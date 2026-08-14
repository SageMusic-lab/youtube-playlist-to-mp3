# Windows Setup

This guide takes you from a fresh Windows computer to downloading a YouTube playlist as MP3.

The setup uses:

- yt-dlp
- FFmpeg
- Deno
- Git
- bgutil PO-token provider

> **Important:** Only download content that you have permission to download or that is otherwise lawful for you to save.

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

The official standalone Windows executable is recommended.

Download:

https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe

Create a folder for yt-dlp:

    mkdir "$HOME\yt-dlp"

Move `yt-dlp.exe` into:

    C:\Users\YOUR_USERNAME\yt-dlp\

You can also use another folder if you prefer.

Add the folder containing `yt-dlp.exe` to your Windows PATH.

Then close PowerShell and open it again.

Check:

    yt-dlp --version

You should see a version number.

The official Windows standalone executable includes the required yt-dlp EJS components.

---

# Step 3 — Install FFmpeg

FFmpeg is required for extracting and converting audio.

If your Windows installation has winget, run:

    winget install Gyan.FFmpeg

After installation, close PowerShell and open it again.

Check:

    ffmpeg -version

You should see FFmpeg version information.

---

# Step 4 — Install Deno

Deno is the recommended JavaScript runtime for yt-dlp.

Install Deno using the official instructions:

https://docs.deno.com/runtime/getting_started/installation/

After installation, close PowerShell and open it again.

Check:

    deno --version

Deno 2.x or newer is supported by the current yt-dlp EJS setup.

---

# Step 5 — Check JavaScript support

Run:

    yt-dlp --verbose --simulate "https://www.youtube.com/watch?v=VIDEO_ID"

Replace `VIDEO_ID` with an actual YouTube video ID.

Look through the verbose output for JavaScript/EJS and Deno-related information.

---

# Step 6 — Install Git

Git is required to install the bgutil provider from its repository.

Check:

    git --version

If Git is not installed, download it from:

https://git-scm.com/download/win

Install Git using the default options.

Close PowerShell and open it again.

Check:

    git --version

---

# Step 7 — Install the bgutil PO-token provider

The bgutil provider has two parts:

1. The PO-token server
2. The yt-dlp plugin

Both are required.

Official project:

https://github.com/Brainicism/bgutil-ytdlp-pot-provider

The current release is 1.3.1.

Clone the matching release:

    cd $HOME

    git clone --single-branch --branch 1.3.1 https://github.com/Brainicism/bgutil-ytdlp-pot-provider.git

Enter the server directory:

    cd "$HOME\bgutil-ytdlp-pot-provider\server"

Install the server dependencies using Deno:

    deno install --allow-scripts=npm:canvas --frozen

Wait for the installation to finish.

---

# Step 8 — Install the bgutil yt-dlp plugin

The plugin is separate from the server.

Download:

    bgutil-ytdlp-pot-provider.zip

from:

https://github.com/Brainicism/bgutil-ytdlp-pot-provider/releases

Create the yt-dlp plugin directory:

    New-Item -ItemType Directory -Force "$env:APPDATA\yt-dlp\plugins"

Place the downloaded ZIP file inside:

    $env:APPDATA\yt-dlp\plugins

Do not extract the ZIP unless the current bgutil documentation specifically tells you to.

The server and plugin should use the same bgutil version.

---

# Step 9 — Start the PO-token server

Open a PowerShell window.

Run:

    cd "$HOME\bgutil-ytdlp-pot-provider\server"

Then:

    cd node_modules

Start the server:

    deno run --allow-env --allow-net --allow-ffi=. --allow-read=. ../src/main.ts

The default server port is:

    4416

Keep this PowerShell window open while downloading.

Your setup should look like:

    POWERSHELL 1
    ┌──────────────────────────┐
    │ bgutil PO-token server   │
    │ Port: 4416               │
    │ KEEP OPEN                │
    └──────────────────────────┘

---

# Step 10 — Verify the PO-token plugin

Open a second PowerShell window.

Run:

    yt-dlp -v "https://www.youtube.com/watch?v=VIDEO_ID"

Look for:

    PO Token Providers

You should see a bgutil provider.

For example:

    bgutil:http-1.3.1

