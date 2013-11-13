sudo:
  pkg:
    - installed

  group.present:
    - name: wheel
    - system: True

  file.managed:
    - name: /etc/sudoers
    - source: salt://sudo/sudoers
    - user: root
    - group: root
    - mode: 400
    - require:
      - pkg: sudo
      - group: wheel
