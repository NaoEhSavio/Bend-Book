# Types in Bend

In Bend, types are fundamental for defining the structure and nature of the data that a program can manipulate. They allow the creation of complex data structures and help ensure data integrity and consistency throughout the program's execution.

## Defining Types

To define a type in Bend, we use the `type` keyword. A type can have multiple constructors, each with its own fields. Here is the basic syntax for defining a type:

```bend
type TypeName:
  Constructor1 {value, field1, field2, ...}
  Constructor2 {field1, field2, ...}
  ...
```

Example: Defining a Vector Type

Let's create a `Vector` type that represents a list of elements. Each element is a pair of an integer and an associated value. Here is the definition of the `Vector` type:

```bend
type Vector:
  Nil
  Cons {n, head, ~tail}
```

In this example, the `Vector` type has two constructors:

- `Nil`, which represents an empty list;
- `Cons`, which represents an element of the list.

The `Cons` constructor has three fields:

- `n`, which is an integer;
- `head`, which is the associated value; and
- `tail`, which is the rest of the list.

Additional Example: Days of the Week

Here is an example of defining a type to represent the days of the week and a function that determines the next weekday:

Defining the `Day` Type

```bend
type Day:
  monday
  tuesday
  wednesday
  thursday
  friday
  saturday
  sunday
```

Here we define the `Day` type with seven constructors, one for each day of the week.

`NextWeekday` Function

The `NextWeekday` function takes a value of type `Day` and returns the next weekday. We use pattern matching to define the behavior of the function for each day of the week.

```bend
def NextWeekday(day):
  match day:
    case Day/monday:
      return Day/tuesday
    case Day/tuesday:
      return Day/wednesday
    case Day/wednesday:
      return Day/thursday
    case Day/thursday:
      return Day/friday
    case _:
      return Day/monday
```

In this example, we define the `NextWeekday` function that maps each day of the week to the next weekday. Note that Friday, Saturday, and Sunday should return Monday, as we only consider weekdays, hence the `_` pattern at the end.

## Creating Instances of Types

To create an instance of a defined type, we use its constructors. Here is an example of how to create a vector with three elements:

```bend
def ex1():
  # Create a vector with three elements: (2, "a"), (1, "b"), and (0, "c")
  my_vector = Vector/Cons(2, "a", Vector/Cons(1, "b", Vector/Cons(0, "c", Vector/Nil)))
  return my_vector
```

In this example, we create a vector with three elements: (2, "a"), (1, "b"), and (0, "c"). The vector is built from the end, starting with the last element and adding the previous elements. The result is a linked list of elements, where each element points to the next. Creating types in Bend is a powerful way to structure and manipulate complex data.

## Testing the Function

To verify the functionality of the `NextWeekday` function, we create a `main` function that
tests the function with some examples:

```bend
def main():
  my_vector = ex1()
  # Two weekdays after Saturday
  nextWeekday = NextWeekday(NextWeekday(Day/saturday))
  return nextWeekday
```

When running the code above, the expected result is `Day/tuesday`.
