load 'chess.ijs'
coinsert 'jchess'

bits =: 0 {:: fen^:_1 '5k2/8/3p4/1N3q2/4N3/3K4/8/8 b - - 0 1'

+./^:2 bits
_1 1 |.!.0 square 'f5'

NB. n is single square bitboard, m is pieces bitboard, y is direction
S =: {{ (+. (m~:n) *. y&(|.!.0))^:_ n }}
A =: {{ +./ _2 (-.+./^:2 x) S (square y)\ m }}
B =: _1 _1 _1 1 1 _1 1 1 A
NB. (-. +./^:2 bits) A (square 'f5')
bits B 'f5'
