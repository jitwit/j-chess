load 'chess.ijs stats/bonsai'
coinsert 'jchess'

fendfen =: ]&.(fen^:_1)
checkfen =: -: fendfen

NB. 12, 22, 43 from egblitz have been issues, maybe add them
NB. specifically as test cases
egblitz =: 0 : 0
1. f4 Nf6 2. Nf3 g6 3. e3 Bg7 4. d4 d6 5. Be2 O-O 6. O-O Nbd7 7. c4 c5 8. d5 Re8 9. Qc2 e5 10. Re1 exf4 11. exf4 Nb6 12. Nc3 Bf5 13. Qd1 Re7 14. Bd2 Qe8 15. Rc1 a6 16. h3 Nbd7 17. g4 Be4 18. Ng5 h6 19. Ngxe4 Nxe4 20. Nxe4 Rxe4 21. Bf3 Rxe1+ 22. Qxe1 Qxe1+ 23. Rxe1 Kf8 24. b3 b5 25. Kf2 bxc4 26. bxc4 Nb6 27. Rc1 Bd4+ 28. Be3 Bb2 29. Rc2 Bg7 30. Be2 Re8 31. Kf3 Na4 32. h4 Nc3 33. g5 Nxe2 34. Kxe2 Bd4 35. gxh6 Rxe3+ 36. Kd2 Rh3 37. f5 Rxh4 38. fxg6 fxg6 39. Kd3 Rxh6 40. Ke4 Kg7 41. a4 a5 42. Rg2 Rh4+ 43. Kd3 Be5 44. Rf2 Kh6 45. Rf8 Rh3+ 46. Ke4 Bc3 47. Rd8 Be5 48. Ra8 Bc3 49. Rd8 Rh4+ 50. Kd3 Be5 51. Ra8 g5 52. Rxa5 g4 53. Ra7 g3 54. Ra8 g2 55. Rg8 Rh2 56. Rg4 Kh5 57. Rg7 Kh4 58. Rh7+ Kg3 59. Rf7 Kh3 60. Rh7+ Kg3 61. Rf7 g1=Q 62. Rf8 Kg2 63. Rg8+ Kf1 64. Rxg1+ Kxg1 65. Ke4 Rh8 66. Kf5 Ra8 67. Ke6 Rxa4 68. Kd7 Rxc4 0-1
)

egbullet =: 0 : 0
1. e4 b6 2. Nf3 Bb7 3. d4 { B00 Owen Defense: Smith Gambit } d5 4. exd5 Bxd5 5. Nc3 Nf6 6. Be2 e6 7. O-O Bb4 8. Nxd5 exd5 9. c3 Bd6 10. Bg5 O-O 11. Ne5 h6 12. Bh4 Be7 13. Bb5 Ne4 14. Bxe7 Qxe7 15. Bc6 Nxc6 16. Nxc6 Qd6 17. Nb4 c5 18. Nd3 cxd4 19. cxd4 Qf6 20. Ne5 Rac8 21. f3 Nd6 22. Nd7 Qf4 23. Nxf8 Qe3+ 24. Kh1 Rxf8 25. Re1 Qg5 26. Rg1 Nf5 27. Qb3 Qf4 28. Qxd5 Nxd4 29. Rae1 Nf5 30. Re5 Nh4 31. Re4 Qf6 32. Qe5 Ng6 33. Qxf6 gxf6 34. Re7 Rc8 35. Rxa7 Rc2 36. Ra3 Rxb2 37. Rb3 Rxa2 38. Rxb6 Kg7 39. Rb8 Nf4 40. Rbb1 h5 41. g3 h4 42. gxf4+ { White wins on time. } 1-0
)

egbullet1 =: 0 : 0
1. e4 d6 2. Nf3 g6 3. d4 Bg7 4. c4 Nf6 5. Nc3 { E90 King's Indian Defense: Normal Variation, Rare Defenses } O-O 6. Bd3 Nbd7 7. O-O c5 8. d5 Nb6 9. a3 Ng4 10. h3 Ne5 11. Nxe5 Bxe5 12. f4 Bg7 13. Be3 a6 14. Qd2 Nd7 15. f5 Ne5 16. fxg6 hxg6 17. Rae1 Nxd3 18. Qxd3 f6 19. Qd2 Kf7 20. Bh6 Rh8 21. Bxg7 Kxg7 22. Qf4 Rh6 23. Rf3 Qh8 24. Rg3 g5 25. Qf2 Kf7 26. Rxg5 Bxh3 27. Rg3 Bd7 28. Ne2 Rh1# { Black wins by checkmate. } 0-1
)

