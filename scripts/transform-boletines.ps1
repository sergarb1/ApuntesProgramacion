param(
    [string]$TargetDir = "src/content/docs"
)

Write-Host "=== Transforming boletines in $TargetDir ===" -ForegroundColor Cyan
Set-Location -LiteralPath $TargetDir

# Step 1: Rename resuelto -> intermedio-resuelto (all 1-15)
Write-Host "Step 1: Renaming resuelto -> intermedio-resuelto" -ForegroundColor Yellow
Get-ChildItem "boletin-??-resuelto.md" | Where-Object { $_.Name -notlike "*-inicial-*" } | ForEach-Object {
    $newName = $_.Name -replace "-resuelto", "-intermedio-resuelto"
    Move-Item $_.FullName (Join-Path $_.Directory $newName) -Force
    Write-Host "  $($_.Name) -> $newName" -ForegroundColor Green
}

# Step 2: Delete old units that are merged/removed
Write-Host "Step 2: Deleting old units 07, 12, 14" -ForegroundColor Yellow
@("07", "12", "14") | ForEach-Object {
    Remove-Item "boletin-$_-*" -Force 2>$null
    Write-Host "  Deleted boletin-$_-*" -ForegroundColor Red
}

# Step 3: Renumber in reverse order to avoid conflicts
Write-Host "Step 3: Renumbering" -ForegroundColor Yellow

# Order: 15→14, 13→12, 11→13, 10→11, 09→10, 08→09, 06→08, 04→06, 05→07
$map = @(
    @{from=15; to=14},
    @{from=13; to=12},
    @{from=11; to=13},
    @{from=10; to=11},
    @{from=9; to=10},
    @{from=8; to=9},
    @{from=6; to=8},
    @{from=4; to=6},
    @{from=5; to=7}
)

foreach ($m in $map) {
    $fromPat = '{0:d2}' -f $m.from
    $toPat = '{0:d2}' -f $m.to
    $files = Get-ChildItem "boletin-$fromPat-*" -ErrorAction SilentlyContinue
    foreach ($f in $files) {
        $newName = $f.Name -replace "^boletin-$fromPat", "boletin-$toPat"
        Move-Item $f.FullName (Join-Path $f.Directory $newName) -Force
        Write-Host "  $($f.Name) -> $newName" -ForegroundColor Green
    }
    if (-not $files) { Write-Host "  No files for boletin-$fromPat-*" -ForegroundColor DarkYellow }
}

# Report final state
Write-Host "`nFinal state:" -ForegroundColor Cyan
1..14 | ForEach-Object {
    $n = '{0:d2}' -f $_
    $count = (Get-ChildItem "boletin-$n-*").Count
    $status = if ($count -ge 3) { "✓" } elseif ($count -gt 0) { "!" } else { "✗" }
    Write-Host "  $n`: $count files $status"
}
