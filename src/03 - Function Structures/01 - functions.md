# Functions in Bend

Bend is a language that supports defining functions in a concise and expressive manner. Functions are reusable blocks of code that perform specific operations and return values.

## Function Definition

Functions are defined using the `def` keyword followed by the function name, parameters in parentheses, and a body.

```bend
def sum(a, b):
  result = a + b
  return result
```

The `sum` function takes two parameters `a` and `b`, and returns their sum.

## Anonymous Functions (Lambdas)

Bend supports anonymous functions, also known as lambdas, which are defined using the `lambda x: expression` syntax.

Example of an anonymous function that increments a number:

```bend
def lambda_inc:
  inc = lambda x: x + 1
  return inc
```

This function can be called in the same way as a named function:
result = lambda_inc(5)  # result is 6

## Higher-Order Functions

Higher-order functions are those that accept other functions as parameters or return functions.

Example of a function that accepts another function as a parameter:

```bend
def apply_two_times(f, x):
  return f(f(x))
```

Using the `apply_two_times` function with an anonymous function:
result = apply_two_times(lambda x: x + 1, 5)  # result is 7

## Recursion

Bend supports recursion, allowing a function to call itself.

Example of a recursive function to calculate the factorial of a number:

```bend
def factorial(n):
  if n == 0:
    return 1
  else:
    return n * factorial(n - 1)
```

Recursive functions in Bend are optimized for tail recursion, resulting in better performance and efficient memory usage.

## Pattern Matching

Functions can use pattern matching to decompose values and make decisions based on those values.

Example of a function that uses pattern matching to calculate the factorial:

```bend
def factorial_match(n):
  switch n:
    case 0:
      return 1
    case _:
      return n * factorial_match(n - 1)
```

## Currying

In Bend, functions can be partially applied through currying, allowing a function with multiple parameters to be transformed into a chain of functions that each take a single parameter.

Example of a curried function:

```bend
def curried_sum(a):
  return lambda b: a + b
```

Using the curried function:

```bend
sum5    = curried_sum(5)
sum5_3  = sum5(3)  # result is 8
```

Conclusion

Functions in Bend are powerful and flexible, allowing for the creation of modular and reusable code. With support for anonymous functions, recursion, currying, and pattern matching, Bend facilitates writing concise and expressive functions.

```bend
def main():
  sum_result = sum(2, 3)
  lambda_inc_result = lambda_inc(5)
  higher_order_result = apply_two_times(lambda_inc, 5)
  recursive_result = factorial(5)
  factorial_match_result = factorial_match(5)
  sum5 = curried_sum(5)
  sum5_3_result = sum5(3)
  return sum5_3_result
```
