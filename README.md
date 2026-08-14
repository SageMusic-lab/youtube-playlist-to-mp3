# YouTube Playlist → MP3

A beginner-friendly guide for downloading audio from YouTube playlists on **macOS and Windows** using yt-dlp, FFmpeg, Deno, and the bgutil PO-token provider.

This guide starts from zero — including installing the required tools — and takes you all the way to downloading an entire playlist as MP3 files.

## ⚠️ Important

Only download content that you have permission to download or that is otherwise lawful for you to save.

This guide does not bypass DRM, private content, or access controls.

YouTube availability and download restrictions can change over time.

---

# What you'll be able to do

You will be able to:

- Download an entire YouTube playlist
- Extract the audio
- Convert it to MP3
- Keep playlist order
- Automatically create a playlist folder
- Skip files you already downloaded
- Resume an interrupted playlist
- Skip unavailable videos instead of stopping the entire download

Example:

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
    Downloads / Playlist Name /

---

# Choose your operating system

## 🍎 macOS

👉 Open [macOS.md](macOS.md)

Complete macOS setup, including:

- Homebrew
- yt-dlp
- FFmpeg
- Deno
- bgutil PO-token provider
- Playlist → MP3 download command

## 🪟 Windows

👉 Open [Windows.md](Windows.md)

Complete Windows setup, including:

- yt-dlp
- FFmpeg
- Deno
- Git
- bgutil PO-token provider
- Playlist → MP3 download command

---

# Troubleshooting

If something doesn't work:

👉 Open [TROUBLESHOOTING.md](TROUBLESHOOTING.md)

The troubleshooting guide covers common problems such as:

- yt-dlp errors
- FFmpeg problems
- Deno problems
- HTTP 403 errors
- PO-token provider problems
- Unavailable videos
- Interrupted downloads
- Files being skipped
- Multiple Terminal/PowerShell windows
- MP3 quality questions

---

# Credits

This guide uses open-source projects including:

- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [FFmpeg](https://ffmpeg.org/)
- [Deno](https://docs.deno.com/runtime/)
- [bgutil-ytdlp-pot-provider](https://github.com/Brainicism/bgutil-ytdlp-pot-provider)

Please see the respective project documentation and licenses.

---

# Official Projects

### yt-dlp

https://github.com/yt-dlp/yt-dlp

### bgutil-ytdlp-pot-provider

https://github.com/Brainicism/bgutil-ytdlp-pot-provider

### FFmpeg

https://ffmpeg.org/

### Deno

https://docs.deno.com/runtime/