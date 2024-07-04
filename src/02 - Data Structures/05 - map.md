# Maps in Bend

In Bend, a Map represents a tree with values stored in the branches. It is intended to be used as an efficient map data structure with integer keys and O(log n) read and write operations.

## Defining Maps

To define a Map in Bend, we use the type keyword. A Map can have two constructors: Node and Leaf.

Example: Defining a Map

```bend
type Map:
  Node { value, ~left, ~right }
  Leaf
```

- Node { value, ~left, ~right }:
  - Represents a map node with a value and left and right subtrees.
  - Empty nodes have * stored in the value field.
- Leaf:
  - Represents an unwritten and empty portion of the map.

## Syntax

Here is how you create a new Map with some initial values:

{ 0: 4, `hi`: "bye", 'c': 2 + 3 }

Keys must be U24 numbers and can be given as literals or any other expression that evaluates to a U24.

Values can be anything, but storing data of different types in a Map will make it harder to understand.

You can read and write a value from a map with the [] operator:

map = { 0: "zero", 1: "one", 2: "two", 3: "three" }
map[0] = "not zero"
map[1] = 2
map[2] = 3
map[3] = map[1] + map[map[1]]

Here, map should be the name of the Map variable, and the keys inside [] can be any expression that evaluates to a U24.

Map is an efficient binary tree with U24 keys. It offers O(log n) read and write operations.

{ 0: 4, 'c': 2 + 3 , ... } # Map

## Pattern Matching

We can do pattern matching with Maps:

map = { 0: "zero", 1: "one", 2: "two", 3: "three" }

## Updating Values Using Keys

We can update values using keys:

map[0] = "not zero"      # Updates the value at key 0
map[1] = 2               # Updates the value at key 1
map[2] = 3               # Updates the value at key 2

## Using Keys in Operations

We can use keys in operations:

map[3] = map[1] + map[map[1]]  # Uses the value at key 1 and the value at key map[1]

Keys can be literals or expressions that evaluate to u24. Values can be of any type, but mixing types can make reasoning about the map more difficult.

```bend
def main():
  map = { 0: "zero", 1: "one", 2: "two", 3: "three" }
  return map[2] # should return "two"
```
