//
//  KGE_pg5.m
//
//  Created by Judy Choi 2013/05/17
//


#import "KGE_pg6.h"
#import "CCTextureCache.h"
// #import "TextPositioner.h"

@implementation KGE_pg6

@synthesize scissors_startTime;
static int igor_angles[] = { 17, -14, 8, -2, 10, -3, 7, -4, 9, 6, 14 };

/*
+(KGE_pg6 *) scene
{

   // CCScene *scene = [CCScene node];
    
    // CCNode *mynode = [[self alloc] init];
 	// 'layer' is an autorelease object.
	// KGE_pg6 *layer = [KGE_pg6 node];

	// add layer as a child to scene
	// [mynode addChild: layer];

    // Text Positioner Tool
	//TextPositioner *textPositionLayer = [TextPositioner node];
    
	// add layer as a child to scene
	//[scene addChild: textPositionLayer];
    //[textPositionLayer setTag:999];
    
    

    return [[self alloc] init];
}
*/

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];
    KGE_pg6 *pg6_layer = [KGE_pg6 node];
    CCNode *node_layer = [CCNode node];
    [node_layer setName:@"My_CCNodeLayer"];
    
    [scene addChild: pg6_layer];
    [scene addChild: node_layer];
    return scene;
}



-(void)dealloc
{

    
    igor_arm = NULL;
    cat = NULL;
    cat_tail = NULL;
    chicken = NULL;
    milo_armback = NULL;
    milo_armfront = NULL;
    hair = NULL;
    speech_bubble = NULL;
    
  //  [scissors_startTime release];
/*
    [[CCSpriteFrameCache sharedSpriteFrameCache] removeSpriteFramesFromFile:@"KGE_pg6_assets_0.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] removeSpriteFrameByName:@"KGE_pg6_bg.png"];
*/
    // [[CCSpriteFrameCache sharedSpriteFrameCache] purgeSharedSpriteFrameCache];

    [self removeAllChildrenWithCleanup:TRUE];
    [[CCTextureCache sharedTextureCache] dumpCachedTextureInfo];
    
    
    [[CCTextureCache sharedTextureCache] removeUnusedTextures];
    
    /*
    [[CCTextureCache sharedTextureCache] removeTextureForKey:@"KGE_pg6_assets_0.png"];
    [[CCTextureCache sharedTextureCache] removeTextureForKey:@"KGE_pg6_bg.png"];
     */
    CCLOG(@"dumped textures !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    CCTexture *tex1 = [[CCTextureCache sharedTextureCache] textureForKey:@"KGE_pg6_bg.png"];

    [[CCTextureCache sharedTextureCache] dumpCachedTextureInfo];

    
    /*
    [sceneSpriteBatchNode removeAllChildrenWithCleanup:true];
    [sceneSpriteBatchNode removeFromParentAndCleanup:true];
    sceneSpriteBatchNode = nil;
*/
  //   [super dealloc];
}



-(void) setup_sprites
{
    
    // Background
    CCSprite *backgroundImage;
    backgroundImage = [CCSprite spriteWithImageNamed:@"KGE_pg6_bg.png"];
    backgroundImage.scale=0.5;
    [backgroundImage setPosition: ccp(self.contentSize.width/2,self.contentSize.height/2)];
    [self addChild:backgroundImage];

    // Scissors
    [self scissors_resetStartTime];
    
    
    // Set up the CCSpriteFrameCache and CCSpriteBatchNode
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"KGE_pg6_assets_0.plist"];
//    sceneSpriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"KGE_pg6_assets_0.png"];
//    [self addChild:sceneSpriteBatchNode z:0];
    
    // Text
    // [self setupTextForPageName:NSStringFromClass([self class])];
    
    
    // sprites
    
    
    KGE_pg6_character *speech_bubble_sprite = [KGE_pg6_character spriteWithImageNamed:@"kge6_bubble.png"];
    [speech_bubble_sprite rescale];
    [speech_bubble_sprite setPosition: ccp (158.50,474.50)];
    [speech_bubble_sprite setName:@"SpeechBubble"];
    [speech_bubble_sprite setVisible:FALSE];
    speech_bubble = speech_bubble_sprite;
    [self addChild:speech_bubble_sprite];
    
    KGE_pg6_character *chicken_anim = [KGE_pg6_character spriteWithImageNamed:@"kge6_chicken_1.png"];
    [chicken_anim rescale];
    [chicken_anim setPosition: ccp (602.00, 599.50)];
    [chicken_anim setName:@"ChickenAnim"];
    [self addChild:chicken_anim];
    chicken = chicken_anim;


    KGE_pg6_character *milo_backarm = [KGE_pg6_character spriteWithImageNamed:@"kge6_miloArm_back_1.png"];
    [milo_backarm rescale];
    [milo_backarm setPosition: ccp (809.50,	485.00)];
    [milo_backarm setName:@"MiloBackArm"];
    [self addChild:milo_backarm];
    milo_armback = milo_backarm;
    
    KGE_pg6_character *milo = [KGE_pg6_character spriteWithImageNamed:@"kge6_milo.png"];
    [milo rescale];
    [milo setPosition: ccp (596.50,308.0)];
    [milo setName:@"Milo"];
    [self addChild:milo];

    KGE_pg6_character *hair_anim = [KGE_pg6_character spriteWithImageNamed:@"kge6_hair_1.png"];
    [hair_anim rescale];
    [hair_anim setPosition: ccp (852.50,353.5)];
    [hair_anim setName:@"HairAnim"];
    [self addChild:hair_anim];
    hair = hair_anim;
    
    
    KGE_pg6_character *milo_frontarm_sprite = [KGE_pg6_character spriteWithImageNamed:@"kge6_miloArm_front_1.png"];
    [milo_frontarm_sprite rescale];
    [milo_frontarm_sprite setPosition: ccp (701.50,434.5)];
    [milo_frontarm_sprite setName:@"MiloFrontArm"];
    [self addChild:milo_frontarm_sprite];
    milo_armfront = milo_frontarm_sprite;
    
    
    KGE_pg6_character *tail_anim = [KGE_pg6_character spriteWithImageNamed:@"kge6_tail_01.png"];
    [tail_anim rescale];
    [tail_anim setPosition: ccp (427.00,72.0)];
    [tail_anim setName:@"TailAnim"];
    [self addChild:tail_anim];
    cat_tail = tail_anim;

    KGE_pg6_character *cat_sprite = [KGE_pg6_character spriteWithImageNamed:@"kge6_cat.png"];
    [cat_sprite rescale];
    [cat_sprite setPosition: ccp (372.00, 164.50)];
    [cat_sprite setName:@"Cat"];
    [self addChild:cat_sprite];
    cat = cat_sprite;
    
    float igor_x_anchor = 0.2101515;
    float igor_y_anchor = 0.9128531;
    KGE_pg6_character *igor_arm_scissors = [KGE_pg6_character spriteWithImageNamed:@"kge6_igorArm_1.png"];
    [igor_arm_scissors rescale];
    [igor_arm_scissors setPosition: ccp(260.50,290.50)]; // ccp (310.50, 214.50)];
    [igor_arm_scissors setAnchorPoint:ccp(igor_x_anchor,igor_y_anchor)];
    [igor_arm_scissors setName:@"IgorArmAnim"];
    [self addChild:igor_arm_scissors];
    igor_arm = igor_arm_scissors;
    igor_angles_idx = 0;
    
    [self scissors_resetStartTime];
    bAfter1Second = FALSE;
    igor_hintbox1 =  CGRectMake( 158.0, 14.0, 128, 325);
    igor_hintbox2 =  CGRectMake( 200, 301.5,221, 196);
 
    /*
    // sound Bird Sprite
    CCSprite *soundBird = [CCSprite spriteWithFile:@"ribbon_parrot_patina.png"];
    [soundBird setPosition: CGPointMake(51.0f, 721.0f)];
    [soundBird setTag:kCoverSoundBirdTag];
    if (CC_CONTENT_SCALE_FACTOR()==2) soundBird.scale=2; else soundBird.scale=1;
    [soundBird setOpacity:125];
    [self addChild:soundBird];
    */
}

