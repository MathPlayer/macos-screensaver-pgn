//
//  GameManager.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 17/05/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

static NSDictionary *_enPassantMoves;
static NSDictionary *_castlingMoves;

+ (void)initialize {
    _castlingMoves = @{@"e1c1": @"Ra1d1",
                       @"e8c8": @"Ra8d8",
                       @"e1g1": @"Rh1f1",
                       @"e8g8": @"Rh8f8"};

    NSMutableDictionary *enPassantDictionary = [NSMutableDictionary dictionary];
    for (NSInteger columnDiff = 0; columnDiff <= 1; columnDiff++) {
        for (unichar col1 = COLUMN_FIRST + columnDiff; col1 < COLUMN_LAST + columnDiff; col1++) {
            NSString *fst, *snd;
            unichar col2 = col1 + (1 - 2 * columnDiff);

            fst = [NSString stringWithFormat:@"%c%c%c%c", col1, LINE_2, col1, LINE_4];
            snd = [NSString stringWithFormat:@"%c%c%c%c", col2, LINE_4, col1, LINE_3];
            enPassantDictionary[snd] = fst;

            fst = [NSString stringWithFormat:@"%c%c%c%c", col1, LINE_7, col1, LINE_5];
            snd = [NSString stringWithFormat:@"%c%c%c%c", col2, LINE_5, col1, LINE_6];
            enPassantDictionary[snd] = fst;
        }
    }
    _enPassantMoves = [NSDictionary dictionaryWithDictionary:enPassantDictionary];
}

+ (instancetype)managerWithFile:(NSString *)filename
{
    return [[self alloc] initWithFile:filename];
}

- (instancetype)initWithFile:(NSString *)filename
{
#pragma unused(filename)
    self = [super init];
    if (self) {
        NSURL *gameURL = [[NSBundle bundleForClass:self.class] URLForResource:[filename stringByDeletingPathExtension]
                                                                withExtension:[filename pathExtension]];
        NSString *gameMoves = [NSString stringWithContentsOfURL:gameURL
                                                       encoding:NSUTF8StringEncoding
                                                          error:nil];
        ChessPieceColor colorToMove = WHITE;
        NSMutableArray<Move *> *readMoves = [NSMutableArray array];
        NSString *prevMoveString;
        for (NSString *moveString in [gameMoves componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]) {
            // NSString componentsSeparatedByCharactersInSet: is returning empty strings
            // if there are consecutive characters from the set
            if (moveString.length == 0) {
                continue;
            }
            NSString *castlingMove = _castlingMoves[moveString];
            if (castlingMove) {
                [readMoves addObject:[Move moveFromString:[@"K" stringByAppendingString:moveString]
                                                 andColor:colorToMove]];
                [readMoves addObject:[Move moveFromString:castlingMove
                                                 andColor:colorToMove]];
            } else {
                [readMoves addObject:[Move moveFromString:moveString
                                                 andColor:colorToMove
                                              isEnPassant:[_enPassantMoves[moveString] isEqualToString:prevMoveString]]];
            }
            if (colorToMove == WHITE) {
                colorToMove = BLACK;
            } else {
                colorToMove = WHITE;
            }
            prevMoveString = moveString;
        }
        _moves = [NSArray arrayWithArray:readMoves];
    }

    return self;
}

@end
