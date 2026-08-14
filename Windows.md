# Windows Setup

This guide takes you from a fresh Windows computer to downloading a YouTube playlist as MP3.

---

# Step 1 — Open PowerShell

Press:

Windows key

Search:

PowerShell

Open:

Windows PowerShell

---

# Step 2 — Install yt-dlp

If your Windows installation has winget, run:

    winget install yt-dlp.yt-dlp

After installation, close PowerShell and open it again.

Check:

    yt-dlp --version

You should see a version number.

---

# Step 3 — Install FFmpeg

FFmpeg is required for extracting and converting audio.

If available through winget:

    winget install Gyan.FFmpeg

Close PowerShell and open it again after installation.

Check:

    ffmpeg -version

---

# Step 4 — Install Deno

Install Deno using the official Deno installation instructions:

https://docs.deno.com/runtime/getting_started/installation/

After installation:

    deno --version

You should see a Deno version.

---

# Step 5 — Check yt-dlp JavaScript support

Run:

    yt-dlp --verbose --simulate "https://www.youtube.com/watch?v=VIDEO_ID"

Make sure Deno is detected.

---

# Step 6 — PO-token provider

Some YouTube requests may require proof-of-origin tokens.

The bgutil project provides a PO-token server and yt-dlp plugin:

https://github.com/Brainicism/bgutil-ytdlp-pot-provider

Follow the current Windows installation instructions from the project.

IMPORTANT:

The server and yt-dlp plugin are separate components.

Installing only the server is not sufficient.

---

# Step 7 — Start the PO-token server

Start the bgutil server according to its current documentation.

Keep that PowerShell window open.

Think of it as:

    POWERSHELL 1
    ┌──────────────────────┐
    │ PO-token server       │
    │ KEEP RUNNING          │
    └──────────────────────┘

---

# Step 8 — Open another PowerShell window

The second PowerShell window is where the download command runs.

Go to your Downloads folder:

    cd "$HOME\Downloads"

---

# Step 9 — Download a playlist

Run:

    yt-dlp `
    --ignore-errors `
    --yes-playlist `
    -f "bestaudio/best" `
    -x `
    --audio-format mp3 `
    --audio-quality 0 `
    -o "%(playlist)s/%(playlist_index)03d - %(title)s.%(ext)s" `
    --no-overwrites `
    "YOUR_PLAYLIST_URL"

Replace:

    YOUR_PLAYLIST_URL

with your YouTube playlist URL.

---

# What the options mean

--ignore-errors

Skip unavailable videos and continue.

--yes-playlist

Process the playlist.

-f "bestaudio/best"

Select the best available format.

-x

Extract audio.

--audio-format mp3

Convert to MP3.

--audio-quality 0

Use the best MP3 quality setting.

-o

Controls the folder and filename.

--no-overwrites

Do not replace existing files.

---

# Output

Files will be organized like:

    Downloads/
    └── Playlist Name/
        ├── 001 - Track One.mp3
        ├── 002 - Track Two.mp3
        └── 003 - Track Three.mp3

---

# If you stop the download

Press:

    Ctrl + C

Your completed files remain on your computer.

Run the same command again.

Existing files with matching filenames will not be overwritten because of:

    --no-overwrites

---

# MP3 quality

MP3 is a lossy format.

The option:

    --audio-quality 0

means best MP3 conversion quality.

It does not mean lossless audio or guaranteed 320 kbps.

If you want the original available audio stream:

    yt-dlp -f "bestaudio/best" "PLAYLIST_URL"