load 'chess.ijs stats/bonsai'
coinsert 'jchess'

fendfen =: ]&.(fen^:_1)
checkfen =: -: fendfen

egclassic =: 1!:1 < 'data/eg_classic.txt'
egblitz =: 1!:1 < 'data/eg_blitz.txt'
egbullet =: 1!:1 < 'data/eg_bullet.txt'
egbullet1 =: 1!:1 < 'data/eg_bullet1.txt'
egbullet2 =: 1!:1 < 'data/eg_bullet2.txt'
egblitzchesscom =: 1!:1 < 'data/egblitzchesscom.txt'
egrapid =: 1!:1 < 'data/eg_rapid.txt'
egblitz3 =: 1!:1 < 'data/egblitz3.txt'
eg_uci_moves =: < ;._2 ] 1!:1 < 'data/example_uci_game.txt'

NB. example tournament result matrix
sbeg =: ".;._2 ] 0 : 0
0 0.5 0.5 1 0.5 0.5 1 1 0.5  1  0.5  1  1  1  1
0.5 0 0 0.5 1 0.5 1 1 1  0.5  1  1  1  1  1
0.5 1 0 0.5 0.5 0.5 0.5 0.5 1  1  0.5  1  1  1  1
0 0.5 0.5 0 0.5 1 0.5 0 1  1  0.5  1  0.5  1  0.5
0.5 0 0.5 0.5 0 0.5 0.5 0.5 0.5  0  1  1  0.5  1  1
0.5 0.5 0.5 0 0.5 0 0.5 0.5 0  1  0.5  0.5  0  1  1
0 0 0.5 0.5 0.5 0.5 0 0.5 1  0  0.5  0.5  1  1  0.5
0 0 0.5 1 0.5 0.5 0.5 0 0  0.5  1  0  1  0.5  1
0.5 0 0 0 0.5 1 0 1 0  1  0.5  0.5  0.5  0.5  1
0 0.5 0 0 1 0 1 0.5 0  0  1  1  1  0  1
0.5 0 0.5 0.5 0 0.5 0.5 0 0.5  0  0  0  1  0.5  1
0 0 0 0 0 0.5 0.5 1 0.5  0  1  0  0.5  0.5  1
0 0 0 0.5 0.5 1 0 0 0.5  0  0  0.5  0  0.5  1
0 0 0 0 0 0 0 0.5 0.5  1  0.5  0.5  0.5  0  1
0 0 0 0.5 0 0 0.5 0 0  0  0  0  0  0  0
)

demos =: 0 : 0
<"1 ,~"0/~/ coords NB. boxed coordinates
)

