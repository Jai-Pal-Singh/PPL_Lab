(setf arr (make-array '(10)
			))
(dotimes (i (array-total-size arr))
	(setf (aref arr i) i)
)

(defun swapAdj (a)
	(setq noOfTimes (floor(/ (array-total-size a) 2)))
	(do ( ( j 0 (+ j 2))
		  (counter 0 (+ counter 1)))
		  ( (= counter noOfTimes) counter)
			(setf temp (aref a j))
			(setf (aref a j) (aref a (+ j 1)) )
			(setf (aref a (+ j 1)) temp)
	)
)


(defun swap (a)
	(do ( ( j 0 (+ j 1))
		  ( k (- (array-total-size a) 1) (- k 1)))
		  ( (>= j k) 0)
			(setf temp (aref a j))
			(setf (aref a j) (aref a k) )
			(setf (aref a k) temp)
	)
)

(write-line "Original Array: ")
(write arr)
(terpri)

(setq arrTemp (make-array (array-total-size arr)))
(dotimes (i (array-total-size arr))
	(setf (aref arrTemp i) (aref arr i))
)

(swapAdj arrTemp)

(terpri)
(write-line "After swapping adjacent values")
(write arrTemp)

(swap arr)

(terpri)
(write-line "After swapping mirror values")
(write arr)

