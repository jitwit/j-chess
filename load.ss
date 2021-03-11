(import (matchable)
	(chezscheme))

(load "uci.ss")
(load "stockfish.ss")

(define (get-lines)
  (define in (current-input-port))
  (let lp ((lines '()))
    (let ((line (get-line in)))
      (if (eof-object? line)
	  (reverse lines)
	  (lp `(,line ,@lines))))))

(define eg-info-0
  "info depth 23 seldepth 34 multipv 1 score cp 523 nodes 4297327 nps 859293 hashfull 980 tbhits 0 time 5001 pv c3d5 c6d5 g2g3 h7h6 c2c3 d8e7 b2b3 a6a5 f3d3 c5a3 d3d5 a5a4 b3b4 a3c3 b4b5 e7c5 d5a8 c5f8 g1g2 c3c2")

(define eg-info-1
  "info depth 20 seldepth 27 multipv 3 score cp 466 upperbound nodes 3311732 nps 661949 hashfull 853 tbhits 0 time 5003 pv g2g3 d5c3")

(define eg-info-2
  "info depth 18 currmove f3h5 currmovenumber 28")

(define eg-info-3
  "info string NNUE evaluation using nn-82215d0fd0df.nnue enabled")

(define eg-info-4
  "info depth 22 seldepth 33 multipv 1 score cp 499 upperbound nodes 3609794 nps 880008 hashfull 952 tbhits 0 time 4102 pv c3d5 c6d5")

(define eg-fen
  "6k1/4b1p1/7p/4P3/q4P2/2BQ2P1/PP5P/6K1 w - - 3 30")

(define (main)
  (define fens
    (with-input-from-file "blitz.txt" get-lines))
  (start-stockfish)
  (for-each (lambda (fen)
	      (display fen) (newline)
	      (display (score-position fen))
	      (newline))
	    fens)
  ;; (analyze-position eg-fen 18)
  )
