# Matrices in Bend

In Bend, a common way to construct matrices is by using lists of lists, as it is not a native type. Each inner list represents a row of the matrix.

Example: Building a Matrix in Bend
Here is an example of how we can build a matrix in Bend using lists of lists:

```py
matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]
```

In this example, we have a 3x3 matrix with values from 1 to 9 organized into three rows and three columns. We can access the elements of the matrix using double indices. For example, `matrix[0][0]` gives us the element in the first row and first column, which is 1.

This is a flexible and convenient way to represent matrices in Bend, allowing easy access to elements and manipulation of data structures.

```py
def main():
  return matrix
```
