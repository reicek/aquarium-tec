$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$stlRoot = Join-Path $PSScriptRoot 'stl'

function Get-StlBounds {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    $minX = [double]::PositiveInfinity
    $minY = [double]::PositiveInfinity
    $minZ = [double]::PositiveInfinity
    $maxX = [double]::NegativeInfinity
    $maxY = [double]::NegativeInfinity
    $maxZ = [double]::NegativeInfinity
    $vertexCount = 0

    Get-Content -Path $Path | ForEach-Object {
        if ($_ -match 'vertex\s+([-+0-9.eE]+)\s+([-+0-9.eE]+)\s+([-+0-9.eE]+)') {
            $x = [double]$matches[1]
            $y = [double]$matches[2]
            $z = [double]$matches[3]

            if ($x -lt $minX) { $minX = $x }
            if ($y -lt $minY) { $minY = $y }
            if ($z -lt $minZ) { $minZ = $z }
            if ($x -gt $maxX) { $maxX = $x }
            if ($y -gt $maxY) { $maxY = $y }
            if ($z -gt $maxZ) { $maxZ = $z }

            $vertexCount++
        }
    }

    if ($vertexCount -eq 0) {
        throw "No STL vertices found in '$Path'."
    }

    return [pscustomobject]@{
        Name  = [System.IO.Path]::GetFileName($Path)
        MinX  = [math]::Round($minX, 3)
        MaxX  = [math]::Round($maxX, 3)
        SizeX = [math]::Round($maxX - $minX, 3)
        MinY  = [math]::Round($minY, 3)
        MaxY  = [math]::Round($maxY, 3)
        SizeY = [math]::Round($maxY - $minY, 3)
        MinZ  = [math]::Round($minZ, 3)
        MaxZ  = [math]::Round($maxZ, 3)
        SizeZ = [math]::Round($maxZ - $minZ, 3)
    }
}

function Test-Near {
    param(
        [Parameter(Mandatory = $true)]
        [double]$Actual,
        [Parameter(Mandatory = $true)]
        [double]$Expected,
        [Parameter(Mandatory = $true)]
        [double]$Tolerance
    )

    return [math]::Abs($Actual - $Expected) -le $Tolerance
}

$expectations = @(
    [pscustomobject]@{
        Name = 'prototype_lid_base_bundle.stl'
        Values = @{
            MinX = 0.000
            MinY = 0.000
            MinZ = 0.000
            SizeX = 284.000
            SizeY = 92.000
            SizeZ = 16.000
        }
        Tolerances = @{
            MinX = 0.010
            MinY = 0.010
            MinZ = 0.010
            SizeX = 0.250
            SizeY = 0.250
            SizeZ = 0.250
        }
    },
    [pscustomobject]@{
        Name = 'prototype_hose_bundle.stl'
        Values = @{
            MinX = 0.000
            MinY = 0.000
            MinZ = 0.000
            SizeX = 74.000
            SizeY = 48.000
            SizeZ = 33.750
        }
        Tolerances = @{
            MinX = 0.010
            MinY = 0.010
            MinZ = 0.010
            SizeX = 0.250
            SizeY = 0.250
            SizeZ = 0.250
        }
    },
    [pscustomobject]@{
        Name = 'prototype_hose_lid_base_bundle.stl'
        Values = @{
            MinX = 0.000
            MinY = 0.000
            MinZ = 0.000
            SizeX = 140.000
            SizeY = 240.000
            SizeZ = 33.750
        }
        Tolerances = @{
            MinX = 0.010
            MinY = 0.010
            MinZ = 0.010
            SizeX = 0.250
            SizeY = 0.250
            SizeZ = 0.250
        }
    },
    [pscustomobject]@{
        Name = 'prototype_support_frame.stl'
        Values = @{
            MinX = 0.000
            MinY = 0.000
            MinZ = 0.000
            SizeX = 290.000
            SizeY = 240.000
            SizeZ = 8.000
        }
        Tolerances = @{
            MinX = 0.010
            MinY = 0.010
            MinZ = 0.010
            SizeX = 0.500
            SizeY = 0.250
            SizeZ = 0.250
        }
    }
)

$failures = New-Object System.Collections.Generic.List[string]
$bounds = New-Object System.Collections.Generic.List[object]

foreach ($expectation in $expectations) {
    $path = Join-Path $stlRoot $expectation.Name

    if (-not (Test-Path -Path $path)) {
        $failures.Add("Missing expected STL '$($expectation.Name)'.")
        continue
    }

    $actual = Get-StlBounds -Path $path
    $bounds.Add($actual)

    foreach ($metric in $expectation.Values.Keys) {
        if (-not (Test-Near -Actual $actual.$metric -Expected $expectation.Values[$metric] -Tolerance $expectation.Tolerances[$metric])) {
            $failures.Add(
                "$($expectation.Name): $metric expected $($expectation.Values[$metric]) +/- $($expectation.Tolerances[$metric]), got $($actual.$metric)."
            )
        }
    }
}

$bounds | Sort-Object Name | Format-Table Name, SizeX, SizeY, SizeZ, MinX, MinY, MinZ -AutoSize | Out-String | Write-Host

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Host $_ }
    throw 'Prototype STL layout validation failed.'
}

Write-Host 'Prototype STL layout validation passed.'