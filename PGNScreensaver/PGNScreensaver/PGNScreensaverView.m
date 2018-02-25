//
//  PGNScreensaverView.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 23/02/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "PGNScreensaverView.h"

#import "NSColor+ChessBoardColor.h"

@implementation PGNScreensaverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    // TODO: check if a call for this method is needed for each frame
    [self drawChessBoard];
}

- (void)drawChessBoard
{
    CGFloat minDimension = self.frame.size.width;
    if (minDimension > self.frame.size.height) {
        minDimension = self.frame.size.height;
    }
    // Use only 3/4 of the minDimension
    minDimension *= 0.75;

    CGPoint bottomLeft = CGPointMake(self.frame.size.width / 2 - minDimension / 2,
                                     self.frame.size.height / 2 - minDimension / 2);
    CGFloat sqSize = minDimension / 8;

    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            NSRect r = NSMakeRect(bottomLeft.x + i * sqSize,
                                  bottomLeft.y + j * sqSize,
                                  sqSize,
                                  sqSize);
            if ((i + j) % 2) {
                [NSColor.chessBoardBrownDarkColor set];
            } else {
                [NSColor.chessBoardBrownLightColor set];
            }
            NSRectFill(r);
        }
    }
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
