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

bind-utils:
  pkg:
    - installed

bind-chroot:
  pkg:
    - installed
  service:
    - name: named
    - running
    - watch:
      - file: /etc/named*

/etc/named.conf:
  file:
    - managed
    - source: salt://util/files/etc/named.conf
    - require:
      - pkg: bind-chroot

/etc/named/zones/db.catnameddog.com:
  file:
    - managed
    - source: salt://util/files/etc/named/zones/db.catnameddog.com
    - require:
      - pkg: bind-chroot

/etc/named/zones/db.172.31:
  file:
    - managed
    - source: salt://util/files/etc/named/zones/db.172.31
    - require:
      - pkg: bind-chroot


