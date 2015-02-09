//  BookManager.m
//  KGE2
//
#import "BookManager.h"
/*
#import "KGE_cover.h"
#import "KGE_pg2.h"
#import "KGE_pg3.h"
#import "KGE_pg4.h"
*/
//#import "KGE_pg5.h"
/*
#import "KGE_pg5_spritetest.h"
*/
 #import "KGE_pg6.h"
/*
 #import "KGE_pg7.h"
#import "KGE_pg11_1.h"
*/

@implementation BookManager
static BookManager* _sharedBookManager = nil;
@synthesize isMusicON;
@synthesize isSoundEffectsON;
@synthesize managerSoundState;
@synthesize listOfSoundEffectFiles;
@synthesize soundEffectsState;
// @synthesize sse;
@synthesize currentScene = _currentScene;
@synthesize lastScene = _lastScene;

+(BookManager*)sharedBookManager {
    @synchronized([BookManager class])
    {
        if(!_sharedBookManager)
            [[self alloc] init]; 
        return _sharedBookManager;
    }
    return nil; 
}

+(id)alloc 
{
    @synchronized ([BookManager class])
    {
        NSAssert(_sharedBookManager == nil,
                 @"Attempted to allocated a second instance of the Book Manager singleton");
        _sharedBookManager = [super alloc];
        return _sharedBookManager;
    }
    return nil;  
}

-(id)init {
    self = [super init];
    if (self != nil) {
        // Book Manager initialized
        CCLOG(@"Book Manager Singleton, init");
        isMusicON = YES;
        isSoundEffectsON = YES;
        currentScene = kNoSceneUninitialized;
        lastScene = kPage11;
        hasAudioBeenInitialized = NO;
        managerSoundState = kAudioManagerUninitialized;
        pageTextSoundID=-1;
    }
    return self;
}

// ** Background Music Methods **
-(void)playBackgroundTrack:(NSString*)trackFileName {
/*
    // Wait to make sure soundEngine is initialized
    if ((managerSoundState != kAudioManagerReady) && 
        (managerSoundState != kAudioManagerFailed)) {
        
        int waitCycles = 0;
        while (waitCycles < AUDIO_MAX_WAITTIME) {
            [NSThread sleepForTimeInterval:0.1f];
            if ((managerSoundState == kAudioManagerReady) || 
                (managerSoundState == kAudioManagerFailed)) {
                break;
            }
            waitCycles = waitCycles + 1;
        }
    }

    if (managerSoundState == kAudioManagerReady) {
        if ([[CDAudioManager sharedManager] isBackgroundMusicPlaying]) {
            [[CDAudioManager sharedManager] stopBackgroundMusic];
        }
        [[CDAudioManager sharedManager] preloadBackgroundMusic:trackFileName];
        [[CDAudioManager sharedManager] playBackgroundMusic:trackFileName loop:YES];
    }
*/
}

-(void)stopBackgroundMusic {
/*
    if ([[CDAudioManager sharedManager] isBackgroundMusicPlaying]) {
        [[CDAudioManager sharedManager] stopBackgroundMusic];
    }
*/
}

-(void)setBackgroundMusicVolume:(float)volume {
/*
    [CDAudioManager sharedManager].backgroundMusic.volume = volume;
*/
}

-(void)nextPage {
    CCLOG(@"BookManager nextPage from scene:%i",currentScene);
    int nextScene = currentScene + 1;
    [self runSceneWithID: (SceneTypes) nextScene];
}

-(void)previousPage {
    CCLOG(@"BookManager previousPage from scene:%i",currentScene);
    int prevScene = currentScene - 1;
    [self runSceneWithID: (SceneTypes) prevScene];
}

-(void)gotoPage:(SceneTypes)sceneID {
    CCLOG(@"BookManager gotoPage:%i from scene:%i",sceneID,currentScene);
    [self runSceneWithID:sceneID];
}

