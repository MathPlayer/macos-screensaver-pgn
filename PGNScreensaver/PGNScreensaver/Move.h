//
//  ChessMove.h
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 17/05/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ChessCommonDefines.h"

@interface Move : NSObject

@property (readonly) NSInteger fromX;
@property (readonly) NSInteger fromY;
@property (readonly) NSInteger toX;
@property (readonly) NSInteger toY;
@property (readonly) ChessPieceType transformed;

+ (instancetype)moveFromString:(NSString *)move;
- (instancetype)initWithMoveString:(NSString *)move;

@end
