# Lambda Calculus in Bend

## Introduction

Bend allows the use of lambdas, adopting notations like Scott and Church, with a syntax similar to the equational notation we saw earlier.

### Defining Data Types

#### Booleans

To define data types using lambdas, we use the assignment notation.
For example, to define the boolean values `false` and `true`, we use:

```js
false = λf λt f
true  = λf λt t
```

Alternatively, you can use `@` in place of `λ`:

```js
false = @f @t f
true  = @f @t t
```

- `false` is a function that takes two arguments and returns the first.
- `true` is a function that takes two arguments and returns the second.

Examples of Using Booleans

Defining the `not` Function
To define the `not` function using booleans defined by lambdas:

```js
not = λb (b true false)
```

- `not` is a function that takes a boolean `b` and returns `true` if `b` is `false`
and `false` if `b` is `true`.

#### Defining Natural Numbers

##### Scott-Encoded Natural Numbers

To define natural numbers using Scott encoding:

```js
Zs =    λz λs z
Ss = λp λz λs (s p)
```

Scott encoding represents natural numbers using a case-based approach.
Each number is a function that takes two arguments:

- The first argument is returned if the number is zero.
- The second argument is applied recursively if the number is a successor.

- `Zs` represents the number zero.
- `Ss` is a function that takes a Scott-encoded natural number and returns its successor.

Scott encoding allows for direct deconstruction of natural numbers, making it easier to define recursive functions that operate on these numbers.

##### Church-Encoded Natural Numbers

To define natural numbers using Church encoding:

```js
Zc =    λz λs z
Sc = λp λz λs (s (p z s))
```

Church encoding represents natural numbers as functions that iterate a number of times over a process. Each number is a function that takes two arguments:

- The first argument is the initial value (usually zero).
- The second argument is the function that will be applied repeatedly.

- `Zc` represents the number zero.
- `Sc` is a function that takes a Church-encoded natural number and returns its successor.

Church encoding makes it easier to define arithmetic functions, such as addition and multiplication, through functional composition.

In summary, while Scott encoding is based on a case and deconstruction approach, Church encoding is based on repetitive application of functions, which facilitates the definition of arithmetic operations.

##### Examples of Using Natural Numbers

###### Adding Natural Numbers

To define the addition of Church-encoded natural numbers:

```js
add = λm λn λz λs (m (n z s) s)
```

The addition function `add` for Church-encoded natural numbers combines the iterations of both numbers, m and n, by repeatedly applying the successor function.
Here is how it works:

- `add` is a function that takes two Church-encoded natural numbers, m and n, and returns their sum.
- m and n are Church-encoded natural numbers.
- λz is the initial value (usually zero).
- λs is the successor function that will be applied repeatedly.
- (n z s) applies the function s n times to the initial value z.
- m applies the function s m times to the result of (n z s), combining the iterations of both natural numbers.

This results in the application of the successor function m + n times, effectively adding the two natural numbers.

Example Fibonacci Function

```js
fib = λx switch x {
  0: 0
  1: 1
  _: (+ (fib (- x 1)) (fib (- x 2)))
}
```

- `fib` is a function that calculates the nth Fibonacci number.
- `x` is the argument that determines which Fibonacci number will be calculated.
- `switch x { ... }` is a selection structure that allows different cases based on the value of `x`.
- `0: 0` defines that the 0th Fibonacci number is 0.
- `1: 1` defines that the 1st Fibonacci number is 1.
- `_` is a generic case that captures all other values of `x`.
- `(+ (fib (- x 1)) (fib (- x 2)))` recursively defines that the nth Fibonacci number is the sum of the two preceding Fibonacci numbers.

This function uses recursion to calculate Fibonacci numbers efficiently, as defined by the classic mathematical sequence.

### Complete Examples

Combining Everything

Let's combine the definitions of booleans, natural numbers, and functions in a complete example:

```js
Main =
  let zero    = Zs
  let one     = (Ss Zc)
  let two     = (Ss one)
  let three   = (Ss two)
  let onec    = (Sc Zc)
  let twoc    = (Sc (Sc Zc))
  let threec  = (Sc (Sc (Sc Zc)))
  let add23   = (add twoc threec)
  let neg     = (not true)
  let exp2    = (Exp2 10)
  let sum1    = (Sum1 1 2)
  let sum2    = (Sum2 1 2)
  let fib10   = (fib 10)
  (fib10)
```

The use of the `hs` structure in lambda calculus occurs in the same way as in the equational notation seen earlier.

```js
Exp2 = λn (
  bend x = 0 {
    when (< x n):(
      let lft = (fork (+ x 1))
      let rgt = (fork (+ x 1))
      let y = (+ lft rgt)
      y)
    else:
      let y = 1
      y
  })

```

It is important to note that the definition of functions in lambda calculus is done similarly to the equational notation, and can be done in a mixed manner.

```js
(Sum1 a b) = (+ a b)
```

and

```js
Sum2 = λa λb (+ a b)
```

are examples of function definitions in lambda calculus.

The difference lies in how the variable to be used in the function is defined, with the first being done similarly to the equational notation and the second being purely done in lambda calculus.

### Conclusion

Lambda calculus in Bend, with support for notations like Scott and Church, provides a powerful and expressive way to define and work with functions and data types. Understanding and using this notation can significantly improve the clarity and efficiency of your code, especially when dealing with mathematical and recursive functions and data types.
