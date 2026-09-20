# compress-pdf.ps1 — Comprime PDFs con Ghostscript
# Uso: pwsh -NoProfile -File scripts/compress-pdf.ps1 [-InputDir public/pdf] [-Quality ebook|screen|printer|prepress]
param(
    [string]$InputDir = "public/pdf",
    [string]$Quality = "ebook"
)

$ErrorActionPreference = "Stop"

# Buscar Ghostscript en rutas conocidas
$gs = $null
$candidates = @(
    "C:\Program Files\gs\gs10.08.0\bin\gswin64c.exe",
    "C:\Program Files\gs\gs*\bin\gswin64c.exe",
    "C:\Program Files (x86)\gs\gs*\bin\gswin32c.exe",
    "/usr/local/bin/gs",
    "/usr/bin/gs"
)
foreach ($c in $candidates) {
    $found = Resolve-Path $c -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($found) { $gs = $found.Path; break }
}
if (-not $gs) {
    $gsFallback = Get-ChildItem "C:\Program Files\gs" -Recurse -Filter "gswin64c.exe" -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($gsFallback) { $gs = $gsFallback.FullName }
}
if (-not $gs) {
    Write-Error "Ghostscript no encontrado. Instala desde https://ghostscript.com/releases/gsdnld.html"
    exit 1
}
Write-Host "Usando Ghostscript: $gs" -ForegroundColor Cyan

$pdfs = Get-ChildItem "$InputDir/*.pdf" -ErrorAction SilentlyContinue
if (-not $pdfs) {
    Write-Warning "No se encontraron PDFs en $InputDir"
    exit 0
}

foreach ($pdf in $pdfs) {
    $tempFile = "$InputDir\$($pdf.BaseName)-compressed.pdf"
    $origMB = [math]::Round($pdf.Length / 1MB, 1)

    Write-Host "Comprimiendo $($pdf.Name) ($origMB MB)..." -ForegroundColor Yellow

    $gsArgs = @(
        "-sDEVICE=pdfwrite",
        "-dCompatibilityLevel=1.5",
        "-dPDFSETTINGS=/$Quality",
        "-dNOPAUSE", "-dQUIET", "-dBATCH",
        "-dFastWebView=false",
        "-sOutputFile=$tempFile",
        $pdf.FullName
    )

    & $gs @gsArgs

    if (Test-Path $tempFile) {
        $newMB = [math]::Round((Get-Item $tempFile).Length / 1MB, 1)
        $pct = [math]::Round((1 - $newMB / $origMB) * 100)
        Remove-Item $pdf.FullName
        Rename-Item $tempFile $pdf.FullName
        Write-Host "  $($pdf.Name): $origMB MB -> $newMB MB (-${pct}%)" -ForegroundColor Green
    } else {
        Write-Warning "  Fallo al comprimir $($pdf.Name)"
        if (Test-Path $tempFile) { Remove-Item $tempFile }
    }
}

Write-Host "`nDone!" -ForegroundColor Green
