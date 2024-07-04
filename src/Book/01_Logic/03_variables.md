# Variables in Bend

Bend allows the use of variables to store values. Variables are declared with an equals sign and can be used anywhere a literal value would be used.

## Dynamic Typing

Variables in Bend are dynamically typed, which means that the type of a variable is determined by the value it holds. Variables can hold any type of value, including integers, floats, strings, lists, tuples, maps, and functions.

## Case Sensitivity

Variables in Bend are case-sensitive, which means that variables with different names are considered distinct even if only the capitalization is different. For example, `variable` and `Variable` are different variables.

## Variable Reassignment

Variables can be reassigned at any time. This allows a variable to change the value it stores during the execution of the program.

- Use in Mathematical Expressions
- Variables can store values and perform calculations.
- They can also hold the return values from functions.

## Example of Variables in Bend

Below is an example that demonstrates the declaration and use of variables in Bend:

```py
def main():
  # Declaring variables of different types
  string = "Hello, World!"              # String
  integer = 42                          # Integer
  floating_point = 3.14                 # Float
  list = [1, 2, 3, 4, 5]                # List
  tuple = (1, 2, 3, 4, 5)               # Tuple
  map = {'k': "value", 'j': "value2"}   # Map

  # Declaring a lambda function and storing it in a variable
  function = lambda x: x + 1

  # Using the function variable to calculate the return value
  result = function(integer)

  return result
```

## In the example above

- `string` stores a string "Hello, World!".
- `integer` stores an integer 42.
- `floating_point` stores a float number 3.14.
- `list` stores a list of integers [1, 2, 3, 4, 5].
- `tuple` stores a tuple of integers (1, 2, 3, 4, 5).
- `map` stores a map with keys 'k' and 'j', and values "value" and "value2".
- `function` stores a lambda function that adds 1 to its argument.
- `result` stores the value returned by the `function` when applied to `integer`.

## Variables

- are declared using the `=` (equals) sign;
- dynamically typed;
- case-sensitive.
- can be reassigned;
- store values and perform calculations;
- hold return values from functions.

With these features, variables in Bend provide a flexible and powerful way to manage data and logic in your programs.
