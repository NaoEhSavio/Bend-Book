
# `IF` Statements

Making Decisions Based on Conditions in Bend a common way to implement this is by using conditional statements, such as if and else.

## The Basic Structure of if-else

The if-else structure allows our program to execute different blocks of code depending
on whether a condition is true or false.

```py
def if_else(cond): 
  if cond:
    return "condition is true"
  else:
    return "condition is false"
```

Here, cond is the condition we are evaluating. If cond is true, the function returns
"condition is true". Otherwise, it returns "condition is false".

### Importance of else

Unlike some languages where else may be optional, in Bend else is mandatory. This
ensures that there is always an execution path, even if the initial condition is not
met.

### The Condition

In the above structure, cond should return a u24 (a 24-bit integer), where 0 represents false and any other value represents true.

```py
def if_else_u24(cond):
  if cond != 0:
    return "condition is true"
  else:
    return "condition is false"
```

#### Chaining Conditions with elif

For situations where we need to evaluate multiple conditions, we use elif. This allows
us to create chains of conditions where several conditions are tested in sequence
until one of them is true.

```py
def else_if(cond):
  if cond == 1:
    return 0
  elif cond > 1:
    return 1
  elif cond < 1:
    return 2
  else:
    return 3
```

Here, we have a function that returns different values depending on the value of cond:

- If cond is true, it returns 0.
- If cond is greater than 1, it returns 1.
- If cond is less than 1, it returns 2.
- If none of the above conditions are true, it returns 3.
