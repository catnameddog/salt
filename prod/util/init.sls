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

bind-chroot:
  pkg:
    - installed
  service:
    - name: named
    - running

/etc/named.conf:
  file:
    - managed
    - source: salt://util/files/etc/named.conf
    - require:
      - pkg: bind-chroot

bind-utils:
  pkg:
    - installed
