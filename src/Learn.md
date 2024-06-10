
```py
# Single line comments start with a number symbol.

# There's no multi-line comment,
# but you can stack multiple comments.
```

## Basic types

There are numbers

``` py
420  # Unsigned integers (24 bits)
+69  # Signed integers (24 bits)
1.4  # Floating point (24 bits)
```

There are also binary and hexadecimal.

```py
0b100_100 # binary 
0x123_abc # hexadecimal 
-0xbeef   # hex_signed 
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

# pattern match
(fst, snd, ...) = ("Hi", 2, ...)
# fst = "Hi"
# snd = 2
# ... = ...
(fst, snd) = (1, "Hello", ...)
# fst = 1
# snd = ("Hello", ...)
```

Lists that are implemented as lists. they are separated by `,`.

```py
[1,2,3] # list

# list comprehensions
[x + 1 for x in [1,2,3]] # Result: [2, 3, 4]
# with a conditional
[x * 2 for x in [1,2,3] if x > 2] # Result: [6, 8]
```

Maps

todo

## Operators

Some math, todo

```py
10 + 10 => 20   # ADD
10 -  5 => 5    # SUB
5  *  2 => 10   # MUL
10 /  2 => 5    # DIV
10 %  3 => 1    # REM
10 >> 1 => 5    # SHR
10 << 1 => 20   # SHL
10.0 ** 2.0 => 100.0 # POW
```

- In Bend the operator `**` is exclusive to `f24`.

There are also boolean operators: `&`, `|` and `^`.

```py
1 & 1 => 1 # true  # AND 
1 | 0 => 1 # true  # OR
1 ^ 1 => 0 # false # XOR
```

- In Bend the boolean operators is exclusive to `i24` and `u24`.

For comparisons we have: `==`, `!=`, `<` and `>`, must return a `u24`.

```py
1.0 == 1.0 => 1 # true  # EQ
1   !=  1  => 0 # false # NEQ
-1  <  +2  => 1 # true  # LT
1   >   2  => 0 # false # GT
```
  
<!-- All values except `False`, `Nil`, `None` and `Empty` will evaluate to O. -->
## Basic Functions

Defines a top level function.
use `def` to define your functions.

```py
def add(x, y):
  result = x + y
  return result

def main:
  return add(40, 2)
```

- A function definition is composed by a name, a sequence of parameters and a body.
  - A top-level name can be anything matching the regex `[A-Za-z0-9_.-/]+`, except it can't have `__` (used for generated names) or start with `//`.
  - The last statement of each function must either be a return or a selection statement (`if`, `switch`, `match`, `fold`) where all branches `return`.

## Control Flow

```py
if condition:
  return # ...then
else:
  return # ...else
```

- A branching statement where `else` is mandatory.
  - The condition must return a `u24`, where 0 will run the `else` branch and any other value will return the `then`.

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
  case _: # default
    # then branch
    return 0
```

Remember pattern matching? Many control-flow structures in Bend rely on it.

`match` allows us to compare a value against many patterns.
the cases must be the constructor names of the matching value.

```py
match variable:
  case type/constructor1:
    # This will match and bind `type/constructor1`
    return variable.field1  
  case type/constructor2:
    # This will match and bind `type/constructor2`
    return variable.value2
  ...
```

A `fold` statement. Reduces the given value with the given match cases.

```py
fold variable:
  case type/constructor1:
    return variable.value1 + variable.field1 - variable.field2 ...
  case type/constructor2:
    return variable.value2 ...
  ...
```

- You can use fold to reduce a `type`
  - For fields notated with `~` in the type definition, the fold function is called implicitly.

It is equivalent to the inline recursive function:

```py
def fold(x)
  match x:
    case type/constructor1:
      return x.value1 + fold(x.field1) - fold(x.field2) ...
    case type/constructor2:
      return x.value2 ...
    ...
```

Bend doesn't have loops; it uses recursion instead.

`bend` is naturally suited for handling recursive data structures. Unlike traditional loops, `bend` uses recursive calls to repeat operations.

```py
bend initialization: # init branch  
  when condition:    # when branch 
    # code block to be executed
    fork(increment) # optional
  else:              # end branch        
    # block of code to be executed a final bend
```

<!-- `bend` statement is not a loop. -->

- In `bend`, state variables are passed explicitly.
  - It is possible to pass multiple state variables, which can be initialized.
  - When calling `fork`, the function must receive the same number of arguments as those passed during initialization.

It is equivalent to this inline recursive function:

```py
def bend(x, y, ...):
  if condition(x, y, ...):
    ...
    return ... bend(x, y, ...) ...
  else:
    return ...
```

Open

```py
open object: variable
...
return object { field1: variable.field1, field2: ... }
```

- Brings the inner fields of an `object` into scope.
  - The original variable can still be accessed, but doing so will cause any used fields to be duplicated.

It's equivalent to pattern matching on the `object`, with the restriction that its type must have only one constructor.

```py
match variable:
  case object:
    ...
```

### Datatypes

Algebraic data type

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
  - The constructor names inherit the name of their types and become functions `Map/Node` and `Map/Leaf`.
  - The exact function they become depends on the encoding.

Defines a type with a single constructor (like a struct, a record or a class).

```py
object Pair { fst, snd }

object Function { name, args, body }

object Vec { len, data }
```

The constructor created from this definition has the same name as the type.

## More Functions

todo

Bind also provides many built-in functions

todo

## IO

TODO
