import os

qc_dir = os.path.join(os.path.expanduser('~'), "qconvert_config")
qc_config_filepath = os.path.join(qc_dir, "qconvert_config.json")
qc_presets_dir = os.path.join(qc_dir, "qconvert_presets")

video_extension = [
    ".mov",
    ".mp4",
    ".wmv",
    ".avi",
    ".mkv",
    ".mts",
    ".xvid",
    ".divx",
]

audio_extension = [
    ".mp3",
    ".wav",
    ".flac",
    ".ogg",
    "opus",
    "m4a",
]