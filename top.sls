base:
  'kernel:Linux':
    - match: grain
    - sudo
    - zsh
    - users
    - ssh
    - vim
    - tmux
    - modprobe
    - devtools
    - magicsysrq
    - locale

  'virtual:VirtualBox':
    - match: grain
    - virtualbox.guest

  'workstations':
    - match: nodegroup
    - video
    - gnome
    - gdm
    - browsers.firefox
    - terminals.roxterm
    - terminals.urxvt
