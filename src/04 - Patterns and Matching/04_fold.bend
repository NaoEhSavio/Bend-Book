# `Fold` statements provide a powerful way to reduce a data structure by recursively 
# applying a function and combining the results. Another language that has `fold` is 
# Haskell, where it is a fundamental technique for operating on data structures like 
# lists and trees. The `fold` in Bend is equivalent to `foldl` in Haskell.

# Basic Structure of `Fold`
# The `fold` structure reduces the given value based on the provided matching cases.

# Bound Fields
# Just like in `match`, we can bind variable names to the corresponding values.

# Implicit `fold` Calls
# For fields annotated with `~` in the type definition, the `fold` function is implicitly 
# called.

# Suppose a tree definition where the subtree fields are annotated with `~`:

type BTree:
  Leaf
  Node {value, ~left, ~right}

# Here, `Node` represents an internal tree node with a value and left and right subtrees, 
# while `Leaf` represents a tree leaf.

# `Fold` Example
# With this definition, we can use the `fold` function implicitly. Let's create a `fold` 
# that sums all the node values in the tree:

def sum_btree(btree):
  fold btree:
    case BTree/Leaf:
      return 0
    case BTree/Node:
      return btree.value + btree.left + btree.right
# In this example:
# - If the `tree` matches `Leaf`, we return `0`.
# - If the `tree` matches `Node`, we sum the node's value with the results of the 
# recursive `fold` calls on the `left` and `right` subtrees.

# Equivalence with Recursive Function
# A `fold` statement is equivalent to an inline recursive function. The above example can 
# be rewritten equivalently using an explicit recursive function:

def fold(tree):
  match tree:
    case BTree/Leaf:
      return 0
    case BTree/Node:
      return tree.value + fold(tree.left) + fold(tree.right)

def main():
  tree = BTree/Node(1, BTree/Node(2, BTree/Leaf, BTree/Leaf),
                       BTree/Node(3, BTree/Leaf, BTree/Leaf))
  return sum_btree(tree)  # Output: 6

# Conclusion
# `Fold` statements provide an elegant way to reduce complex data structures like trees 
# by recursively applying a function. By allowing field binding and implicit `fold` 
# calls, this structure facilitates clear and efficient manipulation and aggregation of 
# data.