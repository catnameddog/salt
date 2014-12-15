vim-enhanced:
  pkg:
    - installed

salt-master:
  pkg:
    - installed
  service:
    - running
    - watch:
      - file: /etc/salt/master

/etc/salt/master:
  file:
    - managed
    - source: salt://util/files/etc/salt/master
    - require:
      - pkg: salt-master

