//
//  BookPage.m
//  SpaceViking
//
//  Created by Bill Martin on 3/2/12.
//  Copyright (c) 2012 SmarTots. All rights reserved.
//

#import "BookPage.h"
// #import "SharpLabelTTF.h"
//#import "CCNode+SFGestureRecognizers.h"

// static NSString * const UIGestureRecognizerNodeKey = @"UIGestureRecognizerNodeKey";

@implementation BookPage

-(id)init {
    self = [super init];
	if(self != nil){

        // self.isTouchEnabled = YES;
        
        /*
        // Set up batch nodes
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"kge menu.plist"];
        controlsBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"kge menu.png"];
        [self addChild:controlsBatchNode];
         */
        /*
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"kge menu thumbs.plist"];
        navBarThumbNailsBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"kge menu thumbs.png"];
        [self addChild:navBarThumbNailsBatchNode];
        */
        
        
        
        SceneTypes currentScene = [[BookManager sharedBookManager] getScene];
        SceneTypes lastScene = [[BookManager sharedBookManager] getLastScene];
        
        CCLOG(@"setting up Paging cs: %i, ls: %i",currentScene,lastScene);
        if (currentScene == kCover) {
            [self setupNextPageArrow];
            CCLOG(@"setting up ONLY Next Page Swipe");
        } else if (currentScene == lastScene) {
            [self setupPreviousPageArrow];
            CCLOG(@"setting up ONLY Previous Page Swipe");
        } else {
            [self setupNextPageArrow];
            [self setupPreviousPageArrow];
            CCLOG(@"setting up Both Next and Previous Page Swipe");
        }
        [self setupMenuRibbon];
        
        /*
        // Make sure gestures do not cancel touches in view
        UIGestureRecognizer *aGestureRecognizer;
        for (aGestureRecognizer in [[CCDirector sharedDirector] view].gestureRecognizers)
            aGestureRecognizer.cancelsTouchesInView = NO;
        */
        
    }
    return self;
}

#pragma mark -- Book Page Page Turn Methods --

-(void)setupNextPageArrow {
    /*
    CCLOG(@"setting up Next Page Arrow");
    CCMenuItemSprite *nextLabel =[CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"kge_menu_arrow.png"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"kge_menu_arrow.png"] target:self selector:@selector(nextPage)];
    if (CC_CONTENT_SCALE_FACTOR()==2) nextLabel.scale=1; else nextLabel.scale=.5;
    CCMenu *menuRight = [CCMenu menuWithItems:nextLabel, nil];
    menuRight.position = ccp(950.0f, 50.0f);
    [self addChild:menuRight z:100];
    */
}

-(void)setupPreviousPageArrow {
    /*
    CCLOG(@"setting up Previous Page Arrow");
    CCMenuItemSprite *prevLabel =[CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"kge_menu_arrow.png"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"kge_menu_arrow.png"] target:self selector:@selector(previousPage)];
    if (CC_CONTENT_SCALE_FACTOR()==2) prevLabel.scale=1; else prevLabel.scale=.5;
    prevLabel.rotation = 180.0f;
    CCMenu *menuLeft = [CCMenu menuWithItems:prevLabel, nil];
    menuLeft.position = ccp(100.0f, 50.0f);
    [self addChild:menuLeft z:100];
     */
}

