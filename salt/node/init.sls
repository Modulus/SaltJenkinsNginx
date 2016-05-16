node.installed:
  pkg.installed:
    - pkgs:
      - nodejs-legacy
      - npm

pm2:
  npm.installed:
    - require:
      - pkg: node.installed

bower:
  npm.installed:
    - require:
      - pkg: node.installed

gulp:
  npm.installed:
    - require:
      - pkg: node.installed
      - npm: bower
