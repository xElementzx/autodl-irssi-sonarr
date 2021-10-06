### Autodl-Irssi Sonarr

Container for the autodl irssi plugin with sonarr support.

## Usage

```
docker run \
	-it -e TERM \
	--name autodl-irssi-sonarr \
	-v </path/to/watch/directory>:/home/user/watch:rw \
	-v </path/to/autodl/directory>:/home/user/.autodl:rw \
	xelementzx/autodl-irssi
```

## Docker Compose Build

```
docker-compose up --build --detach --remove-orphans
```