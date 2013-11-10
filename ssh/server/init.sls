include:
  - ssh

sshd:
  service:
    - running
  require:
    - pkg: openssh
    - file: sshd_config

sshd_config:
  file:
    - managed
    - name: /etc/ssh/sshd_config
    - source: salt://ssh/server/sshd_config
    - user: root
    - group: root
    - mode: 644
