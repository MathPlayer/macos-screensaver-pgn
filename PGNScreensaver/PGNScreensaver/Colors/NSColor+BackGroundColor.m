//
//  NSColor+BackGroundColor.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 25/02/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "NSColor+BackGroundColor.h"

@implementation NSColor (BackGroundColor)

+ (NSColor *)backgroundColor
{
    static NSColor *backgroundColor;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        backgroundColor = [NSColor colorWithRed:25.5 / 255.0
                                          green:25.5 / 255.0
                                           blue:25.5 / 255.0
                                          alpha:1.0];
    });

    return backgroundColor;
}

@end
