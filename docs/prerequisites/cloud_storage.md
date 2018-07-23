# Cloud Storage

!> Currently only Google Drive is supported out of the box (due to our preference for Plexdrive and lack of Rclone Cache Mount support).


## Google Drive Account

Cloudbox stores the media unencrypted in Google Drive and utilizes Plexdrive to access it. So if you want to use another cloud storage provider and/or prefer encryption, Cloudbox may not be for you (see [[FAQ]]). We recommend creating a [G-Suite Business](https://gsuite.google.com/pricing.html) account for larger storage space.

Media will be stored in `Movies` and `TV` folders, all within a `Media` folder in root (i.e. `/Media`). <a href="#note1" id="note1ref"><sup>[1]</sup></a>  


   ```
   Media
   ├── Movies
   └── TV
   ```

  ![](https://i.imgur.com/Q8cxZW4.png)

If you have media in other folders, simply move them into these folders via the [Google Drive website](https://www.google.com/drive/).

Note: All the paths/folders mentioned here, and elsewhere, are **CASE SENSITIVE** (see  [[Cloudbox Paths|Basics: Cloudbox Paths]]).

---
 <sub> <a id="note1" href="#note1ref"><sup>1</sup></a> If you would like to customize your Plex libraries beyond what is listed above, see [[Customizing Plex Libraries]].</sub>
