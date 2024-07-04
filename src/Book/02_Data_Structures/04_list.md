# List

```bend
 type List:
   Cons {head, ~tail}
   Nil
```

 The List type is a native type in Bend, used to represent ordered sequences of elements.
 It is defined by two main constructors: Cons and Nil.

## Constructors

- Cons: This constructor is used to create a list with an element and a tail. It takes two arguments:
  - head: The value of the first element of the list.
  - tail: The tail of the list, which is another List object.
- Nil: This constructor represents an empty list. It takes no arguments and is used to indicate the end of the list.

## Visual Representation

A list can be visualized as a chain of nodes, where each node contains a value and a reference to the next node. The last node, which does not point to any other node, is represented by Nil.

Example:
Cons(1, Cons(2, Cons(3, Nil))) -> 1 -> 2 -> 3 -> Nil

In this example, we have a list containing the values 1, 2, and 3, ending with Nil.

## Alternative Notation

To simplify the reading and writing of lists, we can use a more familiar notation, where elements are listed between square brackets and separated by commas.

Examples:

- [1, 2, 3] is equivalent to Cons(1, Cons(2, Cons(3, Nil))).
- [] is equivalent to Nil, representing an empty list.
- [1] is equivalent to Cons(1, Nil), representing a list with a single element.

Example of Usage in Code:
Below is an example of a main function that returns the list ["Hello", "world!"]:

```bend
def main():
  return List/Cons("Hello", List/Cons("world!", List/Nil))
```

In this example, the main function constructs a list with two elements, "Hello" and "world!", using the Cons and Nil constructors.
