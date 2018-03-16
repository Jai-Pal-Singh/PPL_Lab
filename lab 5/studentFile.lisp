;JAI PAL SINGH
;2015KUCP1038
;Program to create a file for student record and perform operation on that file such as insert record, delete record, modify record and display the record by its primary key.

(defstruct student
   rollNo
   firstName  
   lastName 
   nameOfFather
   nameOfMother  
   gender	
   dob
   yearOfAdmission
   Class
   contactNo    
   address
)

(defun display ()
	(format t "Enter the Roll No. of the student whose details you want : ")
	(setf rNo (read-line))
	(setf found 0)
	(with-open-file (stream "output.txt" :direction :input :if-does-not-exist nil)
		(when stream
			(do ((st (read stream nil 'eof) (read stream nil 'eof)))
				((eql st 'eof) 0)
				
				(when (string= (student-rollNo st) rNo)
					(setf found 1)
					(write st)
					(terpri)
				)
			)
		)
	)
	(when (= found 0)
		(format t "The entered Roll No. does not exist ~%")
	)
)

(defun insert ()
	(format t "Enter the number of records you want to insert : ")
	(setf noOfRecords (read))
	(setf studentArray (make-array 100 :fill-pointer 0))
	(dotimes (i noOfRecords)
		(format t "Enter the Roll No of the student ~d: " (+ i 1))
		(setf rNo (read-line))	
		(format t "Enter the First Name of the student ~d: " (+ i 1))
		(setf fname (read-line))		
		(format t "Enter the Last Name of the student ~d: " (+ i 1))
		(setf lname (read-line))
		(format t "Enter the Father's Name of the student ~d: " (+ i 1))
		(setf fatherName (read-line))		
		(format t "Enter the Mother's Name of the student ~d: " (+ i 1))
		(setf motherName (read-line))	
		(format t "Enter the Gender of the student ~d: "(+ i 1))
		(setf gen (read-line))	
		(format t "Enter the Date Of Birth of the student ~d: " (+ i 1))
		(setf dob (read-line))
		(format t "Enter the Year Of Admission of the student ~d: " (+ i 1))
		(setf YOA (read-line))
		(format t "Enter the Class of the student ~d: " (+ i 1))
		(setf Class (read-line))
		(format t "Enter the Address of the student ~d: " (+ i 1))
		(setf address (read-line))		
		(format t "Enter the Contact No. of the student ~d: " (+ i 1))
		(setf pNo (read-line))
		
		( setq student1 (make-student 
			:rollNo rNO
			:firstName fname 
			:lastName lname 
			:gender gen
			:dob dob
			:Class Class
			:yearOfAdmission YOA
			:address address
			:contactNo pNo
			:nameOfFather fatherName
			:nameOfMother motherName)
		)	
		(vector-push student1 studentArray)
		(terpri)
	)
	
	(with-open-file (stream "output.txt" :direction :output :if-exists :append :if-does-not-exist :create)
		(dotimes (k (length studentArray))
			(print (aref studentArray k) stream)
		)
	)	
	;(write-line "Inserted the data into the file")
)

(defun modify() 
	(format t "Enter the Roll No. of the student whose record you want to modify: ")
	(setf rNo (read-line))	
	(setf found 0)
	(with-open-file (out "temp.txt" :direction :output :if-exists :supersede)
		(with-open-file (stream "output.txt" :direction :input :if-does-not-exist nil)
			(when stream
				(do ((st (read stream nil 'eof) (read stream nil 'eof)))
					((eql st 'eof) 0)
						(when (string= (student-rollNo st) rNo)
							(setf found 1)			
							(write-line "1. Modify First Name")
							(write-line "2. Modify Last Name")
							(write-line "3. Father's Name.")
							(write-line "4. Mother's Name")
							(write-line "5. Gender")
							(write-line "6. Dob")
							(write-line "7. Year Of Admission")
							(write-line "8. Class")
							(write-line "9. Address")
							(write-line "10. Contact No.")
							(format t "What do you want to modify: ")
							(setf ch (read))
							
							(format t "Enter the new value for ")
							(case ch
								(1 (format t "First Name: ") (setf (student-firstName st) (read-line) ) )
								(2 (format t "Last Name: ") (setf (student-lastName st) (read-line) ) )
								(3 (format t "Father's Name: ") (setf (student-nameOfFather st) (read-line) ) )
								(4 (format t "Mother's Name: ") (setf (student-nameOfMother st) (read-line) ) )
								(5 (format t "Gender: ") (setf (student-gender st) (read-line) ) )
								(6 (format t "Dob: ") (setf (student-dob st) (read-line) ) )
								(7 (format t "Year Of Admission: ") (setf (student-yearOfAdmission st) (read-line) ) )
								(8 (format t "Class: ") (setf (student-class st) (read-line) ) )
								(9 (format t "Address: ") (setf (student-address st) (read-line) ) )
								(10 (format t "Contact No.: ") (setf (student-contactNo st) (read-line) ) )								
							)					
							(print st out)		
						)
						(when (string/= (student-rollNo st) rNo)
							(print st out)
						)	
				)
			)
		)
	)
	(when (= found 0)
		(format t "The requested Roll No. does not exist ~%")
	)
	(when (= found 1)
		(format t "The record was modified~%")
	)
	(setq p (probe-file "output.txt"))
	(delete-file p)
	(rename-file "temp.txt" "output.txt")		
)

(defun removeRecord() 
	(format t "Enter the Roll No. of the student whose record you want to delete: ")
	(setf rNo (read-line))	
	(setf found 0)
	(with-open-file (out "temp.txt" :direction :output :if-exists :supersede)
		(with-open-file (stream "output.txt" :direction :input :if-does-not-exist nil)
			(when stream
				(do ((st (read stream nil 'eof) (read stream nil 'eof)))
					((eql st 'eof) 0)
						(if (string= (student-rollNo st) rNo)
							(setf found 1)
							(print st out)
						)	
				)
			)
		)
	)
	(when (= found 0)
		(format t "The requested Roll No. does not exist ~%")
		
	)
	(when (= found 1)
		(format t "The record was deleted~%")
	)
	(setq p (probe-file "output.txt"))
	(delete-file p)
	(rename-file "temp.txt" "output.txt")	
)

(setf conti "Y")

(do ((n 0 (+ n 1) ))
	((string-equal conti "N") 0)

	(write-line "Enter 1 to display a record")
	(write-line "Enter 2 to insert a record")
	(write-line "Enter 3 to modify a record")
	(write-line "Enter 4 to delete a record")
	(write-line "Enter 5 to exit")
	(format t "Enter your choice: ")
	(setf choice (read))

	(case choice
		(1 (display))
		(2 (insert))
		(3 (modify))
		(4 (removeRecord))
		(5 (return 0) )
	)
	
	(format t "~%Do you want to continue(y/n): ")
	(setf conti (read-line))
	(terpri)
)
