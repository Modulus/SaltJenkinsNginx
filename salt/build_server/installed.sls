base:
  pkgrepo.managed:
    - humanname: Jenkins Repo
    - name: deb http://pkg.jenkins-ci.org/debian binary/
    - key_url: https://jenkins-ci.org/debian/jenkins-ci.org.key
    - file: /etc/apt/sources.list.d/jenkins.list

/var/lib/jenkins/plugins/git.hpi:
  file.managed:
    - user: jenkins
    - group: jenkins
    - source: https://updates.jenkins-ci.org/download/plugins/git/2.4.3/git.hpi
    - source_hash: sha1=ea0ba7656741c428cdf1c40fd56a5c4a4e8d9aa4
    - makedirs: True
    - create: True
    - require:
      - pkg: jenkins.installed

/var/lib/jenkins/plugins/bitbucket.hpi:
  file.managed:
    - user: jenkins
    - group: jenkins
    - source: https://updates.jenkins-ci.org/download/plugins/bitbucket/1.1.5/bitbucket.hpi
    - source_hash: sha1=5b83d21ddacd39d8fad6fd491e0178e82d80995e
    - makedirs: True
    - create: True
    - require:
      - pkg: jenkins.installed

jenkins.installed:
  pkg.installed:
    - pkgs:
      - jenkins
    - require:
      - pkgrepo: base

jenkins.enabled:
  service.enabled:
    - name: jenkins
    - require:
      - pkg: jenkins.installed

jenkins.running:
  service.running:
    - name: jenkins
    - enable: True
    - init_delay: 20
    - user: root
    - watch:
      - pkg: jenkins.installed
      - service: jenkins.enabled
      - file: /var/lib/jenkins/plugins/bitbucket.hpi
      - file: /var/lib/jenkins/plugins/git.hpi
    - require:
      - pkg: jenkins.installed
      - file: /var/lib/jenkins/plugins/bitbucket.hpi
      - file: /var/lib/jenkins/plugins/git.hpi
      - service: jenkins.enabled

