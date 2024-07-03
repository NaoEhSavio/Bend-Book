# `Match` Statements

Bend offers a powerful pattern matching system through the `match` construct. It allowsfor clear and safe control flow, enabling clear and concise deconstruction of values, with the ability to bind variables to fields of the constructors. With `match`, you can write expressive and robust code to handle different types of data efficiently

## Basic Structure of `match`

The `match` structure examines a value and allows executing different code blocks based on the corresponding value's constructor. Here's a basic example:

### Pattern Matching

Patterns in `match` must cover the possible variants of the type being matched.

### Variable Binding

It is possible to bind a variable name to the corresponding value. The fields of the associated constructor are bound to `matched_var.field_name`.

### Assignment

For fields within the constructor, you can use variables specified in the case body.

### Default Case (`_`)

The default case must be `_`, which catches all values not explicitly enumerated.

Consider the definition of a type `Option`:

```python
type Option:
  None
  Some {value}
```

```python
def match_example(x):
  match x:
    case Option/None:
      return 0
    case Option/Some:
      return x.value
```

In this example, the variable `x` can be an instance of `Option/Some` or `Option/None`. The matching logic determines the value based on the constructor of `x`.

- If `x` is an instance of `Option/None`, `0` is returned.
- If `x` is an instance of `Option/Some`, the field `value` is returned.

### Detailed Example

Consider a type `Direction`:

```python
type Direction:
  Up
  Down
  Left
  Right
```

```python
def direction_to_string(direction):
  match direction:
    case Direction/Up:
      return "Up"
    case Direction/Down:
      return "Down"
    case Direction/Left:
      return "Left"
    case Direction/Right:
      return "Right"
```

In this example, `direction_to_string` converts a `Direction` value to a corresponding string.

### Nested Structures

Consider a binary tree:

```python
type BTree:
  Leaf
  Node {value, left, right}
```

```python
def sum_tree(btree):
  match btree:
    case BTree/Leaf:
      return 0
    case BTree/Node:
      return btree.value + sum_tree(btree.left) + sum_tree(btree.right)
```

Here, `sum_tree` calculates the sum of all values in a binary tree:

- If `tree` is `BTree/Leaf`, it returns `0`.
- If `tree` is `BTree/Node`, it sums the current node's value with the sums of the left and right subtrees.

### Now let's apply the `match_example` function and test it

```python
def main():
  some_value = Option/Some(42)
  none_value = Option/None
  return (match_example(none_value),  # Output: 0
          match_example(some_value))  # Output: 42
```

## Conclusion

`Match` statements provide a clear and powerful way to deconstruct values based on their constructors. They allow binding variables to the fields of corresponding constructors, making it easier to work with algebraic data types and resulting in more readable and organized code.
