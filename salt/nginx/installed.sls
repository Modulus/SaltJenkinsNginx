nginx.package:
  pkg.installed:
    - pkgs:
      - nginx
    - require:
      - user: nginx-user

remove-default-sites:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
    - require:
      - pkg: nginx.package

jenkins-config:
  file.managed:
    - name: /etc/nginx/sites-enabled/jenkins.conf
    - source: salt://nginx/jenkins.conf
    - group: build
    - user: nginx-user
    - mode: 640
