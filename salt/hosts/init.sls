
{% for server, addrs in salt['mine.get']('G@roles:repository or G@roles:build', 'network.ip_addrs', expr_form='compound').items() %}
{% if server != salt['grains.get']('id') %}
{{server}}-present:
  host.present:
    - ip: {{addrs[0]}}
    - names:
      - {{server}}
{% endif %}
{% endfor %}
