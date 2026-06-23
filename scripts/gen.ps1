param($Lang = "es", $OutDir = "public/epub")

$ErrorActionPreference = "Stop"

$units = "01-introduccion","02-variables-tipos-operadores","03-estructuras-control-excepciones","04-algoritmica-fundamentos","05-algoritmica-tecnicas","06-poo-clases-objetos","07-visibilidad-encapsulacion-static","08-herencia-polimorfismo-interfaces","09-arrays-colecciones","10-genericos-mapas","11-consola-ficheros-regex","12-conexion-bases-datos","13-apis-web","14-proyecto-final"

if ($Lang -eq "va") {
  $prefix = "va/"
  $metaTitle = "Apunts Programacio Java"
  $metaLang = "ca"
  $outFile = "ApuntesProgramacion-val.epub"
} else {
  $prefix = ""
  $metaTitle = "Apuntes Programacion Java"
  $metaLang = "es"
  $outFile = "ApuntesProgramacion-cat.epub"
}

$srcDir = "src/content/docs/$prefix"
$outPath = "$OutDir/$outFile"

New-Item -ItemType Directory -Path $OutDir -Force | Out-Null

$sb = [System.Text.StringBuilder]::new()
$null = $sb.AppendLine("---")
$null = $sb.AppendLine("title: '$metaTitle'")
$null = $sb.AppendLine("author: 'Sergi Garcia Barea'")
$null = $sb.AppendLine("language: $metaLang")
$null = $sb.AppendLine("---")
$null = $sb.AppendLine("")

foreach ($u in $units) {
  $file = "$srcDir/$u.md"
  if (Test-Path $file) {
    $content = Get-Content $file -Raw -Encoding UTF8
    $content = $content -replace '(?s)^---.*?---\s*', ''
    $null = $sb.AppendLine($content.Trim())
    $null = $sb.AppendLine("")
  }
}

$tempMd = [System.IO.Path]::GetTempFileName() + ".md"
[System.IO.File]::WriteAllText($tempMd, $sb.ToString(), [System.Text.Encoding]::UTF8)

try {
  & pandoc $tempMd --from markdown --to epub3 --toc --toc-depth=2 -o $outPath
  if ($LASTEXITCODE -eq 0) { Write-Host "OK: $outPath" } else { Write-Host "FAIL" }
} finally {
  Remove-Item $tempMd -Force -ErrorAction SilentlyContinue
}
