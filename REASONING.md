# Reasoning for the Predictions Table

Write one entry under every heading below, then commit this file together with
`predictions.tsv`, before you run a case or open `tests/expected.tsv`.

Each entry names the rule that produces the four predicted fields for that
case. One to three sentences is enough. The grader checks structure only. It
does not judge quality, and it sets no word minimum.

After you run the cases, add a short correction under each case you predicted
wrongly. Say what you predicted, what CLISP printed, and which rule you
misread. Those entries belong in the correction commits.

## P01

`+` is considered a function-name in this case, and a function works out all arguments first before actually running, as stated in the evaluation rule for function call forms. Lisp sees 1 and marks it as the first argument, but then sees (* 2 3) so it evaluates this on its own which gives 6. Finally, it evaluates the values against the + which gives 7, a whole number, making it an integer with none for its length.

## P02

The reader turns ''(+ 1 2) into (quote (+ 1 2)), so quote is the head, and it is a special operator according to the manual. quote does not evaluate its argument, so Lisp returns the list (+ 1 2) as it is. It is a non-empty list, so the kind is cons and the length is 3.

## P03

nil is a single atom, so there is no head to look at and the operator is none. Lisp sees it and evaluates it to itself, which gives nil. nil is the empty list, so its kind is null, which the course keeps for nil only. Since it is a sequence (the empty one according to the guide), its length is 0 and not none.

## P04

t evaluates to itself. It is a symbol other than nil, so the kind is symbol, it is not a sequence so the length is none, and as an atom the operator is none.

## P05

symbolp is a function that checks whether the thing it's given is a symbol, meaning it answers t if yes and nil if no. Since it is a function, Lisp works out its argument first wherein nil evaluates to itself and nil is a symbol (stated in the manual), so symbolp answers t. t is a symbol, so the kind is symbol and the length is none since it is not a sequence.

## P06

car is another function in Lisp, and in this case, the argument is '(), and the quote hands car the empty list, which is nil. car of the empty list answers nil instead of an error (as given in the guide). nil is the one value whose kind is null, and the length is 0 because nil is the empty sequence.

## P07

cons is also a function, and in this case, 1 evaluates to itself, and the quote hands over the list (2 3). cons then puts 1 in front of that list, which gives (1,2,3). Since it is a non-empty list, the kind is cons and the length is 3 with the operator being a function.

## P08

"if" is a special operator, so it works out the condition (null '()) first, which is t because the empty list is nil. Since the condition is true, it takes only the first branch— which the quote on 'empty gives the symbol empty, written in lower case— and never touches 'full. A symbol is not a sequence, so the kind is symbol and the length is none.

## P09

and stops at the first nil and never evaluates the 3, so the value is nil, with kind null and length 0. CLISP implements and as both a special operator and a macro, and the course asks about special operators first, so the operator is special-operator.

## P10

The head is progn, a special operator which evaluates a series of expressions sequentially from left to right and returns the value of the very last expression. *ps3-rate* is a dynamic variable with defvar, so when let sets it to 10 later on in the run, ps3-scale sees 10 and (ps3-scale 3) is 3 times 10, which is 30. That value is an integer, so the length is none.

## P11

defun is a macro, and a definition returns the function's name. The value is the symbol ps3-twice, so the kind is symbol and the length is none.

## P12

labels is a special operator that defines a local recursive function. down conses n onto the recursion until n is 0, where the base case returns nil, so (down 3) is (3,2,1), a cons with length 3.

## P13

mapcar is a function that applies length to each sublist of ((1 2) () (3)). The lengths are 2, 0 and 1, collected into (2,0,1), a cons with length 3.

## P14

This case still uses the mapcar function, however, lambda is one of its arguments so it does not decide the operator. The lambda squares each item, which gives (1,4,9). That is a non-empty list, making its kind cons, with 3 for its length.

## P15

lambda is a macro, and evaluating it produces a function object. The grader writes that as #<function>, with kind function and length none.

## P16

The head is let which is a special operator to create local variables. Lisp sees f being made while factor is 2, so f keeps that value and the inner let then makes a new factor of 10, but it doesn't change the value of factor for f, so it (funcall f 3) gives 6 instead of 30. That makes it an integer, with none for its length since it is not a sequence.