The exact output may change with future versions.

If bgutil does not appear, the plugin has not been installed correctly.

---

# Step 11 — Go to Downloads

In the second PowerShell window:

    cd "$HOME\Downloads"

Check your current folder:

    pwd

---

# Step 12 — Download a YouTube playlist as MP3

PowerShell uses the backtick character:

    `

for multiline commands.

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

with the actual YouTube playlist URL.

Example:

    yt-dlp `
    --ignore-errors `
    --yes-playlist `
    -f "bestaudio/best" `
    -x `
    --audio-format mp3 `
    --audio-quality 0 `
    -o "%(playlist)s/%(playlist_index)03d - %(title)s.%(ext)s" `
    --no-overwrites `
    "https://www.youtube.com/playlist?list=YOUR_PLAYLIST_ID"

---

# What the options mean

### --ignore-errors

Skips unavailable videos and continues.

### --yes-playlist

Processes the entire playlist.

### -f "bestaudio/best"

Selects the best available format.

### -x

Extracts the audio.

### --audio-format mp3

Converts the extracted audio to MP3.

### --audio-quality 0

Uses FFmpeg's best MP3 quality setting.

This does NOT mean lossless audio or guaranteed 320 kbps.

### -o

Controls the output folder and filename.

### %(playlist)s

Creates a folder using the playlist name.

### %(playlist_index)03d

Numbers tracks:

    001
    002
    003

### %(title)s

Uses the YouTube video title.

### --no-overwrites

Does not overwrite an existing output file with the same filename.

---

# Where will the files go?

Because you started in:

    $HOME\Downloads

the files will be saved inside your Downloads folder.

Example:

    Downloads/
    └── My Playlist/
        ├── 001 - Track One.mp3
        ├── 002 - Track Two.mp3
        ├── 003 - Track Three.mp3
        └── ...

---

# If you stop the download

Press:

    Ctrl + C

Your completed files remain on your computer.

Run the same command again.

Because the command contains:

    --no-overwrites

existing files with matching filenames will not be intentionally overwritten.

yt-dlp may still check playlist items again before skipping existing files.

---

# If some videos fail

A playlist can contain videos that are:

- Deleted
- Private
- Region restricted
- Copyright removed
- Temporarily unavailable
- Otherwise unavailable

Because the command uses:

    --ignore-errors

yt-dlp will skip an unavailable item and continue.

---

# HTTP 403 errors

A 403 Forbidden error means YouTube rejected a request.

Possible causes include:

- YouTube changed its systems
- Temporary rate limiting
- IP/network restrictions
- An outdated yt-dlp version
- PO-token provider problems
- Restrictions on a particular video

The bgutil PO-token provider may help with some YouTube bot checks, but it does NOT guarantee that every 403 or bot check will be bypassed.

If you repeatedly receive 403 errors:

1. Update yt-dlp.
2. Check Deno.
3. Make sure the bgutil server is running.
4. Make sure the bgutil plugin is installed.
5. Check the verbose output.
6. Avoid running many large downloads simultaneously.

---

# Update yt-dlp

Run:

    yt-dlp -U

Then check:

    yt-dlp --version

---

# MP3 quality

IMPORTANT:

    --audio-quality 0

does NOT mean:

- Lossless audio
- Guaranteed 320 kbps
- Studio-quality audio

YouTube audio is already compressed.

Converting it to MP3 creates another lossy encoding step.

If you want the best available audio stream without MP3 conversion:

    yt-dlp -f "bestaudio/best" "PLAYLIST_URL"

---

# Multiple PowerShell windows

The recommended setup is:

    PowerShell 1 → PO-token server

    PowerShell 2 → One playlist download

You can technically run multiple yt-dlp processes, but downloading several large playlists simultaneously can increase requests to YouTube and may increase rate limiting or temporary errors.

For reliability, download large playlists one at a time.

---

# Official Links

yt-dlp:

https://github.com/yt-dlp/yt-dlp

Deno:

https://docs.deno.com/runtime/getting_started/installation/

Git:

https://git-scm.com/download/win

FFmpeg:

https://ffmpeg.org/

bgutil PO-token provider:

https://github.com/Brainicism/bgutil-ytdlp-pot-provider