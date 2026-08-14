# YouTube Playlist → MP3

A simple beginner-friendly tool for downloading audio from YouTube playlists and converting it to MP3 using **yt-dlp** and **FFmpeg**.

Works on:

- 🍎 macOS
- 🪟 Windows

The project is designed around a simple workflow:

```text
Clone the project
      ↓
Run the installer
      ↓
Paste your YouTube playlist URL
      ↓
Download MP3 files
```

---

## ⚠️ Important

Only download content that you have permission to download or that is otherwise lawful for you to save.

This project does not bypass DRM, private content, or access controls.

YouTube availability and technical requirements can change over time.

---

# 🚀 Quick Start

You don't need to manually install every component.

The repository includes installers for both macOS and Windows.

---

## 🍎 macOS

### 1. Clone the repository

Open Terminal and run:

```bash
git clone https://github.com/SageMusic-lab/youtube-playlist-to-mp3.git
```

Then enter the project:

```bash
cd youtube-playlist-to-mp3
```

### 2. Start the installer

Run:

```bash
chmod +x scripts/mac-install.sh
./scripts/mac-install.sh
```

The installer will:

1. Check for Homebrew
2. Install yt-dlp
3. Install FFmpeg
4. Install Deno
5. Check the required tools
6. Ask for your YouTube playlist URL
7. Download the playlist as MP3 files

When you see:

```text
Paste your YouTube playlist URL:
```

paste your playlist URL and press Enter.

### macOS requirement

Homebrew must be installed.

If you don't have Homebrew, install it from:

https://brew.sh/

Then run the installer again.

---

# 🪟 Windows

### 1. Clone the repository

Open PowerShell and run:

```powershell
git clone https://github.com/SageMusic-lab/youtube-playlist-to-mp3.git
```

Then enter the project:

```powershell
cd youtube-playlist-to-mp3
```

### 2. Run the installer

Run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
```

Then:

```powershell
.\scripts\windows-install.ps1
```

The installer will:

1. Check for winget
2. Install yt-dlp
3. Install FFmpeg
4. Install Deno
5. Check the required tools
6. Ask for your YouTube playlist URL
7. Download the playlist as MP3 files

When you see:

```text
Paste your YouTube playlist URL:
```

paste your playlist URL and press Enter.

---

# 🎵 What the downloader does

The downloader uses:

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

It is configured to:

- Download the entire playlist
- Extract audio
- Convert audio to MP3
- Keep playlist order
- Number tracks automatically
- Create a folder using the playlist name
- Skip unavailable videos
- Avoid overwriting existing files

---

# 📁 Where are the files saved?

### macOS

```text
~/Downloads/
```

### Windows

```text
Downloads\
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

---

# 🔢 Playlist numbering

Tracks are automatically numbered:

```text
001 - Track Name.mp3
002 - Track Name.mp3
003 - Track Name.mp3
```

This keeps the original playlist order.

---

# 🔄 Continuing an interrupted download

If you stop a download with:

```text
Ctrl + C
```

your completed files remain on your computer.

Run the installer/download command again.

The downloader uses:

```text
--no-overwrites
```

so existing files with matching filenames will not intentionally be overwritten.

---

# 🎧 MP3 quality

The downloader uses:

```text
--audio-quality 0
```

This tells FFmpeg to use its best MP3 conversion quality.

This does **not** mean:

- Lossless audio
- Guaranteed 320 kbps
- Studio-quality audio

YouTube audio is already compressed, and converting it to MP3 creates another lossy encoding step.

---

# 🛠️ Troubleshooting

Having problems?

Open:

[Troubleshooting Guide](TROUBLESHOOTING.md)

It covers common problems including:

- `yt-dlp: command not found`
- `ffmpeg: command not found`
- `deno: command not found`
- HTTP 403 errors
- Video unavailable
- Copyright-removed videos
- Interrupted downloads
- Wrong download folder
- Rate limiting
- PO-token problems
- MP3 quality questions

---

# 🔐 PO-token / YouTube changes

Most users do **not** need to manually configure a PO-token provider.

The included installers set up the main tools required for normal use:

- yt-dlp
- FFmpeg
- Deno

YouTube's systems can change over time.

If yt-dlp repeatedly returns HTTP 403 errors, bot checks, or other request-related errors, an advanced PO-token provider may help in some situations.

The bgutil PO-token provider is available here:

https://github.com/Brainicism/bgutil-ytdlp-pot-provider

The PO-token server and yt-dlp plugin are separate components.

A PO-token provider does not guarantee that every 403 error or YouTube restriction will be resolved.

For problems, see:

[Troubleshooting Guide](TROUBLESHOOTING.md)

---

# 📂 Project structure

```text
youtube-playlist-to-mp3/
│
├── README.md
├── TROUBLESHOOTING.md
│
└── scripts/
    ├── mac-install.sh
    └── windows-install.ps1
```

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

If this project helped you:

- ⭐ Star the repository
- 🐛 Report problems in Issues
- 💡 Suggest improvements
- 🔧 Submit Pull Requests

---

# ⚖️ Disclaimer

This project is provided for educational and personal use.

The author does not host or distribute downloaded media.

Users are responsible for complying with YouTube's Terms of Service, copyright law, and any other applicable laws and permissions.

---

## Made by Sage

GitHub:

https://github.com/SageMusic-lab
