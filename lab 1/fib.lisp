;(defun fib(n) (	if (= n 1) 
;	(print  1 )
;	(if (= n 2)
;	 (print  1 )
;	 (print + fib(- n 1) fib(- n 2)))))
;(write(fib 2))

(defvar x 0)
(defvar y 1)
(defvar temp 1)
(loop for n from 1 to 10
	do(print x)
	do(setq temp x)
	do(setq x y)
	do(setq y (+ y temp))
	)

