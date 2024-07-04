# Trees in Bend

Bend has native support for trees, a hierarchical data structure with nodes connected by edges.

## Tree Definition

In Bend, a tree (`Tree`) is defined with two constructors:

- `Node { ~left, ~right }`: Represents a tree node with left and right subtrees.
- `Leaf { value }`: Represents a tree leaf that stores a value.

Trees are ideal for algorithms that benefit from parallel recursion, as they allow large problems to be divided into smaller subproblems.

## Tree Syntax

Bend provides the `![]` operator to create tree branches and the `!` operator to create a tree leaf.

- `![a, b]` is equivalent to `Tree/Node { left: a, right: b }`
- `!x` is equivalent to `Tree/Leaf { value: x }`

Example: Building a Tree in Bend

```bend
def main():
  tree = ![![!1, !2], ![!3, !4]]
  return tree
```

In this example, we create a binary tree with leaves containing the values 1, 2, 3, and 4,
representing the following tree:

```md
     node
   /     \
  node    node
 /   \   /   \
1     2 3     4
```
