//
//  KGE_pg5.h
//  KGE2
//
//  Created by Judy Choi 2013/05/17
//

#import "BookPage.h"
#import "KGE_pg6_types.h"
#import "KGE_pg6_character.h"

@interface KGE_pg6 : BookPage {
    // CCSpriteBatchNode *sceneSpriteBatchNode;
    KGE_pg6_character *igor_arm;
    KGE_pg6_character *cat;
    KGE_pg6_character *cat_tail;
    KGE_pg6_character *chicken;
    KGE_pg6_character *milo_armback;
    KGE_pg6_character *milo_armfront;
    KGE_pg6_character *hair;
    KGE_pg6_character *speech_bubble;
    NSDate *scissors_startTime;
    CGRect igor_hintbox1;
    CGRect igor_hintbox2;
    int igor_angles_idx;
    BOOL bAfter1Second;
    BOOL bIgorAnimOn;
    BOOL bCatTailOn;
    BOOL bChickenOn;
    BOOL bChickenTouched;
    BOOL bMiloArmBackOn;
    BOOL bMiloArmFrontOn;
    BOOL bHairOn;
    BOOL bArrowPressed;
    BOOL bCatPressed;
}

@property (nonatomic, retain) NSDate *scissors_startTime;


+(KGE_pg6 *) scene;



@end
