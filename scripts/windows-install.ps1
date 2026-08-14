Write-Host "=================================="
Write-Host " YouTube Playlist -> MP3"
Write-Host " Windows Installer"
Write-Host "=================================="
Write-Host ""

Write-Host "Checking for winget..."

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget was not found."
    Write-Host "Please install/update App Installer from the Microsoft Store."
    exit 1
}

Write-Host "Installing yt-dlp..."
winget install yt-dlp.yt-dlp --accept-source-agreements --accept-package-agreements

Write-Host "Installing FFmpeg..."
winget install Gyan.FFmpeg --accept-source-agreements --accept-package-agreements

Write-Host ""
Write-Host "Installing Deno..."
winget install DenoLand.Deno --accept-source-agreements --accept-package-agreements

Write-Host ""
Write-Host "Installation complete."
Write-Host ""

$PlaylistURL = Read-Host "Paste your YouTube playlist URL"

if ([string]::IsNullOrWhiteSpace($PlaylistURL)) {
    Write-Host "No playlist URL entered."
    exit 1
}

Set-Location "$HOME\Downloads"

Write-Host ""
Write-Host "Starting download..."
Write-Host ""

yt-dlp `
--ignore-errors `
--yes-playlist `
-f "bestaudio/best" `
-x `
--audio-format mp3 `
--audio-quality 0 `
-o "%(playlist)s/%(playlist_index)03d - %(title)s.%(ext)s" `
--no-overwrites `
"$PlaylistURL"

Write-Host ""
Write-Host "Download finished."
Write-Host "Check your Downloads folder."
