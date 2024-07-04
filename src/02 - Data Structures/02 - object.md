# Objects in Bend

In Bend, an object defines a type with a single constructor, similar to a structure (struct), a record, or a class. Objects allow the creation of complex data types with multiple fields.

## Defining Objects

To define an object in Bend, we use the `object` keyword. The definition of an object specifies the fields it has.

## Example: Defining Simple Objects

Here are some examples of object definitions:

```bend
object Pair { fst, snd }

object Function { name, args, body }

object Vec { len, data }
```

In these examples, we define three objects: Pair, Function, and Vec, each with their respective fields.
The constructor created from this definition has the same name as the type.

Example: Defining an Account Object

Let's define an Account object with two fields: number and balance.

```bend
object Account {
  number,
  balance
}
```

In this example, we define an Account object with two fields: number and balance.
The Account constructor has two parameters: number and balance.

## Creating and Manipulating Objects

To create an instance of an object, we use its constructor. We can access and manipulate the fields of an object using the `open` keyword.

Example: Creating an Instance of Account
Below is an example of `createAccount1` and `createAccount2` functions that create instances of the Account object:

```bend
def createAccount1():
  return Account { number: "1234-56", balance: 10000.00 }

def createAccount2():
  return Account { number: "1234-57", balance: 20000.00 }
```

## Function to withdraw an amount from an account

This function uses the `balance` field of the `Account` object to calculate the balance after withdrawal.

```bend
def withdraw(amount, account):
  open Account: account
  return ("Actual balance", (account.balance - amount))

Main function demonstrating the usage of the above functions
def main():
  account1 = createAccount1()
  account2 = createAccount2()
  return withdraw(6000.00, account1)
```

In this example:

- We use `open` to access the number and balance fields of the Account object.
- We use `return` to return an instance of the Account object with the
fields number and balance filled with the provided values.
