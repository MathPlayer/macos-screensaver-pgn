//
//  MovingPiece.h
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 17/05/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ChessCommonDefines.h"
#import "Move.h"

@interface MovingPiece : NSObject {
    NSUInteger _stepCount;
    NSUInteger _stepTotal;
}

@property (readonly) ChessPieceType type;
@property (readonly) Move *move;

+(instancetype)pieceWithType:(ChessPieceType)type
                     andMove:(NSString *)move;

- (instancetype)initWithPieceType:(ChessPieceType)type
                          andMove:(NSString *)move;

- (NSRect)moveStepWithOriginSquare:(NSRect)originRect
                     andSquareSize:(CGFloat)squareSize;

- (BOOL)stopped;

@end
