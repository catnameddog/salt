########################################
# Service configurations
######################################## 
sshd:
  pkg:
    - name: openssh-server
    - installed
  service:
    - running
    - watch:
      - file: /etc/ssh/sshd_config

/etc/ssh/sshd_config:
  file:
    - managed
    - source: salt://base/files/etc/ssh/sshd_config
    - require:
      - pkg: openssh-server

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

/etc/cloud/cloud.cfg:
  file:
    - managed
    - source: salt://base/files/etc/cloud/cloud.cfg

/etc/dhcp/dhclient.conf:
  file:
    - managed
    - source: salt://base/files/etc/dhcp/dhclient.conf

########################################
# User Authentication
########################################
cstoner:
  user.present:
    - fullname: Cye Stoner
    - shell: /bin/bash
    - home: /home/cstoner
    - groups:
      - wheel

AAAAB3NzaC1yc2EAAAADAQABAAABAQDQetaerKWD30yTGzM3/0DnbZKMhFcnhI0VuF/CpWbMVZ15wcbpldi1pdpP9CoWYBve0zUNJZ7EBasVZvC7OgZXuVekQO7gfiAHybXU71Z5Sb1XIjUDIWGQ+8tmumR6FiwVL3aOnWcDHad6lv/pIqb9AT3tCCBsfaDQt89wdPl3A2MaKmILvf8VQjUHOx5WMosSpYdUDM/Rj+uvAMat4dqBfQfvdkl4tS4QQL3+x9VoSS7Ryx3aoEgDd6/rAcGoL8+o1ziuYZVzUip8vasq5qocgcumgstL0/55gAfFTxJwM/gf/8wbWMH5IO5NgP/un8ZKfrzssp13ijQCArf+VJ3F:
  ssh_auth:
    - present
    - user: cstoner
    - enc: ssh-rsa
    - require:
      - user: cstoner 
