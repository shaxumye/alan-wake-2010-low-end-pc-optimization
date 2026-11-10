param(
    [ValidateSet("720p","540p")]
    [string]$Preset = "720p"
)

$ErrorActionPreference = "Stop"
$GameExe = Join-Path $PSScriptRoot "alanwake.exe"

if (-not (Test-Path -LiteralPath $GameExe)) {
    Write-Host ""
    Write-Host "Could not find alanwake.exe." -ForegroundColor Red
    Write-Host "Put this launcher in the same folder as alanwake.exe."
    Write-Host "Expected location: $GameExe"
    Read-Host "Press Enter to close"
    exit 1
}

switch ($Preset) {
    "720p" { $width = 1280; $height = 720 }
    "540p" { $width = 960;  $height = 540 }
}

$launchArgs = @("-w$width", "-h$height", "-window", "-novsync", "-showfps")

Write-Host "Starting Alan Wake at ${width}x${height}..."
Write-Host "Arguments: $($launchArgs -join ' ')"
Write-Host "If the game ignores these switches, set resolution in its own options."

try {
    $process = Start-Process -FilePath $GameExe -ArgumentList $launchArgs -WorkingDirectory $PSScriptRoot -PassThru
    Start-Sleep -Seconds 3
    try {
        $process.Refresh()
        if (-not $process.HasExited) {
            $process.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::AboveNormal
            Write-Host "Set process priority to Above Normal."
        }
    } catch {
        Write-Host "Could not change process priority; continuing with normal priority."
    }
} catch {
    Write-Host "Could not launch the game: $($_.Exception.Message)" -ForegroundColor Red
    Read-Host "Press Enter to close"
    exit 1
}
