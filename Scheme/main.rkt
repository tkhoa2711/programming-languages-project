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
;;			outgoing_call	;; cost per outgoing call minute;;			
;;			sms 			;; cost per SMS
;;			data 			;; cost per GB of data
;;		)
;;	)

;; Postpaid plans available
(define Singtel_3G_Flexi_Lite	#(3G_Flexi_Lite		39.90	#(FREE 100 800 2) #(0 0.1605 0.0535 5.35)))
(define Singtel_3G_Flexi_Value	#(3G_Flexi_Value	59.90	#(FREE 200 900 3) #(0 0.1605 0.0535 5.35)))
(define M1_ValueSurf			#(ValueSurf			39		#(FREE 120 600 2) #(0 0.1605 0.0535 5.35)))
(define M1_LiteSurf				#(LiteSurf			59		#(FREE 300 800 3) #(0 0.1605 0.0535 5.35)))
;(define M1_SunSaver #(SunSaver 25.68 #(FREE 100 500 0) #(0 0.1605 0.0535 5.35)))

;; A single list of all postpaid plans
(define postpaid_plans
	(list	Singtel_3G_Flexi_Value
			Singtel_3G_Flexi_Lite
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

;; Calculate cost on a particular field
(define get-cost
	(lambda (user plan get-function excess-index)
		(let ((usage (get-function user)) (standard (get-function plan)))
			(cond	
				((eq? standard 'FREE) 0)
				((> usage standard)
					(*	(- usage standard) (vector-ref (get-excess plan) excess-index)))
				(else 0)))))

;; Calculate cost for a user with a specific plan
(define calculate-cost
	(lambda (user plan)
		(let ((cost (get-plan-price plan)))
			(begin
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
				cost))))

;; Search for the best plan among service providers
(define search-best-plan
	(lambda (user postpaid_plans)
		(letrec ((search 
					(lambda (u ls)
						(if (null? ls)
							'()
							(cons (calculate-cost u (car ls)) (search u (cdr ls)))))))
			(apply min (search user postpaid_plans)))))


;; Usage pattern: #(plan price #(incoming_call outgoing_call sms data))
;; Data type:
;; 	- incoming_call 				: minute
;;	- outgoing_call					: minute
;;	- sms 							: number of SMS
;;	- data 							: GB
;;
;; Define test cases

(define user1 #(3G_Flexi_Lite 39.90 #(200 300 300 4)))
(search-best-plan user1 postpaid_plans)