#lang racket

(require racket/format)

(define (get-value value)
  (string->number
   (string-trim
    (file->string
     (format "/sys/class/power_supply/BAT0/energy_~a" value)))))

(string->number "1")

(define (get-max) (get-value "full"))
(define (get-now) (get-value "now"))

(define (hibernate) (system "s-hibernate"))

(define (current-percantage)
  (* (/ (get-now)
        (get-max))
     100))

(define (run perc)
  (println perc)
  (if (<= perc 50)
      (hibernate)
      (begin
        (sleep 10)
        (run (current-percantage)))))

(run (current-percantage))
