//
//  MovingPiece.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 17/05/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "MovingPiece.h"

@implementation MovingPiece

+(instancetype)pieceWithType:(ChessPieceType)type
                     andMove:(Move *)move;
{
    return [[self alloc] initWithPieceType:type andMove:move];
}

- (instancetype)initWithPieceType:(ChessPieceType)type
                          andMove:(Move *)move
{
    self = [super init];
    if (self) {
        _move = move;
        _stepCount = 0;
        _stepTotal = 10;
    }
    return self;
}

- (NSRect)moveStepWithOriginSquare:(NSRect)originRect andSquareSize:(CGFloat)squareSize
{
    if (_stepCount >= _stepTotal) {
        return NSOffsetRect(originRect, squareSize * _move.toColumn, squareSize * _move.toLine);
    }
    _stepCount++;
    return NSOffsetRect(originRect,
                        squareSize * (_move.fromColumn + (CGFloat)(_move.toColumn - _move.fromColumn) * _stepCount / _stepTotal),
                        squareSize * (_move.fromLine + (CGFloat)(_move.toLine - _move.fromLine) * _stepCount / _stepTotal));
}

- (BOOL)stopped
{
    return _stepCount >= _stepTotal;
}

@end