-(id)init
{
    self = [super init];

    
    if (self != nil)
    {
        
        // [self setup_sprites];
        
        self.userInteractionEnabled = YES;
        self.multipleTouchEnabled = YES;
        
        // parameters for page

        
        bAfter1Second = FALSE;
        bIgorAnimOn = FALSE;
        bCatTailOn = FALSE;
        bChickenOn = FALSE;
        bChickenTouched = FALSE;
        bMiloArmBackOn = FALSE;
        bMiloArmFrontOn = FALSE;
        bHairOn = FALSE;

        bArrowPressed = FALSE;
        bCatPressed = FALSE;        
    }
    return self;
}


-(void)shutDownPage {
    [self stopPageText];
}


-(void)nextPage {
    if (!bArrowPressed)
    {
        [self shutDownPage];
        [[BookManager sharedBookManager] nextPage];
        bArrowPressed = true;
    }
}
 
-(void)catPage {
    if (bCatPressed)
    {
        CCScene *gameplayScene = [CCBReader loadAsScene:@"Gameplay"];
        [[CCDirector sharedDirector] replaceScene:gameplayScene];

    }
}


-(void)previousPage {

    if (!bArrowPressed)
    {
        [self shutDownPage];
        [[BookManager sharedBookManager] previousPage];
        bArrowPressed = true;
    }
}




