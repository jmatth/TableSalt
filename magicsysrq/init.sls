/etc/sysctl.d/99-magicsysrq.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents: kernel.sysrq = 1

echo "1" > /proc/sys/kernel/sysrq:
  cmd.wait:
    - watch:
      - file: /etc/sysctl.d/99-magicsysrq.conf
