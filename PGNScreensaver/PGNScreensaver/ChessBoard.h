//
//  ChessBoard.h
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 25/02/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ChessCommonDefines.h"
#import "GameManager.h"
#import "MovingPiece.h"

@interface ChessBoard : NSObject {
    ChessPieceType _board[8][8];

    // Use values from ChessPieceType enum as keys
    NSDictionary<NSNumber *, NSImage *> *_images;

    GameManager *_gameManager;
    MovingPiece *_movingPiece;
    NSInteger _moveCount;
}

@property (readonly) BOOL needsDisplay;

- (void)setInitialPosition;
- (void)loadImages;
- (void)loadGame;
- (void)drawInRect:(NSRect)rect;
- (void)startMove;

@end
