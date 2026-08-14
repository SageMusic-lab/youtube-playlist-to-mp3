# macOS Setup

This guide takes you from a completely fresh Mac to downloading a YouTube playlist as MP3.

---

# Step 1 — Open Terminal

Press:

Command + Space

Search:

Terminal

Press Enter.

You should see something similar to:

    mac@MacBook ~ %

---

# Step 2 — Install Homebrew

Homebrew is a package manager for macOS.

Install it using the official Homebrew installation instructions:

https://brew.sh/

After installation, close Terminal and open it again.

Check that Homebrew works:

    brew --version

If you see a Homebrew version number, you're ready.

---

# Step 3 — Install yt-dlp, FFmpeg and Deno

Run:

    brew install yt-dlp ffmpeg deno

Wait for the installation to finish.

---

# Step 4 — Check the installations

Run these one at a time:

    yt-dlp --version

    ffmpeg -version

    deno --version

Each command should return version information.

---

# Step 5 — Install the YouTube JavaScript components

Current versions of yt-dlp use JavaScript support for full YouTube extraction.

Deno is the recommended JavaScript runtime.

yt-dlp should automatically detect Deno if it is installed correctly.

Check:

    yt-dlp --verbose --simulate "https://www.youtube.com/watch?v=VIDEO_ID"

Look for Deno being detected in the output.

---

# Step 6 — PO-token provider

Some YouTube requests may require proof-of-origin tokens.

The bgutil project provides a PO-token server and a yt-dlp plugin:

https://github.com/Brainicism/bgutil-ytdlp-pot-provider

Follow the current installation instructions from that project for the server and yt-dlp plugin.

IMPORTANT:

The PO-token server and the yt-dlp plugin are separate components.

Installing only the server is not enough.

---

# Step 7 — Start the PO-token server

After installing bgutil according to its documentation, start its server.

Keep that Terminal window open.

Think of it like this:

    TERMINAL 1
    ┌──────────────────────┐
    │ PO-token server       │
    │ Running in background │
    └──────────────────────┘

Do not close this window while downloading.

---

# Step 8 — Open a second Terminal

Open another Terminal window.

This second Terminal is where you run yt-dlp.

You can check your Downloads folder:

    cd ~/Downloads

---

# Step 9 — Download a playlist as MP3

Use:

    yt-dlp \
    --ignore-errors \
    --yes-playlist \
    -f "bestaudio/best" \
    -x \
    --audio-format mp3 \
    --audio-quality 0 \
    -o "%(playlist)s/%(playlist_index)03d - %(title)s.%(ext)s" \
    --no-overwrites \
    "YOUR_PLAYLIST_URL"

Replace:

    YOUR_PLAYLIST_URL

with the YouTube playlist URL.

Example:

    yt-dlp \
    --ignore-errors \
    --yes-playlist \
    -f "bestaudio/best" \
    -x \
    --audio-format mp3 \
    --audio-quality 0 \
    -o "%(playlist)s/%(playlist_index)03d - %(title)s.%(ext)s" \
    --no-overwrites \
    "https://www.youtube.com/playlist?list=YOUR_PLAYLIST_ID"

---

# What the options mean

--ignore-errors

If one video is unavailable, continue to the next video.

--yes-playlist

Download the playlist rather than only one video.

-f "bestaudio/best"

Select the best available audio/video format that yt-dlp can use.

-x

Extract audio.

--audio-format mp3

Convert the extracted audio to MP3.

--audio-quality 0

Use the best quality setting for the MP3 conversion.

-o

Controls the filename and folder structure.

%(playlist)s

Creates a folder using the playlist name.

%(playlist_index)03d

Numbers tracks:

001
002
003

%(title)s

Uses the YouTube video title.

--no-overwrites

Do not overwrite an existing file with the same output filename.

---

# Where will the files go?

They will be saved inside:

    ~/Downloads/

For example:

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

Your already downloaded files remain on your computer.

Run the same command again.

Because the command contains:

    --no-overwrites

existing files with matching filenames will not be overwritten.

The playlist can continue processing the remaining items.

---

# MP3 quality

IMPORTANT:

    --audio-quality 0

does NOT mean lossless audio.

It tells FFmpeg to use its best MP3 quality setting.

The original YouTube audio is already compressed, and converting it to MP3 creates another lossy encoding step.

If you want the original available audio instead of MP3 conversion, use:

    yt-dlp -f "bestaudio/best" "PLAYLIST_URL"

---

# Multiple Terminal windows

You can run more than one yt-dlp process while the PO-token server is running.

However, running several large playlists simultaneously can increase requests to YouTube and may increase rate limiting or errors.

For the most reliable experience:

    Terminal 1 → PO-token server

    Terminal 2 → playlist download

Run large playlists one at a time.
