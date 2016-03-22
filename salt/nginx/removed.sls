config.removed:
  file.absent:
    - name: /etc/nginx/sites-enabled/jenkins.conf
    - require:
      - service: nginx.stopped

nginx.stopped:
  service.dead:
    - name: nginx

nginx.purged:
  pkg.removed:
    - name: nginx
    - require:
      - service: nginx.stopped
