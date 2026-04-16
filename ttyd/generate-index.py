#!/usr/bin/env python3
"""
Regenerate ttyd/index.html with MesloLGS NF webfont support.

Captures ttyd's built-in HTML and injects @font-face CSS + preload hints
so NerdFont glyphs render correctly in the browser (even on first load).

Usage:
    python3 ~/.dotfiles/ttyd/generate-index.py
    # or after dotbot:
    python3 ~/.config/ttyd/generate-index.py
"""
import os
import signal
import socket
import subprocess
import sys
import time
import urllib.request

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
OUTPUT = os.path.join(SCRIPT_DIR, "index.html")
PORT = 19876  # ephemeral port unlikely to conflict

CDN_BASE = "https://cdn.jsdelivr.net/gh/romkatv/powerlevel10k-media@master"
FONTS = [
    ("MesloLGS%20NF%20Regular.ttf", "normal", "normal"),
    ("MesloLGS%20NF%20Bold.ttf", "bold", "normal"),
    ("MesloLGS%20NF%20Italic.ttf", "normal", "italic"),
    ("MesloLGS%20NF%20Bold%20Italic.ttf", "bold", "italic"),
]

def font_css():
    preloads = []
    faces = []
    for filename, weight, style in FONTS:
        url = f"{CDN_BASE}/{filename}"
        preloads.append(
            f'<link rel="preload" href="{url}" as="font" type="font/ttf" crossorigin>'
        )
        faces.append(
            f"@font-face {{ font-family: 'MesloLGS NF'; "
            f"src: url('{url}') format('truetype'); "
            f"font-weight: {weight}; font-style: {style}; }}"
        )
    preload_tags = "\n".join(preloads)
    style_block = "<style>\n" + "\n".join(faces) + "\n</style>"
    return preload_tags + "\n" + style_block + "\n"

def wait_for_port(port, timeout=5):
    start = time.time()
    while time.time() - start < timeout:
        try:
            with socket.create_connection(("127.0.0.1", port), timeout=0.5):
                return True
        except OSError:
            time.sleep(0.2)
    return False

def capture_default_html():
    proc = subprocess.Popen(
        ["ttyd", "-p", str(PORT), "echo", "generating"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    try:
        if not wait_for_port(PORT):
            raise RuntimeError("ttyd did not start in time")
        with urllib.request.urlopen(f"http://127.0.0.1:{PORT}") as resp:
            return resp.read().decode("utf-8")
    finally:
        proc.send_signal(signal.SIGTERM)
        proc.wait(timeout=5)

def main():
    print("Starting temporary ttyd to capture default HTML...")
    html = capture_default_html()
    print(f"Captured {len(html)} bytes of default HTML")

    if "</head>" not in html:
        print("ERROR: could not find </head> in captured HTML", file=sys.stderr)
        sys.exit(1)

    html = html.replace("</head>", font_css() + "</head>", 1)

    with open(OUTPUT, "w") as f:
        f.write(html)
    print(f"Written {len(html)} bytes to {OUTPUT}")

if __name__ == "__main__":
    main()
