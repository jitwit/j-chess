load 'stats/bonsai'
NB. represent board.
NB. bit grids for: pawn, knight, bishop, rook, queen, king for each side
NB. castling rights 4 bits
NB. en passant (given whose turn it is, file is sufficient info...)
NB. half move clock (moves since capture or pawn advance)
NB. full move clock (increments after black goes)

boarde =: 8 8 $ '.' NB. empty board
board0 =: (];._2) 0 : 0 NB. start position
rnbqkbnr
pppppppp
........
........
........
........
PPPPPPPP
RNBQKBNR
)

pieces =: 'pnbrqkPNBRQK' NB. ascii representation for pieces
pieces_u =: u: (i.-#pieces) + 16b2654

NB. starting position
NB. black 0, 1 white, corresponding to indices in rep.
NB. en passant is just file, 8 means no en passant opportunity
start =: (_6 ]\ pieces ="0 _ board0);1;1 1 1 1;8;0;1
'IP IN IB IR IQ IK' =: i. 6 NB. indices into board representation

NB. neighborhoods for moves
NP =: (,-) 2 0,1,.i:1 NB. (both black & white)
NN =: ,/ (<:+:#:i.4) *"1/ >:=/~i.2 NB. knight
NB =: ,/ (<:+:#.^:_1 i.4) *"1/ ,~"0}.i.8 NB. bishop
NR =: (,-) (,.&0,0&,.) }. i.8 NB. rook
NQ =: NB,NR NB. queen
NK =: <: 3 #.^:_1 (i.9)-.4 NB. king

NHOOD =: NP;NN;NB;NR;NQ;NK

coords =: 97 (,:|.)&(a.{~+&(i.8)) 49
square =: [: |. coords&(i."1 0)

NB. careful with +. or + ...
print =: ('.',pieces) {~ +./ @: (* 1+i.@#) @: (,/)
rleb =: (0&{::#1&{::)`([:":0&{::)@.('.'-:1&{::)
rldb =: ]`('.'#~".)@.(e.&({:coords))
rle =: ([: < [: rleb (#;{.));.1~ 1,2 ~:/\ ]
rld =: [: ([:;<@rldb"0);._1 '/',]
efen =: [: > [: (([,'/',])&.>)/ [: <@;@rle"1 print
dfen =: (_6]\i.#pieces) =/ pieces i. rld

fen_of =: 3 : 0
 'brd bw oo ep hm fm' =. y
 oo =. (0<+/oo){::'-';oo#'KQkq'
 ep =. (ep~:8){::'-';(ep{({.coords),'-'),(bw{'36')
 ;:^:_1 (efen brd);(bw{'bw');oo;ep;hm;&":fm
)

pos_of =: 3 : 0
 'brd bw oo ep hm fm' =. <;._1 ' ',y
 (dfen brd);(bw='w');('KQkq'e.oo);({:(square :: 8:)ep);hm;&".fm
)

fen =: fen_of :. pos_of

pgn0 =: 0 : 0
1. e4 d6 2. f4 Nf6 3. Nf3 Nxe4 4. Bc4 e6 5. O-O g6 6. d3 Nc5 7. a3 Bg7 8. c3 a6 9. d4 Ne4 10. Nbd2 Nxd2 11. Bxd2 O-O 12. Ng5 b5 13. Ba2 Nc6 14. Qf3 Bb7 15. Qh3 h6 16. Nf3 e5 17. fxe5 dxe5 18. Bxh6 exd4 19. Bxg7 Kxg7 20. Nxd4 Nxd4 21. cxd4 Qxd4+ 22. Kh1 Qxb2 23. Qd7 Qxg2# 0-1
)

NB. have a target square, figure out which piece could have gone there.
NB. if pawn then none of NBRQK is present.
NB. promotion something back rank = Q (say), ie, e8=Q
NB. check is + checkmate is #

NB. k moves (nb includes o-o and o-o-o)  => no castle rights
NB. rook moves, that side loses rights (a => -q, h => -k)

NB. have target square, reverse engineer piece from neighborhood
NB. works for everything except pawns.

,. (#~ [: * 3 | i.@#) <;._1 ' ',pgn0

NB. algebraic notation, roughly
NB. piece = N | B | R | Q | K
NB. file = a | b | c | d | e | f | g | h
NB. rank = 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8
NB. capture = x
NB. kingattack = check | checkmate
NB. square = file rank
NB. promotion = square '=' piece
NB. move = (piece? file? rank? capture? square kingattack?) | promotion

piece =: [: (* 6&~:) (6}.pieces) i. {.
movesto =: _2 {. -.&'+#'
maskto =: (i. 8 8) = 8 #. square @: movesto
masknill =: 0 * maskfull =: 8 8$1
maskf =: (8 8 $ i.8) = ({.coords)&i.
maskr =: (8 $"0 i.8) = ({:coords)&i.
maskc =: maskr`maskf@.(e.&'abcdefgh')

maskfrom =: 3 : 0
NB. where did the piece possibly come from?
 msk =. (i. 8 8) = 8 #. square d =. _2 {. z =. y -. pieces,'x+#='
 p =. piece y  NB. pawn = 0, so if. works
 if. p do. ,:~ (*/maskc _2}.z) * +./ (p{::NHOOD)|.!.0 msk
 else.     (maskf {.y) *"2 (_4 +./\ NP |.!.0 msk) end.
)

castleq =: 3 : 0
 'brd bw oo ep hm fm' =. y
 if. bw do.
  rm =. (+./ _2 maskto\ 'a1d1') ~: (<bw,IR) { brd
  brd =. ((maskto'c1'),:rm)((<bw,IK),(<bw,IR))}brd
  oo =. 0 0 1 1 * oo
 else.
  rm =. (+./ _2 maskto\ 'a8d8') ~: (<bw,IR) { brd
  brd =. ((maskto'c8'),:rm)((<bw,IK),(<bw,IR))}brd
  oo =. 1 1 0 0 * oo
 end.
 brd;(-.bw);oo;ep;(hm+1);(fm+-.bw)
)

castlek =: 3 : 0
 'brd bw oo ep hm fm' =. y
 if. bw do.
  rk =. (+./ _2 maskto\ 'h1f1') ~: (<bw,IR) { brd
  brd =. ((maskto'g1'),:rk)((<bw,IK),(<bw,IR))}brd
  oo =. 0 0 1 1 * oo
 else.
  rk =. (+./ _2 maskto\ 'h8f8') ~: (<bw,IR) { brd
  brd =. ((maskto'g8'),:rk)((<bw,IK),(<bw,IR))}brd
  oo =. 1 1 0 0 * oo
 end.
 brd;(-.bw);oo;ep;(hm+1);(fm+-.bw)
)

NB. need to do promotion, castling rights outside of castling
san =: 4 : 0
 if. x -: 'O-O'       do. castlek y
 elseif. x -: 'O-O-O' do. castleq y
 else.  'brd bw oo ep hm fm' =. y [ p =. piece x
  NB. need to make sure it's most forward pawn by scanning in
  NB. different directions for each color. (> and \. for black, < and
  NB. \ for white)
  if. bw do. clr =. (</\ @: (+./\)) (+./ p {"_1 brd) * bw { maskfrom x
  else. clr =. (>/\. @: (+./\.)) (+./ p {"_1 brd) * bw { maskfrom x end.
  clr =. clr + to =. maskto x
  to =. ,:~ (p=i.6) */ to
  brd1 =. ((bw=i.2) * to) + (-.clr) *"2 brd
  NB. for en passant
  epr =. I. +/"1 epb =. | +/ IP {"_1 brd1 - brd
  if. (-.p) *. (2=-~/epr) *. (*#epr) do. ep =. >./ I. epb else. ep =. 8 end.
  NB. half moves/full moves
  fm =. fm+-.bw [ hm =. (hm+1) * -. (-.({.x)e.pieces) +. ('x'e.x)
  brd1;(-.bw);oo;ep;hm;fm
 end.
)

fen start
fen 'e4' san start
fen 'd5' san 'e4' san start
fen 'exd5' san 'd5' san 'e4' san start

fen start
fen 'e4' san start
fen 'c5' san 'e4' san start
fen 'Nf3' san 'c5' san 'e4' san start
