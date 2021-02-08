# Rpn

### How to run the command
To run the calculator: run `bin/rpn`

### Tests
To run the tests: run `rake test`

### What to look for in the code
1. `bin/rpn` is the executable for the command.
1. `lib/errors` include the 2 error classes
1. `lib/operations` include all the operations that are supported. Following Open Close Principle. If we need to add more operations, we can add them in this folder and reference the operation in `lib/rpn.rb`
1. `lib/rpn.rb` defines the rpn calculator class that processes user input and invokes different operations accordingly.
1. `test` folders include all the tests for each operations and for all the examples in the assignments.