-(void)setupMenuRibbon {
    /*
    CGSize screenSize = [[CCDirector sharedDirector] winSize];

    // Ribbon Background
    CCSprite *menuRibbon = [CCSprite spriteWithSpriteFrameName:@"kge_menu_banner.png"];
    if (CC_CONTENT_SCALE_FACTOR()==2) menuRibbon.scale=1; else menuRibbon.scale=.5;
    [menuRibbon setTag:kMenuRibbon];
    [menuRibbon setPosition: ccp(screenSize.width/2, -menuRibbon.boundingBox.size.height/2)];
    [self addChild:menuRibbon z:100];
    menuUp = NO;
    
    
    //Ribbon ScrollLayer
    NSMutableArray *menuThumbs = [NSMutableArray new];
    //NSArray *frameNames = [self loadPlistForMenuThumbnails];
 
    CCScrollLayer *scroller = [CCScrollLayer scrollLayer];
    
    double wid;
    if (CC_CONTENT_SCALE_FACTOR()==2) wid=125; else wid=250;
    
    CGSize pgecontentSize = CGSizeMake(screenSize.width, wid );
    [scroller setContentSize:pgecontentSize];

    scroller.position = ccp(scroller.position.x,-wid);
    
    scroller.minScrollPosition = -1;
    scroller.maxScrollPosition = 3;
    
    scroller.direction = CCScrollLayerDirectionHorizontal;
    
    [self addChild:scroller z:100 tag:kMenuScroller];
    
    
    // 022414 - notes - don't like this menu - can't swipe the thumbnails...
    
    
    //CCLOG(@"frame names: %@",frameNames);
    int x=1;
    while (x<9) {
        if (x==6 || x == 8) {
            x++;
            continue;
        }
        //CCLayer *thislayer = [[CCLayer alloc] init];
        CCMenuItemSprite *thisThumb =[CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"kge_menu_thumb_%i.png",x]] selectedSprite:[CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"kge_menu_thumb_%i.png",x]] target:self selector:@selector(thumbClicked:)];
        [thisThumb setTag:x+3000];
        //if (CC_CONTENT_SCALE_FACTOR()==2) thisThumb.scale=1; else thisThumb.scale=.5;

        //[self addChild:thislayer z:100];
        //CCLOG(@"thumb: %@",thumb);
        //CCLOG(@"thisThumbSize: %.2f, %.2f",thisThumb.boundingBox.size.width,thisThumb.boundingBox.size.height);
        //CCLOG(@"thisMenuSize: %.2f, %.2f",thisMenu.boundingBox.size.width,thisMenu.boundingBox.size.height);
        //CCLOG(@"thisLayerSize: %.2f, %.2f",thislayer.boundingBox.size.width,thislayer.boundingBox.size.height);
        
        [menuThumbs addObject:thisThumb];
        //[thislayer release];
        //CCSprite* sprite = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"kge_menu_thumb_%i.png",x]];
        //if (CC_CONTENT_SCALE_FACTOR()==2) sprite.scale=1; else sprite.scale=.5;
        //sprite.position = ccp( x * scroller.spacing, 50 );
        //[ scroller addChild:sprite ];
        x++;
    }

    
    CCMenu *thisMenu = [CCMenu menuWithArray:menuThumbs];
    [thisMenu alignItemsHorizontallyWithPadding:100.0];
    [thisMenu setPosition:ccp(screenSize.width/2,50)];
    [scroller addChild:thisMenu];
    [menuThumbs release];
    

     
     
    // Crown Button
    CCMenuItemSprite *crownButton =[CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithSpriteFrameName:@"kge_menu_0002_crown-flat.png"] selectedSprite:[CCSprite spriteWithSpriteFrameName:@"kge_menu_0002_crown-flat.png"] target:self selector:@selector(crownClicked)];
    [crownButton setTag:kMenuCrownButton];
    if (CC_CONTENT_SCALE_FACTOR()==2) crownButton.scale=1; else crownButton.scale=.5;
    CCMenu *menuCrown = [CCMenu menuWithItems:crownButton, nil];
    menuCrown.position = CGPointMake(screenSize.width/2, crownButton.boundingBox.size.height/2);
    [self addChild:menuCrown z:100 tag:kMenuCrownMenu];
  */
}

/*
-(void)thumbClicked:(CCMenuItemImage *)sender {
 
    CCLOG(@"thumb clicked: %i",sender.tag-3000);
    [[BookManager sharedBookManager] gotoPage:(SceneTypes)sender.tag-3000];
 
}
*/

-(void)nextPage {
    [[BookManager sharedBookManager] nextPage];
}

-(void)previousPage {
    [[BookManager sharedBookManager] previousPage];
}

-(void)crownClicked {
    CCLOG(@"Crown Clicked");
    if (menuUp == YES) {
        menuUp = NO;
        [self moveMenuRibbon:1];
    } else {
        menuUp = YES;
        [self moveMenuRibbon:0];
    }

}

