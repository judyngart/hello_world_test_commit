//
//  BookPage.h
//  SpaceViking
//
//  Created by Bill Martin on 3/2/12.
//  Copyright (c) 2012 SmarTots. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCAnimation.h"
#import "CCBuilderReader.h"

// #import "Cocos2dTags.h"
// #import "CommonProtocols.h"
#import "BookManager.h"
// #import "SimpleAudioEngine.h"
// #import "CCScrollLayer.h"

@interface BookPage :  CCScene { // CCScene { //<UIGestureRecognizerDelegate> {
    ALuint pageTextSoundID;
    // CCSpriteBatchNode *navBarThumbNailsBatchNode;
    // CCSpriteBatchNode *controlsBatchNode;
    BOOL menuUp;
}

-(CCAnimation *)loadPlistForAnimationWithName:(NSString *)animationName andClassName:(NSString *)className;
-(NSDictionary *)loadPlistForTextForPage:(NSString *)pageName;
-(void) setupTextForPageName:(NSString*)pageName;
-(void) setPositionRelativeToParentPosition:(CGPoint)pos forNode:(CCNode*)node;
-(void)fadeInText:(CCNode*)textNode;
-(CGFloat) distanceBetweenPoints: (CGPoint) p1 otherPoint:(CGPoint) p2;

@end
