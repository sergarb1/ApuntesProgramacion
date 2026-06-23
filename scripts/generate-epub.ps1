param($Lang = "es", $OutDir = "public/epub")

$ErrorActionPreference = "Stop"

$units = "01-introduccion","02-variables-tipos-operadores","03-estructuras-control-excepciones","04-algoritmica-fundamentos","05-algoritmica-tecnicas","06-poo-clases-objetos","07-visibilidad-encapsulacion-static","08-herencia-polimorfismo-interfaces","09-arrays-colecciones","10-genericos-mapas","11-consola-ficheros-regex","12-conexion-bases-datos","13-apis-web"

$boletinTypes = @("inicial", "intermedio", "extras")

if ($Lang -eq "va") {
  $prefix = "va/"
  $metaTitle = "Apunts Programacio Java"
  $metaLang = "ca"
  $outFile = "ApuntesProgramacion-val.epub"
} else {
  $prefix = ""
  $metaTitle = "Apuntes Programacion Java"
  $metaLang = "es"
  $outFile = "ApuntesProgramacion-cast.epub"
}

$srcDir = "src/content/docs/$prefix"
$outPath = "$OutDir/$outFile"
$coverPath = Join-Path (Get-Location) "portada.png"

New-Item -ItemType Directory -Path $OutDir -Force | Out-Null

$sb = [System.Text.StringBuilder]::new()
$null = $sb.AppendLine("---")
$null = $sb.AppendLine("title: '$metaTitle'")
$null = $sb.AppendLine("author: 'Sergi Garcia Barea'")
$null = $sb.AppendLine("language: $metaLang")
$null = $sb.AppendLine("---")
$null = $sb.AppendLine("")

foreach ($u in $units) {
  # --- Unit content ---
  $file = "$srcDir/$u.md"
  if (Test-Path $file) {
    $content = Get-Content $file -Raw -Encoding UTF8

    # Extract title from frontmatter
    $title = ""
    if ($content -match '(?ms)^---\s*\n(.+?)\n^---') {
      $frontmatter = $matches[1]
      if ($frontmatter -match '^title:\s*"(.+?)"') {
        $title = $matches[1]
      }
    }
    if (-not $title) {
      $title = ($u -replace '^\d+-', '' -replace '-', ' ')
    }

    # Remove frontmatter
    $content = $content -replace '(?ms)^---.*?^---\s*', ''
    $content = $content.Trim()
    $content = $content -replace '/ApuntesProgramacion/cc-by-sa\.png', 'public/cc-by-sa.png'

    $null = $sb.AppendLine("# $title")
    $null = $sb.AppendLine("")
    if ($content) {
      $null = $sb.AppendLine($content)
      $null = $sb.AppendLine("")
    }
  }

  # --- Boletines ---
  $unitNum = $u -replace '^(\d+).*', '$1'
  foreach ($bt in $boletinTypes) {
    $boletinFile = "$srcDir/boletin-$unitNum-$bt.md"
    if (Test-Path $boletinFile) {
      $bContent = Get-Content $boletinFile -Raw -Encoding UTF8

      # Extract boletin title
      $bTitle = ""
      if ($bContent -match '(?ms)^---\s*\n(.+?)\n^---') {
        $bfront = $matches[1]
        if ($bfront -match '^title:\s*"(.+?)"') {
          $bTitle = $matches[1]
        }
      }

      # Remove frontmatter
      $bContent = $bContent -replace '(?ms)^---.*?^---\s*', ''
      $bContent = $bContent.Trim()
      $bContent = $bContent -replace '/ApuntesProgramacion/cc-by-sa\.png', 'public/cc-by-sa.png'

      # Demote headings by one level: ## -> ###, ### -> ####, etc.
      $bContent = $bContent -replace '(?m)^(#+)', '#$1'

      if ($bTitle) {
        $null = $sb.AppendLine("## $bTitle")
        $null = $sb.AppendLine("")
      }
      if ($bContent) {
        $null = $sb.AppendLine($bContent)
        $null = $sb.AppendLine("")
      }
    }
  }
}

$tempMd = [System.IO.Path]::GetTempFileName() + ".md"
[System.IO.File]::WriteAllText($tempMd, $sb.ToString(), [System.Text.Encoding]::UTF8)

$cssPath = Join-Path $PSScriptRoot "epub.css"
try {
  & pandoc $tempMd --from markdown --to epub3 --toc --toc-depth=3 --epub-cover-image="$coverPath" --syntax-highlighting pygments --css $cssPath -o $outPath
  if ($LASTEXITCODE -eq 0) { Write-Host "OK: $outPath" } else { Write-Host "FAIL" }
} finally {
  Remove-Item $tempMd -Force -ErrorAction SilentlyContinue
}
