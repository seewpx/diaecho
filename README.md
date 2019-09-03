# diaecho
A gentoo overlay with misc packages


## Usage

### layman

Add and install using *layman*.

```bash
layman -f -a qownnotes-overlay -o https://raw.githubusercontent.com/seewpx/diaecho/master/overlay.xml
```

### direct

To create a configuration file for the QOwnNotes overlay you have to run these commands as root.

```bash
mkdir -p /etc/portage/repos.conf
nano /etc/portage/repos.conf/diaecho-overlay.conf
```

Add these lines to the file:

```
[qownnotes-overlay]
location = /usr/local/portage/diaecho-overlay
sync-type = git
sync-uri = https://github.com/seewpx/diaecho.git
```

Then you should be able to install packages from the overlay.

```bash
emerge --sync
emerge visual-studio-code
```
