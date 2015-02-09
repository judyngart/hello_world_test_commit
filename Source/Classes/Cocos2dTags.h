//
//  Cocos2dTags.h
//  KGE2
//
//  Created by Bill Martin on 4/11/12.
//  Copyright (c) 2012 SmarTots. All rights reserved.
//



#ifndef KGE2_Cocos2dTags_h
#define KGE2_Cocos2dTags_h

#define kCoverBirdTag 1
#define kCoverLogoTag 2
#define kCoverLeftCurlTag 3
#define kCoverRightCurlTag 4
#define kCoverLeftEarTag 5
#define kCoverRightEarTag 6
#define kCoverEyesTag 7
#define kCoverKingTag 8
#define kCoverTextTag 9
#define kCoverSoundBirdTag 10

#define kPage2FrameTag 11
#define kPage2TearTag 12
#define kPage2EyesTag 13
#define kPage2PupilsTag 14
#define kPage2EyeballsTag 15
#define kPage2TextTag 16

#define kPg3KingHappy 17
#define kPg3KingMad 18
#define kPage3TextTag 19

#define kPage4TextTag 20
#define kPage4AppleManTag 21
#define kPage4BlondeGirlTag 22
#define kPage4CatTag 23
#define kPage4KingCurtainsClosedTag 24
#define kPage4Gossip1Tag 25
#define kPage4GossipBasketTag 26
#define kPage4Gossip3Tag 27
#define kPage4Gossip2Tag 28
#define kPage4KingCurtainPeekTag 29
#define kPage4LadyBasketTag 30
#define kPage4ManBreadTag 31

#define kMenuRibbon 32
#define kMenuRibbonSoundBird 33
#define kMenuRibbonNote 34
#define kMenuCrownMenu 35
#define kMenuCrownButton 1000
#define kMenuScroller 1001

#define kPage5Dream1Tag 36
#define kPage5Dream2Tag 37
#define kPage5Dream3Tag 38
#define kPage5Dream4Tag 39
#define kPage5Dream5Tag 40
#define kPage5Dream6Tag 41
#define kPage5Dream7Tag 42
#define kPage5Dream8Tag 43
#define kPage5Dream9Tag 44
#define kPage5Dream10Tag 45
#define kPage5Dream11Tag 46
#define kPage5DreamAnimTag 47
#define kPage5PigsSeriousTag 48
#define kPage5PigsLaughingAnimTag 49
#define kPage5PigletAnimTag 50
#define kPage5PigletTag 51
#define kPage5SmileTag  52
#define kPage5Piglet1Tag    53
#define kPage5Piglet2Tag    54
#define kPage5ScissorsAnimTag   55
#define kPage5HintTag       56


#define kPage7Hair1Tag   57
#define kPage7Hair2Tag   58
#define kPage7Hair3Tag   59
#define kPage7Hair4Tag   60
#define kPage7Hair5Tag   61
#define kPage7Hair6Tag   62
#define kPage7Hair7Tag   63
#define kPage7Hair8Tag   64
#define kPage7Hair9Tag   65
#define kPage7Hair10Tag   66
#define kPage7Hair11Tag   67
#define kPage7Hair12Tag   68
#define kPage7Hair13Tag   69
#define kPage7Hair14Tag   70
#define kPage7Hair15Tag   71
#define kPage7Hair16Tag   72
#define kPage7Hair17Tag   73
#define kPage7Hair18Tag   74
#define kPage7Hair19Tag   75
#define kPage7Hair20Tag   76
#define kPage7Hair21Tag   77
#define kPage7Hair22Tag   78
#define kPage7Hair23Tag   79
#define kPage7Hair24Tag   80

#define kPage7Hair25Tag   81
#define kPage7Hair26Tag   82
#define kPage7Hair27Tag   83
#define kPage7Hair28Tag   84
#define kPage7Hair29Tag   85
#define kPage7Hair30Tag   86
#define kPage7Hair31Tag   87


#define kPage7ScissorsAnimTag   88
#define kPage7SingleHair1Tag    89
#define kPage7SingleHair2Tag    90
#define kPage7SingleHair3Tag    91
#define kPage7SingleHair4Tag    92
#define kPage7SingleHair5Tag    93
#define kPage7SingleHair6Tag    94
#define kPage7SingleHair7Tag    95
#define kPage7SingleHair8Tag    96
#define kPage7FurTag            97
#define kPage7LeftScissorsTag   98
#define kPage7RightScissorsTag  99
#define kPage7Spritz1Tag        100
#define kPage7Spritz2Tag        101

#define kPage11IgorTag          120
#define kPage11GaugeTag         121
#define kPage11NeedleTag        122

#define kPage6SpeechBubbleTag   123
#define kPage6CatTag            124
#define kPage6ChickenAnimTag    125
#define kPage6ChickenTag        126
#define kPage6HairAnimTag       127
#define kPage6HairTag           128
#define kPage6IgorArmAnimTag    129
#define kPage6IgorArmTag        130
#define kPage6MiloTag           131
#define kPage6MiloFrontArmTag   133
#define kPage6MiloBackArmTag    134
#define kPage6TailAnimTag       135
#define kPage6TailTag           136








typedef enum {
    kNoSceneUninitialized = 0,
    kCover = 1,
    kPage2 = 2,
    kPage3 = 3,
    kPage4 = 4,
    kPage5 = 5,
    kPage6 = 6,
    // kPage7 = 7,
    kPage11 = 7  // 8
} SceneTypes;