egbullet2 =: 0 : 0
1. e4 d6 { B00 Pirc Defense } 2. Nf3 Nf6 3. Bc4 Nxe4 4. O-O Nf6 5. d4 g6 6. Bg5 Bg7 7. Re1 O-O 8. Qd2 e6 9. Bh6 Nbd7 10. Bxg7 Kxg7 11. Nc3 c6 12. d5 exd5 13. Bf1 b5 14. b4 Bb7 15. a4 a6 16. axb5 axb5 17. Rxa8 Qxa8 18. Ne2 c5 19. bxc5 dxc5 20. Ng3 d4 21. c3 Bxf3 22. gxf3 Qxf3 23. cxd4 cxd4 24. Qxd4 Nb8 25. Re3 Qc6 26. Bg2 Qc8 27. h4 Rd8 28. Qb4 Rd1+ 29. Kh2 Qd7 30. Qb2 Rd2 31. Qe5 Rxf2 32. h5 Nc6 33. hxg6 hxg6 34. Qxb5 Ng4+ 35. Kh3 Nxe3+ 36. Kh2 Rxg2+ 37. Kh1 Qh3# { Black wins by checkmate. } 0-1
)

egblitzchesscom =: 0 : 0
1. e4 {[%timestamp 1]} 1... c5 {[%timestamp 1]} 2. Nf3 {[%timestamp 17]} 2... d6
{[%timestamp 19]} 3. d4 {[%timestamp 7]} 3... cxd4 {[%timestamp 25]} 4. Nxd4
{[%timestamp 1]} 4... Nf6 {[%timestamp 15]} 5. Nc3 {[%timestamp 9]} 5... a6
{[%timestamp 12]} 6. Be3 {[%timestamp 28]} 6... e5 {[%timestamp 19]} 7. Nb3
{[%timestamp 56]} 7... Be7 {[%timestamp 58]} 8. f3 {[%timestamp 18]} 8... Be6
{[%timestamp 37]} 9. Qd2 {[%timestamp 28]} 9... Nbd7 {[%timestamp 72]} 10. Be2
{[%timestamp 54]} 10... Qc7 {[%timestamp 21]} 11. g4 {[%timestamp 26]} 11... b5
{[%timestamp 63]} 12. a3 {[%timestamp 19]} 12... Rc8 {[%timestamp 53]} 13. h4
{[%timestamp 67]} 13... Nb6 {[%timestamp 40]} 14. g5 {[%timestamp 278]} 14...
Nfd7 {[%timestamp 105]} 15. f4 {[%timestamp 51]} 15... Nc4 {[%timestamp 81]} 16.
Bxc4 {[%timestamp 90]} 16... bxc4 {[%timestamp 1]} 17. Nc1 {[%timestamp 333]}
17... Rb8 {[%timestamp 49]} 18. f5 {[%timestamp 143]} 18... Bxf5 {[%timestamp
147]} 19. exf5 {[%timestamp 1]} 19... Rxb2 {[%timestamp 16]} 20. Nd5
{[%timestamp 83]} 20... Qb7 {[%timestamp 150]} 21. Rf1 {[%timestamp 249]} 21...
f6 {[%timestamp 273]} 22. Nxe7 {[%timestamp 44]} 22... Kxe7 {[%timestamp 23]}
23. gxf6+ {[%timestamp 16]} 23... gxf6 {[%timestamp 72]} 24. Qg2 {[%timestamp
107]} 24... Qxg2 {[%timestamp 69]} 0-1
)

pgn0 =: 0 : 0
1. e4 d6 2. f4 Nf6 3. Nf3 Nxe4 4. Bc4 e6 5. O-O g6 6. d3 Nc5 7. a3 Bg7 8. c3 a6 9. d4 Ne4 10. Nbd2 Nxd2 11. Bxd2 O-O 12. Ng5 b5 13. Ba2 Nc6 14. Qf3 Bb7 15. Qh3 h6 16. Nf3 e5 17. fxe5 dxe5 18. Bxh6 exd4 19. Bxg7 Kxg7 20. Nxd4 Nxd4 21. cxd4 Qxd4+ 22. Kh1 Qxb2 23. Qd7 Qxg2# 0-1
)

demos =: 0 : 0
<"1 ,~"0/~/ coords NB. boxed coordinates
)

