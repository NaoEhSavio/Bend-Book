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

Char
todo

String

todo

### Types

todo

### Object

todo

##### Open

todo

Tuples can contain 2 or more elements. they are separated by `,`.

```py
(1,2) # tuple
```

Lists that are implemented as lists. they are separated by `,`.

```py
[1,2,3] # list
```

<!-- In Elixir, just like in Erlang, the `=` denotes pattern matching and not an assignment.

This means that the left-hand side (pattern) is matched against a right-hand side.

This is how the above example of accessing the head and tail of a list works.

A pattern match will error when the sides don't match, in this example
the tuples have different sizes.
{a, b, c} = {1, 2} #=> ** (MatchError) no match of right hand sid
Strings are all encoded in UTF-8:
"héllò" #=> "héllò"

Strings are really just binaries, and char lists are just lists.
<<?a, ?b, ?c>> #=> "abc"
[?a, ?b, ?c]   #=> 'abc'

`?a` in Elixir returns the ASCII integer for the letter `a` -->

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
10 ** 2 => 20.0 # POW
```

In Bend the operator `**` is exclusive to float.

There are also boolean operators: `&`, `|` and `^`.

```py
1 & 1 => 1 # true  # AND 
1 | 0 => 1 # true  # OR
1 ^ 1 => 0 # false # XOR
```

<!-- These operators expect a boolean as their first argument. -->

<!-- All values except `False`, `Nil`, `None` and `Empty` will evaluate to O. -->

For comparisons we have: `==`, `!=`, `<` and `>`

```py
1 == 1 => 1 # true  # EQ
1 != 1 => 0 # false # NEQ
1 < 2  => 1 # true  # LT
1 > 2  => 0 # false # GT
```

<!-- Elixir operators are strict in their arguments, with the exception
of comparison operators that work across different data types:

This enables building collections of mixed types:

While there is an overall order of all data types,
to quote Joe Armstrong on this: "The actual order is not important,
but that a total ordering is well defined is important." -->

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

## Functions

todo

## IO

todo

## Concurrency

<!-- 
case {:one, :two} do
  {:four, :five} ->
    "This won't match"
  {:one, x} ->
    "This will match and bind `x` to `:two` in this clause"
  _ ->
    "This will match any value"
end

It's common to bind the value to `_` if we don't need it.
For example, if only the head of a list matters to us:
[head | _] = [1,2,3]
head #=> 1

For better readability we can do the following:
[head | _tail] = [:a, :b, :c]
head #=> :a

`cond` lets us check for many conditions at the same time.
Use `cond` instead of nesting many `if` expressions.
cond do
  1 + 1 == 3 ->
    "I will never be seen"
  2 * 5 == 12 ->
    "Me neither"
  1 + 2 == 3 ->
    "But I will"
end

It is common to set the last condition equal to `true`, which will always match.
cond do
  1 + 1 == 3 ->
    "I will never be seen"
  2 * 5 == 12 ->
    "Me neither"
  true ->
    "But I will (this is essentially an else)"
end

`try/catch` is used to catch values that are thrown, it also supports an
`after` clause that is invoked whether or not a value is caught.
try do
  throw(:hello)
catch
  message -> "Got #{message}."
after
  IO.puts("I'm the after clause.")
end

# => I'm the after clause

"Got :hello"

-- Modules and Functions

Anonymous functions (notice the dot)
square = fn(x) -> x * x end
square.(5) #=> 25

They also accept many clauses and guards.
Guards let you fine tune pattern matching,
they are indicated by the `when` keyword:
f = fn
  x, y when x > 0 -> x + y
  x, y -> x * y
end

f.(1, 3)  #=> 4
f.(-1, 3) #=> -3

Elixir also provides many built-in functions.
These are available in the current scope.
is_number(10)    #=> true
is_list("hello") #=> false
elem({1,2,3}, 0) #=> 1

You can group several functions into a module. Inside a module use `def`
to define your functions.
defmodule Math do
  def sum(a, b) do
    a + b
  end

  def square(x) do
    x * x
  end
end

Math.sum(1, 2)  #=> 3
Math.square(3) #=> 9

To compile our simple Math module save it as `math.ex` and use `elixirc`
in your terminal: elixirc math.ex

Inside a module we can define functions with `def` and private functions with `defp`.
A function defined with `def` is available to be invoked from other modules,
a private function can only be invoked locally.
defmodule PrivateMath do
  def sum(a, b) do
    do_sum(a, b)
  end

  defp do_sum(a, b) do
    a + b
  end
end

PrivateMath.sum(1, 2)    #=> 3
PrivateMath.do_sum(1, 2) #=> ** (UndefinedFunctionError)

Function declarations also support guards and multiple clauses.
When a function with multiple clauses is called, the first function
that satisfies the clause will be invoked.
Example: invoking area({:circle, 3}) will call the second area
function defined below, not the first:
defmodule Geometry do
  def area({:rectangle, w, h}) do
    w * h
  end

  def area({:circle, r}) when is_number(r) do
    3.14 *r* r
  end
end

Geometry.area({:rectangle, 2, 3}) #=> 6
Geometry.area({:circle, 3})       #=> 28.25999999999999801048
Geometry.area({:circle, "not_a_number"})

# => ** (FunctionClauseError) no function clause matching in Geometry.area/1

Due to immutability, recursion is a big part of Elixir
defmodule Recursion do
  def sum_list([head | tail], acc) do
    sum_list(tail, acc + head)
  end

  def sum_list([], acc) do
    acc
  end
end

Recursion.sum_list([1,2,3], 0) #=> 6

Elixir modules support attributes, there are built-in attributes and you
may also add custom ones.
defmodule MyMod do
  @moduledoc """
  This is a built-in attribute on a example module.
  """

  @my_data 100 This is a custom attribute.
  IO.inspect(@my_data) #=> 100
end

The pipe operator |> allows you to pass the output of an expression
as the first parameter into a function.

Range.new(1,10)
|> Enum.map(fn x -> x * x end)
|> Enum.filter(fn x -> rem(x, 2) == 0 end)

# => [4, 16, 36, 64, 100]

-- Structs and Exceptions

Structs are extensions on top of maps that bring default values,
compile-time guarantees and polymorphism into Elixir.
defmodule Person do
  defstruct name: nil, age: 0, height: 0
end

joe_info = %Person{ name: "Joe", age: 30, height: 180 }

# => %Person{age: 30, height: 180, name: "Joe"}

Access the value of name
joe_info.name #=> "Joe"

Update the value of age
older_joe_info = %{ joe_info | age: 31 }

# => %Person{age: 31, height: 180, name: "Joe"}

The `try` block with the `rescue` keyword is used to handle exceptions
try do
  raise "some error"
rescue
  RuntimeError -> "rescued a runtime error"
  _error -> "this will rescue any error"
end

# => "rescued a runtime error"

All exceptions have a message
try do
  raise "some error"
rescue
  x in [RuntimeError] ->
    x.message
end

# => "some error"

-- Concurrency

Elixir relies on the actor model for concurrency. All we need to write
concurrent programs in Elixir are three primitives: spawning processes,
sending messages and receiving messages.

To start a new process we use the `spawn` function, which takes a function
as argument.
f = fn -> 2 * 2 end #=> #Function<erl_eval.20.80484245>
spawn(f) #=> #PID<0.40.0>

`spawn` returns a pid (process identifier), you can use this pid to send
messages to the process. To do message passing we use the `send` operator.
For all of this to be useful we need to be able to receive messages. This is
achieved with the `receive` mechanism:

The `receive do` block is used to listen for messages and process
them when they are received. A `receive do` block will only
process one received message. In order to process multiple
messages, a function with a `receive do` block must recursively
call itself to get into the `receive do` block again.

defmodule Geometry do
  def area_loop do
    receive do
      {:rectangle, w, h} ->
        IO.puts("Area = #{w *h}")
        area_loop()
      {:circle, r} ->
        IO.puts("Area = #{3.14* r * r}")
        area_loop()
    end
  end
end

Compile the module and create a process that evaluates `area_loop` in the shell
pid = spawn(fn -> Geometry.area_loop() end) #=> #PID<0.40.0>
Alternatively
pid = spawn(Geometry, :area_loop, [])

Send a message to `pid` that will match a pattern in the receive statement
send pid, {:rectangle, 2, 3}

# => Area = 6

  {:rectangle,2,3}

send pid, {:circle, 2}

# => Area = 12.56000000000000049738

  {:circle,2}

The shell is also a process, you can use `self` to get the current pid
self() #=> #PID<0.27.0> -->
