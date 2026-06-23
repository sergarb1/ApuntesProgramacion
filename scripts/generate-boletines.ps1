#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Restructure boletines from 45 old files → 70 new files (per language).

.DESCRIPTION
    This script performs a massive boletin restructure for the Java programming
    course at src/content/docs/ and src/content/docs/va/.

    Old: 45 files per directory (15 units × 3 types)
    New: 70 files per directory (14 units × 5 types)

    Steps:
    1. Rename  resuelto → intermedio-resuelto
    2. Renumber files via git mv (following the old→new unit mapping)
    3. Delete unused old boletines (units 07, 12, 14)
    4. Create avanzado from scratch for brand‑new units 04, 05
    5. Create extras files for ALL 14 new units
    6. Create avanzado files for ALL 14 new units (copy+strip old content)

.NOTES
    Author:   Generated for course restructure
    Requires: PowerShell 7+, git in PATH, working directory = repo root
#>

#Requires -Version 7

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
$RootDir  = Resolve-Path "$PSScriptRoot/.."
$DocsDir  = Join-Path $RootDir "src/content/docs"
$VaDir    = Join-Path $DocsDir "va"

Write-Host "📁 Root: $RootDir" -ForegroundColor Cyan

# ---------------------------------------------------------------------------
# Mappings
# ---------------------------------------------------------------------------

# Old unit → New unit number ($null = delete)
$RenameMap = [ordered]@{
    1  = 1
    2  = 2
    3  = 3
    4  = 6
    5  = 7
    6  = 8
    7  = $null   # merged into 08
    8  = 9
    9  = 10
    10 = 11
    11 = 13
    12 = $null   # regex moved into 11
    13 = 12
    14 = $null   # merged into 12
    15 = 14
}

# Topic names for each NEW unit number (used in generated file titles)
$TopicName = @{
    1  = "Introducción"
    2  = "Variables y Operadores"
    3  = "Estructuras de Control"
    4  = "Algorítmica I — Fundamentos"
    5  = "Algorítmica II — Técnicas Avanzadas"
    6  = "POO - Clases y Objetos"
    7  = "Visibilidad, Encapsulación y Static"
    8  = "Herencia y Polimorfismo"
    9  = "Arrays y Colecciones"
    10 = "Genéricos y Mapas"
    11 = "Consola y Ficheros"
    12 = "JDBC - Conexión y Consultas"
    13 = "Interfaz Web"
    14 = "Proyecto Final"
}

# All new unit numbers (01–14)
$NewUnits = 1..14

# Types that will exist after the restructure
$AllSuffixes = @(
    "inicial.md",
    "inicial-resuelto.md",
    "intermedio-resuelto.md",
    "avanzado.md",
    "extras.md"
)

# ---------------------------------------------------------------------------
# Helper functions
# ---------------------------------------------------------------------------

function Test-IsGitRepo {
    $orig = Get-Location
    try {
        Set-Location -LiteralPath $RootDir -ErrorAction Stop
        $null = git rev-parse --git-dir 2>&1
        return $LASTEXITCODE -eq 0
    } catch {
        return $false
    } finally {
        Set-Location -LiteralPath $orig
    }
}

function Invoke-Git {
    param([string[]]$Arguments)
    $orig = Get-Location
    try {
        Set-Location -LiteralPath $RootDir -ErrorAction Stop
        $output = & git @Arguments 2>&1
        $global:LASTEXITCODE = $LASTEXITCODE
        return $output
    } finally {
        Set-Location -LiteralPath $orig
    }
}

function Get-YamlTitleNumber {
    <#
    .SYNOPSIS
        Extracts the unit number from the YAML title line.
        e.g.  title: "Boletín 14 - Resuelto: ..."  → "14"
    #>
    param([string]$FilePath)
    $firstTwo = Get-Content -LiteralPath $FilePath -TotalCount 2
    if ($firstTwo.Count -ge 2) {
        $titleLine = $firstTwo[1]
        if ($titleLine -match 'Boletín\s+(\d+)') {
            return $matches[1]
        }
    }
    return $null
}

