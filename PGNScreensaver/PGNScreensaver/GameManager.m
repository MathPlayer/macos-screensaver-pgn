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
        // TODO: load a PGN file from filename and parse a similar content to this hardcoded one
        // Content extracted from output of command:
        // ./pgn-extract ../macos-screensaver-pgn/DefaultGame.pgn
        //     -Welalg -V -C -N --nochecks -w9999 -7 --nomovenumbers --noresults
        NSString *hardcodedMoves = @"e2e4 e7e5 Ng1f3 d7d6 d2d4 Bc8g4 d4e5 Bg4f3 Qd1f3 d6e5 Bf1c4 Ng8f6 Qf3b3 Qd8e7 Nb1c3 c7c6 Bc1g5 b7b5 Nc3b5 c6b5 Bc4b5 Nb8d7 e1c1 Ra8d8 Rd1d7 Rd8d7 Rh1d1 Qe7e6 Bb5d7 Nf6d7 Qb3b8 Nd7b8 Rd1d8";

        // TODO: add as tests for this class the ones below
        // NSString *hardcodedMoves = @"e2e4 c7c6 d2d4 d7d5 Nb1c3 d5e4 c3e4 Nb8d7 Qd1e2 Ng8f6 Ne4d6";
        // NSString *hardcodedMoves = @"b2b4 g7g5 b4b5 g5g4 h2h4 g4h3 a2a3 c7c5
        // NSString *hardcodedMoves = @"a2a8Q b7b1R";
        ChessPieceColor colorToMove = WHITE;
        NSMutableArray<Move *> *readMoves = [NSMutableArray array];
        NSString *prevMoveString;
        for (NSString *moveString in [hardcodedMoves componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]) {
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
