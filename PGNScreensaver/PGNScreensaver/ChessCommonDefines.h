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