function Update-YamlTitleNumber {
    <#
    .SYNOPSIS
        Replaces the unit number in the YAML title and H1 heading.
        Uses the ACTUAL number found in the title (not the filename),
        which handles pre‑existing inconsistencies (e.g. boletin-13-*
        files whose title says "Boletín 14").
    #>
    param(
        [string]$FilePath,
        [string]$NewNumStr
    )
    if (-not (Test-Path -LiteralPath $FilePath)) {
        Write-Warning "  ⚠  File not found: $FilePath"
        return
    }

    $content = Get-Content -LiteralPath $FilePath -Raw

    # Replace the number in YAML title:  title: "Boletín XX - ..."
    $content = $content -replace '(?<=^title:\s*"Boletín\s+)\d+(?=\s*[-—])', $NewNumStr

    # Replace the number in H1 heading:  # Boletín XX — ...
    $content = $content -replace '(?<=^#\s+Boletín\s+)\d+(?=\s*[-—])', $NewNumStr

    # Also replace in any other "Boletín XX" pattern (just to be safe)
    $content = $content -replace "(?<=Boletín\s+)\d+(?=\s*[-—])", $NewNumStr

    Set-Content -LiteralPath $FilePath -Value $content -NoNewline
}

function Replace-TypeInFile {
    <#
    .SYNOPSIS
        Replaces the type string (e.g. "Resuelto" → "Intermedio Resuelto")
        in the YAML title and H1 heading.
    #>
    param(
        [string]$FilePath,
        [string]$OldType,
        [string]$NewType
    )
    if (-not (Test-Path -LiteralPath $FilePath)) {
        Write-Warning "  ⚠  File not found: $FilePath"
        return
    }

    $content = Get-Content -LiteralPath $FilePath -Raw

    # Escape regex special chars
    $oldEsc = [regex]::Escape($OldType)
    $newEsc = $NewType  # the replacement is literal

    # In YAML title:  title: "Boletín XX - OldType: ..."
    $content = $content -replace "(?<=title:\s*""Boletín\s+\d+\s*[-—]\s*)$oldEsc(?=\s*:)", $NewType

    # In H1 heading:  # Boletín XX — OldType: ...
    $content = $content -replace "(?<=^#\s+Boletín\s+\d+\s*[-—]\s*)$oldEsc(?=\s*[:—])", $NewType

    # Handle the case where OldType is immediately followed by colon
    $content = $content -replace "(?<=[-—]\s*)$oldEsc(?=\s*:)", $NewType

    Set-Content -LiteralPath $FilePath -Value $content -NoNewline
}

function Strip-Solutions {
    <#
    .SYNOPSIS
        Removes fenced code blocks from markdown content.
        Keeps exercise descriptions and blockquote hints.
    #>
    param([string]$Content)

    $lines = $Content -split "`n"
    $out = [System.Collections.Generic.List[string]]::new()
    $inFence = $false

    foreach ($line in $lines) {
        if ($line.TrimStart() -match '^```') {
            $inFence = !$inFence
            continue
        }
        if ($inFence) { continue }

        # Transform "> **💡 Explicación:**" into "> 💡 Pista:"
        $processed = $line -replace '>\s*\*\*💡\s*Explicación:\s*\*\*', '> 💡 Pista:'

        $out.Add($processed)
    }

    return $out -join "`n"
}