cases =: 0 : 0
NB. check that e8 is black king and b1 is white knight
'k' -: (<squareix 'e8') { print 0 {:: start
'N' -: (<squareix 'b1') { print 0 {:: start

NB. convert to and from fen after some sicillian
checkfen 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'
checkfen 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1'
checkfen 'rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq c6 0 2'
checkfen 'rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2'
NB. kasparov resigns against deep blue
checkfen 'r1k4r/p2nb1p1/2b4p/1p1n1p2/2PP4/3Q1NB1/1P3PPP/R5K1 b - - 0 1'

NB. do some sicillian moves
'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1' -: fen start
'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1' -: fen 'e4' san start
'rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq c6 0 2' -: fen 'c5' san 'e4' san start
'rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2' -: fen 'Nf3' san 'c5' san 'e4' san start

NB. promotion
NB. white
'Q7/8/6p1/1K5p/5pkP/8/8/8 b - - 0 1' -: fen 'a8=Q' san fen ^: _1 '8/P7/6p1/1K5p/5pkP/8/8/8 w - - 0 1'
NB. black with check
'8/8/8/8/8/8/4K1k1/5b2 w - - 0 2' -: fen 'f1=B+' san fen^:_1 '8/8/8/8/8/8/4Kpk1/8 b - - 0 1'
NB. with capture
'8/8/8/8/8/8/4K1k1/6q1 w - - 0 2' -: fen 'fxg1=Q' san fen^:_1 '8/8/8/8/8/8/4Kpk1/6N1 b - - 0 1'

NB. castling in random scotch theory
'2kr3r/ppp1nppp/2n2q2/8/3PB3/4B1P1/PP3P1P/R2QK2R w KQ - 1 13' -: fen 'O-O-O' san fen ^:_1 'r3k2r/ppp1nppp/2n2q2/8/3PB3/4B1P1/PP3P1P/R2QK2R b KQkq - 0 12'
'2krr3/ppp2ppp/5q2/3P4/3nB3/3Q2P1/PP3P1P/R4RK1 b - - 3 17' -: fen 'O-O' san fen ^:_1 '2krr3/ppp2ppp/5q2/3P4/3nB3/3Q2P1/PP3P1P/R3K2R w KQ - 2 17'

NB. king move loses castling rights
'rnbqkbnr/pppp1ppp/8/4p3/8/4P3/PPPPKPPP/RNBQ1BNR b kq - 1 2' -: fen 'Ke2' san fen^:_1 'rnbqkbnr/pppp1ppp/8/4p3/8/4P3/PPPP1PPP/RNBQKBNR w KQkq - 0 2'
'rnbq1bnr/ppppkppp/8/4p3/8/4P3/PPPPKPPP/RNBQ1BNR w - - 2 3' -: fen 'Ke7' san fen^:_1'rnbqkbnr/pppp1ppp/8/4p3/8/4P3/PPPPKPPP/RNBQ1BNR b kq - 1 2'

NB. rook disambiguates correctly when pieces are in way of one but not
NB. other. also castling rights if rook on a8 moves.
'rnbqkbnr/pp3ppp/B1ppp3/8/8/4P3/PPPPNPPP/RNBQK1R1 b Qkq - 1 4' -: fen 'Rg1' san fen^:_1 'rnbqkbnr/pp3ppp/B1ppp3/8/8/4P3/PPPPNPPP/RNBQK2R w KQkq - 0 4'

NB. running an example blitz game gives right fen at end
'8/3K4/3p4/2pPb3/2r5/8/8/6k1 w - - 0 69' -: fen > {: game_of_pgn egblitz
NB. example bullet(s)
'8/5pk1/5p2/8/5P1p/5P2/r6P/1R4RK b - - 0 42' -: fen > {: game_of_pgn pgn_com egbullet-.LF
'r6q/1p1bpk2/p2p1p2/2pP4/2P1P3/P5R1/1P2NQP1/4R1Kr w - - 4 29' -: fen > {: game_of_pgn pgn_com egbullet1-.LF
'8/5pk1/2n3p1/1Q6/8/4n1Nq/6r1/7K w - - 2 38' -: fen > {: game_of_pgn pgn_com egbullet2-.LF
'8/5pk1/2n3p1/1Q6/8/4n1Nq/6r1/7K w - - 2 38' -: fen > {: game_of_pgn pgn_com egbullet2-.LF
)


NB. fen start
NB. fen 'e4' san start
NB. fen 'd5' san 'e4' san start
NB. fen 'exd5' san 'd5' san 'e4' san start

NB. fen start
NB. fen 'e4' san start
NB. fen 'c5' san 'e4' san start
NB. fen 'Nf3' san 'c5' san 'e4' san start

0!:1 demos
0!:2 cases
NB. |. |."1 <"1 ,~"0/~/ coords

NB. gogo =: {{ print 0 {:: > y { y game_of_pgn_debug pgn_com x }}
NB. egbullet gogo 7
NB. <"0 print 0 {:: > {: game_of_pgn pgn_com egbullet-.LF
NB. <"0 print 0 {:: > {: game_of_pgn pgn_com egbullet1-.LF
NB. <"0 print 0 {:: > {: game_of_pgn pgn_com egbullet2-.LF

NB. why does chess.com add annoying 1... before black moves???
NB. <"0 print 0 {:: > {: _3 }.\ pgn_moves egblitzchesscom
