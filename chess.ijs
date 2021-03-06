NB. represent board
NB. grids for: pawn, knight, bishop, rook, queen, king for each side
NB. black/white by 0/1, corresponding item indices in piece brick
NB. castling rights 4 bits corresponding to KQkq in fen
NB. en passant (given color, file gives sufficient info...) 8 means no capture
NB. half move clock (moves since capture or pawn advance)
NB. full move clock (increments after black goes)
pieces =: 'pnbrqkPNBRQK' NB. ascii representation for pieces
piecesfr =: 'pcftdrPCFTDR'
pieces_u =: u: (i.-#pieces) + 16b2654 NB. unicode, nb width screws up boxing
board0 =: (];._2) 0 : 0 NB. starting board
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
'IP IN IB IR IQ IK' =: i. 6 NB. indices into board representation
coords =: 97 (,:|.)&(a.{~+&(i.8)) 49
square =: [: |. coords&(i."1 0)

NB. neighborhoods/piece movement
NP =: (,-) 2 0,1,.i:1 NB. pawn (both black & white)
NN =: ,/ (<:+:#:i.4) *"1/ >:=/~i.2 NB. knight
NB =: ,/ (<:+:#.^:_1 i.4) *"1/ ,~"0}.i.8 NB. bishop
NR =: (,-) (,.&0,0&,.) }. i.8 NB. rook
NQ =: NB,NR NB. queen
NK =: <: 3 #.^:_1 (i.9)-.4 NB. king
NHOOD =: NP;NN;NB;NR;NQ;NK


NB. FEN encoding & decoding
NB. (!) careful using +. or + ... and not validating input
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
 NB. careful that bw isn't array?
 (dfen brd);('w'={.bw);('KQkq'e.oo);({:(square :: 8:)ep);hm;&".fm
)

fen =: fen_of :. pos_of

NB. algebraic notation
NB. roughly:
NB. piece = N | B | R | Q | K
NB. file = a | b | c | d | e | f | g | h
NB. rank = 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8
NB. capture = x
NB. check = +
NB. checkmate = #
NB. kingattack = check | checkmate
NB. square = file rank
NB. promotion = '='
NB. castle = (O-O | O-O-O) kingattack?
NB. move = (piece? file? rank? capture? square (promotion piece)? kingattack?)
NB.      | castle

piece =: [: (* 6&~:) (6}.pieces) i. {.
movesto =: _2 {. -.&((6}.pieces),'+#=')
maskto =: (i. 8 8) = 8 #. square @: movesto
maskf =: (8 8 $ i.8) = ({.coords)&i.
maskr =: (8 $"0 i.8) = ({:coords)&i.
maskc =: maskr`maskf@.(e.&'abcdefgh')

NB. have a target square, figure out which piece can get there.
maskfrom =: 3 : 0
 NB. where can the piece come from when going to move y?
 NB. 6}.pieces because b is bishop and file...
 msk =. (i. 8 8) = 8 #. square d =. _2 {. z =. y -. (6}.pieces),'x+#='
 p =. piece y  NB. pawn = 0, so if. works
 if. p do. ,:~ (*/maskc _2}.z) * +./ (p{::NHOOD)|.!.0 msk
 else. (maskf {.y) *"2 (_4 +./\ NP |.!.0 msk) end.
 
)
castleq =: 3 : 0
 'brd bw oo ep hm fm' =. y
 oo =. oo * (-+:<:+:bw) |.!.0 oo
 if. bw do. 'k r' =. 'c1';'a1d1' else. 'k r' =. 'c8';'a8d8' end.
 rm =. (+./ _2 maskto\ r) ~: (<bw,IR) { brd
 brd =. ((maskto k),:rm)((<bw,IK),(<bw,IR))}brd
 brd;(-.bw);oo;ep;(hm+1);(fm+-.bw)
)
castlek =: 3 : 0
 'brd bw oo ep hm fm' =. y
 oo =. oo * (-+:<:+:bw) |.!.0 oo
 if. bw do. 'k r' =. 'g1';'f1h1' else. 'k r' =. 'g8';'f8h8' end.
 rm =. (+./ _2 maskto\ r) ~: (<bw,IR) { brd
 brd =. ((maskto k),:rm)((<bw,IK),(<bw,IR))}brd
 brd;(-.bw);oo;ep;(hm+1);(fm+-.bw)
)

NB. take board, masks, figure out which piece it really must be.
NB. issues include pieces in way, pieces one in front of other.
NB. should mostly be issue with rooks, but can happen from promotions
NB. as well. pawn issues are handled by scans, though maybe that
NB. should move here as well. this issue can't happen with knights
NB. because they hop.
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

san =: 4 : 0
 NB. produces resulting position with arguments x as move in SAN, y as
 NB. position in J representation.
 if. 'O-O-O' -: 5{.x   do. castleq y NB. {. to avoid possible +/#
 elseif. 'O-O' -: 3{.x do. castlek y
 else.  'brd bw oo ep hm fm' =. y [ p =. piece x
  NB. make sure it's most forward pawn by scanning in different
  NB. directions for each color. (\ for white, \. for black (needs to
  NB. work under |. because base case is 1 which leads to alternating
  NB. pattern otherwise)
  if. bw do. clr =. (</\@:(+./\))^:(0=p) (bw{p{"_1 brd) * bw{maskfrom x
  else. clr =. ((</\&.:|.)@:(+./\.))^:(0=p) (bw{p{"_1 brd) * bw{maskfrom x end.
  to =. maskto x
NB.  echo (p{"_1 brd) ; bw { maskfrom x
  if. 1 < +/,clr do. clr =. disamb brd;clr;to end.
  clr =. clr + to
  to =. ,:~ (p=i.6) */ to
  brd1 =. ((bw=i.2) * to) + (-.clr) *"2 brd
  if. '=' e. x  NB. promotion  
  do. brd1=.(maskto x)(<bw,piece{:x-.'+#x')}(-.pr=.maskto x)*"2 brd1 end.
  NB. en passant
  epr =. I. +/"1 epb =. | +/ IP {"_1 diff =. brd1 - brd
  NB. castling rights
  oo =. oo * -.,_3 (2+./\])\ (_2 <@square\ 'h1e1a1h8e8a8') { +./^:2 | diff
  if. (-.p) *. (2=-~/epr) *. (*#epr) do. ep =. >./ I. epb else. ep =. 8 end.
  NB. half moves/full moves
  fm =. fm+-.bw [ hm =. (hm+1) * -. (-.({.x)e.pieces) +. ('x'e.x)
  brd1;(-.bw);oo;ep;hm;fm
 end.
)

game_of_pgn =: 3 : 0
 fens =. < brd =. start
 for_move. (#~ [: * 3 | i.@#) <;._1 ' ',y do.
   fens =. fens,<brd =. (>move) san brd
 end.
)
