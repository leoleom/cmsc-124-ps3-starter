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
In (+ 1 (* 2 3)), it heads with the + function. The function + evaluates is arguments first so (* 2 3) gives a product of 6 before running +. The + returns 7, integer, so length is none and head is a function.

## P02
Stored form is ''(+ 1 2). This means form evaluated is (quote (+ 1 2)). quote is special operator that return its argument unevaluated. The value is the three-element list (+, 1, 2). Giving a cons with length 3. 

## P03
nil is an atom that evaluates to itself, so the value is nil. The course kind for nil is null, and since nil is the empty sequence its length is 0 rather than none. An atom has no head, so the operator is none.

## P04
t evaluates to itself. It is a symbol other than nil, so the kind is symbol, it is not a sequence so the length is none, and as an atom the operator is none.

## P05
symbolp is a function, and nil is a symbol, so the call returns t. t is a symbol with length none, and the head symbolp is a function.

## P06
car is a function, and car of the empty list answers nil. The result nil has kind null and length 0, because it is the empty sequence.

## P07
cons is a function, and the quote hands it the list (2 3) unevaluated. It puts 1 in front, giving (1,2,3), a cons with 3 elements.

## P08
if is a special operator, so it evaluates the condition and then only one branch. (null '()) is true, so only 'empty is evaluated, giving the symbol empty with length none.

## P09
and stops at the first nil and never evaluates the 3, so the value is nil, with kind null and length 0. CLISP implements and as both a special operator and a macro, and the course asks about special operators first, so the operator is special-operator.

## P10
defvar declares *ps3-rate* special, so the let rebinding to 10 changes what ps3-scale sees while the call runs. The result is 3 × 10 = 30, an integer. The head progn is a special operator.

## P11
defun is a macro, and a definition returns the function’s name. The value is the symbol ps3-twice, so the kind is symbol and the length is none.

## P12
labels is a special operator that defines a local recursive function. down conses n onto the recursion until n is 0, where the base case returns nil, so (down 3) is (3,2,1), with length 3.

## P13
mapcar is a function that applies length to each sublist of ((1 2) () (3)). The lengths are 2, 0 and 1, collected into (2,0,1), a cons with length 3.

## P14
mapcar is a function that applies the lambda to each element, squaring 1, 2 and 3. The result is (1,4,9), a cons with length 3.

## P15
lambda is a macro, and evaluating it produces a function object. The grader writes that as #<function>, with kind function and length none.

## P16
f is defined inside the outer let, so it captures the lexical factor holding 2. The inner let binds a different, later factor that f never sees, so (funcall f 3) is 6. The head let is a special operator.
