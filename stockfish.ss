;; interact with stockfish subprocess
(define sf-out
  (make-parameter (void)))
(define sf-in
  (make-parameter (void)))
(define sf-pid
  (make-parameter (void)))
(define sf-alive?
  (make-parameter #f))

(define (stockfish-command command)
  (display command (sf-in))
  (newline (sf-in)))

(define (spawn-stockfish)
  (unless (sf-alive?)
    (match (process "stockfish")
      ((out in pid)
       (sf-out out)
       (sf-in in)
       (sf-pid pid)
       (sf-alive? #t)
       'ok))))

(define (uci-stockfish)
  (stockfish-command "uci"))

(define (start-stockfish)
  (spawn-stockfish)
  (uci-stockfish))

(define (stockfish-output)
  (get-string-some (sf-out)))

(define (close-stockfish)
  (when (sf-alive?)
    (stockfish-command "quit")
    (let ((out (get-string-all (sf-out))))
      (close-input-port (sf-out))
      (close-output-port (sf-in))
      (sf-in (void))
      (sf-out (void))
      (sf-pid (void))
      (sf-alive? #f)
      out)))

(define (analyze-position fen time/depth)
  (assert (sf-alive?))
  (stockfish-command (format #f "position fen ~a" fen))
  (if (time? time/depth)
      (stockfish-command (format #f "go movetime ~a"
				 (floor
				  (+ (* 1e3 (time-second time/depth))
				     (/ (time-second time/depth) 1e6)))))
      (stockfish-command (format #f "go depth ~a" time/depth)))
  (let lp ((prev '()))
    (let ((x (get-line (sf-out))))
      (assert (not (eof-object? x)))
      (let ((result (parse-uci-line (with-input-from-string x uci-tokens))))
	(if (and (pair? result) (eq? 'bestmove (car result)))
	    ; (begin (display result) (newline))
	    prev
	    (lp result))))))

(define (score-position fen)
  (define result
    ;; (analyze-position fen 18)
    (analyze-position fen (make-time 'time-duration 0 1)))
  (assert (and (pair? result) (eq? 'info (car result))))
  (assq 'score (cdr result)))
