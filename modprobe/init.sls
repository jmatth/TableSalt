# Fuck this thing
pcspkr:
  kmod.absent:
    - persist: true

# The persist part doesn't seem to work, so we'll do it ourselves
/etc/modprobe.d/pcspkr.conf:
  file.managed:
    - contents: blacklist pcspkr
    - user: root
    - group: root
    - mode: 644