- (NSString*)formatSceneTypeToString:(SceneTypes)sceneID {
    NSString *result = nil;
    
    switch(sceneID) {
        case kNoSceneUninitialized:
            result = @"kNoSceneUninitialized";
            break;
        case kCover:
            result = @"kCover";
            break;           
        case kPage2:
            result = @"kPage2";
            break;
        case kPage3:
            result = @"kPage3";
            break;
        case kPage4:
            result = @"kPage4";
            break;
        case kPage5:
            result = @"kPage5";
            break;
        case kPage6:
            result = @"kPage6";
            break;
        // case kPage7:
        //    result = @"kPage7";
        //    break;
        case kPage11:
            result = @"kPage11";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected SceneType."];
    }
    return result;
}

/*
-(NSDictionary *)getSoundEffectsListForSceneWithID:(SceneTypes)sceneID {
    NSString *fullFileName = @"SoundEffects.plist";
    NSString *plistPath;
    NSString *rootPath = 
    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                         NSUserDomainMask, YES) 
     objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:fullFileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] 
                     pathForResource:@"SoundEffects" ofType:@"plist"];
    }
    
    NSDictionary *plistDictionary = 
    [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    if (plistDictionary == nil) {
        CCLOG(@"Error reading SoundEffects.plist");
        return nil;
    }
    
    if ((listOfSoundEffectFiles == nil) || 
        ([listOfSoundEffectFiles count] < 1)) {
        [self setListOfSoundEffectFiles:[[NSMutableDictionary alloc] init]];
        for (NSString *sceneSoundDictionary in plistDictionary) {
            [listOfSoundEffectFiles 
             addEntriesFromDictionary:
             [plistDictionary objectForKey:sceneSoundDictionary]];
        }
    }
    
    if ((soundEffectsState == nil) || 
        ([soundEffectsState count] < 1)) {
        [self setSoundEffectsState:[[NSMutableDictionary alloc] init]];
        for (NSString *SoundEffectKey in listOfSoundEffectFiles) {
            [soundEffectsState setObject:[NSNumber numberWithBool:SFX_NOTLOADED] forKey:SoundEffectKey];
        }
    }
    
    // 6. Return just the mini SFX list for this scene
    NSString *sceneIDName = [self formatSceneTypeToString:sceneID];

    NSDictionary *soundEffectsList =
    [plistDictionary objectForKey:sceneIDName];
    
    return soundEffectsList;
}


-(void)loadAudioForSceneWithID:(NSNumber*)sceneIDNumber {
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

    SceneTypes sceneID = (SceneTypes) [sceneIDNumber intValue];

    if (managerSoundState == kAudioManagerInitializing) {
            int waitCycles = 0;
            while (waitCycles < AUDIO_MAX_WAITTIME) {
                [NSThread sleepForTimeInterval:0.1f];
                if ((managerSoundState == kAudioManagerReady) || (managerSoundState == kAudioManagerFailed)) {
                    break;
                }
                waitCycles = waitCycles + 1;
            }
   }
    
    if (managerSoundState == kAudioManagerFailed) {
        return; // Nothing to load, CocosDenshion not ready
    }

    NSDictionary *soundEffectsToLoad = 
    [self getSoundEffectsListForSceneWithID:sceneID];
    if (soundEffectsToLoad == nil) {
        CCLOG(@"Error reading SoundEffects.plist");
        return;
    }
    
    //Create Sound Buffers Array
    for( NSString *soundObjectHere in soundEffectsToLoad )
    {
        NSString *keyString = [[soundEffectsToLoad objectForKey:soundObjectHere ] objectForKey:@"keyString"];
        NSString *soundFileName = [[soundEffectsToLoad objectForKey:soundObjectHere ] objectForKey:@"fileName"];
        NSString *soundFileType = [[soundEffectsToLoad objectForKey:soundObjectHere ] objectForKey:@"fileType"];
        NSNumber *soundID = [[soundEffectsToLoad objectForKey:soundObjectHere ] objectForKey:@"id"];

        //Each CDBufferLoadRequest takes an integer as an identifier (to call later)
        NSString* soundFilePath = [[NSBundle mainBundle] pathForResource:soundFileName
                                                             ofType:soundFileType];
        int bufferID = [soundID integerValue];
        [sse loadBuffer:bufferID filePath:soundFilePath];
        [soundEffectsState setObject:[NSNumber numberWithBool:SFX_LOADED] forKey:keyString];   
    }
    [pool release];
}

-(void)unloadAudioForSceneWithID:(NSNumber*)sceneIDNumber {

    
    
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    SceneTypes sceneID = (SceneTypes)[sceneIDNumber intValue];
    if (sceneID == kNoSceneUninitialized) {
        return; // Nothing to unload
    }
    
    if (sceneID == kCover) {
        //[self stopBackgroundMusic];
        [self setBackgroundMusicVolume:0.1f];
    }
    
    NSDictionary *soundEffectsToUnload = 
    [self getSoundEffectsListForSceneWithID:sceneID];
    if (soundEffectsToUnload == nil) {
        CCLOG(@"Error reading SoundEffects.plist");
        return;
    }
    if (managerSoundState == kAudioManagerReady) {
        // Get all of the entries and unload
        for(NSDictionary *soundObjectHere in soundEffectsToUnload )
        {
            NSString *keyString = [[soundEffectsToUnload objectForKey:soundObjectHere ] objectForKey:@"keyString"];
            NSNumber *soundID = [[soundEffectsToUnload objectForKey:soundObjectHere ] objectForKey:@"id"];            
            //Each CDBufferLoadRequest takes an integer as an identifier (to call later)

            int bufferID = [soundID integerValue];

            [soundEffectsState setObject:[NSNumber numberWithBool:SFX_NOTLOADED] forKey:keyString];
            [sse unloadBuffer:bufferID];
            
        }
    }
    [pool release];
}




-(void)initAudioAsync {
    CCLOG(@"initAudioAsync");
    // Initializes the audio engine asynchronously
    // Indicate that we are trying to start up the Audio Manager
    managerSoundState = kAudioManagerInitializing;
    
    //CDSoundEngine for Background Music
    [CDSoundEngine setMixerSampleRate:CD_SAMPLE_RATE_MID];
    
    //Init audio manager asynchronously as it can take a few seconds
    //The FXPlusMusicIfNoOtherAudio mode will check if the user is
    // playing music and disable background music playback if 
    // that is the case.
    [CDAudioManager initAsynchronously:kAMM_FxPlusMusicIfNoOtherAudio];
    
    //Wait for the audio manager to initialise
    while ([CDAudioManager sharedManagerState] != kAMStateInitialised) 
    {
        [NSThread sleepForTimeInterval:0.1];
    }
    
    //At this point the CocosDenshion should be initialized
    // Grab the CDAudioManager and check the state
    CDAudioManager *audioManager = [CDAudioManager sharedManager];
    if (audioManager.soundEngine == nil || 
        audioManager.soundEngine.functioning == NO) {
        CCLOG(@"CocosDenshion failed to init, no audio will play.");
        managerSoundState = kAudioManagerFailed; 
    } else {
        [audioManager setResignBehavior:kAMRBStopPlay autoHandle:YES];
        sse = [CDAudioManager sharedManager].soundEngine;
        //
        // A source group is another name for a channel
         //Here I have 2 channels, the first index allows for only single effect... my background music
         The second channel I have reserved for my sound effects.  This is set to 31 because you can
         have up to 32 effects at once
         //
        NSArray *sourceGroups = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:31], nil];
        [sse defineSourceGroups:sourceGroups];
        managerSoundState = kAudioManagerReady;
        CCLOG(@"CocosDenshion is Ready");
    }
}


-(void)setupAudioEngine {
    CCLOG(@"setting up AudioEngine");
    if (hasAudioBeenInitialized == YES) {
        return;
    } else {
        hasAudioBeenInitialized = YES; 
        NSOperationQueue *queue = [[NSOperationQueue new] autorelease];
        NSInvocationOperation *asyncSetupOperation = 
        [[NSInvocationOperation alloc] initWithTarget:self 
                                             selector:@selector(initAudioAsync) 
                                               object:nil];
        [queue addOperation:asyncSetupOperation];
        [asyncSetupOperation autorelease];
    }
}

-(void)playCurrentPageSound {
    if (pageTextSoundID != -1) {
        [self stopPageText];
    } else {
        [self playPageText];
    }
}

-(void)playPageText {
    if ([[[BookManager sharedBookManager].soundEffectsState objectForKey:@"COVER_TEXT"] boolValue] == SFX_LOADED) {
        pageTextSoundID = playEffectNoLoop(COVER_TEXT);
    }
}

-(void)stopPageText {
    stopEffect(pageTextSoundID);
    pageTextSoundID=-1;
}
*/

