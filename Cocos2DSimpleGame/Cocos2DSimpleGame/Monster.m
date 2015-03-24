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

+(Monster*)spriteWithImageNamed:(NSString *)name
{
    Monster *monster = [super spriteWithImageNamed:name];
    monster.shell_radius = 40;
    CCNode *phantom_node = [[CCNode alloc] init];
    [phantom_node setAnchorPoint:ccp(monster.contentSize.width/2, monster.contentSize.height/2)];
    [monster addUpperShellToNode:phantom_node];
    [monster addLeftBottomShellToNode:phantom_node];
    [monster addRightBottomShellToNode:phantom_node];
    [monster addChild:phantom_node];
    [phantom_node runAction:[CCActionRepeatForever actionWithAction:[CCActionRotateBy actionWithDuration:0.1 angle:10]]];
     return monster;
}

- (void) update:(CCTime)delta
{
    int step = 100;
    [self setPosition: ccp(self.position.x - step*delta, self.position.y - _y_value*delta)];
    if (arc4random() % 10 == 0) {
        int lowerBound = -step;
        int upperBound = step;
        _y_value = lowerBound + arc4random() % (upperBound - lowerBound);
    }
}

- (void) addUpperShellToNode:(CCNode*)node;
{
    CCSprite *shell = [CCSprite spriteWithImageNamed:@"shell.png"];
    [shell setPosition: ccp(self.contentSize.width/2, self.contentSize.height + _shell_radius)];
    [node addChild: shell];
    [self addPhysicsToShell:shell];
}

- (void) addLeftBottomShellToNode:(CCNode*)node;
{
    CCSprite *shell = [CCSprite spriteWithImageNamed:@"shell.png"];
    [shell setPosition: ccp(self.contentSize.width/2 - _shell_radius, self.contentSize.height - _shell_radius)];
    [node addChild: shell];
    [self addPhysicsToShell:shell];
}

- (void) addRightBottomShellToNode:(CCNode*)node;
{
    CCSprite *shell = [CCSprite spriteWithImageNamed:@"shell.png"];
    [shell setPosition: ccp(self.contentSize.width/2 + _shell_radius, self.contentSize.height - _shell_radius)];
    [node addChild: shell];
    [self addPhysicsToShell:shell];
}

- (void) addPhysicsToShell:(CCNode*) shell
{
    shell.physicsBody = [CCPhysicsBody bodyWithRect:(CGRect){CGPointZero, shell.contentSize} cornerRadius:0];
    shell.physicsBody.collisionGroup = @"shellGroup";
    shell.physicsBody.collisionType  = @"shellCollision";
}

@end