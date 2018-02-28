//
//  PGNScreensaverView.m
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 23/02/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "PGNScreensaverView.h"

#import "NSColor+BackGroundColor.h"

@implementation PGNScreensaverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        _board = [[ChessBoard alloc] init];
        drawChessBoard = YES;
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

    [NSColor.backgroundColor set];
    NSRectFill(self.frame);

    [_board drawInRect:self.frame];
    drawChessBoard = NO;
}

- (void)animateOneFrame
{
    if (drawChessBoard) {
        [self setNeedsDisplay:YES];
    }
}

- (BOOL)hasConfigureSheet
{
    return YES;
}

- (NSWindow*)configureSheet
{
    if (![_optionsSheet isKindOfClass:NSPanel.class]) {
        [[NSBundle bundleForClass:self.class] loadNibNamed:@"OptionsSheet"
                                                     owner:self
                                           topLevelObjects:nil];
    }
    
    return _optionsSheet;
}

- (IBAction)cancelClick:(id)sender
{
    [[NSApplication sharedApplication] endSheet:_optionsSheet];
}

- (IBAction)okClick:(id)sender
{
    [[NSApplication sharedApplication] endSheet:_optionsSheet];
}
@end
