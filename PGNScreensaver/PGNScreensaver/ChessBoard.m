//
//  ChessBoard.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 25/02/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "ChessBoard.h"

#import <AppKit/AppKit.h>

#import "NSColor+ChessBoardColor.h"

@implementation ChessBoard

- (id)init
{
    self = [super init];
    if (self) {
        [self loadImages];
        [self setInitialPosition];
        _needsDisplay = YES;
    }
    return self;
}

- (void)setInitialPosition
{
    _board[0][0] = _board[0][7] = WHITE_ROOK;
    _board[0][1] = _board[0][6] = WHITE_KNIGHT;
    _board[0][2] = _board[0][5] = WHITE_BISHOP;
    _board[0][3] = WHITE_QUEEN;
    _board[0][4] = WHITE_KING;
    _board[7][0] = _board[7][7] = BLACK_ROOK;
    _board[7][1] = _board[7][6] = BLACK_KNIGHT;
    _board[7][2] = _board[7][5] = BLACK_BISHOP;
    _board[7][3] = BLACK_QUEEN;
    _board[7][4] = BLACK_KING;
    for (int i = 1; i < 7; ++i) {
        for (int j = 0; j < 8; ++j) {
            ChessPieceType toAssign = NONE;
            if (i == 1) {
                toAssign = WHITE_PAWN;
            } else if (i == 6) {
                toAssign = BLACK_PAWN;
            }
            _board[i][j] = toAssign;
        }
    }
}

- (void)loadImages
{
    NSBundle *b = [NSBundle bundleForClass:[self class]];
    _images = @{@(WHITE_KING): [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_klt45" ofType:@"pdf"]],
                @(BLACK_KING): [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_kdt45" ofType:@"pdf"]],
                @(WHITE_QUEEN): [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_qlt45" ofType:@"pdf"]],
                @(BLACK_QUEEN): [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_qdt45" ofType:@"pdf"]],
                @(WHITE_ROOK): [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_rlt45" ofType:@"pdf"]],
                @(BLACK_ROOK): [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_rdt45" ofType:@"pdf"]],
                @(WHITE_BISHOP): [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_blt45" ofType:@"pdf"]],
                @(BLACK_BISHOP): [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_bdt45" ofType:@"pdf"]],
                @(WHITE_KNIGHT): [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_nlt45" ofType:@"pdf"]],
                @(BLACK_KNIGHT): [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_ndt45" ofType:@"pdf"]],
                @(WHITE_PAWN): [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_plt45" ofType:@"pdf"]],
                @(BLACK_PAWN): [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_pdt45" ofType:@"pdf"]]
                };
}

- (void)drawInRect:(CGRect)rect
{
    // Use only 3/4 of the actual size
    CGFloat boardSize = 0.75 * MIN(CGRectGetWidth(rect), CGRectGetHeight(rect));
    CGRect board = CGRectInset(rect,
                               (CGRectGetWidth(rect) - boardSize) / 2,
                               (CGRectGetHeight(rect) - boardSize) / 2);
    CGFloat squareSize = boardSize / 8;
    for (int y = 0; y < 8; ++y) {
        for (int x = 0; x < 8; ++x) {
            NSRect r = NSMakeRect(CGRectGetMinX(board) + x * squareSize,
                                  CGRectGetMinY(board) + y * squareSize,
                                  squareSize,
                                  squareSize);
            if ((x + y) % 2) {
                [NSColor.chessBoardBrownDarkColor set];
            } else {
                [NSColor.chessBoardBrownLightColor set];
            }
            NSRectFill(r);
            NSImage *piece = _images[@(_board[y][x])];
            if ([piece isKindOfClass:NSImage.class]) {
                [piece drawInRect:r];
            }
        }
    }

    _needsDisplay = NO;
}

@end