#pragma mark -- Book Page Ribbon and Page Selection Menu Methods --
-(void)moveMenuRibbon:(int)direction {
    /*
    double wid;
    if (CC_CONTENT_SCALE_FACTOR()==2) wid=125; else wid=250;
    
    CCSprite *menuRibbon = (CCSprite *)[self getChildByTag:kMenuRibbon];
    //CCMenu *menuCrown = (CCMenu *)[self getChildByTag:kMenuCrownMenu];
    //CCSprite *menuCrownButton = (CCSprite*)[menuCrown getChildByTag:kMenuCrownButton];
    CCScrollLayer *menuScroller = (CCScrollLayer*)[self getChildByTag:kMenuScroller];
    
    float ribbonHeight = menuRibbon.boundingBox.size.height;
    //float crownHeight = menuCrownButton.boundingBox.size.height;
    
    //float crownBottom = crownHeight/2;
    //float crownTop = ribbonHeight;
    
    float ribbonTop = 143.0f;
    float ribbonBottom = -(ribbonHeight/2);
    
    float scrollerTop = 88.0f;
    float scrollerBottom = -(wid);
    
    id ribbonTranslate;
    //id crownTranslate;
    id scrollerTranslate;
    
    if (direction == 0) {
        ribbonTranslate = [CCMoveTo actionWithDuration:1.0f position:ccp(menuRibbon.position.x,ribbonTop)];
        //crownTranslate = [CCMoveTo actionWithDuration:1.0f position:ccp(menuCrown.position.x,crownTop)];
        scrollerTranslate = [CCMoveTo actionWithDuration:1.0f position:ccp(menuScroller.position.x,scrollerTop)];
    } else {
        ribbonTranslate = [CCMoveTo actionWithDuration:1.0f position:ccp(menuRibbon.position.x,ribbonBottom)];
        //crownTranslate = [CCMoveTo actionWithDuration:1.0f position:ccp(menuCrown.position.x,crownBottom)];
        scrollerTranslate = [CCMoveTo actionWithDuration:1.0f position:ccp(menuScroller.position.x,scrollerBottom)];
    }
    

    id ease = [CCEaseInOut actionWithAction:ribbonTranslate rate:2];
    //id ease2 = [CCEaseInOut actionWithAction:crownTranslate rate:2.5];
    id ease3 = [CCEaseInOut actionWithAction:scrollerTranslate rate:2.5];

    [menuRibbon runAction:ease];
    //[menuCrown runAction:ease2];
    [menuScroller runAction:ease3];
     */
}


#pragma mark -- Book Page Sound Bird Methods --
-(void) menuLayerSoundBirdToggle {
    /*
    CCSprite *soundBird = (CCSprite *)[self getChildByTag:kMenuRibbonSoundBird];
    
    [[BookManager sharedBookManager] playCurrentPageSound];
    soundBird.visible = ! soundBird.visible;
     */
}

// ** Touch Methods for Sound Bird in BookPage? **
/*
 -(void) registerWithTouchDispatcher
 {
 //	[[[CCDirector sharedDirector] touchDispatcher]  addTargetedDelegate:self priority:0 swallowsTouches:NO];
 [[[CCDirector sharedDirector] touchDispatcher]  addStandardDelegate:self priority:0];
 }
 
 -(void)ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent *)event {
 }
 
 
 -(void) ccTouchesEnded:(NSSet*)touches withEvent:(UIEvent *)event {
 UITouch * touch;
 
 for (touch in touches) {
 CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
 
 CCSprite *soundBird = (CCSprite *)[self getChildByTag:kMenuRibbonSoundBird];
 if (CGRectContainsPoint(soundBird.boundingBox, touchLocation)) {
 [self menuLayerSoundBirdToggle];
 }
 }
 }
 
 
 -(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
 return (TRUE);
 }
 
 
 -(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
 CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
 
 CCSprite *soundBird = (CCSprite *)[self getChildByTag:kMenuRibbonSoundBird];
 if (CGRectContainsPoint(soundBird.boundingBox, touchLocation)) {
 [self menuLayerSoundBirdToggle];
 }
 }
 */
// ** End Touch Methods for Sound Bird in Book Page **

#pragma mark -- Book Page Setup Core Methods --
-(NSArray *)loadPlistForMenuThumbnails {
    NSString *fullFileName = [NSString stringWithFormat:@"kge menu thumbs.plist"];
    NSString *plistPath;
    
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:fullFileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"kge menu thumbs" ofType:@"plist"];
    }
    
    NSDictionary *plistDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    if (plistDictionary == nil) {
        CCLOG(@"Error reading plist:kge menu thumbs.plist");
        return  nil;
    }
    
    NSDictionary *thumbDictionary = [plistDictionary objectForKey:@"frames"];
    if (thumbDictionary == nil) {
        CCLOG(@"Text Dictionary: Could not Locate frames array in kge menu thumbs");
        return nil;
    }
    
    NSArray *frameNames = [thumbDictionary allKeys];

    return frameNames;
}

-(CCAnimation *)loadPlistForAnimationWithName:(NSString *)animationName andClassName:(NSString *)className {

    NSString *fullFileName = [NSString stringWithFormat:@"%@.plist",className];
    NSString *plistPath;
    
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:fullFileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:className ofType:@"plist"];
    }
    
    NSDictionary *plistDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    if (plistDictionary == nil) {
        CCLOG(@"Error reading plist:%@.plist",className);
        return  nil;
    }
    
    NSDictionary *animationSettings = [plistDictionary objectForKey:animationName];
    if (animationSettings == nil) {
        CCLOG(@"Could not Locate AnimationWithName:%@",animationName);
        return nil;
    }
    
    float animationDelay = [[animationSettings objectForKey:@"delay"] floatValue];
    CCAnimation *animationToReturn = nil;
    animationToReturn = [CCAnimation animation];
    [animationToReturn setDelayPerUnit:animationDelay];
    
    NSString *animationNamePrefix = [animationSettings objectForKey:@"filenamePrefix"];
    NSString *animationFrames = [animationSettings objectForKey:@"animationFrames"];
    NSArray *animationFrameNumbers = [animationFrames componentsSeparatedByString:@","];
    
    for (NSString *frameNumber in animationFrameNumbers) {
        NSString *frameName = [NSString stringWithFormat:@"%@%@.png",animationNamePrefix,frameNumber];
        [animationToReturn addSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frameName]];
    }
    return animationToReturn;
}

