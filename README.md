# radio.do1g.com

a basic web radio station setup using icecast2, liquidsoap, and caddy.

## file layout

* `~/media/music`: music files. layout is irrelevant (see `generate-playlists.sh`).
* `~/radio`: this repo

## setup

1. Put some music in `~/media/music`
2. `sudo bash ./setup.sh && bash ./generate-playlists.sh`
3. Make sure to set passwords and hostname in /etc/icecast2/icecast.xml
4. `cp secrets.liq.example secrets.liq`, then edit `secrets.liq`
5. Edit `/etc/caddy/Caddyfile` to just be `import /home/YOUR-USERNAME-HERE/radio/Caddyfile`

## running

`liquidsoap secrets.liq stream.liq`
