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
    ChessBoard *board;
    BOOL drawChessBoard;
}

@end
