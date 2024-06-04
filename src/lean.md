<!-- Elixir is a modern functional language built on top of the Erlang VM. It’s fully compatible with Erlang, but features a more standard syntax and many more features. -->
```py
# Single line comments start with a number symbol.

# There's no multi-line comment,
# but you can stack multiple comments.
```
<!-- To use the Elixir shell use the `iex` command.
Compile your modules with the `elixirc` command.

Both should be in your path if you installed Elixir correctly. -->

## Basic types

There are numbers

``` py
420  # Unsigned integers (24 bits)
+69  # Signed integers (24 bits)
1.4  # Floating point (24 bits)
```

There are also binary and hexadecimal.

```py
# binary      = 0b100_100_011_101_010_111_100
# hexadecimal = 0x123_abc
# hex_signed = -0xbeef
```  

There are character literal

```py
'x'
```

- A Character is surrounded with `'`.
  - Accepts unicode characters, unicode escapes in the form `'\u{hex value}'`.
  - The value is desugared to a 24-bit unsigned integer `u24`.
  - Support Unicode codepoints up to `0xFFFFFF`.
  
There are string literal

```py
"Hello, World!"
```

- A String literal is surrounded with `"`.
  - Accepts the same values as characters literals.
  
Tuples can contain 2 or more elements. they are separated by `,`.

```py
(1,2) # tuple
```

Lists that are implemented as lists. they are separated by `,`.

```py
[1,2,3] # list
```

## Operators

Some math

```py
10 + 10 => 20   # ADD
10 -  5 => 5    # SUB
5  *  2 => 10   # MUL
10 /  2 => 5    # DIV
10 %  3 => 1    # REM
10 >> 1 => 5    # SHR
10 << 1 => 20   # SHL
10 ** 2 => 100.0 # POW
```

- In Bend the operator `**` is exclusive to `f24`.

There are also boolean operators: `&`, `|` and `^`.

```py
1 & 1 => 1 # true  # AND 
1 | 0 => 1 # true  # OR
1 ^ 1 => 0 # false # XOR
```

- In Bend the boolean operators is exclusive to `i24` and `u24`.

<!-- All values except `False`, `Nil`, `None` and `Empty` will evaluate to O. -->

For comparisons we have: `==`, `!=`, `<` and `>`

```py
1.0 == 1.0 => 1 # true  # EQ
1   !=  1  => 0 # false # NEQ
-1  <  +2  => 1 # true  # LT
1   >   2  => 0 # false # GT
```

- Return `u24`
  
<!-- Elixir operators are strict in their arguments, with the exception
of comparison operators that work across different data types:

This enables building collections of mixed types:

While there is an overall order of all data types,
to quote Joe Armstrong on this: "The actual order is not important,
but that a total ordering is well defined is important." -->

### Type

Defines an algebraic data type.

- Type names must be unique, and should have at least one constructor.
  - Each constructor is defined by a name followed by its fields.

```py
type Option:
  Some { value }
  None

type Map:
  Node { value, ~left, ~right }
  Leaf
```

- The `~` notation indicates a recursive field.

The constructor names inherit the name of their types and become functions `Map/Node` and `Map/Leaf` The exact function they become depends on the encoding.

### Object

Defines a type with a single constructor (like a struct, a record or a class).

```py
object Pair { fst, snd }

object Function { name, args, body }

object Vec { len, data }
```

The constructor created from this definition has the same name as the type.

## Functions

 todo

## Control Flow

### IF

```py
if condition:
  return # ...then
else:
  return # ...else
```

- A branching statement where `else` is mandatory.
  - The condition must return a `u24` number, where 0 will run the `else` branch and any other value will return the `then`.

It is possible to make if-chains using `elif`:

```py
if condition1:
  return 0
elif condition2:
  return 1
elif condition3:
  return 2
else:
  return 3
```

### Switch

Switches may only be used with native numbers values. lets us check for many conditions at the same time.

- beginning with 0 and incrementing by 1. The last case must be `_`, like a `default` case.

```py
switch number:
  case 0:
    return 6
  case 1:
    return 7
  case _: # default
    return x-2
```

Use `Switch` instead of nesting many `if` expressions.

```py
switch condition:
  case 0:
    # else branch
    return 1
  case _:
    # then branch
    return 0
```

Remember pattern matching? Many control-flow structures in Bend rely on it.

### Match

allows us to compare a value against many patterns.
the cases must be the constructor names of the matching value.

```py
match x:
  case Option/Some:
    # This will match and bind `Option/Some`
    return x.value
  case Option/None:
    # This will match and bind `Option/None`
    return 0
```

### Fold

todo

### Bend

todo

## More Functions

todo

## IO

todo