;; info messages
;;  depth <x>
;;  seldepth <x>
;;  time <x>
;;  nodes <x>
;;  pv <x1> ... <xi>, i = multipv
;;  multipv <x>
;;  score
;;   cp <x>
;;   mate <x>
;;   lowerbound
;;   upperbound
;;  currmove <x>
;;  currmovenumber <x>
;;  hashfull <x>
;;  nps <x>
;;  tbhits <x>
;;  sbhits <x>
;;  cpuload <x>
;;  string <str>
;;  refutation <move1> <move2> ... <movei>
;;  currline <cpunr> <move1> ... <movei>

(define score-keywords
  '(cp mate lowerbound upperbound))

(define info-keywords
  '(depth
    seldepth
    time
    nodes
    pv
    multipv
    score
    currmove
    currmovenumber
    hashfull
    nps
    tbhits
    sbhits
    cpuload
    string
    refutation
    currline))

(define compound-info-keywords
  '(score string refutation pv currline))

(define (simple-info-keyword? keyword)
  (and (memq keyword info-keywords)
       (not (memq keyword compound-info-keywords))))

(define (uci-tokens)
  (let lp ((xs '()))
    (let ((x (read)))
      (if (eof-object? x)
	  (reverse xs)
	  (lp `(,x ,@xs))))))

(define (bound-tag? tag)
  (memq tag '(lowerbound upperbound)))

(define (parse-score tokens)
  (match tokens
    ((tag value tokens ...)
     (let ((score `((,tag . ,value))))
       (match tokens
	 (((? bound-tag? extra-tag) tokens ...)
	  (values `((bound? . ,extra-tag) ,@score) tokens))
	 (_ (values score tokens)))))))

(define (parse-info tokens)
  (let lp ((info '()) (tokens tokens))
    (match tokens
      (((? simple-info-keyword? k) d tokens ...)
       (lp `((,k . ,d) ,@info) tokens))
      (('score tokens ...)
       (let-values (((score tokens) (parse-score tokens)))
	 (lp `((score . ,score) ,@info) tokens)))
      (('pv moves ...) ;; maybe should double check no more keywords?
       (reverse `((pv . ,moves) ,@info)))
      (('string tokens ...)
       (reverse `((string . ,tokens) ,@info)))
      (() (reverse info))
      (_ `(failure (info . ,info)
		   (tokens . ,tokens))))))

(define (parse-uci-line tokens)
  (match tokens
    (('info tokens ...)
     `(info . ,(parse-info tokens)))
    (('bestmove move 'ponder ponder)
     `(bestmove (move . ,move) (ponder . ,ponder)))
    (('bestmove move)
     `(bestmove (move . ,move)))
    (_ tokens)))