// Audio Items
#define AUDIO_MAX_WAITTIME 150

typedef enum {
    kAudioManagerUninitialized=0,
    kAudioManagerFailed=1,
    kAudioManagerInitializing=2,
    kAudioManagerInitialized=100,
    kAudioManagerLoading=200,
    kAudioManagerReady=300
    
} BookManagerSoundState;

// Audio Constants
#define SFX_NOTLOADED NO
#define SFX_LOADED YES

// This is a shared header
// Don't mind too much what is in this file yet, it'll be explained below.
/** CDAudioManager supports two long audio source channels called left and right
 typedef enum {
 kASC_Left = 0,
 kASC_Right = 1
 } tAudioSourceChannel;	*/
#define CGROUP_BG       kASC_Left    // Channel for background music
#define CGROUP_EFFECTS  kASC_Right   // Channel for sound effects

#define COVER_TEXT 1

#define PAGE_2_TEXT 2
#define WING_FLAP   3

#define PAGE_3_TEXT 4
#define PAGE_3_KING_HAPPY 5
#define PAGE_3_KING_UNHAPPY 6


#define PAGE_4_TEXT 7


#define PAGE_4_APPLE_MAN    10
#define PAGE_4_BLONDE_GIRL  11
#define PAGE_4_CAT          12
#define PAGE_4_GOSSIP1      13
#define PAGE_4_GOSSIP2      14
#define PAGE_4_GOSSIP3      15
#define PAGE_4_GOSSIP_BASKET    16
#define PAGE_4_LADY_BASKET  17
#define PAGE_4_MAN_BREAD    18
#define PAGE_4_KING1        19
#define PAGE_4_KING2        20
#define PAGE_4_KING3        21
#define PAGE_4_KING4        22
#define PAGE_4_KING5        23
#define PAGE_4_KING6        24
#define PAGE_4_KING7        25
#define PAGE_4_KING8        26

#define PAGE_2_TEARDROP1    27
#define PAGE_2_TEARDROP2    28
#define PAGE_2_TEARDROP3    29

#define PAGE_4_DEBUG_SOUND  30

#define PAGE_5_TEXT         31
#define PAGE_5_BARBER_SAD   32
#define PAGE_5_BARBER_WISTFUL   33
#define PAGE_5_PIGS         34

#define PAGE_7_TEXT         35
#define PAGE_7_SCISSORS1    36
#define PAGE_7_SCISSORS2    37
#define PAGE_7_SCISSORS3    38
#define PAGE_7_PURR         39

#define PAGE_6_TEXT         40

// Helper macros for playing sound effects
#pragma mark Background Music

#define playBGMusicWithParams(__ID__,__PITCH__,__PAN__,__GAIN__,__LOOP__)      [[CDAudioManager sharedManager].soundEngine playSound:__ID__ sourceGroupId:CGROUP_BG pitch:__PITCH__ pan:__PAN__ gain:__GAIN__ loop:__LOOP__]

#define stopBGMusic(__ID__)      [[CDAudioManager sharedManager].soundEngine stopSound:__ID__]

#pragma mark Play Sound Effects Custom

#define playEffectLoop(__ID__)      [[CDAudioManager sharedManager].soundEngine playSound:__ID__ sourceGroupId:CGROUP_EFFECTS pitch:1.0f pan:0.0f gain:1.0f loop:YES]

#define playEffectNoLoop(__ID__)      [[CDAudioManager sharedManager].soundEngine playSound:__ID__ sourceGroupId:CGROUP_EFFECTS pitch:1.0f pan:0.0f gain:1.0f loop:NO]

#define playEffectLoopWithParams(__ID__,__PITCH__,__PAN__,__GAIN__)      [[CDAudioManager sharedManager].soundEngine playSound:__ID__ sourceGroupId:CGROUP_EFFECTS pitch:__PITCH__ pan:__PAN__ gain:__GAIN__ loop:YES]

#define playEffectNoLoopWithParams(__ID__,__PITCH__,__PAN__,__GAIN__)      [[CDAudioManager sharedManager].soundEngine playSound:__ID__ sourceGroupId:CGROUP_EFFECTS pitch:__PITCH__ pan:__PAN__ gain:__GAIN__ loop:NO]

#pragma mark Effect Quiet, Medium, Loud

#define playEffectQuietlyLoop(__ID__)      [[CDAudioManager sharedManager].soundEngine playSound:__ID__ sourceGroupId:CGROUP_EFFECTS pitch:1.0f pan:0.0f gain:0.4f loop:YES]

#define playEffectQuietlyNoLoop(__ID__)      [[CDAudioManager sharedManager].soundEngine playSound:__ID__ sourceGroupId:CGROUP_EFFECTS pitch:1.0f pan:0.0f gain:0.1f loop:NO]

#define playEffectMediumNoLoop(__ID__)      [[CDAudioManager sharedManager].soundEngine playSound:__ID__ sourceGroupId:CGROUP_EFFECTS pitch:1.0f pan:0.0f gain:0.5f loop:NO]



#pragma mark Stop Sounds

#define stopEffect(__ID__) [[CDAudioManager sharedManager].soundEngine stopSound:__ID__]



#pragma mark Effect Timing

#define effectSecondsLeft(__ID__) [[CDAudioManager sharedManager].soundEngine bufferDurationInSeconds:__ID__]

#endif
