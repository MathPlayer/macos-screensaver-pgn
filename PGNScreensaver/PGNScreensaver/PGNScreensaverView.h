//
//  PGNScreensaverView.h
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 23/02/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import "ChessBoard.h"

#import <ScreenSaver/ScreenSaver.h>

@interface PGNScreensaverView : ScreenSaverView {
    ChessBoard *_board;
    NSUInteger _idleFrameCounter;
    IBOutlet NSPanel *_optionsSheet;
}

- (IBAction)cancelClick:(id)sender;
- (IBAction)okClick:(id)sender;

@end
