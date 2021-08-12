#!/usr/bin/env bash

# An extremely crude script for creating a generic playlist of everything under.
# Assumes media is under ~/radio-media/ and this repository is under ~/radio/.

find ~/radio-media/ -name '*.flac' -o -name '*.mp3' -o -name '*.ogg' > ~/radio/music.pls
