# What is Cloudbox?

- [Cloudbox](https://cloudbox.works) is an [Ansible](https://www.ansible.com/how-ansible-works) and [docker](https://www.docker.com/what-container) based solution for rapidly deploying a cloud media server on any x64 Ubuntu Server.  

- Primary functions are: the automatic acquisition of media, storing that media on the cloud, and the ability to play your media from anywhere.


# Why use Cloudbox?

### Custom Domains

- Have your server setup behind your own domain, securely (e.g. https://apps.yourdomain.com).

### Fast Deployment

- Have a system running in minutes with minimal input (a full server setup from scratch within minutes - see example [here](https://ci.appveyor.com/project/desimaniac/cloudbox)).

### Docker-Based Applications

- Docker containers keep your apps isolated from each other - no more conflicts between apps.

- Docker containers keep your system tidy since none on of the apps' files (executables and dependencies) are stored outside of the container.

- Quickly install and uninstall apps.

- Configuration files for all key applications are conveniently stored in /opt, which makes backup so easy. Easily pack up your server and move to another one with Cloudbox's built-in Backup.


### Cloud Storage

- Store media on cloud storage to save on local drive space.


### Can Choose Your Preferred Media Server Application

- You can decide whether to use Plex or Emby.

### Custom Server Deployment

- You can deploy Cloudbox on an all-in-one server, for downloading and streaming.

  or

- You can deploy Cloudbox between two servers: a Mediabox, as streaming server, and a Feederbox, as a downloading server.

### Secure

- Cloudbox uses secure HTTPS provided by Let's Encrypt SSL certificates.


# How does Cloudbox function ?

[Plexdrive](https://github.com/dweidenfeld/plexdrive) (or [Rclone](https://rclone.org/)) will mount your cloud storage provider (e.g. Google Drive) on to the server.

UnionFS will merge this mounted cloud storage path, with your server's local folder, and this will be accessible by the media server application (e.g. Plex).

[Sonarr](https://sonarr.tv/) will download your favorite TV Shows. [Radarr](https://radarr.video/) will download favorite movies. Both do this by utilizing either Usenet (via [NZBGet](https://nzbget.net/)) and/or Torrents (via [ruTorrent](https://github.com/Novik/ruTorrent)).<sup name="a1">[\[1\]](#f1) </sup><sup name="a2">[\[2\]](#f2)</sup>

Sonarr / Radarr will move these downloads to your server's `/mnt/local/Media/` folder and send a notification to _Plex Autoscan_.

[Plex AutoScan](https://github.com/l3uddz/plex_autoscan/) will, in turn, tell Plex to scan for the newly downloaded TV Show or Movie, by only scanning the season / movie folders. This will (1), make the media appear in Plex sooner than what a full library scan would have been able to do, and (2), reduce the chances of Cloud Storage API bans.

[Cloudplow](https://github.com/l3uddz/cloudplow/) will eventually move the locally downloaded to the cloud, under a folder called `Media`. The media files will still be accessible to Plex/Emby via UnionFS/Plexdrive/Rclone.




![](https://i.imgur.com/pr6sKtr.png)





***

<sup><b name="f1">[1](#a1)</b> Some of the applications above can be replaced with similar apps. </sup>

<sup><b name="f2">[2](#a2)</b> If you want to use Torrents, it is recommended to be a member of a private tracker vs using public ones. If you want to to use Usenet, you will need to purchase Usenet provider service (or multiple services) and also be a member of a Usenet indexer site. </sup>
