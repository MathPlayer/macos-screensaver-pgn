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
        _idleFrameCounter = 0;
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
}

- (void)animateOneFrame
{
    if ([_board needsDisplay]) {
        [self setNeedsDisplay:YES];
    } else if (_idleFrameCounter >= 60){
        [_board startMove];
        _idleFrameCounter = 0;
    } else {
        _idleFrameCounter++;
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
