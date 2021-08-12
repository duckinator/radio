#!/usr/bin/env bash

# An extremely crude script for creating a generic playlist of everything under.
# Assumes music is under ~/media/music/ and this repository is under ~/radio/.

find ~/media/music/ -name '*.flac' -o -name '*.mp3' -o -name '*.ogg' > ~/radio/music.pls
