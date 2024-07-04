# Tail Recursion in Bend

Tail recursion is a special form of recursion where the recursive call is the last operation to be executed before the function returns a value. This allows the programming language to optimize execution by reusing the same stack frame for recursive calls, instead of creating new ones. This optimization is known as tail call optimization.

Bend, based on the HVM (High Order Virtual Machine), is a language that supports tail call optimization. This results in more efficient use of memory and better performance for recursive functions that follow this pattern. In fact, all recursion in Bend is optimized as tail recursion due to the characteristics of the HVM.

## Characteristics of Tail Recursion

- Final Recursive Call: The recursive call is the last thing that happens
  in the function.
- No Pending Operations: There are no additional operations after the recursive
  call. Any calculation or operation must be completed before the recursive
  call.

### Example of Traditional Recursion vs. Tail Recursion

#### Traditional Recursion

Here is an example of a traditional recursive function that calculates the factorial
of a number:

```py
def factorial(n):
  switch n:
    case 0:
      return 1
    case _:
      return n * factorial(n - 1)
```

In this version, the multiplication `n * factorial(n - 1)` occurs after the recursive call, which means the operation is not tail recursion.

#### Tail Recursion

Here is the same function rewritten to use tail recursion:

```py
def factorial_tail(n):
  return factorial_tail_aux(n, 1)

def factorial_tail_aux(n, acc):
  switch n:
    case 0:
      return acc
    case _:
      return factorial_tail_aux(n - 1, n * acc)
```

In this version, the recursive call `factorial_tail_aux(n - 1, n * acc)` is the last operation of the function, allowing Bend to optimize the recursion.

### Practical Example in Bend

Let's create a tail recursive function to calculate the Fibonacci sequence in Bend:

```py
def fib_tail(n):
  return fib_tail_aux(n, 0, 1)

def fib_tail_aux(n, a, b):
  switch n:
    case 0:
      return a
    case 1:
      return b
    case _:
      return fib_tail_aux(n - 1, b, a + b)
```

In this function, `fib_tail_aux(n - 1, b, a + b)` is the last operation, ensuring the function is tail recursive.

#### Benefits of Tail Recursion

- Memory Efficiency: Tail call optimization allows the same stack frame to be reused, preventing excessive stack growth and saving memory.
- Improved Performance: By avoiding the creation of new stack frames for each recursive call, performance can be significantly improved.
- Prevents Stack Overflow: In languages that do not support tail call optimization, deep recursion can lead to stack overflow. With tail call optimization, this is mitigated.

### Implementation in the HVM

The HVM, which is the basis of Bend, allows efficient execution of recursion due to its lazy evaluation mechanism and the use of "REF nodes" to expand on demand. This means that memory is used consistently even in deep recursions.

#### Example of implementation in the HVM

```hs
(IsNat Z)     = True
(IsNat (S p)) = (IsNat p)
```

This does not "grow forever" because, in the case `(IsNat Z)`, it reduces directly to `True`, using a constant amount of memory.

### Conclusion

Tail recursion is a powerful technique that can lead to more efficient and better-performing programs, especially in languages that support its optimization, such as Bend. By ensuring that the recursive call is the last operation in a function, you allow the compiler or interpreter to optimize execution, saving memory and preventing stack overflow.

```py
def main():
  tail_factorial = factorial_tail(5)
  factorial = factorial(5)
  fib = fib_tail(10)
  return fib
```
