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

@property (readonly) ChessPieceType type;
@property (readonly) NSInteger fromLine;
@property (readonly) NSInteger fromColumn;
@property (readonly) NSInteger toLine;
@property (readonly) NSInteger toColumn;
@property (readonly) ChessPieceType transformed;
@property (readonly) BOOL enPassant;

+ (instancetype)moveFromString:(NSString *)move
                      andColor:(ChessPieceColor)color;

+ (instancetype)moveFromString:(NSString *)move
                      andColor:(ChessPieceColor)color
                   isEnPassant:(BOOL)flag;

- (instancetype)initWithMoveString:(NSString *)move
                          andColor:(ChessPieceColor)color
                       isEnPassant:(BOOL)flag;

@end
