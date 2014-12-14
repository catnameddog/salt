ntpd:
  pkg:
    - name: ntp
    - installed
  service:
    - running
    - watch:
      - file: /etc/ntp.conf

/etc/ntp.conf:
  file:
    - managed
    - source: salt://base/files/etc/ntp.conf
    - require:
      - pkg: ntp