-(void)onEnterTransitionDidFinish {
    //[self playPageText];
    [self setup_sprites];
    [super onEnterTransitionDidFinish];
}



-(void)scissors_resetStartTime {
    [self setScissors_startTime:[NSDate date]]; // startTime has a retain property so old startTime is autoreleased.
}




-(NSTimeInterval)scissors_elapsedTime {
    return abs([scissors_startTime timeIntervalSinceNow]);
}

BOOL igor_swing_clockwise  (int n)
{
    return ((n % 2) == 0);
}

-(void)swing_igors_arm
{
    if ((igor_angles_idx >= 0) && (igor_angles_idx <= 10))
    {
        if (igor_swing_clockwise(igor_angles_idx))
        {
            //CCLOG(@" clockwise %f ",igor_arm.rotation);
            
            // I've reached limit of clockwise angle...
            if (igor_arm.rotation >= igor_angles[igor_angles_idx])
            {
                // ...advance the igor_angles array for the next limit. Set index to beginning if index above 10
                igor_angles_idx++;
                if (igor_angles_idx > 10)
                    igor_angles_idx = 0;

                //CCLOG(@" -----target:  %d ",igor_angles[igor_angles_idx]);

            }
            else // increase rotation clockwise
                igor_arm.rotation++;
         }
        else
        {
            //CCLOG(@" counter %f ",igor_arm.rotation);
            
            // I've reached limit of counterclockwise angle...
            if (igor_arm.rotation <= igor_angles[igor_angles_idx])
            {
                // ...advance the igor angles array for the next limit.  Set index to beginning if index above 10
                igor_angles_idx++;
                if (igor_angles_idx > 10)
                    igor_angles_idx = 0;

                //CCLOG(@" -----target:  %d ",igor_angles[igor_angles_idx]);

            }
            else // increase rotation conterclockwise
                igor_arm.rotation--;
        }
    }


}



-(void)update:(CCTime)deltaTime
{
    
    if (bCatPressed)
    {
        if (!bArrowPressed)
            [self catPage];
    }
    else
    {
        if (!bMiloArmBackOn)
            [self milo_armback_anim];
        
        if (!bMiloArmFrontOn)
            [self milo_armfront_anim];
        
        if (!bHairOn)
            [self hair_anim];

        // chicken actions
        if (bChickenTouched)
        {
            if (!bChickenOn)
            {
                switch(rand() % 3)
                {
                    case 0:
                        [self chicken_anim:'a'];
                        break;
                    case 1:
                        [self chicken_anim:'b'];
                        break;
                    default:
                        [self chicken_anim:'c'];
                        break;
                }
            }
        }

        
        // cat actions
        if (!bCatTailOn)
        {
            switch(rand() % 3)
            {
                case 0:
                    [self cat_tail_anim:'a'];
                    break;
                case 1:
                    [self cat_tail_anim:'b'];
                    break;
                default:
                    [self cat_tail_anim:'c'];
                    break;
            }
       }
        
        
        
        // igor actions
        [self swing_igors_arm];

        if (bAfter1Second)
        {
            if (!bIgorAnimOn)
            {
                [self igor_scissors_anim];
            }
        }
        else
        {
            if ([self scissors_elapsedTime] > 1)
                bAfter1Second = TRUE;
        }
    } // catPressed

}




#pragma mark -- Sound Bird Methods --
-(void)playPageText {
    /*
    CCSprite *soundBird = (CCSprite *)[self getChildByTag:kCoverSoundBirdTag];
    pageTextSoundID = playEffectNoLoop(PAGE_6_TEXT);
    [soundBird setOpacity:255];
     */
}

-(void)stopPageText {
/*
    CCSprite *soundBird = (CCSprite *)[self getChildByTag:kCoverSoundBirdTag];
    stopEffect(pageTextSoundID);
    pageTextSoundID=-1;
    [soundBird setOpacity:125];
*/
}




