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
    - makedirs: True
    - create: True
    - require:
      - pkg: jenkins.installed

/var/lib/jenkins/plugins/bitbucket.hpi:
  file.managed:
    - user: jenkins
    - group: jenkins
    - source: https://updates.jenkins-ci.org/download/plugins/bitbucket/1.1.5/bitbucket.hpi
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
  service.running: 
    - enable: True
    - watch:
      - pkg: jenkins
      - file: /var/lib/jenkins/plugins/git.hpi
      - file: /var/lib/jenkins/plugins/bitbucket.hpi
