//
//  GameManager.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 17/05/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

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
        //     -Wlalg -V -C -N --nochecks -w9999 -7 --nomovenumbers --noresults
        // NSString *hardcodedMoves = @"e2e4 e7e5 g1f3 d7d6 d2d4 c8g4 d4e5 g4f3 d1f3 d6e5 f1c4 g8f6 f3b3 d8e7 b1c3 c7c6 c1g5 b7b5 c3b5 c6b5 c4b5 b8d7 e1c1 a8d8 d1d7 d8d7 h1d1 e7e6 b5d7 f6d7 b3b8 d7b8 d1d8";
        NSString *hardcodedMoves = @"e2e4 c7c6 d2d4 d7d5 b1c3 d5e4 c3e4 b8d7 d1e2 g8f6 e4d6";
        NSMutableArray<Move *> *readMoves = [NSMutableArray array];
        for (NSString *moveString in [hardcodedMoves componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]) {
            [readMoves addObject:[Move moveWithString:moveString]];
        }
        _moves = [NSArray arrayWithArray:readMoves];
    }

    return self;
}

@end
