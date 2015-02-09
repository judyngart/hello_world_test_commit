//  BookManager.h
//  SpaceViking
//
#import <Foundation/Foundation.h>
#import "Cocos2dTags.h"
#import "cocos2d.h"
// #import "SimpleAudioEngine.h"

@interface BookManager : NSObject {
    BOOL isMusicON;
    BOOL isSoundEffectsON;
    BOOL hasPlayerDied;
    SceneTypes currentScene;
    SceneTypes lastScene;
    
    // Added for audio
    BOOL hasAudioBeenInitialized;
    BookManagerSoundState managerSoundState;
//    CDSoundEngine *sse;
    NSMutableDictionary *listOfSoundEffectFiles;
    NSMutableDictionary *soundEffectsState;
    ALuint pageTextSoundID;

    
}
@property (readwrite) BOOL isMusicON;
@property (readwrite) BOOL isSoundEffectsON;
@property (readwrite) BookManagerSoundState managerSoundState;
@property (nonatomic, retain) NSMutableDictionary *listOfSoundEffectFiles;
@property (nonatomic, retain) NSMutableDictionary *soundEffectsState;
// @property (nonatomic, retain) CDSoundEngine *sse;
@property (readonly) SceneTypes currentScene;
@property (readonly) SceneTypes lastScene;

+(BookManager*)sharedBookManager;
-(void)runSceneWithID:(SceneTypes)sceneID;
-(void)setupAudioEngine;

-(void)loadAudioForSceneWithID:(NSNumber*)sceneIDNumber;
-(void)unloadAudioForSceneWithID:(NSNumber*)sceneIDNumber;

-(void)nextPage;
-(void)previousPage;
-(void)gotoPage:(SceneTypes)sceneID;

-(void)playCurrentPageSound;
-(void)playBackgroundTrack:(NSString*)trackFileName;
-(void)stopBackgroundMusic;

-(SceneTypes)getScene;
-(SceneTypes)getLastScene;

@end
