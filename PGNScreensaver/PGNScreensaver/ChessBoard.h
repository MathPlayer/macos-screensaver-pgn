//
//  ChessBoard.h
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 25/02/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ChessCommonDefines.h"

@interface ChessBoard : NSObject {
    ChessPieceType _board[8][8];

    // Use values from ChessPieceType enum as keys
    NSDictionary<NSNumber *, NSImage *> *_images;
}

@property (readonly) BOOL needsDisplay;

- (void)setInitialPosition;
- (void)loadImages;
- (void)drawInRect:(CGRect)rect;

@end