function New-BoletinAvanzado {
    <#
    .SYNOPSIS
        Creates a blank boletin-XX-avanzado.md (template with placeholders).
    #>
    param([string]$FilePath, [string]$UnitStr, [string]$TopicName)

    $content = @"
---
title: "Boletín $UnitStr - Avanzado: $TopicName"
nav_order: 4
---

# Boletín $UnitStr — Avanzado: $TopicName

Ejercicios para valientes. Sin soluciones. Solo pistas. Si llegas hasta aquí, ya sabes de qué va esto.

---

## ⭐⭐⭐ Ejercicio 1: [Title]

[Descripción del desafío]

> 💡 Pista: [Hint only, no solution]

---

## ⭐⭐⭐ Ejercicio 2: [Title]

[Descripción del desafío]

> 💡 Pista: [Hint only, no solution]

---

## ⭐⭐⭐⭐ Ejercicio 3: [Title]

[Descripción del desafío]

> 💡 Pista: [Hint only, no solution]

---

## ⭐⭐⭐⭐ Ejercicio 4: [Title]

[Descripción del desafío]

> 💡 Pista: [Hint only, no solution]

---

## ⭐⭐⭐⭐⭐ Ejercicio 5: [Title]

[Descripción del desafío]

> 💡 Pista: [Hint only, no solution]

---

## ⭐⭐⭐⭐⭐ Ejercicio 6: [Title]

[Descripción del desafío]

> 💡 Pista: [Hint only, no solution]

---

> 💡 **Consejo:** Si te atascas, repasa los apuntes de la unidad. Busca en Google. Pregunta a un compañero. Pero no mires la solución. El esfuerzo es lo que te hace aprender.
"@
    Set-Content -LiteralPath $FilePath -Value $content -NoNewline
}

