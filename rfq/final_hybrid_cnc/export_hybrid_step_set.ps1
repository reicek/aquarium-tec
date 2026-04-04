$ErrorActionPreference = 'Stop'

$packageRoot = $PSScriptRoot
$workspaceRoot = Split-Path (Split-Path $packageRoot -Parent) -Parent
Set-Location $workspaceRoot

$openscadExe = if (Test-Path 'C:\Program Files (x86)\OpenSCAD\openscad.com') {
    'C:\Program Files (x86)\OpenSCAD\openscad.com'
} elseif ($env:OPENSCAD_EXE) {
    $env:OPENSCAD_EXE
} else {
    'C:\Program Files (x86)\OpenSCAD\openscad.exe'
}

$freecadCmd = 'C:\Users\reice\AppData\Local\Programs\FreeCAD 1.1\bin\FreeCADCmd.exe'
$pythonScript = Join-Path $packageRoot 'export_step_from_scad.py'
$pythonScriptEscaped = $pythonScript.Replace('\', '\\')
$runner = "import runpy; _ = runpy.run_path(r'$pythonScriptEscaped', run_name='__main__')"
$stepDir = Join-Path $packageRoot 'step'
$csgDir = Join-Path $packageRoot 'csg'
$stlDir = Join-Path $packageRoot 'stl'

New-Item -ItemType Directory -Force -Path $stepDir, $csgDir, $stlDir | Out-Null

$parts = @(
    @{ Name = 'cold_block_lid'; Source = 'rfq\final_hybrid_cnc\exports\export_lid.scad' },
    @{ Name = 'cold_block_base'; Source = 'rfq\final_hybrid_cnc\exports\export_base.scad' },
    @{ Name = 'hose_plug_main_16_0mm'; Source = 'rfq\final_hybrid_cnc\exports\export_plug_main.scad' },
    @{ Name = 'hose_plug_mid_15_4mm'; Source = 'rfq\final_hybrid_cnc\exports\export_plug_mid.scad' },
    @{ Name = 'hose_plug_small_14_8mm'; Source = 'rfq\final_hybrid_cnc\exports\export_plug_small.scad' }
)

foreach ($part in $parts) {
    $inputScad = Join-Path $workspaceRoot $part.Source
    $outputStep = Join-Path $stepDir ($part.Name + '.step')
    $outputCsg = Join-Path $csgDir ($part.Name + '.csg')
    $outputStl = Join-Path $stlDir ($part.Name + '.stl')

    Write-Host "Exporting $($part.Name) to STEP"
    $runner | & $freecadCmd --pass $openscadExe $inputScad $outputStep $outputCsg $outputStl
}