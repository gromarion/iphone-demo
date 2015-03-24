//
//  Monster.m
//  Cocos2DSimpleGame
//
//  Created by German Romarion on 20/3/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>
#import "cocos2d.h"
#import "Monster.h"

@implementation Monster

- (void) update:(CCTime)delta
{
    int step = 100;
    self.position = ccp(self.position.x - step*delta, self.position.y - _y_value*delta);
    if (arc4random() % 10 == 0) {
        int lowerBound = -step;
        int upperBound = step;
        _y_value = lowerBound + arc4random() % (upperBound - lowerBound);
    }
}

@end