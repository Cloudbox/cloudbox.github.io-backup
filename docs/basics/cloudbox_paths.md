# Cloudbox Paths

## General Info

It is recommended to assign all your disk space to `/`, as all of your imported media and app data will be saved to `/mnt/local/` and `/opt/`,  respectively.


Note 1: **ALL** folders/paths mentioned below, and elsewhere on the wiki, are **CASE SENSITIVE** (e.g. Google Drive: `Media` not `media`, `Movies` not `movies`, `TV` not `tv`; Plex Requests: `/logs` not `/Logs`, etc). This is important, or else apps like Plex, Sonarr, and Radarr will not be able find your media.

Note 2: This wiki uses `~/` interchangeably with `/home/<username>/`, which is defined as `/home/{{user}}/` in Ansible syntax (as used in [[settings.yml|Install: Settings]]). So if your user name was `seed`, your `~/` path would be `/home/seed/`.

## Google Drive Paths




```
Media
├── Movies
└── TV
```

![](https://i.imgur.com/Q8cxZW4.png)


| Path                   | Purpose                                                                                                                                                            |
|:---------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| /Media/     |  Location of the `Movies` and `TV` folders                                                                                                                            |
| /Media/Movies/ |  Location of all your movies (folder format: /Media/Movies/Movie Name (year)/movie file.ext)                                                                                                   |
| /Media/TV/   |  Location of all your TV shows (folder format: /Media/TV/TV Show Name/Season 00/episode file.ext) |

_Note: If you would like to customize your Plex libraries differently, see [[Customizing Plex Libraries]]._


## Local Paths

```
mnt
├──local
|  └── Media
├──plexdrive
|  └── Media
└──unionfs
   └── Media
```

### Media





| Path                   | Purpose                                                                                                                                                            |
|:---------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| /mnt/local/Media/     |  Location of media stored on the server.  <br /><br />This is the local part of /mnt/unionfs/Media.                                                                                                                         |
| /mnt/plexdrive/Media/ |  Location of media stored on Google Drive (mounted by Plexdrive)                                                                                                   |
| /mnt/unionfs/Media/   |  Combined folder of local media ("/mnt/local/Media/") and online media ("/mnt/plexdrive/Media/"). <br /><br /> This is the folder that Plex, Sonarr, and Radarr read when scanning for media. |

_Note: Make sure `/mnt/local/` has enough space to store the imported media (before it is able to move it to Google Drive; see [below](#unionfs-cleaner))._

### Cloudplow


| Path               | Purpose                                                                                                                                                                                       |
|:------------------ |:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| /mnt/local/Media/ |  Location of media stored on the server. <br /><br /> Size of this path is checked periodically (default 30 min). <br /><br /> When the folder size reaches its target (default 200GB), media files are moved off/uploaded to the cloud, freeing up local disk space.  |

_Note: For more info, see the [[Cloudplow]] page._


## Docker Paths

The Dockerized app (e.g. Plex) will "see" the **Docker Path**, but that path will actually be the **Host Path** on the server. 

By default, NZBGet and ruTorrent downloads are stored in `/mnt/local/downloads/` on the server (i.e **Host Path**), however, this can be changed to point elsewhere (e.g. a second hard drive) by editing the [[settings.yml|Install: Settings]] file. But regardless of the download location chosen, the **Docker Path** will always be the same.

_Note: It is advised to leave at least 100GB free on `/opt` for the storage of Docker data_.

### Plex

| Docker Path    | Host Path                   | Purpose                      |
|:-------------- |:--------------------------- |:---------------------------- |
| /data/Movies/ | /mnt/unionfs/Media/Movies/ |  Plex reads this for Movies   |
| /data/TV/     | /mnt/unionfs/Media/TV/     |  Plex reads this for TV Shows |


### Sonarr


| Docker Path            | Host Path                         | Purpose                                                                 |
|:---------------------- |:--------------------------------- |:----------------------------------------------------------------------- |
| /tv/                  | /mnt/unionfs/Media/TV/           |  Sonarr will import to "/tv/", which is actually "/mnt/unionfs/Media/TV/" on host system.     |
| /downloads/rutorrent/ | /mnt/local/downloads/rutorrent/ (default)  |  ruTorrent download folder as set in settings.yml                        |
| /downloads/nzbget/    | /mnt/local/downloads/nzbget/ (default)    |  NZBGet download folder as set in settings.yml                           |


### Radarr


| Docker Path            | Host Path                         | Purpose                                                                     |
|:---------------------- |:--------------------------------- |:--------------------------------------------------------------------------- |
| /movies/              | /mnt/unionfs/Media/Movies/       |  Radarr will import to "/movies/", which is actually "/mnt/unionfs/Media/Movies/" on host system  |
| /downloads/rutorrent/ | /mnt/local/downloads/rutorrent/ (default)  |  ruTorrent download folder as set in settings.yml                            |
| /downloads/nzbget/    | /mnt/local/downloads/nzbget/ (default)    |  NZBGet download folder as set in settings.yml                                |


### PlexPy (Tautulli)


| Docker Path | Host Path                                                      | Purpose                               |
|:----------- |:-------------------------------------------------------------- |:------------------------------------- |
| /logs/          | /opt/plex/Library/Application Support/Plex Media Server/Logs/ |  Location of Plex logs  |
