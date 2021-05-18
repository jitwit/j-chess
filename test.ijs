load 'jess.ijs stats/bonsai'
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

NB. causes error because SAN doesn't specify which knight to d2 in
NB. move 11. the reason it doesn't is because the knight on f3 is
NB. pinned by black's queen.
trickypin =: 0 : 0
1. d4 d6 2. Bf4 Nf6 3. Nf3 g6 4. e3 Bg7 5. Bd3 O-O 6. h4 c6 7. h5 Nxh5 8. Rxh5 gxh5 9. Ke2 Qd7 10. Qh1 Qg4 11. Nd2 Bf5 12. Bxf5 Qxf5 13. Qh4 Qg4 14. Qh2 Nd7 15. Rh1 e5 16. dxe5 dxe5 17. Bg3 Nf6 18. Ke1 e4 19. Ne5 Nd5 20. Nxg4 hxg4 21. Qxh7# 1-0
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

egrapid =: 0 : 0
1. e4 e5 2. Nf3 Nc6 3. d4 { C44 Scotch Game } d6?! { (0.00 → 0.90) Inaccuracy. exd4 was best. } (3... exd4 4. Nxd4 Nf6 5. Nxc6 bxc6 6. Bd3 d5 7. exd5 cxd5 8. O-O) 4. Bb5 a6?! { (0.59 → 1.57) Inaccuracy. exd4 was best. } (4... exd4 5. O-O Ne7 6. Nxd4 a6 7. Bc4 Nxd4 8. Qxd4 Nc6 9. Qc3) 5. Bxc6+ bxc6 6. dxe5 Bg4 7. exd6 Bxf3? { (1.61 → 3.37) Mistake. Bxd6 was best. } (7... Bxd6 8. O-O Ne7 9. h3 Bxf3 10. Qxf3 O-O 11. Qc3 Rb8 12. f4) 8. Qxf3 Qxd6 9. O-O Be7 10. Bf4 Qc5 11. Nc3 Nf6 12. Bxc7 O-O 13. Bf4 Rfd8 14. Rad1 Rxd1 15. Rxd1 Rd8 16. Rxd8+ Bxd8 17. e5 Nd5 18. Nxd5 cxd5 19. c3 h6 20. g3 d4?! { (4.47 → 5.96) Inaccuracy. a5 was best. } (20... a5) 21. Qa8 Qe7?! { (5.48 → 7.85) Inaccuracy. Qb6 was best. } (21... Qb6) 22. cxd4 Kh7 23. Qxa6 f6 24. Qd6 Qe8 25. Bd2 fxe5 26. dxe5 Be7 27. Qd3+ Kg8 28. f4 Qc6 29. Bc3 Qa4 30. a3 Qb3 31. Kg2 Qb7+ 32. Qf3 Qb3 33. Qa8+ Kh7 34. Qe4+ Kg8 35. f5 Bg5 36. f6 gxf6 37. exf6 Qb6? { (9.68 → Mate in 3) Checkmate is now unavoidable. Bxf6 was best. } (37... Bxf6 38. Qg6+) 38. Qg6+ Kf8 39. Bb4+ { Black resigns. } 1-0
)

