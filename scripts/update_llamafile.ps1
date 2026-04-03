# =====================================================================
# 🛠️ Llamafile Auto-Updater
# =====================================================================
# This script checks the GitHub API for the latest version of Llamafile
# and offers to download it if a newer version is available.
# =====================================================================

$repo = "Mozilla-Ocho/llamafile"
$binaryName = "llamafile.exe"
$localPath = Join-Path $PSScriptRoot ".." $binaryName

# 1. Fetch latest release from GitHub API
Write-Host "[+] Checking for updates from GitHub..." -ForegroundColor Cyan
$url = "https://api.github.com/repos/$repo/releases/latest"

try {
    $response = Invoke-RestMethod -Uri $url -Method Get
    $latestTag = $response.tag_name
    Write-Host "[+] Latest version on GitHub: $latestTag" -ForegroundColor Green
} catch {
    Write-Host "[!] Error: Unable to fetch release info from GitHub API." -ForegroundColor Red
    exit
}

# 2. Check if local file exists
if (Test-Path $localPath) {
    # In a real script, we would check version strings, but here we'll 
    # just ask the user if they want to overwrite with the LATEST.
    $choice = Read-Host "[-] Llamafile.exe already exists. Do you want to download $latestTag and replace it? (y/n)"
    if ($choice -ne "y") { exit }
}

# 3. Find the correct asset in the release
$asset = $response.assets | Where-Object { $_.name -like "llamafile-*" -and $_.name -notlike "*.sig" } | Select-Object -First 1

if (-not $asset) {
    Write-Host "[!] Error: No suitable binary found in the latest release." -ForegroundColor Red
    exit
}

$downloadUrl = $asset.browser_download_url
$tempFile = Join-Path $env:TEMP $asset.name

# 4. Download and Replace
Write-Host "[+] Downloading $latestTag..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $downloadUrl -OutFile $tempFile

Write-Host "[+] Replacing local binary..." -ForegroundColor Cyan
Move-Item -Path $tempFile -Destination $localPath -Force

Write-Host "`n[✨] Llamafile has been updated to $latestTag successfully!" -ForegroundColor Green
pause
