# Using scopeless lambdas

Scopeless lambdas are very powerful lambdas that are a side-effect of HVM's internal representation for lambda terms.

Scopeless lambdas are lambdas that have no scope. The variables bound by them can be used outside the lambda's body. They can be created by prefixing a dollar symbol (`$`) to a lambda's variable name.

```bend
id = λ$x $x # The identity function as a scopeless lambda
```

Of course, using scopeless lambdas as a replacement for regular lambdas is kind of pointless. Their real power comes from being able to use the bound variable outside the body:

```bend
Ex1 = (((λ$x 1) 2), $x)
```

$x gets replaced by 2 and the application ((λ$x 1) 2) gets replaced by 1
Outputs (1, 2)

Take some time to think about the program above. It is valid, despite `$x` being used outside the lambda's body.
However, scopeless lambdas don't bind across definitions.

```bend
def = $x
main = (((λ$x 1) 2), def)
```

The bound variables are local to each term.

## Duplicating scopeless lambdas

We have seen that the variable bound to a scopeless lambda gets set when the lambda is called. But, what happens if we never call `λ$x 1`? What will `$x` get set to then? Here is a program that does that:

```bend
Ex2 =
  let _ = λ$x 1 # Discard and erase the scopeless lambda
  (2, $x) # Outputs (2, *)
```

The program outputs `2` as the first item of the tuple, as expected.
But the second item is `*`! What is `*`?

`*` (called ERA or eraser) is a special term HVM uses when a value was erased.
This is what happened to `$x`. We erased `λ$x 1` when we discarded it, which led to `$x` being erased.

What happens if we call `λ$x 1` with two different values instead?

Try to answer this with your knowledge of HVM.
Will it throw a runtime error?
Will it return something unexpected?

```bend
Ex3 =
  let f = λ$x 1 # Assign the lambda to a variable
  ((f 2), ((f 3), $x)) # Return a tuple of (f 2) and another tuple.
# Outputs (1, (1, {3 2}))
```

What? This is even more confusing. The first two values are `1`, as expected.
But what about the last term?

The last term in the tuple is a **superposition** of two values.
A superposition (see more in Dups_and_Sups.bend) is the "other side" of a duplication.
It is created here because we implicitly duplicated `f` when we used it twice,
and duplicating lambdas creates superpositions.

### Usage

Now that we know how scopeless lambdas work, we can make programs using them.
An example of a function that is usually thought as "primitive", but can be implemented using scopeless lambdas is [call/cc]
(<http://www.madore.org/~david/computers/callcc.html>)

Call/cc is a function that takes a function that takes a parameter `k`.
When `k` is called with an argument, `callcc` returns it.

```bend
# Function that discards its second argument
Seq a b = a

# Create a program capable of using `callcc`
CC.lang = λprogram
  let callcc  = λcallback (λ$garbage($hole) (callback λ$hole(0)));
  let result  = (program callcc);
  (Seq result $garbage)

Ex4 =
  (CC.lang λcallcc
    # This code calls `callcc`, then calls `k` to fill the hole with `42`.
    # This means that the call to callcc returns `42`, and the program returns `52`.
    # (+ (k 42) 1729) is garbage and is erased.
    (+ 10 (callcc λk(+ (k 42) 1729)))
  )

Main =
  let id2 = (id 2)
  let ex1 = Ex1
  let ex2 = Ex2
  let ex3 = Ex3
  let ex4 = Ex4
  ex4
```
