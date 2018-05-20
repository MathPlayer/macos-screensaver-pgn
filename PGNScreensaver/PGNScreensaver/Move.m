//
//  ChessMove.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 17/05/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "Move.h"

@implementation Move

static NSDictionary *_castlingMoves;
static NSDictionary *_nonPawnPieces;
static NSCharacterSet *_nonPawnLetters;

+ (void)initialize
{
    _nonPawnLetters = [NSCharacterSet characterSetWithCharactersInString:@"BNRQK"];
}

+ (instancetype)moveFromString:(NSString *)move
{
    return [[self alloc] initWithMoveString:move];
}

- (instancetype)initWithMoveString:(NSString *)move
{
    if (!move) {
        return nil;
    }

    self = [super init];
    if (self) {
        _transformed = NONE;
        NSUInteger coordIndex = 0;
        NSRange nonPawnRange = [move rangeOfCharacterFromSet:_nonPawnLetters];
        if (nonPawnRange.location != NSNotFound) {
            if (nonPawnRange.location != 0) {
                // Transforming a pawn
                switch ([move characterAtIndex:4]) {
                    case 'B':
                        _transformed = BISHOP;
                        break;
                    case 'N':
                        _transformed = KNIGHT;
                        break;
                    case 'R':
                        _transformed = ROOK;
                        break;
                    case 'Q':
                        _transformed = QUEEN;
                        break;
                }
                if ([move characterAtIndex:3] == '1') {
                    _transformed += WHITE;
                } else {
                    _transformed += BLACK;
                }
            } else {
                // Moving a non-pawn piece, skip piece letter
                coordIndex = 1;
            }
        }

        _fromY = [move characterAtIndex:coordIndex] - 'a';
        _fromX = [move characterAtIndex:coordIndex + 1] - '1';
        _toY = [move characterAtIndex:coordIndex + 2] - 'a';
        _toX = [move characterAtIndex:coordIndex + 3] - '1';
    }

    return self;
}

@end
