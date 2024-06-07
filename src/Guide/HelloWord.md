# Hello World

At this point, `bend` should already be installed on your machine. If not, please go back to the installation and follow the instructions.

In this guide, we will be using command lines and text editors, so make sure your terminal is open to proceed with the steps.

## Creating the Files

First of all, create a directory to store the bend files. It is recommended to use a dedicated directory to keep all exercises and examples, but feel free to do as you please. The three commands below will create a directory named 'bendExamples' and a file named 'hello_world.bend' inside the project directory. Use them in order:

```diff
// Linux, Mac or WSL
mkdir bendExamples
cd    bendExamples
touch hello_world.bend
```

The `.bend` extension is what makes it a bend file. For example, a file that ends with `.exe` is an executable; `.js` is a JavaScript file; `.rs` is a Rust file, etc.

If the commands were used correctly, the hello_world.bend file should be inside the bendExamples folder. So let's have some fun, CODING!

## Hello World

Open the `hello_world.bend` file in your text editor, it will be empty, but don't worry. From now on, there will be some advanced concepts. Everything will make sense in the future, and pertinent concepts will be explained in due time. It is recommended that you manually type the codes, instead of copying and pasting them into your file.

Let's write your first code in the hello_world.bend file:

``` py
def main():
  return "Hello, World!"
```

## Code Check

With the code ready, you should use code checking to verify that everything is in order. The code checker is still unknown in this guide, but will be explained in more detail later. For now, understand it as a checker that verifies that the file is correctly written and defined.

To check the code of a Bend file, simply use the `bend check fileName.bend` command. For the hello_world.bend file, it would be:

```sh
bend check hello_world.bend
```

If there is no return after executing the command, it means your file is ready!

If the code check is  correct? So let's run the code.

### Running the code

To run a file in bend, use the command `bend run fileName.bend`. It should look like this:

```sh
bend run hello_world.bend
```

And there you go! Your terminal should print "Hello, World!" back to you.

### Remember to do all the steps above, check the type, and then run

Great, now that you have your first bend program running, you can start exploring more about the language and its features. Congratulations on your progress!

If you have any questions or need help, don't hesitate to ask. We are always available to help!
