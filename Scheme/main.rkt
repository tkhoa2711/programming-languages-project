;; Data structure of a postpaid plan: 	
;;	(	
;;		plan_name			;; name
;;		price 				;; cost in SGD
;;		(
;;			;; standard usage			
;;			incoming_call	;; minute of incoming call
;;			outgoing_call 	;; minute of outgoing call
;;			sms 			;; number of SMSs
;;			data 			;; GB of data
;;		)
;;		(
;;			;; excess amount
;;			incoming_call	;; cost per incoming call minute
;;			outgoing_call	;; cost per outgoing call minute
;;			sms 			;; cost per SMS
;;			data 			;; cost per GB of data
;;		)
;;	)


;; Postpaid plans available
(define Singtel_3G_Flexi_Lite		#(3G_Flexi_Lite		39.90	#(FREE 100 800 2) #(0 0.1605 0.0535 5.35)))
(define Singtel_3G_Flexi_Value		#(3G_Flexi_Value	59.90	#(FREE 200 900 3) #(0 0.1605 0.0535 5.35)))
(define Singtel_3G_Flexi_Plus		#(3G_Flexi_Plus		99.90	#(FREE 500 1000 4) #(0 0.1605 0.0535 5.35)))
(define Singtel_3G_Flexi_Premium	#(3G_Flexi_Premium	205.00	#(FREE 2000 2500 12) #(0 0.1605 0.0535 5.35)))
(define M1_ValueSurf				#(ValueSurf			39		#(FREE 120 600 2) #(0 0.1605 0.0535 5.35)))
(define M1_LiteSurf					#(LiteSurf			59		#(FREE 300 800 3) #(0 0.1605 0.0535 5.35)))

;; A single list of all postpaid plans
(define postpaid-plans
	(list	Singtel_3G_Flexi_Value
			Singtel_3G_Flexi_Lite
			Singtel_3G_Flexi_Plus
			Singtel_3G_Flexi_Premium
			M1_ValueSurf
			M1_LiteSurf))

;; All the helper functions for later use
(define (get-plan-name plan)
	(vector-ref plan 0))

(define (get-plan-price plan)
	(vector-ref plan 1))

(define (get-usage plan)
	(vector-ref plan 2))

(define (get-excess plan)
	(vector-ref plan 3))

(define (get-incoming-call plan)
	(vector-ref (get-usage plan) 0))

(define (get-outgoing-call plan)
	(vector-ref (get-usage plan) 1))

(define (get-sms plan)
	(vector-ref (get-usage plan) 2))

(define (get-data plan)
	(vector-ref (get-usage plan) 3))

;; Calculate cost of a particular field i.e incoming-call/outgoing-call/sms/data
(define get-cost
	(lambda (user plan get-function excess-index)
		(let ((usage (get-function user)) (standard (get-function plan)))
			(cond	
				((eq? standard 'FREE) 0)
				((> usage standard) (*	(- usage standard) (vector-ref (get-excess plan) excess-index)))
				(else 0)))))

;; Calculate cost for a user with a specific plan
(define calculate-cost
	(lambda (user plan)
		(let ((cost (get-plan-price plan)))
			(display "-------------") (newline)
			(set! cost
				(+	cost
					(+	(get-cost user plan get-incoming-call 0))
						(+	(get-cost user plan get-outgoing-call 1))
							(+	(get-cost user plan get-sms 2))
								(+	(get-cost user plan get-data 3))))				
			(display (get-plan-name plan)) (display ": ")
			(display cost) (newline)
			(display "-------------") (newline)
			cost)))

;; Search for the best plan among service providers
(define sort-plans
	(lambda (user plans)
		(letrec ((search 
					(lambda (u pl)
						(if (null? pl) '()
							(cons (calculate-cost u (car pl)) (search u (cdr pl)))))))
			(sort (search user plans) <))))

;; Return a list containing vectors with name and cost for a specific user pattern of all the postpaid plans.
(define ppp-list
	(lambda (user plans)
		(if	(null? plans) '()
			(cons	(vector (get-plan-name plan) (calculate-cost user (car plans)))
					(ppp-list user (cdr plans))))))

;; Prints out the names and prices of the two cheapest postpaid plans
(define find-two-cheapest-plans
	(lambda (user plans)
		(let ((plans (sort (ppp-list user plans) (lambda (x y) (< (vector-ref x 1) (vector-ref y 1))))))		
			(display "The two best plans: ")
			(newline)
			(display (vector-ref (car plans) 0))
			(display ": ")
			(display (vector-ref (car plans) 1))
			(display " SGD")
			(newline)
			(display (vector-ref (cadr plans) 0))
			(display ": ")
			(display (vector-ref (cadr plans) 1))
			(display " SGD")
			(newline) (newline))))


;; Usage pattern: #(current-plan current-cost #(incoming_call outgoing_call sms data))
;; Data type:
;; 	- incoming_call 				: minute
;;	- outgoing_call					: minute
;;	- sms 							: number of SMS
;;	- data 							: GB


;; Define test cases
(define user1 #(NONE 0 #(200 300 300 4)))
(define user2 #(NONE 0 #(100 3000 300 4)))
(define user3 #(NONE 0 #(100 500 1000 40)))

;; Find best plan for user1
(let ((a (sort-plans user1 postpaid-plans)))
	(display "The list of available price in ascending order: ")
	(display a)
	(newline))

;; Find 2 cheapest plans for 3 users
(find-two-cheapest-plans user1 postpaid-plans)
(find-two-cheapest-plans user2 postpaid-plans)
(find-two-cheapest-plans user3 postpaid-plans)