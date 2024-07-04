# Tuples in Bend

In Bend, a tuple can contain two or more elements. The elements are separated by commas.

## Defining Tuples

To define a tuple, we use parentheses and separate the elements with commas.

Example: Defining Simple Tuples
Here are some examples of tuple definitions:

(1, 2) tuple with two elements

We can do pattern matching on tuples:
(fst, snd, ..., lst) = ("Hi", 2, ..., lst)
fst = "Hi"
snd = 2
... = ...
lst = lst

(fst, snd) = (1, "Hello", ..., lst)
fst = 1
snd = ("Hello", ..., lst)

## Creating and Manipulating Tuples

To create and manipulate tuples, we use the syntax of parentheses and commas.
Below is an example of functions that return the first, second, and third elements of a tuple:

```bend
def return_fst(t):
  (fst, snd) = t
  return fst

def return_snd(t):
  (fst, snd) = t
  return snd

def return_trd(t):
  (fst, snd, trd) = t
  return trd

# Main function demonstrating the usage of the above functions
def main():
  tupl = (1, 2, 3, 4)
  fst = return_fst(tupl) # 1
  snd = return_snd(tupl) # (2, (3, 4))
  trd = return_trd(tupl) # (3, 4)
  return trd # (3, 4)
```

## In this example

- We create a tuple `tupl` with four elements: (1, 2, 3, 4).
- We use the function `return_fst` to return the first element of the tuple, which is 1.
- We use the function `return_snd` to return the second element of the tuple, which is (2, (3, 4)).
- We use the function `return_trd` to return the third element of the tuple, which is (3, 4).
