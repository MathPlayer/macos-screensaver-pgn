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
    }
    return self;
}

- (void)setInitialPosition
{
    position[0][0] = position[0][7] = WHITE_ROOK;
    position[0][1] = position[0][6] = WHITE_KNIGHT;
    position[0][2] = position[0][5] = WHITE_BISHOP;
    position[0][3] = WHITE_QUEEN;
    position[0][4] = WHITE_KING;
    position[7][0] = position[7][7] = BLACK_ROOK;
    position[7][1] = position[7][6] = BLACK_KNIGHT;
    position[7][2] = position[7][5] = BLACK_BISHOP;
    position[7][3] = BLACK_QUEEN;
    position[7][4] = BLACK_KING;
    for (int i = 1; i < 7; ++i) {
        for (int j = 0; j < 8; ++j) {
            ChessPieceType toAssign = NONE;
            if (i == 1) {
                toAssign = WHITE_PAWN;
            } else if (i == 6) {
                toAssign = BLACK_PAWN;
            }
            position[i][j] = toAssign;
        }
    }
}

- (void)loadImages
{
    NSBundle *b = [NSBundle bundleForClass:[self class]];
    chessPieces = @{@(WHITE_KING): [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_klt45" ofType:@"pdf"]],
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
    CGFloat minDimension = rect.size.width;
    if (minDimension > rect.size.height) {
        minDimension = rect.size.height;
    }
    // Use only 3/4 of the minDimension
    minDimension *= 0.75;

    CGPoint bottomLeft = CGPointMake(rect.size.width / 2 - minDimension / 2,
                                     rect.size.height / 2 - minDimension / 2);
    CGFloat sqSize = minDimension / 8;

    for (int y = 0; y < 8; ++y) {
        for (int x = 0; x < 8; ++x) {
            NSRect r = NSMakeRect(bottomLeft.x + x * sqSize,
                                  bottomLeft.y + y * sqSize,
                                  sqSize,
                                  sqSize);
            if ((x + y) % 2) {
                [NSColor.chessBoardBrownDarkColor set];
            } else {
                [NSColor.chessBoardBrownLightColor set];
            }
            NSRectFill(r);
            NSImage *piece = chessPieces[@(position[y][x])];
            if ([piece isKindOfClass:NSImage.class]) {
                [piece drawInRect:r];
            }
        }
    }
}

@end
