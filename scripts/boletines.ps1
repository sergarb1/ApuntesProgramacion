Write-Host "=== Boletín Restructure ===" -ForegroundColor Cyan

$root = "src/content/docs"
$va = "src/content/docs/va"
$dirs = @($root, $va)

# Step 1: Rename old resuelto → intermedio-resuelto (for all 01-15)
Write-Host "`nStep 1: Renaming resuelto → intermedio-resuelto..." -ForegroundColor Yellow
foreach ($dir in $dirs) {
    for ($i = 1; $i -le 15; $i++) {
        $old = "$dir/boletin-$('{0:d2}' -f $i)-resuelto.md"
        $new = "$dir/boletin-$('{0:d2}' -f $i)-intermedio-resuelto.md"
        if (Test-Path $old) {
            git mv $old $new
            Write-Host "  $old → $new" -ForegroundColor Green
        }
    }
}

# Step 2: Renumber boletines (git mv)
Write-Host "`nStep 2: Renumbering boletines..." -ForegroundColor Yellow
$renameMap = @(
    @{from=4; to=6},
    @{from=5; to=7},
    @{from=6; to=8},
    @{from=8; to=9},
    @{from=9; to=10},
    @{from=10; to=11},
    @{from=11; to=13},
    @{from=13; to=12},
    @{from=15; to=14}
)

foreach ($dir in $dirs) {
    foreach ($map in $renameMap) {
        $from = '{0:d2}' -f $map.from
        $to = '{0:d2}' -f $map.to
        Get-ChildItem "$dir/boletin-$from-*.md" | ForEach-Object {
            $newName = $_.Name -replace "^boletin-$from", "boletin-$to"
            git mv $_.FullName "$dir/$newName"
            Write-Host "  $($_.Name) → $newName" -ForegroundColor Green
        }
    }
}

# Step 3: Delete unused old boletines
Write-Host "`nStep 3: Deleting unused boletines..." -ForegroundColor Yellow
$deletePrefixes = @("07", "12", "14")
foreach ($dir in $dirs) {
    foreach ($prefix in $deletePrefixes) {
        Get-ChildItem "$dir/boletin-$prefix-*.md" | ForEach-Object {
            git rm $_.FullName
            Write-Host "  DELETED $($_.Name)" -ForegroundColor Red
        }
    }
}

Write-Host "`n=== Base rename/renumber complete ===" -ForegroundColor Green
Write-Host "Now need to create avanzado and extras files for all 14 units" -ForegroundColor Cyan
