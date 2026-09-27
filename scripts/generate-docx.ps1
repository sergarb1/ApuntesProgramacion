# Genera un DOCX por unidad (tema = índice + capítulos) y por boletín, ordenados por idioma:
#   docx/es/<unidad>/<unidad>.docx
#   docx/es/<unidad>/boletin-uNN-*.docx
#   docx/va/... (idéntico en valenciano)
# Requisitos: pandoc 3.x en PATH y python con cairosvg (solo para los diagramas SVG de U02).
param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$utf8 = New-Object System.Text.UTF8Encoding($false)
$work = Join-Path $env:TEMP 'opencode\docxgen'
$assets = Join-Path $work 'png'
$mdtmp = Join-Path $work 'md'
if (Test-Path $work) { Remove-Item $work -Recurse -Force }
New-Item -ItemType Directory -Force -Path $assets, $mdtmp | Out-Null

# 1) SVG -> PNG (pandoc no puede incrustar SVG en docx sin rsvg-convert)
$conv = @'
import sys, glob, os, cairosvg
src, dst = sys.argv[1], sys.argv[2]
for f in sorted(glob.glob(os.path.join(src, '*.svg'))):
    out = os.path.join(dst, os.path.splitext(os.path.basename(f))[0] + '.png')
    cairosvg.svg2png(url=f, write_to=out, scale=2.0)
    print(os.path.basename(f))
'@
$convPath = Join-Path $work 'conv.py'
[IO.File]::WriteAllText($convPath, $conv, $utf8)
& python $convPath (Join-Path $Root 'public\diagrams') $assets
if ($LASTEXITCODE -ne 0) { throw 'Fallo la conversión SVG -> PNG' }

$rootUrl = 'https://sergarb1.github.io/ApuntesProgramacion/'
$rootFs = ([IO.Path]::GetFullPath($Root)) -replace '\\', '/'

function Convert-Block([string]$text) {
    # quitar frontmatter y usar el title como H1 (los cuerpos no llevan H1)
    if ($text -match '(?s)^---\s*\r?\n(.*?)\r?\n---\s*\r?\n') {
        $fm = $Matches[1]
        $text = $text.Substring($Matches[0].Length)
        $title = $null
        if ($fm -match '(?m)^title:\s*"?([^"\r\n]+?)"?\s*$') { $title = $Matches[1].Trim() }
        if ($title) { $text = "# $title`n`n" + $text }
    }
    # etiquetas de solución: <details><summary>X</summary> -> **X** (el HTML crudo se descarta en docx)
    $text = [regex]::Replace($text, '<details>\s*\r?\n<summary>([^<]+)</summary>',
        { param($m) '**' + $m.Groups[1].Value + "**`n" })
    # imágenes SVG -> PNG temporal incrustado
    $text = [regex]::Replace($text, '!\[([^\]]*)\]\(/ApuntesProgramacion/diagrams/([^)]+?)\.svg\)',
        { param($m) '![' + $m.Groups[1].Value + '](<' + ($assets -replace '\\', '/') + '/' + $m.Groups[2].Value + '.png>)' })
    # resto de imágenes locales -> public/
    $text = [regex]::Replace($text, '!\[([^\]]*)\]\(/ApuntesProgramacion/([^)]+)\)',
        { param($m) '![' + $m.Groups[1].Value + '](<' + $rootFs + '/public/' + $m.Groups[2].Value + '>)' })
    # enlaces internos -> URL absoluta de la web (para que funcionen desde el docx)
    $text = [regex]::Replace($text, '(?<!!)\]\(/ApuntesProgramacion/', '](' + $rootUrl)
    return $text
}

function Invoke-Pandoc([string]$inPath, [string]$outPath, [switch]$Toc) {
    $pargs = @('-f', 'gfm', '-t', 'docx', '-o', $outPath)
    if ($Toc) { $pargs += @('--toc', '--toc-depth=2') }
    $pargs += $inPath
    & pandoc @pargs
    if ($LASTEXITCODE -ne 0 -or -not (Test-Path $outPath)) { throw "pandoc falló: $inPath" }
}

$units = Get-ChildItem (Join-Path $Root 'src\content\docs') -Directory |
    Where-Object { $_.Name -match '^\d{2}-' } | Sort-Object Name
$total = 0

foreach ($lang in @('es', 'va')) {
    $docs = if ($lang -eq 'es') { Join-Path $Root 'src\content\docs' } else { Join-Path $Root 'src\content\docs\va' }
    $bolDir = Join-Path $docs 'boletines'

    foreach ($u in $units) {
        $outDir = Join-Path $Root "docx\$lang\$($u.Name)"
        New-Item -ItemType Directory -Force -Path $outDir | Out-Null

        # tema: índice + capítulos concatenados
        $parts = New-Object System.Collections.Generic.List[string]
        $idx = Join-Path $docs "$($u.Name).md"
        if (Test-Path $idx) { $parts.Add((Convert-Block ([IO.File]::ReadAllText($idx)))) }
        $chDir = Join-Path $docs $u.Name
        if (Test-Path $chDir) {
            Get-ChildItem $chDir -Filter '*.md' | Sort-Object Name | ForEach-Object {
                $parts.Add((Convert-Block ([IO.File]::ReadAllText($_.FullName))))
            }
        }
        if ($parts.Count -gt 0) {
            $combo = Join-Path $mdtmp "$($u.Name).$lang.md"
            [IO.File]::WriteAllText($combo, ($parts -join "`n`n---`n`n"), $utf8)
            Invoke-Pandoc $combo (Join-Path $outDir "$($u.Name).docx") -Toc
            $total++
        }

        # boletines de la unidad
        $num = ($u.Name -split '-')[0]
        Get-ChildItem $bolDir -Filter "boletin-u$num-*.md" -ErrorAction SilentlyContinue | Sort-Object Name | ForEach-Object {
            $md = Convert-Block ([IO.File]::ReadAllText($_.FullName))
            $tmpMd = Join-Path $mdtmp "$($_.BaseName).$lang.md"
            [IO.File]::WriteAllText($tmpMd, $md, $utf8)
            Invoke-Pandoc $tmpMd (Join-Path $outDir "$($_.BaseName).docx")
            $total++
        }
    }
}

Write-Output "DOCX generados: $total"
Write-Output "Carpeta: $(Join-Path $Root 'docx')"