-(void)runSceneWithID:(SceneTypes)sceneID {
    CCLOG(@"runScenewithID: %i",sceneID);
    SceneTypes oldScene = currentScene;
    currentScene = sceneID;
    int pageDirection = currentScene - oldScene;
    
    id sceneToRun = nil;
    // 0 = regular, 1 = pageturn
    int sceneTransitionType = 0;
    
    if (pageDirection > 0 && sceneTransitionType != 0) {
        sceneTransitionType = 1;
    } else if (pageDirection < 0 && sceneTransitionType != 0) {
        sceneTransitionType = 2;        
    }
    
    CCLOG(@"preswitch sID:%i, cs:%i",sceneID, currentScene);
    switch (sceneID) {
        case kCover: 
         //   sceneToRun = [KGE_cover scene];
            break;              
        case kPage2: 
         //   sceneToRun = [KGE_pg2 scene];
            break;
        case kPage3: 
        //    sceneToRun = [KGE_pg3 scene];
            break;
        case kPage4: 
        //    sceneToRun = [KGE_pg4 scene];
            break;      
        case kPage5:
        //    sceneToRun = [KGE_pg5_spritetest scene];
            break;
        case kPage6:
            sceneToRun = [KGE_pg6 scene];
            break;
        // case kPage7:
        //    sceneToRun = [KGE_pg7 scene];
        //    break;
        case kPage11:
        //    sceneToRun = [KGE_pg11 scene];
            break;
        default:
            CCLOG(@"Unknown ID, cannot switch scenes");
            return;
            break;
    }
     

    if (sceneToRun == nil) {
        // Revert back, since no new scene was found
        currentScene = oldScene;
        return;
    }
    
    while ([BookManager sharedBookManager].managerSoundState != kAudioManagerReady) {
        [NSThread sleepForTimeInterval:0.1];
        //CCLOG(@"soundState: %i",[BookManager sharedBookManager].managerSoundState);
    }
    
    // Load Audio for Page - need loading screen here?
    [self loadAudioForSceneWithID:[NSNumber numberWithInt:currentScene]];
    
    if ([[CCDirector sharedDirector] runningScene] == nil) {
        CCLOG(@"push scene %i",currentScene);
        [[CCDirector sharedDirector] pushScene: sceneToRun];
        // CCLOG(@"first scene: runWithScene scene %i",currentScene);
        // [[CCDirector sharedDirector] runWithScene:sceneToRun];
    } else {
        CCLOG(@"replace scene %i",currentScene);
        if (sceneTransitionType == 0) {
            [[CCDirector sharedDirector] replaceScene:sceneToRun];
        } else if (sceneTransitionType == 1) {
            //CCLOG(@"sceneTransitionType - 1");
            [[CCDirector sharedDirector] replaceScene:sceneToRun];

            //[[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:0.5f scene:sceneToRun]];
        } else if (sceneTransitionType == 2) {
            [[CCDirector sharedDirector] replaceScene:sceneToRun];

            //[[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:0.5f scene:sceneToRun backwards:YES]];            
        }
    }
    [self unloadAudioForSceneWithID:[NSNumber numberWithInt:oldScene]];
     currentScene = sceneID;
}

-(SceneTypes)getScene {
    return currentScene;
}
-(SceneTypes)getLastScene {
    return lastScene;
}

@end
