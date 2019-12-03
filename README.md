# diaecho
A gentoo overlay with misc packages. This overlay is most of my own convenience. But if any question or issue about the packages in this overlay, you're welcome to contact me.


## Usage

### layman

Add and install using *layman*.

```bash
layman -f -a diaecho -o https://raw.githubusercontent.com/seewpx/diaecho/master/overlay.xml
```

### direct

To create a configuration file for the diaecho overlay you have to run these commands as root.

```bash
mkdir -p /etc/portage/repos.conf
nano /etc/portage/repos.conf/diaecho.conf
```

Add these lines to the file:

```
[diaecho]
location = /usr/local/portage/diaecho
sync-type = git
sync-uri = https://github.com/seewpx/diaecho.git
```

Then you should be able to install packages from the overlay.

```bash
emerge --sync
emerge visual-studio-code
```
