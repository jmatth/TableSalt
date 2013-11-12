base:
  'kernel:Linux':
    - match: grain
    - global

  'workstations':
    - match: nodegroup
    - devel
    - gui
