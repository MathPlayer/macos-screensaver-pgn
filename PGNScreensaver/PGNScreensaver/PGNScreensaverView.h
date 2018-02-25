//
//  PGNScreensaverView.h
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 23/02/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface PGNScreensaverView : ScreenSaverView {
    char position[8][8];

    NSImage *whiteKing;
    NSImage *blackKing;

    NSImage *whiteQueen;
    NSImage *blackQueen;

    NSImage *whiteBishop;
    NSImage *blackBishop;

    NSImage *whiteKnight;
    NSImage *blackKnight;

    NSImage *whiteRook;
    NSImage *blackRook;

    NSImage *whitePawn;
    NSImage *blackPawn;

    BOOL drawChessBoard;
}

- (void)drawChessBoard;
- (void)setInitialPosition;
- (void)loadImages;

@end