-(NSDictionary *)loadPlistForTextForPage:(NSString *)pageName {
    NSString *fullFileName = [NSString stringWithFormat:@"KGE_textForPages_English.plist"];
    NSString *plistPath;
    
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:fullFileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"KGE_textForPages_English" ofType:@"plist"];
    }
    
    NSDictionary *plistDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    if (plistDictionary == nil) {
        CCLOG(@"Error reading plist:KGE_textForPages_English.plist");
        return  nil;
    }
    
    NSDictionary * pageDictionary = [plistDictionary objectForKey:pageName];
    if (pageDictionary == nil) {
        CCLOG(@"Text Dictionary: Could not Locate Text For Page:%@",pageDictionary);
        return nil;
    }
    
    return pageDictionary;
    
}

-(void) setupTextForPageName:(NSString*)pageName {
    // Text
    NSDictionary *thisPageText = [self loadPlistForTextForPage:pageName];
    
    for (id key in [thisPageText allKeys]) {
        
        // Get each text by key and put into NSDictionary thisText
        id value = [thisPageText objectForKey:key];
        if ([value isKindOfClass:[NSDictionary class]]) {
            NSDictionary* thisText = (NSDictionary*)value;
            
            NSString *theText = [thisText objectForKey:@"text"];
            NSString *theFont = [thisText objectForKey:@"font"];
            
            NSNumber *theTag = [thisText objectForKey:@"tag"];
            NSDictionary* thisTextData = (NSDictionary*)[thisText objectForKey:@"textData"];
            // CCLOG(@"thisTextData:%@",thisTextData);
            
            
            NSNumber *xloc = [thisTextData objectForKey:@"xloc"];
            NSNumber *yloc = [thisTextData objectForKey:@"yloc"];
            float labelWidth=0.0;
            float labelHeight=0.0;
            {labelWidth = [[thisTextData objectForKey:@"labelWidth"] floatValue];}
            {labelHeight = [[thisTextData objectForKey:@"labelHeight"] floatValue];}
            
            float fontSize = [[thisTextData objectForKey:@"fontSize"] floatValue];
            
            GLubyte cc1 = [[thisTextData objectForKey:@"ccc1"] floatValue];
            GLubyte cc2 = [[thisTextData objectForKey:@"ccc2"] floatValue];
            GLubyte cc3 = [[thisTextData objectForKey:@"ccc3"] floatValue];
            
            NSNumber *fontOpacity = [thisTextData objectForKey:@"opacity"];
            /*
            SharpLabelTTF *theKingLabel = [SharpLabelTTF labelWithString:theText  fontName:theFont fontSize:fontSize];
            theKingLabel.color = ccc3(cc1,cc2,cc3);
            [theKingLabel setPosition: ccp([xloc floatValue], [yloc floatValue])];
            [theKingLabel setOpacity:[fontOpacity floatValue]];
            [theKingLabel setDimensions:CGSizeMake(labelWidth, labelHeight)];
            [theKingLabel setTag:[theTag integerValue]];
            [self addChild:theKingLabel];
             */
        }
        
    }
}

#pragma mark -- Book Page Utilities --
-(void) setPositionRelativeToParentPosition:(CGPoint)pos forNode:(CCNode*)node
{
    if (node == nil) node = self;
    CGPoint parentAP = node.parent.anchorPoint;
    CGSize parentCS = node.parent.contentSize;
    node.position = ccp(parentCS.width * parentAP.x + pos.x,
                        parentCS.height * parentAP.y + pos.y);
}

-(void)fadeInText:(CCNode*)textNode {
    /*
    id fadeTextIn = [CCFadeIn actionWithDuration:0.5f];
    [textNode runAction:fadeTextIn];
     */
}

-(CGFloat) distanceBetweenPoints: (CGPoint) p1 otherPoint:(CGPoint) p2
{
    CGFloat dx = fabs(p2.x - p1.x);
    CGFloat dy = fabs(p2.y - p1.y);
    return sqrt(dx*dx + dy*dy);
}


@end
