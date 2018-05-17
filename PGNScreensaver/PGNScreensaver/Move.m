//
//  ChessMove.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 17/05/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "Move.h"

@implementation Move

+ (instancetype)moveWithString:(NSString *)move
{
    return [[self alloc] initWithMoveString:move];
}

- (instancetype)initWithMoveString:(NSString *)move
{
    if (move.length < 4) {
        return nil;
    }

    self = [super init];
    if (self) {
        _fromY = [[move lowercaseString] UTF8String][0] - 'a';
        _fromX = [move UTF8String][1] - '1';
        _toY = [[move lowercaseString] UTF8String][2] - 'a';
        _toX = [move UTF8String][3] - '1';
        if (move.length > 4) {
            switch ([[move uppercaseString] UTF8String][4]) {
                case 'N':
                    _transformed = KNIGHT;
                    break;

                case 'B':
                    _transformed = BISHOP;
                    break;

                case 'R':
                    _transformed = ROOK;
                    break;

                case 'Q':
                    _transformed = QUEEN;
                    break;

                case 'K':
                    _transformed = KING;
                    break;
            }
        }
    }

    return self;
}

@end
