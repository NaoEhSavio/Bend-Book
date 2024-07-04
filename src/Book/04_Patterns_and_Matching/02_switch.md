# `Switch` Statements

`Switch` statements offer a structured and efficient way to select among multiple conditions based on a specific value. In some programming languages, using `switch` statements can simplify the control flow logic compared to multiple `if-else` statements.

## Basic Structure of `Switch`

The `switch` construct is used to associate a variable name with the result of a given condition and branch to the case that matches its value.

### Ordering of Cases

The cases must be listed from smallest to largest, starting at `0` and incrementing by `1`.

### Default Case (`_`)

The last case must be `_`, which catches all values not explicitly enumerated.

### Native Values

`Switch` statements can only be used with native numeric values.

Let's examine a basic example:

```python
def switch_example(x):
  switch x:
    case 0:
      return 6
    case 1:
      return 7
    case _:
      return x - 2
```

In this example, the `switch` checks the value of `x` and returns a result based on the corresponding case:

- If `x` is `0`, it returns `6`.
- If `x` is `1`, it returns `7`.
- For all other values (`_`), it returns `x - 2`.

In the last case, the value of the predecessor is available with the name `bound_var-next_num`, where `bound_var` is the variable defined by the condition and `next_num` is the expected value of the next case. Let's detail this with a more specific example.

## Implementing `Switch` Using `If-Else`

We can see that the `switch` structure can be converted to a series of `if-else` statements:

```python
def switch_case(x):
  if x == 0:
    return 6
  elif x == 1:
    return 7
  else:
    return x - 2
```

### Comparative Example

Let's see how a `switch` can be equivalent to an `if-else` from the previous section:

```python
def if_else_equiv(condition):
  if condition == 0:
    # then branch
    return 1
  else:
    # else branch
    return 0
```

### Equivalent to `Switch`

```python
def switch_equiv_expl(condition):
  switch condition == 0: # explicit
    case 0:
      # else branch
      return 0
    case _:
      # then branch
      return 1
```

```python
def switch_equiv_impl(condition):
  switch condition: # implicit
    case 0:
      return 1
    case _:
      return 0
```

Both functions above implement the same logic but using different control structures.

### Conclusion

Using `switch` can make your code clearer and more readable when dealing with many conditions and is more efficient than multiple `if-else` statements. It is a powerful control flow tool that complements traditional `if-else` structures.