-(void)igor_scissors_anim
{
    if (igor_arm)
    {
        [igor_arm stopAllActions];
        
        CCAnimation *igor_arm_anim = [self loadPlistForAnimationWithName:@"igor_arm" andClassName:NSStringFromClass([self class])];
        // igor_arm_anim.restoreOriginalFrame=NO;
        id igorAnimAction = [CCActionAnimate actionWithAnimation:igor_arm_anim];
        id myAnimOn = [CCActionCallFunc actionWithTarget:self selector:@selector(igor_anim_on)];
        id myAnimOff = [CCActionCallFunc actionWithTarget:self selector:@selector(igor_anim_off)];
        
        id mySequence = [CCActionSequence actions: myAnimOn, igorAnimAction, myAnimOff, nil];
        
        [igor_arm runAction:mySequence];
    }
}


-(void)cat_tail_anim: (char) ch
{
    if (cat_tail)
    {
        [cat_tail stopAllActions];
        CCAnimation *my_anim;

        switch (ch)
        {
            case 'a':
                my_anim = [self loadPlistForAnimationWithName:@"cat_tail_a" andClassName:NSStringFromClass([self class])];
                break;
            case 'b':
                my_anim = [self loadPlistForAnimationWithName:@"cat_tail_b" andClassName:NSStringFromClass([self class])];
                break;
            default:
                my_anim = [self loadPlistForAnimationWithName:@"cat_tail_c" andClassName:NSStringFromClass([self class])];
                break;
        }
        // my_anim.restoreOriginalFrame=NO;
        id myAnimAction = [CCActionAnimate actionWithAnimation:my_anim];
        id myAnimOn = [CCActionCallFunc actionWithTarget:self selector:@selector(cat_tail_on)];
        id myAnimOff = [CCActionCallFunc actionWithTarget:self selector:@selector(cat_tail_off)];
        
        id mySequence = [CCActionSequence actions: myAnimOn, myAnimAction, myAnimOff, nil];
        
        [cat_tail runAction:mySequence];
    }
}



-(void)chicken_anim: (char) ch
{
    if (chicken)
    {
        [chicken stopAllActions];
        
        CCAnimation *my_anim;
        
        switch (ch)
        {
            case 'a':
                my_anim = [self loadPlistForAnimationWithName:@"chicken_a" andClassName:NSStringFromClass([self class])];
                break;
            case 'b':
                my_anim = [self loadPlistForAnimationWithName:@"chicken_b" andClassName:NSStringFromClass([self class])];
                break;
            default:
                my_anim = [self loadPlistForAnimationWithName:@"chicken_c" andClassName:NSStringFromClass([self class])];
                break;
        }

        // my_anim.restoreOriginalFrame=NO;
        id myAnimAction = [CCActionAnimate actionWithAnimation:my_anim];
        id myAnimOn = [CCActionCallFunc actionWithTarget:self selector:@selector(chicken_on)];
        id myAnimOff = [CCActionCallFunc actionWithTarget:self selector:@selector(chicken_off)];
        id myAnimTouchedOff = [CCActionCallFunc actionWithTarget:self selector:@selector(chicken_touched_off)];
        id mySequence = [CCActionSequence actions: myAnimOn, myAnimAction, myAnimOff, myAnimTouchedOff, nil];
        
        [chicken runAction:mySequence];
    }
}



-(void)milo_armback_anim
{
    if (milo_armback)
    {
        [milo_armback stopAllActions];
        
        CCAnimation *my_anim = [self loadPlistForAnimationWithName:@"milo_armback" andClassName:NSStringFromClass([self class])];
        // my_anim.restoreOriginalFrame=NO;
        id myAnimAction = [CCActionAnimate actionWithAnimation:my_anim];
        id myAnimOn = [CCActionCallFunc actionWithTarget:self selector:@selector(milo_armback_on)];
        id myAnimOff = [CCActionCallFunc actionWithTarget:self selector:@selector(milo_armback_off)];
        
        id mySequence = [CCActionSequence actions: myAnimOn, myAnimAction, myAnimOff, nil];
        
        [milo_armback runAction:mySequence];
    }
}

-(void)milo_armfront_anim
{
    if (milo_armfront)
    {
        [milo_armfront stopAllActions];
        
        CCAnimation *my_anim = [self loadPlistForAnimationWithName:@"milo_armfront" andClassName:NSStringFromClass([self class])];
        // my_anim.restoreOriginalFrame=NO;
        id myAnimAction = [CCActionAnimate actionWithAnimation:my_anim];
        id myAnimOn = [CCActionCallFunc actionWithTarget:self selector:@selector(milo_armfront_on)];
        id myAnimOff = [CCActionCallFunc actionWithTarget:self selector:@selector(milo_armfront_off)];
        
        id mySequence = [CCActionSequence actions: myAnimOn, myAnimAction, myAnimOff, nil];
        
        [milo_armfront runAction:mySequence];
    }
}

