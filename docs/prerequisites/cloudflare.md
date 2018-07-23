# Cloudflare

## Intro

[Cloudflare](https://www.cloudflare.com) a service that, among other things, protects and accelerates a wide network of websites. By acting as a "man in the middle", it it can act like a free DNS provider.

Cloudbox makes adding subdomains to Cloudflare's DNS settings a breeze via automation. All you need is the API key.

Although, Cloudflare is not required for Cloudbox, it is still recommended because:

1. DNS changes propagate almost instantly  (a lot faster than a domain provider's DNS service).

1. Makes setting up Mediabox / Feederbox a lot quicker.

1. Allows for automated setup of subdomains for Cloudbox add-on apps.

1. Can optionally enable CDN / Proxy for your subdomains.

1. And finally, because it's free.

_Note: Cloudbox does not enable CDN / Proxy by default, but you may do so yourself after installing Cloudbox (see section [[below|Prerequisites: Cloudflare#post-setup]])._



## Sign Up

1. Sign up for a free [Cloudflare](https://www.cloudflare.com/) account.

1. On your Domain Registrar's website (e.g. GoDaddy, Namecheap, etc), set the Name Servers to what Cloudflare instructs you to.

   - Examples:

     - Namecheap.com -> "Dashboard" -> _your domain.ltd_ -> "Manage" -> "Name Servers" -> "Custom DNS" -> add the nameservers in.

       ![](https://i.imgur.com/K4OI1XD.png)

     - Namesilo.com -> "Manage My Domains" -> _your domain.ltd_ -> "NameServers" -> "Change" ->  add the nameservers in.

       ![](https://i.imgur.com/a7DMp0I.png)

## Setup

1. Go to [Cloudflare.com](https://www.cloudflare.com/).

1. Your domain will have an "Active" status.

   ![](https://i.imgur.com/p1hAy3a.png)

1. Click on your domain to continue.

1. Click the "Crypto" tab and set "SSL" to `Full (strict)`.

   ![](https://i.imgur.com/PeWGHfP.png)


## Cloudflare API Key

1. Go to [Cloudflare.com](https://www.cloudflare.com/).

1. Click the "Overview" tab, click "Get your API key",

   ![](https://i.imgur.com/bQiRBc9.png)

1. Under "API Keys", and then "Global API Key", click "View".

   ![](https://i.imgur.com/pCmp5dp.png)

1. On the login popup, type in your password and click "View".

   ![](https://i.imgur.com/gTLXDH2.png)

1. Save your API key as this will be used later in during [[install|Install: Settings]].

   ![](https://i.imgur.com/ET91JKG.png)

## Post-Setup

After Cloudbox has added in the subdomains, you may go back in and turn on CDN for for them if you like.

But do this AFTER all your certs have been assigned and you have confirmed that all the Cloudbox app sites are loading OK.

_Note 1: Performance of your server may vary when CDN is enabled._

_Note 2: Leave the subdomains `cloudbox`, `mediabox`, and `feederbox` as `DNS Only`, as they were created to reach your servers directly and not behind a CDN proxy._

You can do this by:

1. Going to [Cloudflare.com](https://www.cloudflare.com/).

1. Clicking the "DNS" tab.

1. Find the subdomain of interest.

1. Under "Status", click the gray cloud icon (i.e. `DNS Only`) to switch to an orange one (i.e. `DNS and HTTP proxy (CDN)`).

   ![](https://i.imgur.com/vKlKOSL.png)