egblitz3 =: 0 : 0
1. e4 d5 2. d4? { (0.43 → -0.86) Mistake. exd5 was best. } (2. exd5 Qxd5 3. Nc3 Qa5 4. d4 Nf6 5. Bd2 Bg4 6. Nf3 Qf5) 2... dxe4 3. Nc3 Nf6 4. f3 exf3 5. Qxf3?! { (-0.88 → -1.78) Inaccuracy. Nxf3 was best. } { D00 Blackmar-Diemer Gambit: Ryder Gambit } (5. Nxf3 g6 6. Bc4 Bg7 7. Bg5 O-O 8. Qe2 Nc6 9. O-O-O Na5) 5... c6?! { (-1.78 → -0.78) Inaccuracy. Qxd4 was best. } (5... Qxd4 6. Be3 Qg4 7. O-O-O Qxf3 8. Nxf3 c6 9. h3 e6 10. g4) 6. Bf4?? { (-0.78 → -2.51) Blunder. Qf2 was best. } (6. Qf2 g6 7. h3 Bg7 8. Nf3 O-O 9. Bd3 Na6 10. a3 Nc7) 6... Bg4? { (-2.51 → -0.83) Mistake. Qxd4 was best. } (6... Qxd4 7. Nge2 Qd8 8. Ne4 Nxe4 9. Qxe4 Qa5+ 10. Bd2 Bf5 11. Qe3 Qb6 12. Nd4 Bg6 13. h4) 7. Qf2?! { (-0.83 → -1.78) Inaccuracy. Qe3 was best. } (7. Qe3 e6 8. h3 Bf5 9. O-O-O Bb4 10. g4 Bg6 11. Nf3 O-O) 7... e6?! { (-1.78 → -1.11) Inaccuracy. Qb6 was best. } (7... Qb6) 8. Nf3 Nbd7 9. Be2?! { (-1.15 → -2.10) Inaccuracy. Bd3 was best. } (9. Bd3) 9... Be7?! { (-2.10 → -1.12) Inaccuracy. Bf5 was best. } (9... Bf5 10. Ne5) 10. h3 Bf5 11. O-O-O O-O?! { (-1.67 → -0.87) Inaccuracy. b5 was best. } (11... b5 12. g4 Bg6 13. h4 b4 14. Na4 Nxg4 15. Qg3 h5 16. Nc5 Nxc5 17. dxc5 Qa5 18. Ne5) 12. g4 Bg6 13. Ne5?! { (-0.97 → -2.00) Inaccuracy. h4 was best. } (13. h4 Nd5 14. Nxd5 cxd5 15. g5 Be4 16. Rhg1 Qb6 17. Nd2 Bf5 18. Nf3 Bd6 19. Bxd6 Qxd6) 13... Ne4?! { (-2.00 → -1.23) Inaccuracy. Nxe5 was best. } (13... Nxe5 14. dxe5 Nd5 15. Nxd5 cxd5 16. Kb1 Bh4 17. Qe3 Rc8 18. Bd3 a6 19. Rhf1 Be7 20. a3) 14. Nxe4 Bxe4 15. Rh2?! { (-1.45 → -2.23) Inaccuracy. Bf3 was best. } (15. Bf3 Bd5) 15... Nf6? { (-2.23 → -0.67) Mistake. Nxe5 was best. } (15... Nxe5 16. Bxe5 Qd5 17. c4 Bg5+ 18. Bf4 Qa5 19. a3 Qa4 20. Rd2 Bxf4 21. Qxf4 f5 22. Qe3) 16. g5?? { (-0.67 → -3.23) Blunder. Qe3 was best. } (16. Qe3 Nd5 17. Qxe4 Nxf4 18. Bc4 Bh4 19. Kb1 Nd5 20. Bd3 g6 21. c4 Nb4 22. Be2 Bg3) 16... Nd5 17. h4? { (-3.09 → -4.99) Mistake. Bd2 was best. } (17. Bd2 Bxg5 18. h4 Bxd2+ 19. Rxd2 f6 20. Nd3 Qe7 21. c4 Nb4 22. Nxb4 Qxb4 23. Qe3 f5) 17... Qa5?? { (-4.99 → -1.00) Blunder. f6 was best. } (17... f6 18. Qg3) 18. Kb1?? { (-1.00 → -4.12) Blunder. Bc4 was best. } (18. Bc4 f6) 18... Nb4 19. Bc4 Bxc2+ 20. Ka1? { (-4.51 → -8.68) Mistake. Qxc2 was best. } (20. Qxc2 Nxc2 21. Rxc2 Qd8 22. Rg2 Bd6 23. h5 Bc7 24. Bd3 a5 25. a3 a4 26. Be4 Qe7) 20... Bxd1 21. Bd2 Rad8 22. a3 Rxd4?! { (-9.86 → -6.08) Inaccuracy. Nc2+ was best. } (22... Nc2+ 23. Kb1 Qb6 24. Ka2 Qxd4 25. Qxd4 Nxd4 26. Rh1 Ba4 27. Bc3 Rfe8 28. Ba5 b6 29. Bc3) 23. Ba2?! { (-6.08 → -15.91) Inaccuracy. Qxd4 was best. } (23. Qxd4 Qxa3+) 23... Nc2+ 24. Kb1 Nxa3+ 25. bxa3 Qxa3?? { (-11.86 → -2.03) Blunder. Qxe5 was best. } (25... Qxe5 26. Bc3 Qe4+ 27. Ka1 Ra4 28. Bb2 Bxa3 29. Bxa3 Rxa3 30. Qc5 Rd3 31. Bb1 Qd4+ 32. Qxd4) 26. Bc3?? { (-2.03 → -17.65) Blunder. Qxd4 was best. } (26. Qxd4 Bc2+ 27. Ka1 Bb3 28. Qb2 Qxb2+ 29. Kxb2 Bxa2 30. Kxa2 Rd8 31. Bc3 f6 32. gxf6 Bxf6) 26... Qxc3 27. Qb2 Rb4 28. Qxb4 Qxb4+ 29. Rb2 Qe4+ 30. Ka1 Qxe5 31. Bb1 Ba3 32. Ka2 Qxb2# { Black wins by checkmate. } 0-1
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
'8/5pk1/5p2/8/5P1p/5P2/r6P/1R4RK b - - 0 42' -: fen > {: game_of_pgn egbullet
'r6q/1p1bpk2/p2p1p2/2pP4/2P1P3/P5R1/1P2NQP1/4R1Kr w - - 4 29' -: fen > {: game_of_pgn egbullet1
'8/5pk1/2n3p1/1Q6/8/4n1Nq/6r1/7K w - - 2 38' -: fen > {: game_of_pgn egbullet2
'8/5pk1/2n3p1/1Q6/8/4n1Nq/6r1/7K w - - 2 38' -: fen > {: game_of_pgn egbullet2
'5k2/8/1q3PQp/6b1/1B6/P5P1/1P4KP/8 b - - 4 39' -: fen > {: game_of_pgn egrapid
'5rk1/pp3ppp/2p1p3/6P1/7P/b7/Kq6/1B1b4 w - - 0 33' -: fen _1 {:: game_of_pgn egblitz3
'7r/3nk2p/p2p1p2/4pP2/2p4P/P3B3/1rP3q1/R1N1KR2 w Q - 0 25' -: fen _1 {::game_of_pgn egblitzchesscom
)

0!:1 demos
0!:2 cases

(< 'rapid.txt') 1!:2~ ;(LF ,~ fen) &.> game_of_pgn egrapid
(< 'blitz.txt') 1!:2~ ;(LF ,~ fen) &.> game_of_pgn egblitzchesscom

'e3' san start

NB. 'rnbqkbnr/pp3ppp/B1ppp3/8/8/4P3/PPPPNPPP/RNBQK1R1 b Qkq - 1 4' -:
brd =: 0 {:: gm =: fen^:_1 'rnbqkbnr/pp3ppp/B1ppp3/8/8/4P3/PPPPNPPP/RNBQK2R w KQkq - 0 4'
'Rg1' maskm~ brd


