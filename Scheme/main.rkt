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
(define postpaid_plan 
	'(
		(Singtel 
			#(3G_Flexi_Lite 39.90 #(FREE 100 800 2) #(0 0.1605 2 0.0535 5.35))
			#(3G_Flexi_Value 59.90 #(FREE 200 900 3) #(0 0.1605 2 0.0535 5.35))
			#(One_Plus #(-1 1200 400 2)))
		(M1
			#(ValueSurf+ ())
			#(LiteSurf+ ()))
	)
)

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
	(lambda(user plan)
		(let ((cost (get-plan-price plan)))
			(begin 
				((if (> (get-incoming-call user) (get-incoming-call plan))
					(+ cost 
						(* (- (get-incoming-call user) (get-incoming-call plan))
								(get-incoming-call (get-excess plan))))))
				))))

(define (search-best-plan user postpaid_plan))


;; Usage pattern: #(vendor plan #(incoming_call outgoing_call sms data))
;; Data type:
;; 	- incoming_call 				: minute
;;	- outgoing_call					: minute
;;	- sms 							: number of SMS
;;	- data 							: GB
;;
;; Define 3 test cases

(define user1 #(Singtel 3G_Flexi_Lite #(200 300 300 4)))
(searchBestPlan user1 postpaid_plan)