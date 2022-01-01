### Autodl-Irssi Sonarr

Container for the autodl irssi plugin with sonarr support.

## Usage

```
docker run \
	-it -e TERM \
	--name autodl-irssi-sonarr \
	-v </path/to/watch/directory>:/home/user/watch:rw \
	-v </path/to/autodl/directory>:/home/user/.autodl:rw \
	-v </path/to/trackers/directory>:/home/user/.irssi/scripts/AutodlIrssi/trackers:rw \
	xelementzx/autodl-irssi
```

Grab your trackerfile for your appropriate tracker either from here: https://github.com/autodl-community/autodl-trackers or from your tracker, the github is no longer being maintained it seems so this is the next best way to handle it, BYO trackerfile

## Docker Compose Build

```
docker-compose up --build --detach --remove-orphans
```