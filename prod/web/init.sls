httpd:
  pkg:
    - installed
  service:
    - running

/var/www/html/index.html:
  file:
    - managed
    - source: salt://web/files/var/www/html/index.html

