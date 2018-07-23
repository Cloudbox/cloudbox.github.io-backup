# Server

## Getting a Server

You will need a dedicated server, from a server provider (e.g. Hetzner, kimsufi, OVH, etc), installed with Ubuntu Server [16.04](http://releases.ubuntu.com/16.04/) or [18.04](http://releases.ubuntu.com/18.04/).

- Example from Hetzner:

  ![](https://i.imgur.com/DcZAAWM.png)


_Note 1: Cloudbox only supports x64 (i.e. AMD64) machines. ARM based hardware is not supported._

_Note 2: If you are using a Scaleway server, read [[this|FAQ#if-you-are-using-a-scaleway-server]]._

_Note 3: If you are setting this up on a home server, make sure you open the relevant [[ports|Reference: Cloudbox Ports]] (eg `80`, `443`, etc) in your [router](https://portforward.com/router.htm)/firewall, before installing Cloudbox._

_Note 4: If using Ubuntu Desktop, make sure SSH is pre-installed._


## Tips

### Ubuntu Install
- When installing the server yourself, select `Install Ubuntu Server with the HWE kernel`. You can then skip the [[Kernel update page|Install: Kernel]] in the wiki.

     ![](https://i.imgur.com/nBCsD9E.png)

### Partitioning:
- If you have multiple hard drives on the server (eg. 2 x 4 TB), put them in RAID 0 to maximize space and speed (you don't need redundancy as you can schedule backups of Cloudbox).

- Set all available space to `/` (remove `/home` and `/data` partitions).

- Leave ample space in `/boot` (e.g. 2+ GB).

- Examples

   - Online.net

     ![](https://i.imgur.com/1rDCs4z.png)

   - OVH

     ![](https://i.imgur.com/GRTjQvt.png)

     ![](https://i.imgur.com/UqR2GCv.png)
