python-pip-whl:
  pkg.removed

pip-install:
  pkg.installed:
    - name: python-pip
    - require:
      - pkg: python-pip-whl
    - stateful: True



dockerpy:
  pip.installed:
    - name: docker-py
    - require:
      - pkg: python-pip-whl
      - pkg: pip-install
    - unless: pip list | grep docker-py
