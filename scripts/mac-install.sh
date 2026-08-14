#!/bin/bash

echo "=================================="
echo " YouTube Playlist → MP3"
echo " macOS Installer"
echo "=================================="
echo ""

echo "Checking Homebrew..."

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is not installed."
    echo "Please install Homebrew from https://brew.sh/"
    exit 1
fi

echo "Installing required tools..."
brew install yt-dlp ffmpeg deno

echo ""
echo "Installation complete."
echo ""

read -p "Paste your YouTube playlist URL: " PLAYLIST_URL

if [ -z "$PLAYLIST_URL" ]; then
    echo "No playlist URL entered."
    exit 1
fi

cd "$HOME/Downloads" || exit 1

echo ""
echo "Starting download..."
echo ""

yt-dlp \
--ignore-errors \
--yes-playlist \
-f "bestaudio/best" \
-x \
--audio-format mp3 \
--audio-quality 0 \
-o "%(playlist)s/%(playlist_index)03d - %(title)s.%(ext)s" \
--no-overwrites \
"$PLAYLIST_URL"

echo ""
echo "Download finished."
echo "Check your Downloads folder."
