# Money tracker tech test

A program you can use to track money you spend and earn.

Requirements
------------
* Be able to interact with the your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)

* Be able to record money you've spent and the date you spent it on.  e.g. You could record the fact that you spent £100 on 2017/8/8.

* Be able to record money you've earned and the date you earned it on.  e.g. You could record the fact that you earned £100 on 2017/8/8.

* Be able to print an account statement that shows all the records (date, amount, balance).

* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** you record that you earned 1000 on 10-01-2012
**And** earned 2000 on 13-01-2012
**And** spent 500 on 14-01-2012
**When** you print your bank statement
**Then** you would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
