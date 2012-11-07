;; -1 	: denotes unlimited
;; 0 	: denotes none
(define FREE 99999999999)

;;
;; Data structure of a plan: 	
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
;;			call 			;; cost per incoming call minute
;;			call 			;; cost per outgoing call minute;;			
;;			sms 			;; cost per SMS
;;			data 			;; cost per GB of data
;;		)
;;	)
;;
;; Postpaid plans by the telcos

(define Singtel_3G_Flexi_Lite	#(3G_Flexi_Lite 39.90 #(FREE 100 800 2) #(0 0.1605 0.0535 5.35)))
(define Singtel_3G_Flexi_Value	#(3G_Flexi_Value 59.90 #(FREE 200 900 3) #(0 0.1605 0.0535 5.35)))
(define M1_ValueSurf #())

(define postpaid_plans
	(list	Singtel_3G_Flexi_Value
			Singtel_3G_Flexi_Lite))
	
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

(define calculate-cost
	(lambda (user plan)
		(let ((cost (get-plan-price plan)))
			(begin
				(display "-------------") (newline)
				(cond 	((eq? (get-incoming-call plan) 'FREE) (display "No excess incoming call\n"))
						((> (get-incoming-call user) (get-incoming-call plan))
							(set! cost 
								(+ 	cost 
									(* 	(- (get-incoming-call user) (get-incoming-call plan))
										(vector-ref (get-excess plan) 0)))))
						(else (display "No excess incoming call\n")))
				(cond 	((eq? (get-outgoing-call plan) 'FREE) (display "No excess outgoing call\n"))
						((> (get-outgoing-call user) (get-outgoing-call plan))
							(set! cost 
								(+ cost 
									(* 	(- (get-outgoing-call user) (get-outgoing-call plan))
										(vector-ref (get-excess plan) 1)))))
						(else (display "No excess outgoing call\n")))				
				(cond 	((eq? (get-sms plan) 'FREE) (display "No excess SMS usage\n"))	
						((> (get-sms user) (get-sms plan))
							(set! cost 
								(+ 	cost 
									(* 	(- (get-sms user) (get-sms plan))
										(vector-ref (get-excess plan) 2)))))
						(else (display "No excess SMSs usage\n")))
				(cond 	((eq? (get-data plan) 'FREE) (display "No excess data usage\n"))	
						((> (get-data user) (get-data plan))
							(set! cost
								(+ 	cost 
									(* 	(- (get-data user) (get-data plan))
										(vector-ref (get-excess plan) 3)))))
						(else (display "No excess data usage\n")))
				(display (vector-ref plan 0)) (display ": ")
				(display cost) (newline)
				(display "-------------") (newline)
				cost))))

(define search-best-plan
	(lambda (user postpaid_plans)
		(letrec ((search 
					(lambda (u ls)
						(if (null? ls)
							'()
							(cons (calculate-cost u (car ls)) (search u (cdr ls)))))))
			(apply min (search user postpaid_plans)))))


;; Usage pattern: #(vendor plan #(incoming_call outgoing_call sms data))
;; Data type:
;; 	- incoming_call 				: minute
;;	- outgoing_call					: minute
;;	- sms 							: number of SMS
;;	- data 							: GB
;;
;; Define 3 test cases

(define user1 #(3G_Flexi_Lite 39.90 #(200 300 300 4)))
;;(calculate-cost user1 Singtel_3G_Flexi_Lite)
(search-best-plan user1 postpaid_plans)