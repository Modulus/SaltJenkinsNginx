nginx:
  pkg.installed:
    - pkgs:
      - nginx

remove-default-sites:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
    - require:
      - pkg: nginx
