# Comments in Bend

In Bend, comments are used to add explanations or notes to the code, which are ignored by the compiler. Comments are useful for documenting the code and making it more readable for other developers (or for yourself in the future).

## Single-Line Comments

Single-line comments start with the hash symbol (`#`). All text after the hash symbol on the same line is considered a comment and is ignored by the compiler.

Example: Single-Line Comments
Here is an example of using single-line comments in Bend:

```bend
def example():
  # This is a single-line comment
  x = 10  # This comment explains the variable x
  return x
```

## Multi-Line Comments

Bend does not have a native mechanism for multi-line comments, like comment blocks found in other languages. However, you can stack multiple single-line comments to create a multi-line comment.

Example: Multi-Line Comments
Here is an example of using multi-line comments in Bend:

```bend
def example_multiline():
  # This is a multi-line comment
  # that explains the code below in detail.
  # Each line starts with the hash symbol.
  y = 20
  return y
```

## Improving Readability with Comments

Comments should be used to clarify the purpose of the code, explain complex logic, and provide additional context. Avoid unnecessary or obvious comments that do not add value to understanding the code.

Example: Clear and Useful Comments
Here is an example of how to use comments clearly and usefully:

```bend
def fib(n):
  # Function to calculate the nth Fibonacci number
  switch n:
    case 0:
      return 0  # Returns 0 if n is 0
    case 1:
      return 1  # Returns 1 if n is 1
    case _:
      # Recursively calculates Fibonacci for n-1 and n-2
      return fib(n - 1) + fib(n - 2)
```

## Summary

- Single-line comments: Start with `#`.
- Multi-line comments: Stack multiple single-line comments.

Comments are a powerful tool for improving code readability and maintenance.
Use them wisely to document your code in Bend.

```bend
def main():
  example = example() # Should return 10
  example_multiline = example_multiline() # Should return 20
  fib = fib(5) # Should return 5
  return fib
```
