(defun ListIntersection ( l1 l2 )
  (if l1
    (if (member (car l1) l2)
      (cons (car l1) (ListIntersection (cdr l1) l2))
      (ListIntersection (cdr l1) l2)
    )
  )
)

(defun ListUnion (a b)
 (if (not b)
      a
      (if (member (car b) a)
        (ListUnion a (cdr b))
        (ListUnion (append a (list (car b))) (cdr b))))
)

(defun ListDifference (a b)
	(if (member (car l1) l2)
      (cons (car l1) (ListDifference (cdr l1) l2))
      (ListIntersection (cdr l1) l2)
    )
)

(setq list1 (list 1 2 3 4 5 'a 'b 'c 'd 'e 'f 'g 'h)
       list2 (list 1 4 5 'b 'c 'd 'i 'j 'k 'g 'h)) 
       
(write-line "Intersection : ")
(write (ListIntersection list1 list2))
(write-line " ")
(write-line "Union : ")
(write (ListUnion list1 list2))
(write-line " ")
(write-line "Difference : ")
(write (set-difference list2 list1))


