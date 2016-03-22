python-pip:
  pkg.removed
python-pip-whl:
  pkg.removed

pip-install:
  cmd.run:
    - name: easy_install pip

dockerpy:
  pip.installed:
    - name: docker-py
    - require:
      - pkg: python-pip
      - pkg: python-pip-whl
      - cmd: pip-install
    - reload_modules: True
