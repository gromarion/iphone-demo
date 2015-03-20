//
//  Monster.m
//  Cocos2DSimpleGame
//
//  Created by German Romarion on 20/3/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Monster.h"

@implementation Monster

- (id)init
{
//    CGSize screen = [[CCDirector sharedDirector] winSize];
    if( (self = [super init]) )
    {
        //CGSize screenSize = [CCDirector sharedDirector].winSize;
        [super ]
    }
    return self;
}

- (void) update:(CCTime)delta
{
    self.position = ccp(self.position.x - 0.01*delta, self.position.y);
}

@end