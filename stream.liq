#!/usr/bin/env -S liquidsoap secrets.liq

# secrets.liq contains passwords and such

set("log.file.path","/tmp/radio.log")

# Music
playlist = playlist("~/radio/music.pls")
# Some jingles
#jingles = playlist("~/radio/jingles.pls")
# If something goes wrong, we'll play this
security = single("~/radio/silence.ogg")

# Start building the feed with music
radio = playlist
# Now add some jingles
#radio = random(weights = [1, 4],[jingles, radio])
# And finally the security
radio = fallback(track_sensitive = false, [radio, security])

# start the stream
output.icecast(%vorbis,
        host = "localhost", port = 8000,
        password = source_password,
        mount = "stream.ogg",
        #description = "",
        #genre = "",
        radio)
