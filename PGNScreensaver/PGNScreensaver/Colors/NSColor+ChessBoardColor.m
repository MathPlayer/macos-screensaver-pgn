//
//  NSColor+NSColor_ChessBoardColor.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 23/02/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "NSColor+ChessBoardColor.h"

@implementation NSColor (ChessBoardColor)

+ (NSColor *)chessBoardBrownLightColor
{
    static NSColor *chessBoardBrownLightColor;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        chessBoardBrownLightColor = [NSColor colorWithRed:240.0 / 255.0
                                                    green:218.0 / 255.0
                                                     blue:181.0 / 255.0
                                                    alpha:1.0];
    });

    return chessBoardBrownLightColor;
}

+ (NSColor *)chessBoardBrownDarkColor
{
    static NSColor *chessBoardBrownDarkColor;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        chessBoardBrownDarkColor = [NSColor colorWithRed:181.0 / 255.0
                                                   green:136.0 / 255.0
                                                    blue:99.0 / 255.0
                                                   alpha:1.0];
    });

    return chessBoardBrownDarkColor;
}
@end
