nginx.installed:
  pkg.installed:
    - pkgs:
      - nginx
    - require:
      - user: nginx-user

remove-default-sites:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
    - require:
      - pkg: nginx.installed

