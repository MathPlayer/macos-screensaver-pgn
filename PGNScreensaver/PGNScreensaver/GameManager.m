//
//  GameManager.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 17/05/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager


static NSDictionary *_castlingMoves;

+ (void)initialize {
    _castlingMoves = @{@"e1c1": @"a1d1",
                       @"e8c8": @"a8d8",
                       @"e1g1": @"h1f1",
                       @"e8g8": @"h8f8"};
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
        // NSString *hardcodedMoves = @"e2e4 c7c6 d2d4 d7d5 Nb1c3 d5e4 c3e4 Nb8d7 Qd1e2 Ng8f6 Ne4d6";
        NSMutableArray<Move *> *readMoves = [NSMutableArray array];
        for (NSString *moveString in [hardcodedMoves componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]) {
            [readMoves addObject:[Move moveFromString:moveString]];
            NSString *extraMove = _castlingMoves[moveString];
            if (extraMove) {
                [readMoves addObject:[Move moveFromString:extraMove]];
            }
        }
        _moves = [NSArray arrayWithArray:readMoves];
    }

    return self;
}

@end
