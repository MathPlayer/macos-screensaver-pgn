//
//  ChessMove.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 17/05/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "Move.h"

@implementation Move

static NSCharacterSet *_nonPawnLetters;

+ (void)initialize
{
    _nonPawnLetters = [NSCharacterSet characterSetWithCharactersInString:@"BNRQK"];
}

+ (instancetype)moveFromString:(NSString *)move
                      andColor:(ChessPieceColor)color
{
    return [self moveFromString:move andColor:color isEnPassant:NO];
}

+ (instancetype)moveFromString:(NSString *)move
                      andColor:(ChessPieceColor)color
                   isEnPassant:(BOOL)flag;
{
    return [[self alloc] initWithMoveString:move
                                   andColor:color
                                isEnPassant:flag];
}

- (instancetype)initWithMoveString:(NSString *)move
                          andColor:(ChessPieceColor)color
                       isEnPassant:(BOOL)flag
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
            ChessPieceType nonPawnType = NONE;
            switch ([move characterAtIndex:nonPawnRange.location]) {
                case 'B':
                    nonPawnType = BISHOP;
                    break;
                case 'N':
                    nonPawnType = KNIGHT;
                    break;
                case 'R':
                    nonPawnType = ROOK;
                    break;
                case 'Q':
                    nonPawnType = QUEEN;
                    break;
                case 'K':
                    nonPawnType = KING;
                    break;
            }

            if (nonPawnRange.location != 0) {
                _transformed = nonPawnType + color;
                _type = PAWN + color;
            } else {
                // Moving a non-pawn piece, skip piece letter
                coordIndex = 1;
                _type = nonPawnType + color;
            }
        } else {
            _type = PAWN + color;
        }

        _fromColumn = [move characterAtIndex:coordIndex] - COLUMN_A;
        _fromLine = [move characterAtIndex:coordIndex + 1] - LINE_1;
        _toColumn = [move characterAtIndex:coordIndex + 2] - COLUMN_A;
        _toLine = [move characterAtIndex:coordIndex + 3] - LINE_1;

        _enPassant = flag;
    }

    return self;
}

@end
