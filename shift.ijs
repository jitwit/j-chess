load 'chess.ijs stats/bonsai'
coinsert 'jchess'

bits =: 0 {:: fen^:_1 '5k2/8/3p4/1N3q2/4N3/3K4/8/8 b - - 0 1'

+./^:2 bits
_1 1 |.!.0 square 'f5'

NB. moves
NB. n is single square bitboard, m is pieces bitboard, y is direction
MV =: {{ (+. m *. y&(|.!.0))^:_ n }} NB. moves
AK =: {{ n ~: y |.!.0 m MV n y }} NB. attacks (moves including one piece)
M =: {{ s ~: +./ _2 (s~:-.+./^:2 x) MV (s=.square y)\ m }}
A =: {{ s ~: +./ _2 (s~:-.+./^:2 x) AK (s=.square y)\ m }}
MB =: _1 _1 _1 1 1 _1 1 1 M NB. bishop
AB =: _1 _1 _1 1 1 _1 1 1 A NB. bishop
MR =: 0 _1 0 1 _1 0 1 0 M NB. rook
AR =: 0 _1 0 1 _1 0 1 0 A NB. rook
MQ =: MB +. MR
AQ =: AB +. AR

NB. how to get up to and including pieces for capture?
NB. how to do xrays?

NB. (-. +./^:2 bits) A (square 'f5')
viewmat bits MQ 'f5'
viewmat bits AQ 'f5'
viewmat +./^:2 bits
NB. bits MR 'f5'
NB. bits MQ 'f5'
NB. (+./^:2 bits)
