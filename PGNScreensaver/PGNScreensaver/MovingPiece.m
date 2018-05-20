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
        _type = move.transformed != NONE ? move.transformed : type;
        _stepCount = 0;
        _stepTotal = 10;
    }
    return self;
}

- (NSRect)moveStepWithOriginSquare:(NSRect)originRect andSquareSize:(CGFloat)squareSize
{
    if (_stepCount >= _stepTotal) {
        return NSOffsetRect(originRect, squareSize * _move.toY, squareSize * _move.toX);
    }
    _stepCount++;
    return NSOffsetRect(originRect,
                        squareSize * (_move.fromY + (CGFloat)(_move.toY - _move.fromY) * _stepCount / _stepTotal),
                        squareSize * (_move.fromX + (CGFloat)(_move.toX - _move.fromX) * _stepCount / _stepTotal));
}

- (BOOL)stopped
{
    return _stepCount >= _stepTotal;
}

@end