function New-BoletinExtras {
    <#
    .SYNOPSIS
        Creates a boletin-XX-extras.md with CodeWars + AceptaElReto refs.
    #>
    param([string]$FilePath, [string]$UnitStr, [string]$TopicName)

    $content = @"
---
title: "Boletín $UnitStr - Extras: $TopicName"
nav_order: 5
---

# Boletín $UnitStr — Extras: $TopicName

Problemas de CodeWars y AceptaElReto para poner a prueba lo aprendido.

---

## 🏆 CodeWars

| Kata | Dificultad | Concepto |
|------|:---:|---------|
| [Name](https://www.codewars.com/kata/...) | X kyu | Concepto |

> 💡 *En CodeWars, cada kata tiene una discusión donde puedes ver soluciones de otros. Úsalo solo cuando hayas intentado resolverlo por tu cuenta.*

---

## 🏆 AceptaElReto

| Problema | Dificultad | Concepto |
|----------|:---:|---------|
| [NNN — Name](https://www.aceptaelreto.com/problem/statement.php?id=NNN) | Fácil / Media / Difícil | Concepto |

---

> 💡 **Consejo:** Intenta resolverlos sin mirar soluciones. Si te atascas, busca pistas en los comentarios de CodeWars o en los foros. Recuerda que en AceptaElReto los problemas tienen entrada/salida estándar: lee con Scanner y escribe con System.out.
"@
    Set-Content -LiteralPath $FilePath -Value $content -NoNewline
}

function New-AvanzadoFromExisting {
    <#
    .SYNOPSIS
        Creates avanzado by copying intermedio-resuelto and stripping solutions.
    #>
    param(
        [string]$SourcePath,
        [string]$DestPath,
        [string]$UnitStr,
        [string]$TopicName
    )
    if (-not (Test-Path -LiteralPath $SourcePath)) {
        Write-Warning "  ⚠  Source not found: $SourcePath  → creating blank avanzado"
        New-BoletinAvanzado -FilePath $DestPath -UnitStr $UnitStr -TopicName $TopicName
        return
    }

    $content = Get-Content -LiteralPath $SourcePath -Raw

    # Strip fenced code blocks
    $stripped = Strip-Solutions -Content $content

    # Update title: replace the type segment (between " - " and ":") with "Avanzado"
    $stripped = $stripped -replace '(?<=title:\s*"Boletín\s+\d+\s*-\s*)[A-Za-zÁ-Úá-ú\s]+(?=\s*:)', 'Avanzado'

    # Update H1: replace the type segment with "Avanzado"
    $stripped = $stripped -replace '(?<=^#\s+Boletín\s+\d+\s*[-—]\s*)[A-Za-zÁ-Úá-ú\s]+(?=\s*[:—])', 'Avanzado'

    # Fallback for any remaining "Intermedio Resuelto" or "Resuelto" as type labels
    $stripped = $stripped -replace 'Intermedio\s+Resuelto', 'Avanzado'
    $stripped = $stripped -replace '(?<!Inicial\s)(?<!Intermedio\s)Resuelto', 'Avanzado'

    # Update nav_order
    $stripped = $stripped -replace '(?<=nav_order:\s*)\d+', '4'

    # Replace the H1 body text to match avanzado style
    # Find the H1 line and the line after "---" divider
    $stripped = $stripped -replace '(?<=^---\s*$)(.*?)(?=^---\s*$)', "`$1`n# Boletín $UnitStr — Avanzado: $TopicName`n`nEjercicios para valientes. Sin soluciones. Solo pistas. Si llegas hasta aquí, ya sabes de qué va esto.`n"

    Set-Content -LiteralPath $DestPath -Value $stripped -NoNewline
}

# ---------------------------------------------------------------------------
# Pre-flight checks
# ---------------------------------------------------------------------------
if (-not (Test-IsGitRepo)) {
    Write-Error "This script must be run from within the git repository at $RootDir"
    exit 1
}

$requiredDirs = @($DocsDir, $VaDir)
foreach ($dir in $requiredDirs) {
    if (-not (Test-Path -LiteralPath $dir)) {
        Write-Error "Required directory not found: $dir"
        exit 1
    }
}

Write-Host "🔍 Pre-flight checks passed." -ForegroundColor Green

# ============================================================================
# STEP 1: Rename  resuelto → intermedio-resuelto
# ============================================================================
Write-Host "`n=== STEP 1: Rename 'resuelto' → 'intermedio-resuelto' ===" -ForegroundColor Yellow

foreach ($dir in @($DocsDir, $VaDir)) {
    $relDir = if ($dir -eq $DocsDir) { "root" } else { "va/" }
    Write-Host "  Processing $relDir ..." -ForegroundColor Gray

    $resolvedDir = Resolve-Path $dir

    Get-ChildItem -LiteralPath $resolvedDir -Filter "boletin-*-resuelto.md" | ForEach-Object {
        $oldPath = $_.FullName
        $oldName = $_.Name
        $newName = $oldName -replace '-resuelto\.md$', '-intermedio-resuelto.md'
        $newPath = Join-Path $_.Directory.FullName $newName

        if (Test-Path -LiteralPath $newPath) {
            Write-Warning "  ⚠  Target already exists: $newName (in $relDir)"
            return
        }

        # Update YAML title and H1: replace "Resuelto" with "Intermedio Resuelto"
        Replace-TypeInFile -FilePath $oldPath -OldType "Resuelto" -NewType "Intermedio Resuelto"

        # Rename the file
        Rename-Item -LiteralPath $oldPath -NewName $newName
        Write-Host "  ✓ $oldName → $newName (in $relDir)" -ForegroundColor Green
    }
}

# ============================================================================
# STEP 2: Renumber boletines via git mv
# ============================================================================
Write-Host "`n=== STEP 2: Renumber boletines (git mv) ===" -ForegroundColor Yellow

# Suffixes to look for (after step 1, resuelto is already intermedio-resuelto)
$Step2Suffixes = @("inicial.md", "inicial-resuelto.md", "intermedio-resuelto.md")

foreach ($dir in @($DocsDir, $VaDir)) {
    $relDir = if ($dir -eq $DocsDir) { "root" } else { "va/" }
    Write-Host "  Processing $relDir ..." -ForegroundColor Gray

    foreach ($oldUnit in $RenameMap.Keys) {
        $newUnit = $RenameMap[$oldUnit]
        if ($null -eq $newUnit) {
            continue   # deleted in step 3
        }

        $oldUnitStr = $oldUnit.ToString("D2")
        $newUnitStr = $newUnit.ToString("D2")

        foreach ($suffix in $Step2Suffixes) {
            $oldName = "boletin-$oldUnitStr-$suffix"
            $newName = "boletin-$newUnitStr-$suffix"
            $oldPath = Join-Path $dir $oldName
            $newPath = Join-Path $dir $newName

            if (-not (Test-Path -LiteralPath $oldPath)) {
                Write-Warning "  ⚠  Not found, skipping: $oldName (in $relDir)"
                continue
            }
            if (Test-Path -LiteralPath $newPath) {
                Write-Warning "  ⚠  Already exists, skipping: $newName (in $relDir)"
                continue
            }

            # Update the unit number in the YAML title and H1
            # We use the number found IN the file (may differ from filename,
            # e.g. boletin-13-* files say "Boletín 14")
            $titleNum = Get-YamlTitleNumber -FilePath $oldPath
            if ($titleNum) {
                # Replace whatever number is in the title
                $content = Get-Content -LiteralPath $oldPath -Raw
                $content = $content -replace "(?<=Boletín\s+)$titleNum(?=\s*[-—])", $newUnitStr
                Set-Content -LiteralPath $oldPath -Value $content -NoNewline
            } else {
                # Fallback: replace using the filename number
                Update-YamlTitleNumber -FilePath $oldPath -NewNumStr $newUnitStr
            }

            # git mv
            $output = Invoke-Git -Arguments @("mv", $oldPath, $newPath)
            if ($LASTEXITCODE -eq 0) {
                Write-Host "  ✓ $oldName → $newName (in $relDir)" -ForegroundColor Green
            } else {
                Write-Warning "  ⚠  git mv failed for $oldName → $newName (in $relDir): $output"
            }
        }
    }
}

# ============================================================================
# STEP 3: Delete unused old boletines (units 07, 12, 14)
# ============================================================================
Write-Host "`n=== STEP 3: Delete unused old boletines (07, 12, 14) ===" -ForegroundColor Yellow

$DeleteUnits = @(7, 12, 14)

foreach ($dir in @($DocsDir, $VaDir)) {
    $relDir = if ($dir -eq $DocsDir) { "root" } else { "va/" }
    Write-Host "  Processing $relDir ..." -ForegroundColor Gray

    foreach ($unit in $DeleteUnits) {
        $unitStr = $unit.ToString("D2")

        # After step 1, resuelto is now intermedio-resuelto; check both just in case
        $patterns = @(
            "boletin-$unitStr-inicial.md",
            "boletin-$unitStr-inicial-resuelto.md",
            "boletin-$unitStr-intermedio-resuelto.md",
            "boletin-$unitStr-resuelto.md"
        )

        foreach ($pattern in $patterns) {
            $filePath = Join-Path $dir $pattern
            if (Test-Path -LiteralPath $filePath) {
                $output = Invoke-Git -Arguments @("rm", $filePath)
                if ($LASTEXITCODE -eq 0) {
                    Write-Host "  ✗ Deleted: $pattern (in $relDir)" -ForegroundColor Red
                } else {
                    Write-Warning "  ⚠  git rm failed for $pattern (in $relDir): $output"
                }
            }
        }
    }
}

# ============================================================================
# STEP 4: Create avanzado files for brand‑new units 04 and 05
# ============================================================================
Write-Host "`n=== STEP 4: Create avanzado for NEW units 04 and 05 ===" -ForegroundColor Yellow

$NewUnitsAvanzadoOnly = @(4, 5)

foreach ($dir in @($DocsDir, $VaDir)) {
    $relDir = if ($dir -eq $DocsDir) { "root" } else { "va/" }
    Write-Host "  Processing $relDir ..." -ForegroundColor Gray

    foreach ($unit in $NewUnitsAvanzadoOnly) {
        $unitStr = $unit.ToString("D2")
        $filePath = Join-Path $dir "boletin-$unitStr-avanzado.md"

        if (Test-Path -LiteralPath $filePath) {
            Write-Host "  ℹ  Already exists: boletin-$unitStr-avanzado.md (in $relDir)" -ForegroundColor DarkGray
            continue
        }

        New-BoletinAvanzado -FilePath $filePath -UnitStr $unitStr -TopicName $TopicName[$unit]
        Write-Host "  ✓ Created: boletin-$unitStr-avanzado.md (in $relDir)" -ForegroundColor Green
    }
}

# ============================================================================
# STEP 5: Create extras files for ALL 14 units
# ============================================================================
Write-Host "`n=== STEP 5: Create extras files for ALL 14 units ===" -ForegroundColor Yellow

foreach ($dir in @($DocsDir, $VaDir)) {
    $relDir = if ($dir -eq $DocsDir) { "root" } else { "va/" }
    Write-Host "  Processing $relDir ..." -ForegroundColor Gray

    foreach ($unit in $NewUnits) {
        $unitStr = $unit.ToString("D2")
        $filePath = Join-Path $dir "boletin-$unitStr-extras.md"

        if (Test-Path -LiteralPath $filePath) {
            Write-Host "  ℹ  Already exists: boletin-$unitStr-extras.md (in $relDir)" -ForegroundColor DarkGray
            continue
        }

        New-BoletinExtras -FilePath $filePath -UnitStr $unitStr -TopicName $TopicName[$unit]
        Write-Host "  ✓ Created: boletin-$unitStr-extras.md (in $relDir)" -ForegroundColor Green
    }
}

# ============================================================================
# STEP 6: Create avanzado files for ALL 14 units
# ============================================================================
Write-Host "`n=== STEP 6: Create avanzado files for ALL 14 units ===" -ForegroundColor Yellow

# Units that HAD old boletines (can copy from intermedio-resuelto and strip)
$UnitsWithOldContent = @(1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 13, 14)

foreach ($dir in @($DocsDir, $VaDir)) {
    $relDir = if ($dir -eq $DocsDir) { "root" } else { "va/" }
    Write-Host "  Processing $relDir ..." -ForegroundColor Gray

    foreach ($unit in $NewUnits) {
        $unitStr = $unit.ToString("D2")
        $avanzadoPath = Join-Path $dir "boletin-$unitStr-avanzado.md"

        if (Test-Path -LiteralPath $avanzadoPath) {
            Write-Host "  ℹ  Already exists, skipping: boletin-$unitStr-avanzado.md (in $relDir)" -ForegroundColor DarkGray
            continue
        }

        if ($unit -in $UnitsWithOldContent) {
            $sourcePath = Join-Path $dir "boletin-$unitStr-intermedio-resuelto.md"
            if (Test-Path -LiteralPath $sourcePath) {
                New-AvanzadoFromExisting -SourcePath $sourcePath -DestPath $avanzadoPath -UnitStr $unitStr -TopicName $TopicName[$unit]
                Write-Host "  ✓ Created (from intermedio-resuelto): boletin-$unitStr-avanzado.md (in $relDir)" -ForegroundColor Green
            } else {
                New-BoletinAvanzado -FilePath $avanzadoPath -UnitStr $unitStr -TopicName $TopicName[$unit]
                Write-Host "  ✓ Created (from scratch, no source found): boletin-$unitStr-avanzado.md (in $relDir)" -ForegroundColor Green
            }
        } else {
            # Units 04 and 05 already handled in step 4, this is a safety fallback
            New-BoletinAvanzado -FilePath $avanzadoPath -UnitStr $unitStr -TopicName $TopicName[$unit]
            Write-Host "  ✓ Created (from scratch): boletin-$unitStr-avanzado.md (in $relDir)" -ForegroundColor Green
        }
    }
}

# ============================================================================
# Summary
# ============================================================================
Write-Host "`n`n============================================" -ForegroundColor Cyan
Write-Host "  ✅  RESTRUCTURE COMPLETE!" -ForegroundColor White -BackgroundColor Green
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Before: 45 files per directory (15 units × 3 types)" -ForegroundColor Gray
Write-Host "After:  70 files per directory (14 units × 5 types)" -ForegroundColor Gray
Write-Host ""
Write-Host "Expected file layout per directory:" -ForegroundColor White
Write-Host "  boletin-01-{inicial, inicial-resuelto, intermedio-resuelto, avanzado, extras}.md" -ForegroundColor Gray
Write-Host "  boletin-02-{...}.md" -ForegroundColor Gray
Write-Host "  ..." -ForegroundColor Gray
Write-Host "  boletin-14-{...}.md" -ForegroundColor Gray
Write-Host ""
Write-Host "Run 'git status' to review all changes before committing." -ForegroundColor Yellow
