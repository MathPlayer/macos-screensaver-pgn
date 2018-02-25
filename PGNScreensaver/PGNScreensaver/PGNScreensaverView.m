//
//  PGNScreensaverView.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 23/02/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "PGNScreensaverView.h"

#import "NSColor+ChessBoardColor.h"

@implementation PGNScreensaverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        drawChessBoard = YES;
        [self setInitialPosition];
        [self loadImages];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    [self drawChessBoard];
}

- (void)animateOneFrame
{
    if (drawChessBoard) {
        [self setNeedsDisplay:YES];
    }
}

- (void)drawChessBoard
{
    CGFloat minDimension = self.frame.size.width;
    if (minDimension > self.frame.size.height) {
        minDimension = self.frame.size.height;
    }
    // Use only 3/4 of the minDimension
    minDimension *= 0.75;

    CGPoint bottomLeft = CGPointMake(self.frame.size.width / 2 - minDimension / 2,
                                     self.frame.size.height / 2 - minDimension / 2);
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
            switch (position[y][x]) {
                case 'K':
                    [whiteKing drawInRect:r];
                    break;
                case 'k':
                    [blackKing drawInRect:r];
                    break;
                case 'Q':
                    [whiteQueen drawInRect:r];
                    break;
                case 'q':
                    [blackQueen drawInRect:r];
                    break;
                case 'R':
                    [whiteRook drawInRect:r];
                    break;
                case 'r':
                    [blackRook drawInRect:r];
                    break;
                case 'B':
                    [whiteBishop drawInRect:r];
                    break;
                case 'b':
                    [blackBishop drawInRect:r];
                    break;
                case 'N':
                    [whiteKnight drawInRect:r];
                    break;
                case 'n':
                    [blackKnight drawInRect:r];
                    break;
                case 'P':
                    [whitePawn drawInRect:r];
                    break;
                case 'p':
                    [blackPawn drawInRect:r];
                    break;
                default:
                    break;
            }
        }
    }

    drawChessBoard = NO;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

- (void)setInitialPosition
{
    strcpy(position[7], "rnbqkbnr");
    strcpy(position[6], "pppppppp");
    strcpy(position[5], "        ");
    strcpy(position[4], "        ");
    strcpy(position[3], "        ");
    strcpy(position[2], "        ");
    strcpy(position[1], "PPPPPPPP");
    strcpy(position[0], "RNBQKBNR");
}

- (void)loadImages
{
    NSBundle *b = [NSBundle bundleForClass:[self class]];
    whiteKing = [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_klt45" ofType:@"pdf"]];
    blackKing = [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_kdt45" ofType:@"pdf"]];

    whiteQueen = [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_qlt45" ofType:@"pdf"]];
    blackQueen = [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_qdt45" ofType:@"pdf"]];

    whiteRook = [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_rlt45" ofType:@"pdf"]];
    blackRook = [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_rdt45" ofType:@"pdf"]];

    whiteBishop = [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_blt45" ofType:@"pdf"]];
    blackBishop = [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_bdt45" ofType:@"pdf"]];

    whiteKnight = [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_nlt45" ofType:@"pdf"]];
    blackKnight = [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_ndt45" ofType:@"pdf"]];

    whitePawn = [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_plt45" ofType:@"pdf"]];
    blackPawn = [[NSImage alloc] initWithContentsOfFile:[b pathForResource:@"Chess_pdt45" ofType:@"pdf"]];
}

@end
