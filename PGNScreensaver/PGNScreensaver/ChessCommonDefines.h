//
//  ChessCommonDefines.h
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 28/02/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#pragma once

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    WHITE = 0,
    BLACK = 1
} ChessPieceColor;

typedef enum : NSUInteger {
    NONE = 0,
    PAWN = 2,
    KNIGHT = 4,
    BISHOP = 8,
    ROOK = 16,
    QUEEN = 32,
    KING = 64,

    WHITE_PAWN = WHITE + PAWN,
    WHITE_KNIGHT = WHITE + KNIGHT,
    WHITE_BISHOP = WHITE + BISHOP,
    WHITE_ROOK = WHITE + ROOK,
    WHITE_QUEEN = WHITE + QUEEN,
    WHITE_KING = WHITE + KING,

    BLACK_PAWN = BLACK + PAWN,
    BLACK_KNIGHT = BLACK + KNIGHT,
    BLACK_BISHOP = BLACK + BISHOP,
    BLACK_ROOK = BLACK + ROOK,
    BLACK_QUEEN = BLACK + QUEEN,
    BLACK_KING = BLACK + KING
} ChessPieceType;

typedef enum : unichar {
    COLUMN_A = 'a',
    COLUMN_B = 'b',
    COLUMN_C = 'c',
    COLUMN_D = 'd',
    COLUMN_E = 'e',
    COLUMN_F = 'f',
    COLUMN_G = 'g',
    COLUMN_H = 'h',
    COLUMN_FIRST = COLUMN_A,
    COLUMN_LAST = COLUMN_H
} ChessColumn;

typedef enum : unichar {
    LINE_1 = '1',
    LINE_2 = '2',
    LINE_3 = '3',
    LINE_4 = '4',
    LINE_5 = '5',
    LINE_6 = '6',
    LINE_7 = '7',
    LINE_8 = '8',
} ChessLine;