cases =: 0 : 0
NB. check that e8 is black king and b1 is white knight
'k' -: (<SQix 'e8') { print 0 {:: start
'N' -: (<SQix 'b1') { print 0 {:: start

NB. convert to and from fen after some sicillian
checkfen 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'
checkfen 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1'
checkfen 'rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq c6 0 2'
checkfen 'rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2'
NB. kasparov resigns against deep blue
checkfen 'r1k4r/p2nb1p1/2b4p/1p1n1p2/2PP4/3Q1NB1/1P3PPP/R5K1 b - - 0 1'

NB. do some sicillian moves
'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1' -: fen start
'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1' -: fen 'e4' san start
'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1' -: fen 'e2e4' uci start
'rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2' -: fen 'c5' san 'e4' san start
'rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 2' -: fen 'c7c5' uci 'e2e4' uci start
'rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2' -: fen 'Nf3' san 'c5' san 'e4' san start
'rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2' -: fen 'g1f3' uci 'c7c5' uci 'e2e4' uci start

NB. promotion
NB. white
'Q7/8/6p1/1K5p/5pkP/8/8/8 b - - 0 1' -: fen 'a8=Q' san fen ^: _1 '8/P7/6p1/1K5p/5pkP/8/8/8 w - - 0 1'
'Q7/8/6p1/1K5p/5pkP/8/8/8 b - - 0 1' -: fen 'a7a8q' uci fen ^: _1 '8/P7/6p1/1K5p/5pkP/8/8/8 w - - 0 1'
NB. black with check
'8/8/8/8/8/8/4K1k1/5b2 w - - 0 2' -: fen 'f1=B+' san fen^:_1 '8/8/8/8/8/8/4Kpk1/8 b - - 0 1'
'8/8/8/8/8/8/4K1k1/5b2 w - - 0 2' -: fen 'f2f1b' uci fen^:_1 '8/8/8/8/8/8/4Kpk1/8 b - - 0 1'
NB. with capture
'8/8/8/8/8/8/4K1k1/6q1 w - - 0 2' -: fen 'fxg1=Q' san fen^:_1 '8/8/8/8/8/8/4Kpk1/6N1 b - - 0 1'
'8/8/8/8/8/8/4K1k1/6q1 w - - 0 2' -: fen 'f2g1q' uci fen^:_1 '8/8/8/8/8/8/4Kpk1/6N1 b - - 0 1'

NB. castling in random scotch theory
'2kr3r/ppp1nppp/2n2q2/8/3PB3/4B1P1/PP3P1P/R2QK2R w KQ - 1 13' -: fen 'O-O-O' san fen ^:_1 'r3k2r/ppp1nppp/2n2q2/8/3PB3/4B1P1/PP3P1P/R2QK2R b KQkq - 0 12'
'2kr3r/ppp1nppp/2n2q2/8/3PB3/4B1P1/PP3P1P/R2QK2R w KQ - 1 13' -: fen 'e8c8' uci fen ^:_1 'r3k2r/ppp1nppp/2n2q2/8/3PB3/4B1P1/PP3P1P/R2QK2R b KQkq - 0 12'
'2krr3/ppp2ppp/5q2/3P4/3nB3/3Q2P1/PP3P1P/R4RK1 b - - 3 17' -: fen 'O-O' san fen ^:_1 '2krr3/ppp2ppp/5q2/3P4/3nB3/3Q2P1/PP3P1P/R3K2R w KQ - 2 17'
'2krr3/ppp2ppp/5q2/3P4/3nB3/3Q2P1/PP3P1P/R4RK1 b - - 3 17' -: fen 'e1g1' uci fen ^:_1 '2krr3/ppp2ppp/5q2/3P4/3nB3/3Q2P1/PP3P1P/R3K2R w KQ - 2 17'

NB. king move loses castling rights
'rnbqkbnr/pppp1ppp/8/4p3/8/4P3/PPPPKPPP/RNBQ1BNR b kq - 1 2' -: fen 'Ke2' san fen^:_1 'rnbqkbnr/pppp1ppp/8/4p3/8/4P3/PPPP1PPP/RNBQKBNR w KQkq - 0 2'
'rnbqkbnr/pppp1ppp/8/4p3/8/4P3/PPPPKPPP/RNBQ1BNR b kq - 1 2' -: fen 'e1e2' uci fen^:_1 'rnbqkbnr/pppp1ppp/8/4p3/8/4P3/PPPP1PPP/RNBQKBNR w KQkq - 0 2'
'rnbq1bnr/ppppkppp/8/4p3/8/4P3/PPPPKPPP/RNBQ1BNR w - - 2 3' -: fen 'Ke7' san fen^:_1'rnbqkbnr/pppp1ppp/8/4p3/8/4P3/PPPPKPPP/RNBQ1BNR b kq - 1 2'
'rnbq1bnr/ppppkppp/8/4p3/8/4P3/PPPPKPPP/RNBQ1BNR w - - 2 3' -: fen 'e8e7' uci fen^:_1'rnbqkbnr/pppp1ppp/8/4p3/8/4P3/PPPPKPPP/RNBQ1BNR b kq - 1 2'

NB. rook disambiguates correctly when pieces are in way of one but not
NB. other. also castling rights if rook on a8 moves.
'rnbqkbnr/pp3ppp/B1ppp3/8/8/4P3/PPPPNPPP/RNBQK1R1 b Qkq - 1 4' -: fen 'Rg1' san fen^:_1 'rnbqkbnr/pp3ppp/B1ppp3/8/8/4P3/PPPPNPPP/RNBQK2R w KQkq - 0 4'
'rnbqkbnr/pp3ppp/B1ppp3/8/8/4P3/PPPPNPPP/RNBQK1R1 b Qkq - 1 4' -: fen 'h1g1' uci fen^:_1 'rnbqkbnr/pp3ppp/B1ppp3/8/8/4P3/PPPPNPPP/RNBQK2R w KQkq - 0 4'

NB. en passant fen
'rnbqkbnr/1pppp1pp/p7/4Pp2/8/8/PPPP1PPP/RNBQKBNR w KQkq f6 0 3' -: fen 'f5' san fen^:_1 'rnbqkbnr/1ppppppp/p7/4P3/8/8/PPPP1PPP/RNBQKBNR b KQkq - 0 2'
'rnbqkbnr/1pppp1pp/p7/4Pp2/8/8/PPPP1PPP/RNBQKBNR w KQkq f6 0 3' -: fen 'f7f5' uci fen^:_1 'rnbqkbnr/1ppppppp/p7/4P3/8/8/PPPP1PPP/RNBQKBNR b KQkq - 0 2'

NB. en passant capture
'rnbqkbnr/1pp1pppp/p2P4/8/8/8/PPPP1PPP/RNBQKBNR b KQkq - 0 3' -: fen 'exd6' san fen^:_1 'rnbqkbnr/1pp1pppp/p7/3pP3/8/8/PPPP1PPP/RNBQKBNR w KQkq d6 0 3'
'rnbqkbnr/1pp1pppp/p2P4/8/8/8/PPPP1PPP/RNBQKBNR b KQkq - 0 3' -: fen 'e5d6' uci fen^:_1 'rnbqkbnr/1pp1pppp/p7/3pP3/8/8/PPPP1PPP/RNBQKBNR w KQkq d6 0 3'
NB. display 'e5d6' uci fen^:_1 'rnbqkbnr/1pp1pppp/p7/3pP3/8/8/PPPP1PPP/RNBQKBNR w KQkq d6 0 3'

NB. run a full example game of uci
'5Q2/4k3/4P3/5Q2/8/6P1/7P/6K1 b - - 0 64' -: fen > {: game_of_uci eg_uci_moves

NB. disambiguate discovered check(!)
'k7/6b1/8/5N2/3N4/2K5/8/8 b - - 1 1' -: fen 'Nf5' san fen^:_1 'k7/6b1/8/8/3N4/2K1N3/8/8 w - - 0 1'

NB. running an example blitz game gives right fen at end
'8/3K4/3p4/2pPb3/2r5/8/8/6k1 w - - 0 69' -: fen > {: game_of_pgn egblitz
NB. example bullet(s)
'8/5pk1/5p2/8/5P1p/5P2/r6P/1R4RK b - - 0 42' -: fen > {: game_of_pgn egbullet
'r6q/1p1bpk2/p2p1p2/2pP4/2P1P3/P5R1/1P2NQP1/4R1Kr w - - 4 29' -: fen > {: game_of_pgn egbullet1
'8/5pk1/2n3p1/1Q6/8/4n1Nq/6r1/7K w - - 2 38' -: fen > {: game_of_pgn egbullet2
'8/5pk1/2n3p1/1Q6/8/4n1Nq/6r1/7K w - - 2 38' -: fen > {: game_of_pgn egbullet2
'5k2/8/1q3PQp/6b1/1B6/P5P1/1P4KP/8 b - - 4 39' -: fen > {: game_of_pgn egrapid
'5rk1/pp3ppp/2p1p3/6P1/7P/b7/Kq6/1B1b4 w - - 0 33' -: fen _1 {:: game_of_pgn egblitz3
'7r/3nk2p/p2p1p2/4pP2/2p4P/P3B3/1rP3q1/R1N1KR2 w Q - 0 25' -: fen _1 {::game_of_pgn egblitzchesscom
'1qr3r1/5pBk/1p2pN1P/p1p1nnQ1/P2p4/2PP2PN/1P3PK1/R7 b - - 1 28' -: fen final_of_pgn egclassic

NB. sonnenborn-berger
69.5 66.75 67.5 54.75 47.75 45.25 42.5 41.5 41.5 40.5 33.25 28.5 24.75 22.75 7.75 -: S_B sbeg
)

0!:1 demos
0!:2 cases

(< 'rapid.txt') 1!:2~ ;(LF ,~ fen) &.> game_of_pgn egrapid
(< 'blitz.txt') 1!:2~ ;(LF ,~ fen) &.> game_of_pgn egblitzchesscom

pgn_moves 'f4 d5 Nf3 Nf6 g3 g6 Bg2 Bg7 O-O O-O d3 c5'
