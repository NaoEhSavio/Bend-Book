# Learn Bend

Bend is a high-level, massively parallel programming language. That means it feels like Python, but scales like CUDA. It runs on CPUs and GPUs, and you don't have to do anything to make it parallel: as long as your code isn't "helplessly sequential", it will use 1000's of threads!

```py
# Single line comments start with a number symbol.

# There's no multi-line comment,
# but you can stack multiple comments.
```

## Basic types

There are numbers, all are 24 bits:

``` py
420  # unsigned integers
+69  # uigned integers
1.4  # floating point
```

<!--
There are also binary and hexadecimal literals:

```py
0b1001_1011  # binary 
0x1234_abcd  # hexadecimal 
-0xbeef      # hexadecimal signed 
```
-->

There are character literals:

```py
'x'
```

- A Character is surrounded with `'`.
  - Accepts unicode characters like `'β'` and Unicode escapes in the form `'\u{hex value}'`.
  - The value is desugared to a 24-bit unsigned integer (`u24`).
  - Support Unicode codepoints up to `0xFFFFFF`.

There are string literals:

```py
"Hello, World!"
```

- A String literal is surrounded with `"`.
  - Accepts the same as character literals.

Tuples can contain 2 or more elements. they are separated by `,`.

```py
(1, 2)  # tuple

# pattern match
(x1, x2, ..., xn) = ("Hi", 2, ..., 'N')
# x1 = "Hi"
# x2 = 2
# ...
# xn = 'N'

(fst, snd) = (1, "Hello", ..., 'N')
# fst = 1
# snd = ("Hello", ..., 'N')
```

Lists that are implemented as linked lists.

```py
[1,2,3] # list

# list comprehensions
[x + 1 for x in [1,2,3]]  # Result: [2, 3, 4]

# with a conditional
[x * 2 for x in [1,2,3] if x > 2]  # Result: [6, 8]
```

Map is an efficient binary tree with `u24` keys. It offers O(log n) read and write operations.

```py
{ 0: 4, 'c': 2 + 3 , ... } # Map

# updating values using keys
map = { 0: "zero", 1: "one", 2: "two", 3: "three" }
map[0] = "not zero"      # update the value at key 0
map[1] = 2               # update the value at key 1
map[2] = 3               # update the value at key 2

# Using keys in operations
map[3] = map[1] + map[map[1]]  # Use the value at key 1 and the value at key map[1]
```

- Keys must values that can be cast to a `u24` number.
  - The values can be of any type, but mixing types can make reasoning about the map harder.

## Operators

Some math

- Bend supports operations only between identical types of numbers.

```py
10 + 10 => 20   # ADD
10 -  5 => 5    # SUB
5  *  2 => 10   # MUL
10 /  2 => 5    # DIV
10 %  3 => 1    # REM
10 >> 1 => 5    # SHR
10 << 1 => 20   # SHL
10.0 ** 2.0 => 100.0  # POW
```

- In Bend the operator `**` is exclusive to the`f24` type.

Booleans are represented with `u24`/`i24` integers `0` and `1`.

There are the boolean operators: `&`, `|` and `^`.

```py
1 & 1 => 1  # AND 
1 | 0 => 1  # OR
1 ^ 1 => 0  # XOR
```

- In Bend the boolean operators are exclusive to `u24` and `i24`.

For comparisons we have: `==`, `!=`, `<`, `>`, `>=` and `<=`, which return `u24`.

```py
1.0 == 1.0 => 1  # EQ
1   !=  1  => 0  # NEQ
-1  <  +2  => 1  # LT
1   >   2  => 0  # GT
2   <=  2  => 1  # LTE
1.0 >= 2.0 => 0  # GTE
```

<!-- `False`, `Nil`, `None` and `Empty` values will evaluate to `0`. All others evalauate to `1`. -->

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
  return "condition is true"
else:
  return "condition is false"
```

- A branching statement where `else` is mandatory.
  - The condition must return a `u24`, where 0 is false.

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

Switches may only be used with native numbers values. It lets us check for many cases at the same time.

- Beginning with 0 and incrementing by 1. The last case must be `_`, like a `default` case.

```py
switch number:
  case 0:
    return 6
  case 1:
    return 7
  case _: # default
    return number - 2
```

Use `switch` instead of nesting many `if` expressions.

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
