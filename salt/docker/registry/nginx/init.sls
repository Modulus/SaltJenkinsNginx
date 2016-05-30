{% from "docker/registry/nginx/map.jinja" import nginx with context %}

include:
  - nginx

extend:
  nginx:
    service.running:
      - name: nginx
      - require:
        - pkg: nginx
      - watch:
        - file: nginx.tls.certs.directory
        - cmd:  nginx.tls.certificates
        #- file: /etc/nginx/sites-available/registry.conf
        - file: symlink.registry.conf
        {% if grains['os_family'] == 'RedHat' %}
        - file: /etc/nginx/sites-enabled
        - file: /etc/nginx/sites-available
        {% endif %}
        - file: /etc/nginx/nginx.conf


nginx.tls.certs.directory:
  file.directory:
    - name: {{nginx.cert_location}}
    - dir_mode: 755
    - file_mode: 644
    - recurse:
        - mode

{% if grains['os_family'] == 'RedHat' %}
/etc/nginx/sites-enabled:
  file.directory:
    - name: /etc/nginx/sites-enabled

/etc/nginx/sites-available:
  file.directory:
    - name: /etc/nginx/sites-available
{% endif %}

nginx.tls.certificates:
  cmd.run:
    - name: openssl req -x509 -nodes -new -newkey rsa:2048 -days 3650  -nodes -x509 -subj "/C={{nginx.c}}/ST={{nginx.st}}/L={{nginx.l}}/O={{nginx.o}}/CN={{nginx.domain}}" -keyout {{nginx.cert_location}}/{{nginx.cert_name}}.key  -out {{nginx.cert_location}}/{{nginx.cert_name}}.crt
    - cwd: {{nginx.cert_location}}
    - unless: cat {{nginx.cert_location}}/{{nginx.cert_name}}.crt
    - stateful: True
    - require:
      - file: nginx.tls.certs.directory
      - file: /etc/nginx/nginx.conf
      #- file: /etc/nginx/sites-available/registry.conf


# copy.to.docker.trust:
#   file.managed:
#     - name:  /etc/ssl/certs/{{nginx.cert_name}}.pem
#     - source: {{nginx.cert_location}}/{{nginx.cert_name}}.crt
#     - makedirs: True
#
# copy.to.docker.trust.private:
#   file.managed:
#     - name:  /etc/ssl/private/{{nginx.cert_name}}.key
#     - source: {{nginx.cert_location}}/{{nginx.cert_name}}.key
#     - makedirs: True


/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://docker/registry/nginx/registry.conf
    - mode: 440
    - makedirs: True
    - template: jinja
    - require:
      - pkg: nginx

/etc/nginx/sites-available/registry.conf:
   file.managed:
    - source: salt://docker/registry/nginx/registry.conf
    - mode: 440
    - makedirs: True
    - template: jinja
    - require:
      - pkg: nginx
      {% if grains['os_family'] == 'RedHat'%}
      - file: /etc/nginx/sites-enabled
      - file: /etc/nginx/sites-available
      {% endif %}

symlink.registry.conf:
  file.symlink:
    - name: /etc/nginx/sites-enabled/registry.conf
    - target: /etc/nginx/sites-available/registry.conf
    - mode: 440
    {% if grains['os_family'] == 'RedHat' %}
    - require:
      - file: /etc/nginx/sites-enabled
      - file: /etc/nginx/sites-available
    {% endif %}


# docker.registry.certificate:
#   module.run:
#     - name: x509.create_certificate
#     - kwargs: {
#         path: "/srv/certs/",
#         text: False
#       }
