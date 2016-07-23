include:
  - python
  - jenkins
  - build_server.ssh
  - hosts
  - docker.registry

git.installed:
  pkg.installed:
    - name: git




extend:
  jenkins:
    service:
      - watch:
        - cmd: jenkins.install.plugins
        - group: add.jenkins.user.to.docker.group
        - pkg: git.installed
        - pkg: docker.installed
        - file: copy.build.script


install.unzip:
  pkg.installed:
    - name: unzip
    - require_in:
      - cmd: jenkins.install.plugins

copy.install.script:
  file.managed:
    - name: /var/lib/jenkins/install_plugins.sh
    - source: salt://build_server/install_plugins.sh
    - mode: 770
    - require:
      - pkg: jenkins


# Installing plugins with bash script, the formula way is not working
#TODO: Loop through a list of pillar data here instead
jenkins.install.plugins:
  cmd.run:
    - name: /var/lib/jenkins/install_plugins.sh workflow-aggregator github skip-certificate-check
    - cwd: /var/lib/jenkins/
    - require:
      - pkg: install.unzip
      - file: copy.install.script
      - pkg: jenkins



copy.build.script:
  file.managed:
    - name: /var/lib/jenkins/jobs/helloworld/config.xml
    - source: salt://build_server/jobs/helloworld/config.xml
    - makedirs: True
    - template: jinja
    - mode: 770
    - dirmode: 750
    - user: jenkins
    - require:
      - pkg: jenkins

add.jenkins.user.to.docker.group:
  group.present:
    - name: docker
    - addusers:
      - jenkins
    - require:
      - pkg: jenkins
