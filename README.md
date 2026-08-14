# YouTube Playlist → MP3

A beginner-friendly command-line setup for downloading audio from YouTube playlists and converting it to MP3 using **yt-dlp** and **FFmpeg**.

Works on:

- 🍎 macOS
- 🪟 Windows

The project is designed to take you from a fresh computer to downloading a complete playlist with as little manual setup as possible.

---

## ⚠️ Important

Only download content that you have permission to download or that is otherwise lawful for you to save.

This project does not bypass DRM, private content, or access controls.

YouTube availability, restrictions, and technical requirements can change over time.

---

# 🚀 Quick Start

The easiest way to use this project is to **clone the repository**.

## 1. Clone the repository

Open Terminal on macOS or PowerShell on Windows and run:

```bash
git clone https://github.com/SageMusic-lab/youtube-playlist-to-mp3.git
```

Then enter the project folder:

```bash
cd youtube-playlist-to-mp3
```

---

# 🍎 macOS

Run:

```bash
chmod +x scripts/mac-install.sh
./scripts/mac-install.sh
```

The installer will:

1. Check that Homebrew is installed
2. Install yt-dlp
3. Install FFmpeg
4. Install Deno
5. Ask you for your YouTube playlist URL
6. Download the playlist as MP3 files

Your downloaded files will be placed inside:

```text
~/Downloads/
```

Example:

```text
Downloads/
└── My Playlist/
    ├── 001 - Track One.mp3
    ├── 002 - Track Two.mp3
    ├── 003 - Track Three.mp3
    └── ...
```

### macOS requirements

The installer requires **Homebrew**.

If Homebrew is not installed, install it from:

https://brew.sh/

Then run the installer again.

---

# 🪟 Windows

Open PowerShell inside the cloned project folder.

Run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
```

Then:

```powershell
.\scripts\windows-install.ps1
```

The installer will:

1. Install yt-dlp
2. Install FFmpeg
3. Install Deno
4. Ask you for your YouTube playlist URL
5. Download the playlist as MP3 files

Your downloaded files will be placed inside:

```text
Downloads\
```

Example:

```text
Downloads\
└── My Playlist\
    ├── 001 - Track One.mp3
    ├── 002 - Track Two.mp3
    ├── 003 - Track Three.mp3
    └── ...
```

---

# 🎵 What the downloader does

The download process uses:

```text
YouTube Playlist
       ↓
     yt-dlp
       ↓
Best available audio
       ↓
    FFmpeg
       ↓
      MP3
       ↓
Downloads / Playlist Name
```

The command is configured to:

- Download the entire playlist
- Extract audio
- Convert audio to MP3
- Keep the playlist order
- Number tracks automatically
- Create a folder using the playlist name
- Skip unavailable videos
- Avoid overwriting existing files

---

# 🔢 Playlist numbering

Tracks are automatically numbered:

```text
001 - Track Name.mp3
002 - Track Name.mp3
003 - Track Name.mp3
```

This makes it easier to keep the original playlist order.

---

# 🔄 Continuing an interrupted download

If you stop the download with:

```text
Ctrl + C
```

your completed files remain on your computer.

Run the installer/download command again.

Existing files are protected by:

```text
--no-overwrites
```

so files that already exist will not intentionally be overwritten.

---

# 🎧 MP3 quality

The downloader uses:

```text
--audio-quality 0
```

This tells FFmpeg to use its best MP3 conversion quality.

However, this does **not** mean:

- Lossless audio
- Guaranteed 320 kbps
- Studio-quality audio

YouTube audio is already compressed, and converting it to MP3 introduces another lossy encoding step.

If you want the best available source audio without converting it to MP3, yt-dlp can also download the best available audio stream directly.

---

# 🛠️ Troubleshooting

If something doesn't work, check:

[Open the Troubleshooting Guide](TROUBLESHOOTING.md)

Common problems include:

- `yt-dlp: command not found`
- `ffmpeg: command not found`
- `deno: command not found`
- HTTP `403 Forbidden`
- Video unavailable
- Interrupted downloads
- PATH problems
- YouTube changing its extraction requirements

---

# 🔐 PO-token / YouTube changes

YouTube's extraction system can change over time.

Some yt-dlp setups may require additional components such as a **PO-token provider** depending on the requests being made.

This repository currently provides the basic installation and download workflow.

If your setup returns repeated `403 Forbidden` errors, see:

[The Troubleshooting Guide](TROUBLESHOOTING.md)

The current bgutil PO-token provider project can be found here:

https://github.com/Brainicism/bgutil-ytdlp-pot-provider

The PO-token server and yt-dlp plugin are separate components and may require additional setup.

---

# 📁 Project structure

```text
youtube-playlist-to-mp3/
│
├── README.md
├── macOS.md
├── Windows.md
├── TROUBLESHOOTING.md
│
└── scripts/
    ├── mac-install.sh
    └── windows-install.ps1
```

---

# 📖 Detailed guides

If you prefer to manually follow every step instead of using the installers:

### 🍎 macOS

[macOS Setup](macOS.md)

### 🪟 Windows

[Windows Setup](Windows.md)

### 🛠️ Troubleshooting

[Troubleshooting](TROUBLESHOOTING.md)

---

# 🧰 Tools used

This project uses open-source tools including:

- **yt-dlp** — YouTube downloader
- **FFmpeg** — audio extraction and conversion
- **Deno** — JavaScript runtime used by yt-dlp
- **Homebrew** — macOS package manager
- **winget** — Windows package manager

---

# 🔗 Official projects

### yt-dlp

https://github.com/yt-dlp/yt-dlp

### FFmpeg

https://ffmpeg.org/

### Deno

https://deno.com/

### Homebrew

https://brew.sh/

### bgutil-ytdlp-pot-provider

https://github.com/Brainicism/bgutil-ytdlp-pot-provider

---

# ⭐ Support the project

If this project helped you, you can:

- ⭐ Star the repository
- 🐛 Report problems in Issues
- 💡 Suggest improvements
- 🔧 Submit improvements through Pull Requests

---

# ⚖️ Disclaimer

This project is provided for educational and personal use.

The author does not host or distribute downloaded media.

Users are responsible for complying with YouTube's Terms of Service, copyright law, and any other applicable laws or permissions.

---

## Made by Sage

GitHub:

https://github.com/SageMusic-lab
