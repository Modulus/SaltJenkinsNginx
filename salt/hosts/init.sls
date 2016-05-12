
{% for server, addrs in salt['mine.get']('G@roles:repository', 'network.ip_addrs', expr_form='compound').items() %}
{{server}}-present:
  host.present:
    - ip: {{addrs[0]}}
    - names:
      - {{server}}
{% endfor %}
