# Equational Notation in Bend

Bend is a language that allows equational notation similar to Haskell, but with simpler and more straightforward syntax.

This notation is very useful for defining mathematical and recursive functions, as it allows for a clear and concise representation.

Equational notation in Bend is a powerful tool for defining mathematical and recursive functions, which can be used to solve a wide variety of problems simply and efficiently. This is ideal for those who seek to utilize functional programming.

## How to Write Functions in Equational Notation

### Basic Structure

The equational notation in Bend follows a simple structure:

`Function parameters = expression`

- `Function` is the name of the function.
- `parameters` are the parameters that the function receives.
- `expression` is the result or operation that the function should perform.

### Simple Examples

#### Sum Function

Let's create a function that calculates the sum from 0 to n:

```bend
Sum 0 = 0
Sum n = (+ n (Sum (- n 1)))
```

- `Sum 0 = 0` defines that the sum of 0 is 0.
- `Sum n = (+ n (Sum (- n 1)))` defines that the sum of `n` is `n` plus the sum of `n-1`.

#### Factorial Function

A function to calculate the factorial of a number:

```bend
Factorial 0 = 1
Factorial n = (* n (Factorial (- n 1)))
```

- `Factorial 0 = 1` defines that the factorial of 0 is 1.
- `Factorial n = (* n (Factorial (- n 1)))` defines that the factorial of `n` is `n` times the factorial of `n-1`.

#### Fibonacci Function

A function to calculate the nth Fibonacci number:

```bend
Fibonacci 0 = 0
Fibonacci 1 = 1
Fibonacci n = (+ (Fibonacci (- n 1)) (Fibonacci (- n 2)))
```

- `Fibonacci 0 = 0` defines that the 0th Fibonacci number is 0.
- `Fibonacci 1 = 1` defines that the 1st Fibonacci number is 1.
- `Fibonacci n = (+ (Fibonacci (- n 1)) (Fibonacci (- n 2)))` defines that the nth Fibonacci number is the sum of the two preceding ones.

### Using User-Defined Types

Equational notation can also be used with user-defined types, such as lists, trees, etc.

#### Defining a List

First, let's define a `UserList` type that represents a list:

```bend
type UserList:
  Cons { head, ~tail }
  Nil
```

- `Cons` is a constructor that has a `head` and a `tail`.
- `Nil` represents an empty list.

#### Length Function for a List

Now, a function that calculates the length of a list:

```bend
Length UserList/Nil = 0
Length (UserList/Cons head tail) = (+ 1 (Length tail))
```

- `Length UserList/Nil = 0` defines that the length of an empty list is 0.
- `Length (UserList/Cons head tail) = (+ 1 (Length tail))` defines that the length of a non-empty list is 1 plus the length of the `tail`.

### Using Bend in Equational Notation

Creating a function that calculates `2^n` using the `bend` in traditional notation:

```bend
def exp2(n):
  bend x = 0:
    when x < n:
      lft = fork(x + 1)
      rgt = fork(x + 1)
      y = lft + rgt
    else:
      y = 1
  return y
```

In this example, the `exp2` function calculates `2^n` by creating a recursive tree. If `n` is 0, the function returns 1; otherwise, the function creates two branches and sums the results recursively.

Graphical representation of the tree created by the `exp2` function for n = 3:

```md
x = 0                 [ ]
                     /   \
                    /     \
                   /       \
                  /         \
                 /           \
                /             \
x = 1          [ ]             [ ]
              /  \            /  \
             /    \          /    \
            /      \        /      \
x = 2      [ ]     [ ]     [ ]     [ ]
           / \    /  \     / \    /  \
x = 3    [1] [1] [1] [1] [1] [1] [1] [1]
```

At the end, each leaf gets the value 1 and the sum of all the leaves is `2^n`.

It is possible to use this notation while using the equational one, but for standardization, there is an equivalent way to write the `exp2` function using equational notation:

```bend
Exp2 n =
  (bend x = 0 {
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

The `Exp2` function is equivalent to the `exp2` function and uses equational notation to define the function clearly and concisely.

The syntax of `bend` in equational notation is as follows:
bend bind=term, ... { when cond: term; else: term; }

Complete Example

```bend
Let's combine everything in a complete example:
Main =
  let sum      = ("Sum", (Sum 5))
  let factorial  = ("Factorial", (Factorial 5))
  let fibonacci = ("Fibonacci", (Fibonacci 6))
  let list      = (UserList/Cons ("sum", sum)
                  (UserList/Cons ("factorial", factorial)
                  (UserList/Cons ("fibonacci", fibonacci)
                  UserList/Nil)))
  let length    = ("Length original List", (Length list))
  let exp2a     = ("exp2: ", (exp2(10)))
  let exp2b     = ("Exp2: ", (Exp2 10))
  let result    = [sum, factorial, fibonacci, length, exp2a, exp2b]
  result
```

This example:

- Defines and uses sum, factorial, and Fibonacci functions.
- Creates a list with the results.
- Calculates the length of the list.
- Calculates `2^n` in two different ways.
- Creates a new list with the previous results.
- Returns the new list.

### Conclusion

Equational notation in Bend makes it easier to define mathematical and recursive functions clearly and concisely. This makes Bend a powerful language for solving a wide variety of problems using functional programming.

Understanding and using this notation can significantly improve the clarity and efficiency of your code, especially when dealing with mathematical and recursive problems.
