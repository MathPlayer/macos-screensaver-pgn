//
//  MovingPiece.h
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 17/05/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ChessCommonDefines.h"

@interface MovingPiece : NSObject {
    NSInteger _fromX;
    NSInteger _fromY;
    NSInteger _toX;
    NSInteger _toY;

    NSUInteger _stepCount;
    NSUInteger _stepTotal;
}

@property (readonly, nonatomic) ChessPieceType type;

+ (instancetype)pieceOfType:(ChessPieceType)aType
                movingFromX:(NSInteger)fromX
                       andY:(NSInteger)fromY
                        toX:(NSInteger)toX
                       andY:(NSInteger)toY;

- (instancetype)initWithPieceType:(ChessPieceType)aType
                      movingFromX:(NSInteger)fromX
                             andY:(NSInteger)fromY
                              toX:(NSInteger)toX
                             andY:(NSInteger)toY;

- (NSRect)moveStepWithOriginSquare:(NSRect)originRect
                     andSquareSize:(CGFloat)squareSize;

- (BOOL)stopped;

@end
