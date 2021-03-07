load 'chess.ijs stats/bonsai'

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

pgn0 =: 0 : 0
1. e4 d6 2. f4 Nf6 3. Nf3 Nxe4 4. Bc4 e6 5. O-O g6 6. d3 Nc5 7. a3 Bg7 8. c3 a6 9. d4 Ne4 10. Nbd2 Nxd2 11. Bxd2 O-O 12. Ng5 b5 13. Ba2 Nc6 14. Qf3 Bb7 15. Qh3 h6 16. Nf3 e5 17. fxe5 dxe5 18. Bxh6 exd4 19. Bxg7 Kxg7 20. Nxd4 Nxd4 21. cxd4 Qxd4+ 22. Kh1 Qxb2 23. Qd7 Qxg2# 0-1
)

demos =: 0 : 0
<"1 ,~"0/~/ coords NB. boxed coordinates
)

cases =: 0 : 0
NB. check that e8 is black king and b1 is white knight
'k' -: (<square 'e8') { print 0 {:: start
'N' -: (<square 'b1') { print 0 {:: start

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
NB. example bullet
'8/5pk1/5p2/8/5P1p/5P2/r6P/1R4RK b - - 0 42' -: fen > {: game_of_pgn pgn_com egbullet-.LF
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

gogo =: {{ print 0 {:: > y { y game_of_pgn0 pgn_com x }}
egbullet gogo 7
<"0 print 0 {:: > {: game_of_pgn pgn_com egbullet-.LF


