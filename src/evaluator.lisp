;;;; evaluator.lisp -- Part 2. Write the eight functions below.
;;;;
;;;; The toy language is a Lisp-1. One namespace holds both variables and
;;;; functions, so a variable bound to a closure is callable in operator
;;;; position and (f 1) works with no FUNCALL. The CLISP hosting this file is a
;;;; Lisp-2, which is why the host needs FUNCALL and #' where the toy language
;;;; needs neither. ANALYSIS.md asks you about that difference.
;;;;
;;;; An environment is an association list: ((name . value) (name . value) ...).
;;;; The grader scores E1 to E4 separately, so finish them in order and keep
;;;; every group you get right.
;;;;
;;;; The grammar, in full:
;;;;
;;;;   expr := number
;;;;         | symbol
;;;;         | (+ expr expr) | (- expr expr) | (* expr expr)
;;;;         | (let ((name expr) ...) body)
;;;;         | (lambda (name ...) body)
;;;;         | (operator-expr argument-expr ...)

;;; E1 -- numbers and symbols.

(defun lookup (name env)
  "The value NAME is bound to in ENV.

The first match wins, so an inner binding shadows an outer one that shares its
name. Signal an error when NAME is not bound at all."
  (declare (ignore name env))
  (error "lookup is not implemented"))

;;; E2 -- prefix arithmetic.

(defun eval-operands (exprs env)
  "Every expression in EXPRS, evaluated in the same ENV, as a list.

MAPCAR and a LAMBDA do this in one line. Watch the arity: EVAL-EXPR takes two
arguments and MAPCAR hands its function one."
  (declare (ignore exprs env))
  (error "eval-operands is not implemented"))

(defun apply-op (op values)
  "Apply the arithmetic operator OP to the two numbers in VALUES.

OP is the symbol +, -, or *. Signal an error for anything else."
  (declare (ignore op values))
  (error "apply-op is not implemented"))

;;; E3 -- let.

(defun extend-env (params args env)
  "Return ENV extended with PARAMS bound to ARGS, without modifying ENV."
  ;; Pair each parameter name with its value, e.g. (x y) and (1 2) become
  ;; ((x . 1) (y . 2)).
  ;; append builds a brand new list with those pairs in front of the old
  ;; environment, so the caller's ENV is never changed. Because the new pairs
  ;; come first, they shadow any older binding with the same name.
  (append (mapcar #'cons params args) env))

(defun eval-let (expr env)
  "Evaluate (let ((name init) ...) body) with every init evaluated in ENV."
  ;; expr looks like (let ((x 1) (y 2)) body).
  ;; cadr is the list of bindings and caddr is the body.
  (let* ((bindings (cadr expr))
         ;; The names being bound, e.g. (x y).
         (names (mapcar #'car bindings))
         ;; Evaluate every initializer in the OLD env, before anything is
         ;; bound. This is what makes it let and not let*: one initializer
         ;; can't see the variables bound by the same let.
         (vals (mapcar (lambda (b) (eval-expr (cadr b) env)) bindings)))
    ;; Only now extend the environment, then run the body in the new one.
    ;; The extension disappears when the body ends, because env itself was
    ;; never modified.
    (eval-expr (caddr expr) (extend-env names vals env))))

;;; E4 -- lambda and application.

(defun make-closure (params body env)
  "Return the closure list holding PARAMS, BODY and the defining ENV."
  ;; A closure is just the code (params and body) bundled with the
  ;; environment that existed when the lambda was written.
  ;; Saving env here is what lets the function remember its variables later.
  (list :closure params body env))

(defun apply-closure (closure args)
  "Run CLOSURE on ARGS.

The parameters join the environment the closure captured. Signal an error when
CLOSURE is not a closure, and when the argument count does not match."
  (declare (ignore closure args))
  (error "apply-closure is not implemented"))

;;; The dispatcher.

(defun eval-expr (expr env)
  "The value of EXPR in ENV.

Order the branches with care. NIL is a symbol as well as the empty list, and a
number is not a cons, so the atom tests come before the list tests."
  (declare (ignore expr env))
  (error "eval-expr is not implemented"))
