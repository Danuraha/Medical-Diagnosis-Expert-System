(deffacts startup
  (start))

(defrule p1
  ?p <- (start)
  =>
  (printout t "Which type of symptoms does the patient have? [Fever, Sore_throat, cough]" crlf)
  (assert (decision (read)))
  (retract ?p))

(defrule p2
(decision Fever)
=>
(printout t "Does the patient have fever? [yes,no]" crlf)
 (assert (answer (read))))

(defrule p3
   (decision Fever)
   (answer yes)
   =>
   (printout t "Does the patient have a rash? " crlf)
   (assert (rash (read))))

(defrule rule1
    (decision Fever)
    (answer yes)
    (rash yes)
    =>
    (printout t "The patient may have the measles, rubella, or chickenpox." crlf))


(defrule rule2
    (decision Fever)
    (answer yes)
    (rash no)
    =>
    (printout t "The patient may have strep throat, influenza, or a urinary tract infection." crlf))


(defrule rule3
    (decision Fever)
    (answer no)
    =>
    (printout t "The patient may have a cold or another viral illness." crlf))
	

(defrule p4
(decision Sore_throat)
=>
(printout t "Does the patient have a sore throat? [yes,no]" crlf)
 (assert (throat (read))))

(defrule p5
   (decision Sore_throat)
   (throat yes)
   =>
   (printout t "
The patient may have strep throat, tonsillitis, or pharyngitis. " crlf)
(printout t "
The sore throat accompanied by fever/difficulty in swallowing?[fever/swallowing]
 " crlf)
   (assert ( secCondi(read))))

(defrule p6
    (decision Sore_throat)
    (secCondi fever)
    =>
    (printout t "Is the sore throat accompanied by fever?" crlf)
    (assert (sore(read))))

(defrule rule4
    (decision Sore_throat)
    (secCondi fever)
    (sore yes)
    =>
    (printout t "The patient may have strep throat or tonsillitis." crlf))

(defrule rule5
    (decision Sore_throat)
    (secCondi fever)
    (sore no)
    =>
    (printout t "The patient may have pharyngitis or a viral infection." crlf))

(defrule p7
    (decision Sore_throat)
    (secCondi swallowing)
    =>
    (printout t "Is the sore throat accompanied by difficulty swallowing?" crlf)
    (assert (swallow(read))))

(defrule rule6
    (decision Sore_throat)
    (secCondi swallowing)
    (swallow yes)
    =>
    (printout t "The patient may have tonsillitis or strep throat." crlf))

(defrule rule7
    (decision Sore_throat)
    (secCondi swallowing)
    (swallow no)
    =>
    (printout t "The patient may have pharyngitis or a viral infection." crlf))

(defrule rule8
   (decision Sore_throat)
   (throat no)
   =>
   (printout t "The patient may have a headache, stress, anxiety, or another non-throat-related condition.
" crlf))

(defrule p8
(decision cough)
=>
(printout t "Does the patient have a cough? [yes,no]" crlf)
 (assert (Cough (read))))

(defrule rule9
   (decision cough)
   (Cough yes)
   =>
   (printout t "The patient may have a cold, influenza, bronchitis, or pneumonia." crlf)
(printout t "
The cough is dry or productive/accompanied by fever?[dryOrProductive/accFever]
 " crlf)
   (assert ( option(read))))

(defrule p9
    (decision cough)
    (option dryOrProductive)
    =>
    (printout t "Is the cough dry or productive?[dry/productive]" crlf)
    (assert (ans(read))))

(defrule rule10
    (decision cough)
    (option dryOrProductive)
    (ans dry)
    =>
    (printout t "The patient may have a cold or asthma." crlf))

(defrule rule11
    (decision cough)
    (option dryOrProductive)
    (ans productive)
    =>
    (printout t "The patient may have bronchitis or pneumonia." crlf))

(defrule p10
    (decision cough)
    (option accFever)
    =>
    (printout t "Is the cough accompanied by fever?
" crlf)
    (assert (Afever(read))))

(defrule rule12
    (decision cough)
    (option accFever)
    (Afever yes)
    =>
    (printout t "The patient may have influenza or pneumonia." crlf))

(defrule rule13
    (decision cough)
    (option accFever)
    (Afever no)
    =>
    (printout t "The patient may have a cold or bronchitis." crlf))

(defrule rule14
   (decision cough)
   (Cough no)
   =>
   (printout t "The patient may have a headache, stress, anxiety, or another non-cough-related condition.
" crlf))


