HashGraft
=========

## Hash/Array Mixins

adds get_path(path) and set_path(path, value) to Hash and Array.
Allows to traverse deeply nested data structures similar to structures.

Arrays also validate a wildcard "*".

``` {.ruby}
@example_1 = {
  "guys" => [
    {"name" => "Dean"},
    {"name" => "Sal"},
    {"name" => "Carlo"},
  ],
  "gals" => [
    {"name" => "Marylou"},
    {"name" => "Camilly"},
    {"name" => "Terry"},
    {"name" => "Mary"},
    {"name" => "Rita"},
    {"name" => "Amy"},
  ]}

@example_1.get_path "gals/2/name" # => "Terry"
@example_1.get_path("gals/*/name") # => ["Marylou","Camilly","Terry","Mary","Rita","Amy"]

```

## Transformer

uses get_path/set_path to transform one data structure into another.
*examples will follow*
