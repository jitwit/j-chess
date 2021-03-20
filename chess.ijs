coclass 'jchess'

NB. core representation
pieces =: 'pnbrqkPNBRQK'
piecesfr =: 'pcftdrPCFTDR'
pieces_u =: u: (i.-#pieces) + 16b2654 NB. unicode, nb width screws up boxing

board0 =: (];._2) 0 : 0
rnbqkbnr
pppppppp
........
........
........
........
PPPPPPPP
RNBQKBNR
)

start =: (_6 ]\ pieces ="0 _ board0);1;1 1 1 1;8;0;1
print =: ('.',pieces) {~ +./ @: (* 1+i.@#) @: (,/)

'IP IN IB IR IQ IK' =: i. 6
coords =: 97 (,:|.)&(a.{~+&(i.8)) 49
squareix =: [: |. coords&(i."1 0)

movesto =: _2 {. -.&((6}.pieces),'+#=') NB. should be in algebraic notation section?
square =: (i. 8 8) = 8 #. squareix @: movesto

NP =: (,-) 2 0,1,.i:1 NB. pawn (both black & white)
NN =: ,/ (<:+:#:i.4) *"1/ >:=/~i.2 NB. knight
NB =: ,/ (<:+:#.^:_1 i.4) *"1/ ,~"0}.i.8 NB. bishop
NR =: (,-) (,.&0,0&,.) }. i.8 NB. rook
NQ =: NB,NR NB. queen
NK =: <: 3 #.^:_1 (i.9)-.4 NB. king
NHOOD =: NP;NN;NB;NR;NQ;NK

NB. algebraic notation
piece =: [: (* 6&~:) (6}.pieces) i. {.
maskf =: (8 8 $ i.8) = ({.coords)&i.
maskr =: (8 $"0 i.8) = ({:coords)&i.
maskc =: maskr`maskf@.(e.&'abcdefgh')

NB. have a target square, figure out which piece can get there.
maskfrom =: 3 : 0
 msk =. (i. 8 8) = 8 #. squareix d =. _2 {. z =. y -. (6}.pieces),'x+#='
 p =. piece y  NB. pawn = 0, so if. works
 if. p do. ,:~ (*/maskc _2}.z) * +./ (p{::NHOOD)|.!.0 msk
 else. (maskf {.y) *"2 (_4 +./\ NP |.!.0 msk) end.
)

NB. x = 0 or 1 means king or queen sides resp, y is position
castle =: 4 : 0
 'brd bw oo ep hm fm' =. y
 oo =. oo * (-+:<:+:bw) |.!.0 oo
 if. x do. if. bw do. 'k r' =. 'c1';'a1d1' else. 'k r' =. 'c8';'a8d8' end.
 else.     if. bw do. 'k r' =. 'g1';'f1h1' else. 'k r' =. 'g8';'f8h8' end.
 end.
 rm =. (+./ _2 square\ r) ~: (<bw,IR) { brd
 brd =. ((square k),:rm)((<bw,IK),(<bw,IR))}brd
 brd;(-.bw);oo;ep;(hm+1);(fm+-.bw)
)
castleq =: 1&castle
castlek =: 0&castle

disamb =: 3 : 0
 'brd clr to' =. y
 pcs =. +./^:2 brd
 z_t =. {.4$.$.to NB. only 1 square here
 z_s =. 4$.$.clr
 tab =. z_t -"1/~ z_s
 mag =. >./"1 | tab
 dir =. * tab
 src =. z_s #~ 1 = dir ([: +/ pcs {~ [: <"1 z_t +"1 (1+i.@]) */ [)"1 0 mag
 (i.8 8) = 8 #. {.src
)

disambe =: disamb :: {{ a: [ echo y }}

san =: 4 : 0
 NB. produces resulting position with arguments x as move in SAN, y as
 NB. position in J representation.
 if. 'O-O-O' -: 5{.x   do. 1 castle y NB. {. to avoid possible +/#
 elseif. 'O-O' -: 3{.x do. 0 castle y
 else.  'brd bw oo ep hm fm' =. y [ p =. piece x
  clr =. (bw{p{"_1 brd) * bw{maskfrom x
  to =. square x
  if. 1 < +/,clr do. clr =. disambe brd;clr;to end.
  clr =. clr + to
  to =. ,:~ (p=i.6) */ to
  brd1 =. ((bw=i.2) * to) + (-.clr) *"2 brd
  if. '=' e. x  NB. promotion  
  do. brd1=.(square x)(<bw,piece{:x-.'+#x')}(-.pr=.square x)*"2 brd1 end.
  NB. en passant
  epr =. I. +/"1 epb =. | +/ IP {"_1 diff =. brd1 - brd
  NB. castling rights
  oo =. oo * -.,_3 (2+./\])\ (_2 <@squareix\ 'h1e1a1h8e8a8') { +./^:2 | diff
  if. (-.p) *. (2=-~/epr) *. (*#epr) do. ep =. >./ I. epb else. ep =. 8 end.
  NB. half moves/full moves
  fm =. fm+-.bw [ hm =. (hm+1) * -. (-.({.x)e.pieces) +. ('x'e.x)
  brd1;(-.bw);oo;ep;hm;fm
 end.
)

NB. fen, obvi
NB. FEN helpers
rleb =: (0&{::#1&{::)`([:":0&{::)@.('.'-:1&{::)
rldb =: ]`('.'#~".)@.(e.&({:coords))
rle =: ([: < [: rleb (#;{.));.1~ 1,2 ~:/\ ]
rld =: [: ([:;<@rldb"0);._1 '/',]
efen =: [: > [: (([,'/',])&.>)/ [: <@;@rle"1 print
dfen =: (_6]\i.#pieces) =/ pieces i. rld

fen_of =: 3 : 0
 NB. fen from our representation
 'brd bw oo ep hm fm' =. y
 oo =. (0<+/oo){::'-';oo#'KQkq'
 ep =. (ep~:8){::'-';(ep{({.coords),'-'),(bw{'36')
 ;:^:_1 (efen brd);(bw{'bw');oo;ep;hm;&":fm
)

pos_of =: 3 : 0
 NB. our representation from a fen
 'brd bw oo ep hm fm' =. <;._1 ' ',y
 NB. careful that bw isn't array?
 (dfen brd);('w'={.bw);('KQkq'e.oo);({:(squareix :: 8:)ep);hm;&".fm
)

NB. fen to encode, fen^:_1 to decode
fen =: fen_of :. pos_of

NB. pgn, obvi
del_brak =: ] #~ 0 = [: (+. _1&(|.!.0)) [: +/\ (-/@:(=/))
del_com =: (-.&'?!')&.>
del_num =: #~ ('.' ~: {:)&>
pgn_clean =: {{ '()' del_brak '{}' del_brak ' ' (I. LF=y)} y }}
pgn_nonmoves =: a:,'1-0';'0-1';'1/2-1/2'
pgn_moves =: {{ del_num del_com (<;._1 ' ',pgn_clean y) -. pgn_nonmoves }}

NB. x =. x -. '?! ' NB. remove move quality commentary
game_of_pgn =: 3 : 0
 moves =. pgn_moves y
 fens =. < brd =. start
 for_move. moves do.
   fens =. fens,<brd =. (>move) san brd
 end.
)

pgn_key =: > @: {. @: (<;._1)~ '[ '&(+./ @: (=/)) NB. pgn symbol token
pgn_val =: #~ [: (~:/\ * 0&=) '"'&= NB. pgn string token
pgn_db =: <;.1~ '[Event'&E.
pgn_moves_sec =: I. @: ((LF,'1.')&E.)

ppgn =: 3 : 0
NB. remove abandoned?
 j =. {. (<:#y),~pgn_moves_sec y=.y,LF
 tagpairs =. (pgn_key;pgn_val);._2 j {. y
 movetext =. (j }. y) -. LF
 tagpairs ; movetext
)



NB. fen_z_ =: fen_jchess_
NB. print_z_ =: print_jchess_
NB. san_z_ =: san_jchess_
NB. start_z_ =: start_jchess_
