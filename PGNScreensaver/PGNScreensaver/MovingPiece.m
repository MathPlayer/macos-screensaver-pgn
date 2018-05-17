//
//  MovingPiece.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 17/05/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "MovingPiece.h"

@implementation MovingPiece

+(instancetype)pieceOfType:(ChessPieceType)type
               movingFromX:(NSInteger)fromX
                      andY:(NSInteger)fromY
                       toX:(NSInteger)toX
                      andY:(NSInteger)toY
{
    return [[self alloc] initWithPieceType:type movingFromX:fromX andY:fromY toX:toX andY:toY];
}

- (instancetype)initWithPieceType:(ChessPieceType)type
                      movingFromX:(NSInteger)fromX
                             andY:(NSInteger)fromY
                              toX:(NSInteger)toX
                             andY:(NSInteger)toY
{
    self = [super init];
    if (self) {
        _fromX = fromX;
        _toX = toX;
        _fromY = fromY;
        _toY = toY;
        _type = type;
        _stepCount = 0;
        _stepTotal = 10;
    }
    return self;
}

- (NSRect)moveStepWithOriginSquare:(NSRect)originRect andSquareSize:(CGFloat)squareSize
{
    if (_stepCount >= _stepTotal) {
        return NSOffsetRect(originRect, squareSize * _toX, squareSize * _toY);
    }
    _stepCount++;
    return NSOffsetRect(originRect,
                        squareSize * (_fromX + (CGFloat)(_toX - _fromX) * _stepCount / _stepTotal),
                        squareSize * (_fromY + (CGFloat)(_toY - _fromY) * _stepCount / _stepTotal));
}

- (BOOL)stopped
{
    return _stepCount >= _stepTotal;
}

@end
