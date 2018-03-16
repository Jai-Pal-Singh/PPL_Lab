(setf arr (make-array '(10) ))

(do ( (i (- (array-total-size arr) 1) (- i 1))
	  (counter 0 (+ counter 5)))
	( (< i 0) 0)
	(setf (aref arr i) counter)
)

(defun swap (array a b)
	(setf temp (aref array a))
	(setf (aref array a) (aref array b))
	(setf (aref array b) temp)
)

(defun bubbleSort (a)
	(dotimes (j (array-total-size a))
		(do ( ( k 0 (+ k 1)))
			( (>= k (- (array-total-size a) 1)) 0)
				(if (> (aref a k) (aref a (+ k 1)))
					(swap a k (+ k 1))
				)
		)
	)
)


(defun insertionSort (a)
	(do ( (j 1 (+ j 1)))
		( (>= j (array-total-size a)) 0)
		(setq key (aref a j))
		(setq k (- j 1))
		(loop 
			(when (or (< k 0) (< (aref a k) key)) (return k))
				(setf (aref a (+ k 1)) (aref a k))
				(setq k (- k 1))	
		)
		(setf (aref a (+ k 1)) key)
	)
)

(write-line "Original Array:")
(write arr)
(terpri)

(setq arrTemp (make-array (array-total-size arr)))
(dotimes (i (array-total-size arr))
	(setf (aref arrTemp i) (aref arr i))
)

(bubbleSort arrTemp)

(terpri)
(write-line "After Bubble Sort:")
(write arrTemp)

(insertionSort arr)

(terpri)
(write-line "After Insertion Sort:")
(write arr)
