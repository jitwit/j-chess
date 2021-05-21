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
display =: print @: bits
bits =: 0&{:: NB. the bit grid
isw =: 1&{:: NB. the is white flag
enpf =: 3&{:: NB. en passant file flag (8 means none, otherwise indicates file)

'IP IN IB IR IQ IK' =: i. 6
coords =: 97 (,:|.)&(a.{~+&(i.8)) 49
squareix =: [: |. coords&(i."1 0)

movesto =: _2 {. -.&((6}.pieces),'+#=') NB. should be in algebraic notation section?
square =: (i. 8 8) = 8 #. squareix @: movesto
sq =: square
NB. x clr y (clear square x in bit grid y, x given as coordinate string)
clr =: (-. @: sq @: [) *."2 ]

NP =: (,-) 2 0,1,.i:1 NB. pawn (both black & white)
NN =: ,/ (<:+:#:i.4) *"1/ >:=/~i.2 NB. knight
NB =: ,/ (<:+:#.^:_1 i.4) *"1/ ,~"0}.i.8 NB. bishop
NR =: (,-) (,.&0,0&,.) }. i.8 NB. rook
NQ =: NB,NR NB. queen
NK =: <: 3 #.^:_1 (i.9)-.4 NB. king
NHOOD =: NP;NN;NB;NR;NQ;NK

DP =: _1 ^ 1 + isw NB. direction of pawn movement based on color for use with |.
enp =: (i. 8 8) = 8 #. enpf ,~ 2 + 3 * 1 - isw NB. doesn't validate enpf not 8

NB. n is source, m is mask of clear squares?
MV =: {{ (+. m *. y&(|.!.0))^:_ n }} NB. moves
ATK =: {{ n ~: y |.!.0 m MV n y }} NB. attacks (moves including possibly one piece)
NB. y is source square, m is movement vector, x is bit brick
NB. thus, in MV/ATK, n is source, m is clear squares, y is movement direction
ATK1 =: {{ y |.!.0 n }} NB. attacks (moves including possibly one piece)
M =: {{ y ~: +./ _2 (y ~: -. +./^:2 x) MV y\ m }}
A =: {{ y ~: +./ _2 (y ~: -. +./^:2 x) ATK y\ m }}
A1 =: 2 : '+./ (_2 ]\ m) |.!.0 y'
NB. A1 =: {{ y ~: +./ _2 (y ~: -. +./^:2 x) ATK1 y\ m }} M1 =: {{ y ~:
NB. +./ _2 (y ~: -. +./^:2 x) MV y\ m }} NB. move single square
MB =: _1 _1 _1 1 1 _1 1 1 M NB. bishop
AB =: _1 _1 _1 1 1 _1 1 1 A NB. bishop
MR =: 0 _1 0 1 _1 0 1 0 M NB. rook
AR =: 0 _1 0 1 _1 0 1 0 A NB. rook
AK =: (,NK) A1 NB. king
AN =: (,NN) A1 NB. knight
MQ =: MB +. MR
AQ =: AB +. AR

NB. x ATKSMn y -- attacks from major + minor pieces in position x from color y
ATKSMm =: {{(x AN IN{y{x)+(x AB IB{y{x)+(x AR IR{y{x)+(x AQ IQ{y{x)}}

NB. algebraic notation
piece =: [: (* 6&~:) (6}.pieces) i. {.
maskf =: (8 8 $ i.8) = ({.coords)&i. NB. mask file
maskr =: (8 $"0 i.8) = ({:coords)&i. NB. mask row
maskc =: maskr`maskf@.(e.&'abcdefgh') NB. for masking eg Nbxd2 or R3a2

NB. x = 0 or 1 means king or queen sides resp, y is position
OO =: 4 : 0
 'brd bw oo ep hm fm' =. y
 oo =. oo * (-+:<:+:bw) |.!.0 oo
 if. x do. if. bw do. 'k r' =. 'c1';'a1d1' else. 'k r' =. 'c8';'a8d8' end.
 else.     if. bw do. 'k r' =. 'g1';'f1h1' else. 'k r' =. 'g8';'f8h8' end.
 end.
 rm =. (+./ _2 square\ r) ~: (<bw,IR) { brd
 brd =. ((square k),:rm)((<bw,IK),(<bw,IR))}brd
 brd;(-.bw);oo;ep;(hm+1);(fm+-.bw)
)
O_O_O =: 1&OO
O_O =: 0&OO

NB. have a target square, figure out which piece can get there.
san =: 4 : 0
 if. 'O-O-O' -: 5{.x   do. O_O_O y NB. {. to avoid possible +/#
 elseif. 'O-O' -: 3{.x do. O_O y
 else.
   p =. piece x
   'brd bw oo ep hm fm' =. y
   brd0 =. brd
   NB. to : where piece will be
   to =. (i. 8 8) = 8 #. xy =. squareix d =. _2 {. z =. x -. (6}.pieces),'x+#='
   select. p
   case. IP do.
     dz =. 0,~<:+:bw
     ept =. ep ,~ 2 + 3 * 1 - bw NB. en passant target index
     NB. simple pawn moves, also need to do captures & promotions
     if. 'x' e. x NB. if capture
     do. src =. (i. 8 8) = 8 #. dz+({.xy),({.coords)i.{.z NB. source
         NB. square extra clear bit in case en passant for captured
         NB. pawn
         capenp =. (xy-:ept) *. (i. 8 8) = 8#.xy+dz 
         brd =. ((-.src)*.to+.(<bw,p){brd) (<bw,p)} brd*."2-.to+.src+.capenp
         ep =. 8 NB. no en passant when capturing
     else.
      is2 =. -.(<bw,0,dz+xy){brd NB. if no pawn was a 2 step move
      epc =. *./ , to *. +./ _1 1 |.!.0"0 1/ (<(-.bw),IP){brd
      src =. (i. 8 8) = 8#.xy+dz+is2*dz NB. source square
      ep =. (epc*.is2){8,{:xy NB. en passant if moved 2 on file ({:xy), else 8
      brd =. ((-.src)*.to+.(<bw,p){brd) (<bw,p)} brd*."2-.src
     end.
     if. '=' e. x NB. promotion
     do. brd=.(to+.pix{brd) (pix=.<bw,piece{:x-.'+#x')} (-.to)*."2 brd 
     end.
   case. IN do. src =. ((<bw,p){brd)*.(*./maskc _2}.z)*.brd AN to
   case. IB do. src =. ((<bw,p){brd)*.(*./maskc _2}.z)*.brd AB to
   case. IR do. src =. ((<bw,p){brd)*.(*./maskc _2}.z)*.brd AR to
   case. IQ do. src =. ((<bw,p){brd)*.(*./maskc _2}.z)*.brd AQ to
   case. IK do. src =. ((<bw,p){brd)*.(*./maskc _2}.z)*.brd AK to end.
   if. p do.
     if. 1 < +/,src do. NB. need to disambiguate (discovered pinned
			NB. checks are the problem, but i'm sure other
			NB. edge cases will pop up)
       for_s. ((i. 8 8) =/~ I.@:,) src do. NB. try each possible move
         brd =. ((-.s)*.to+.(<bw,p){brd0) (<bw,p)} brd0*."2-.to+.s
         NB. need to check current color's king not left in check
         if. 0 = +/,((<bw,IK){brd) * brd ATKSMm -.bw do. break. end.
       end.
     else.
       brd =. ((-.src)*.to+.(<bw,p){brd0) (<bw,p)} brd0*."2-.to+.src
     end.
     ep =. 8
     oo =. oo * -.,_3 (2+./\])\ (_2 <@squareix\ 'h1e1a1h8e8a8') { +./^:2 brd ~: brd0
   end.
   fm =. fm+-.bw [ hm =. (hm+1) * -. (-.({.x)e.pieces) +. ('x'e.x)
   brd;(-.bw);oo;ep;hm;fm
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
NB. take pgn movetext and build all states of game
game_of_pgn =: 3 : 0
 moves =. pgn_moves y
 fens =. < brd =. start
 for_move. moves do.
   fens =. fens,<brd =. (>move) san brd
 end.
)

NB. take pgn movetext and return final position
final_of_pgn =: 3 : 0
 for_move. moves =. pgn_moves y [ brd =. start do. brd =. (>move) san brd end. brd
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
