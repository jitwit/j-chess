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
display =: print @: (0&{::)
i88 =: i. 8 8

'IP IN IB IR IQ IK' =: i. 6
coords =: 97 (,:|.)&(a.{~+&(i.8)) 49
SQix =: [: |. coords&(i."1 0)
SQt =: _2 {. -.&((6}.pieces),'+#=') NB. target square of SAN move
SQ =: i88 = 8 #. SQix @: SQt

NP =: (,-) 2 0,1,.i:1 NB. pawn (both black & white)
NN =: ,/ (<:+:#:i.4) *"1/ >:=/~i.2 NB. knight
NB =: ,/ (<:+:#.^:_1 i.4) *"1/ ,~"0}.i.8 NB. bishop
NR =: (,-) (,.&0,0&,.) }. i.8 NB. rook
NQ =: NB,NR NB. queen
NK =: <: 3 #.^:_1 (i.9)-.4 NB. king
NHOOD =: NP;NN;NB;NR;NQ;NK

NB. n is source, m is mask of clear squares?
MV =: {{ (+. m *. y&(|.!.0))^:_ n }} NB. moves
ATK =: {{ n ~: y |.!.0 m MV n y }} NB. attacks (moves including possibly one piece)
NB. y is source square, m is movement vector, x is bit brick
NB. thus, in MV/ATK, n is source, m is clear squares, y is movement direction
M =: {{ y ~: +./ _2 (y ~: -. +./^:2 x) MV y\ m }}
A =: {{ y ~: +./ _2 (y ~: -. +./^:2 x) ATK y\ m }}
A1 =: 2 : '+./ (_2 ]\ m) |.!.0 y'
MB =: _1 _1 _1 1 1 _1 1 1 M NB. bishop
AB =: _1 _1 _1 1 1 _1 1 1 A NB. bishop
MR =: 0 _1 0 1 _1 0 1 0 M NB. rook
AR =: 0 _1 0 1 _1 0 1 0 A NB. rook
AK =: (,NK) A1 NB. king
AN =: (,NN) A1 NB. knight
MQ =: MB +. MR
AQ =: AB +. AR

NB. x ATKSMn y -- attacks from major + minor pieces in position x from color y
ATKSMm =: {{(x AN IN{y{x)+.(x AB IB{y{x)+.(x AR IR{y{x)+.(x AQ IQ{y{x)}}

NB. algebraic notation
piece =: [: (* 6&~:) (6}.pieces) i. {.
maskf =: (8 8 $ i.8) = ({.coords)&i. NB. mask file
maskr =: (8 $"0 i.8) = ({:coords)&i. NB. mask row
maskc =: maskr`maskf@.(e.&'abcdefgh') NB. for masking eg Nbxd2 or R3a2

NB. x = 0 or 1 means king or queen sides resp, y is position
OO =: 4 : 0
 'brd bw oo ep hm fm' =. y
 oo =. oo * (-+:<:+:bw) |.!.0 oo
 k =. i88 = (56*bw)+6-4*x
 r =. i88 e. (56*bw)+(5*-.x),(7-x*4)
 rm =. r ~: (<bw,IR) { brd
 brd =. (k,:rm)((<bw,IK),(<bw,IR))}brd
 brd;(-.bw);oo;ep;(hm+1);(fm+-.bw)
)
O_O_O =: 1&OO
O_O =: 0&OO
OO_sqs =: _2<@SQix\'h1e1a1h8e8a8' NB. castling squares, used to detect
				  NB. when castling rights are lost.

NB. have a target square, figure out which piece can get there.
san =: 4 : 0
 if. 'O-O-O' -: 5{.x   do. O_O_O y NB. {. to avoid possible +/#
 elseif. 'O-O' -: 3{.x do. O_O y
 else.
   p =. piece x
   'brd bw oo ep hm fm' =. y
   brd0 =. brd
   NB. to : where piece will be
   to =. i88 = 8 #. xy =. SQix d =. _2 {. z =. x -. (6}.pieces),'x+#='
   if. p NB. non pawn move
   do. select. p
     case. IN do. src =. ((<bw,p){brd)*.(*./maskc _2}.z)*.brd AN to
     case. IB do. src =. ((<bw,p){brd)*.(*./maskc _2}.z)*.brd AB to
     case. IR do. src =. ((<bw,p){brd)*.(*./maskc _2}.z)*.brd AR to
     case. IQ do. src =. ((<bw,p){brd)*.(*./maskc _2}.z)*.brd AQ to
     case. IK do. src =. ((<bw,p){brd)*.(*./maskc _2}.z)*.brd AK to end.
     if. p do.
       if. 1 < +/,src do. NB. need to disambiguate (discovered pinned
                          NB. checks are the problem, but i'm sure other
                          NB. edge cases will pop up)
         for_s. (i88 =/~ I.@:,) src do. NB. try each possible move
           brd =. ((-.s)*.to+.(<bw,p){brd0) (<bw,p)} brd0*."2-.to+.s
           NB. need to check current color's king not left in check
           if. 0 = +./,((<bw,IK){brd) *. brd ATKSMm -.bw do. break. end.
         end.
       else.
         brd =. ((-.src)*.to+.(<bw,p){brd0) (<bw,p)} brd0*."2-.to+.src
       end.
       ep =. 8
       oo =. oo*-.,_3(2+./\])\OO_sqs{+./^:2 brd~:brd0
     end.
   else. NB. pawn move
     dz =. 0,~<:+:bw
     ept =. ep ,~ 2 + 3 * 1 - bw NB. en passant target index
     NB. simple pawn moves, also need to do captures & promotions
     if. 'x' e. x NB. if capture
     do. src =. i88 = 8 #. dz+({.xy),({.coords)i.{.z NB. source
         NB. square extra clear bit in case en passant for captured
         NB. pawn
         capenp =. (xy-:ept) *. i88 = 8#.xy+dz 
         brd =. ((-.src)*.to+.(<bw,p){brd) (<bw,p)} brd*."2-.to+.src+.capenp
         ep =. 8 NB. no en passant when capturing
     else.
      is2 =. -.(<bw,0,dz+xy){brd NB. if no pawn was a 2 step move
      epc =. *./ , to *. +./ _1 1 |.!.0"0 1/ (<(-.bw),IP){brd
      src =. i88 = 8#.xy+dz+is2*dz NB. source square
      ep =. (epc*.is2){8,{:xy NB. en passant if moved 2 on file ({:xy), else 8
      brd =. ((-.src)*.to+.(<bw,p){brd) (<bw,p)} brd*."2-.src
     end.
     if. '=' e. x NB. promotion
     do. brd=.(to+.pix{brd) (pix=.<bw,piece{:x-.'+#x')} (-.to)*."2 brd
     end.
   end.
   fm =. fm+-.bw [ hm =. (hm+1) * -. (-.({.x)e.pieces) +. ('x'e.x)
   brd;(-.bw);oo;ep;hm;fm
 end.
)

uci =: 4 : 0
 NB. x is uci notated move y is board, result is new board
 'brd bw oo ep hm fm' =. y
 'sqs sqt' =. _2 SQ\ 4{.x
 p =. {.,I.+./ sqs (+./@:,@:*.)"2 brd
 if. ('eg'-:0 2{x)*.p=IK do. O_O y
 elseif. ('ec'-:0 2{x)*.p=IK do. O_O_O y
 else. pt =. p <. ('pnbrqk' i. {:x)*(IP=p)*.5=#x NB. p or promotion if there is one
       cap =. +./,sqt *."2 brd NB. detect if capture
       brd0 =. sqt (<bw,pt)}brd *."2 -.sqs+.sqt NB. clear squares
       fm =. fm+-.bw [ hm =. (hm+1) * -. (p=0) +. cap
       NB. todo: detect castling rights loss, en passant possibility
       brd0;(-.bw);oo;ep;fm;hm
 end.
)

san_of_uci =: 4 : 0
 NB. x is uci notated move y is board, result is overdisambiguated san notation
  select. p=.{.,I.+./ (SQ 2{.x) (+./@:,@:*)"2 (0{::y)
  case. IP do. if. 5=#y do. (4}.x),'=',{:x else. x end.
  case. IK do. select. 0 2 { x
               case. 'eg' do. 'O-O'
	       case. 'ec' do. 'O-O-O'
	       case. do. 'K',x
	       end.
  case. do. (p{'PNBRQK'),x
  end.
)
'e2e4' uci start
'g1f3' san_of_uci start
'e1c1' san_of_uci start
'e8g8' san_of_uci start

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
 (dfen brd);('w'={.bw);('KQkq'e.oo);({:(SQix :: 8:)ep);hm;&".fm
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



NB. tournament
NB. S_B y -- monad where y is matrix of tournament results where y_ij
NB. is result of game between player i and j.
S_B =: +/ . * +/"1

NB. fen_z_ =: fen_jchess_
NB. print_z_ =: print_jchess_
NB. san_z_ =: san_jchess_
NB. start_z_ =: start_jchess_
