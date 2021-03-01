load 'chess.ijs stats/bonsai'

fendfen =: ]&.(fen^:_1)
checkfen =: -: fendfen

demos =: 0 : 0
<"1 ,~"0/~/ coords NB. boxed coordinates
)

cases =: 0 : 0
NB. convert to and from fen after some sicillian
checkfen 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'
checkfen 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1'
checkfen 'rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq c6 0 2'
checkfen 'rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2'

NB. convert to and from fen after some sicillian
'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1' -: fen start
'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1' -: fen 'e4' san start
'rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq c6 0 2' -: fen 'c5' san 'e4' san start
'rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2' -: fen 'Nf3' san 'c5' san 'e4' san start

NB. castling in random scotch theory
'2kr3r/ppp1nppp/2n2q2/8/3PB3/4B1P1/PP3P1P/R2QK2R w KQ - 1 13' -: fen 'O-O-O' san fen ^:_1 'r3k2r/ppp1nppp/2n2q2/8/3PB3/4B1P1/PP3P1P/R2QK2R b KQkq - 0 12'
'2krr3/ppp2ppp/5q2/3P4/3nB3/3Q2P1/PP3P1P/R4RK1 b - - 3 17' -: fen 'O-O' san fen ^:_1 '2krr3/ppp2ppp/5q2/3P4/3nB3/3Q2P1/PP3P1P/R3K2R w KQ - 2 17'

NB. kasparov resigns against deep blue
checkfen 'r1k4r/p2nb1p1/2b4p/1p1n1p2/2PP4/3Q1NB1/1P3PPP/R5K1 b - - 0 1'
NB. check that e8 is black king and b1 is white knight
'k' -: (<square 'e8') { print 0 {:: start
'N' -: (<square 'b1') { print 0 {:: start
)

0!:1 demos
0!:2 cases
