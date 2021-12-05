# Basic introduction
- (% ...... %)    --statement
- {{ ....... }}   --expression
- {# ...... #}    -- comment
- {%-  ...  %}      -- trim left hand side by delimiter -
- {%  ...  -%}      -- trim right hand side by delimiter -

# Dictionary/YAML
  {% set person = {
  'name': 'me',
  'number': 3
      }
  %}
=================
It's {{person.name}} == It's me
I love {{person['number']}} == I love 3
=================


# List
  {% set tables = [
      {
          'name': 'host', 
          'volume': 100
      },
      {
          'name': 'customer',
          'volume': 500
      }
  ] %}
=================
  {{ tables[0]['volume'] }} = 100
=================


# if statement
  {% set variable_name = value %}
  {% if criteria statement for variable_name %}
      do something
  {% else %}
      do other thing
  {% endif %}


# for loop
  {% set num = [1,2,3] %}
  {% for i in num %}
  number {{num}} is in the pocket.
  {% endfor %}
=================
number 1 is in the pocket.
number 2 is in the pocket.
number 3 is in the pocket.
=================


# macro
  {% macro funcName(arg1, arg2='default') %}
      do something with arg1 and arg2
  {% endmacro %}

- call macro
  {{ funcName(arg1, arg2) }}
  will do something inside the macro
  https://jinja.palletsprojects.com/en/3.0.x/templates/#macros