-(void)hair_anim
{
    if (hair)
    {
        [hair stopAllActions];
        
        CCAnimation *my_anim = [self loadPlistForAnimationWithName:@"hair" andClassName:NSStringFromClass([self class])];
        // my_anim.restoreOriginalFrame=NO;
        id myAnimAction = [CCActionAnimate actionWithAnimation:my_anim];
        id myAnimOn = [CCActionCallFunc actionWithTarget:self selector:@selector(hair_on)];
        id myAnimOff = [CCActionCallFunc actionWithTarget:self selector:@selector(hair_off)];
        
        id mySequence = [CCActionSequence actions: myAnimOn, myAnimAction, myAnimOff, nil];
        
        [hair runAction:mySequence];
    }
}


-(void)scissors_cut
{
    
    KGE_pg6_character  *scissorsSprite = (KGE_pg6_character  *)[self getChildByName:@"ScissorsAnim" recursively:FALSE];
    
    if (scissorsSprite)
    {
        [scissorsSprite stopAllActions];
        
        CCAnimation *scissors_anim = [self loadPlistForAnimationWithName:@"scissors_cut" andClassName:NSStringFromClass([self class])];
        // scissors_anim.restoreOriginalFrame=NO;
        id scissorsAnimAction = [CCActionAnimate actionWithAnimation:scissors_anim];
        
        id scissorsSequence = [CCActionSequence actions: scissorsAnimAction, nil];
        
        [scissorsSprite runAction:scissorsSequence];
    }
}


-(void)touchCancelled:(NSSet*)touches withEvent:(UIEvent *)event
{
}


-(void)touchBegan:(NSSet*)touches withEvent:(UIEvent *)event
{

}

-(void) touchEnded:(UITouch*)thetouch withEvent:(UIEvent *)event
{

    UITouch* touch;
    CGPoint touch_location;

    NSArray *touches = [event.allTouches allObjects];
    
    //CCSprite *soundBird = (CCSprite *)[self getChildByTag:kCoverSoundBirdTag];

    for (touch in touches)
    {
        // touch_location = [self convertToNodeSpace:touch.locationInWorld];  // for BookPage as Scene
        touch_location = touch.locationInWorld;  // for BookPage as CCNode
        
        if ((!speech_bubble.visible) && ((CGRectContainsPoint(igor_hintbox1, touch_location)) ||
                                         (CGRectContainsPoint(igor_hintbox2, touch_location))))
        {
            [speech_bubble setVisible:TRUE];            
        }
        else if ((speech_bubble.visible) && ((CGRectContainsPoint(igor_hintbox1, touch_location)) ||
                                         (CGRectContainsPoint(igor_hintbox2, touch_location))))
        {
            [speech_bubble setVisible:FALSE];
        }

        if (!bChickenOn && !bChickenTouched)
        {
            if (CGRectContainsPoint(chicken.boundingBox, touch_location))
                bChickenTouched = TRUE;
        }
        
        if (!bCatPressed)
        {
            if (CGRectContainsPoint(cat.boundingBox, touch_location))
                bCatPressed = TRUE;
            
        }
        
        /*
        if (soundBird)
        {
            if (CGRectContainsPoint(soundBird.boundingBox, touch_location))
            {
                if (pageTextSoundID != -1)
                {
                    [self stopPageText];
                }
                else
                {
                    [self playPageText];
                }
            }
        } // soundbird
        */
    }
}



-(void) igor_anim_off
{
    bIgorAnimOn = FALSE;
}

-(void) igor_anim_on
{
    bIgorAnimOn = TRUE;
}

-(void) cat_tail_off
{
    bCatTailOn = FALSE;
}

-(void) cat_tail_on
{
    bCatTailOn = TRUE;
}


-(void) chicken_off
{
    bChickenOn = FALSE;
}

-(void) chicken_on
{
    bChickenOn = TRUE;
}

-(void) chicken_touched_off
{
    bChickenTouched = FALSE;
}

-(void) milo_armback_off
{
    bMiloArmBackOn = FALSE;
}

-(void) milo_armback_on
{
    bMiloArmBackOn = TRUE;
}

-(void) milo_armfront_off
{
    bMiloArmFrontOn = FALSE;
}

-(void) milo_armfront_on
{
    bMiloArmFrontOn = TRUE;
}

-(void) hair_off
{
    bHairOn = FALSE;
}

-(void) hair_on
{
    bHairOn = TRUE;
}



- (void)ccTouchesMoved:(NSSet*)touches withEvent:(UIEvent *)event
{
    
}



@end
