# Graphs in Bend

In Bend, graphs are not a native type. Therefore, an efficient way to create a graph is by using a map of lists of pairs. Each key in the map represents a node, and the list of pairs associated with that key represents the edges connecting that node to other nodes, along with the associated distances.

Example: Building a Graph in Bend
Here is an example of how we can build a graph in Bend using a map of lists of pairs:

```py
def main():
  graph = {
    'a': [(4, 'b'), (1, 'c')],
    'b': [(4, 'a'), (13, 'c'), (2, 'd')],
    'c': [(1, 'a'), (13, 'b'), (5, 'd')],
    'd': [(2, 'b'), (5, 'c')]
  }
  return graph
```

In this example, we have a graph with four nodes ("a", "b", "c", "d") and several edges with associated distances.

- Node 'a' is at a distance of 4 from node 'b' and at a distance of 1 from node 'c'.
- Node 'b' is at a distance of 4 from node 'a', 13 from node 'c', and at a distance of 2 from node 'd'.
- Node 'c' is at a distance of 1 from node 'a', 13 from node 'b', and at a distance of 5 from node 'd'.
- Node 'd' is at a distance of 2 from node 'b' and at a distance of 5 from node 'c'.

Visually, the graph can be represented as follows:

```md
 a - 4 - b
 |     / |
 1   13  2
 | /     |
 c - 5 - d
```
