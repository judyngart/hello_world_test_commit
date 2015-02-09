//
//  Gameplay.m
//  penguins2
//
//  Created by Dev on 2014-08-09.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay
{
    CCPhysicsNode *_physicsNode;  // a private member var???
    CCNode *_catapultArm;
    CCNode *_levelNode;
}

// called when CCB file has completed loading
-(void)didLoadFromCCB
{
    // tell this scene to accept touches
    self.userInteractionEnabled = TRUE;
    
    // load level1
    CCScene *level = [CCBReader load:@"Levels/Level1"];
    [_levelNode addChild:level];
    
    
}

// called on every touch in this scene
-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    [self launchPenguin];
}

-(void)launchPenguin
{
    // loads the Penguin.ccp we have set up in Spritebuilder
    CCNode* penguin = [CCBReader load:@"Penguin"];
    
    // position the penguin at the bowl of the catapult
    penguin.position = ccpAdd(_catapultArm.position, ccp(16,50));
    
    // add the penguin to the physicsNode of this scene (because it has physics enabled
    [_physicsNode addChild:penguin];
    
    // manually create and apply a force to launch the penguin
    CGPoint launchDirection = ccp(1,0);
    CGPoint force = ccpMult(launchDirection, 1000); // 8000
    [penguin.physicsBody applyForce:force];
}

@end
