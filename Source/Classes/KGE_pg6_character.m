//
//  KGE_pg4_character.m
//  KGE_cocos2d_2.1b2
//
//  Created by Judy Choi on 13-02-06.
//  Copyright 2013 SmarTots. All rights reserved.
//

#import "KGE_pg6_character.h"


@implementation KGE_pg6_character


-(void)rescale
{
    if (self)
    {
        self.scale = 0.25;
    }
    /*
    if (self)
    {
        if (CC_CONTENT_SCALE_FACTOR()==2)
        {
            self.scale=1;
        }
        else
        {
            self.scale=0.5;
        }
    }
    */
}



@end
