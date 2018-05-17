//
//  GameManager.h
//  PGNScreensaver
//
//  Created by Bogdan Constantin Popescu on 17/05/2018.
//  Copyright © 2018 MathPlayer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Move.h"

@interface GameManager : NSObject

+ (instancetype)managerWithFile:(NSString *)filename;
- (instancetype)initWithFile:(NSString *)filename;

@property (readonly) NSArray<Move *> *moves;

@end
