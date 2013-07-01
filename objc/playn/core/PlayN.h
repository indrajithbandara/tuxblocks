//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/PlayN.java
//
//  Created by Thomas on 7/1/13.
//

@class PlaynCorePlatform_TypeEnum;
@protocol JavaLangRunnable;
@protocol PlaynCoreAnalytics;
@protocol PlaynCoreAssets;
@protocol PlaynCoreAudio;
@protocol PlaynCoreGame;
@protocol PlaynCoreGraphics;
@protocol PlaynCoreJson;
@protocol PlaynCoreKeyboard;
@protocol PlaynCoreLog;
@protocol PlaynCoreMouse;
@protocol PlaynCoreNet;
@protocol PlaynCorePlatform;
@protocol PlaynCorePlayN_LifecycleListener;
@protocol PlaynCorePointer;
@protocol PlaynCoreRegularExpression;
@protocol PlaynCoreStorage;
@protocol PlaynCoreTouch;
@protocol PlaynCoreUIOverlay;

#import "JreEmulation.h"

@interface PlaynCorePlayN : NSObject {
}

+ (void)setPlatform:(id<PlaynCorePlatform>)platform_;
+ (void)runWithPlaynCoreGame:(id<PlaynCoreGame>)game;
+ (id<PlaynCorePlatform>)platform;
+ (PlaynCorePlatform_TypeEnum *)platformType;
+ (double)currentTime;
+ (int)tick;
+ (float)random;
+ (void)openURLWithNSString:(NSString *)url;
+ (void)invokeLaterWithJavaLangRunnable:(id<JavaLangRunnable>)runnable;
+ (void)setLifecycleListenerWithPlaynCorePlayN_LifecycleListener:(id<PlaynCorePlayN_LifecycleListener>)listener;
+ (id<PlaynCoreAudio>)audio;
+ (id<PlaynCoreGraphics>)graphics;
+ (id<PlaynCoreAssets>)assets;
+ (id<PlaynCoreJson>)json;
+ (id<PlaynCoreKeyboard>)keyboard;
+ (id<PlaynCoreLog>)log;
+ (id<PlaynCoreNet>)net;
+ (id<PlaynCorePointer>)pointer;
+ (id<PlaynCoreMouse>)mouse;
+ (id<PlaynCoreRegularExpression>)regularExpression;
+ (id<PlaynCoreTouch>)touch;
+ (id<PlaynCoreStorage>)storage;
+ (id<PlaynCoreAnalytics>)analytics;
+ (id<PlaynCoreUIOverlay>)uiOverlay;
+ (void)setPlatformWithPlaynCorePlatform:(id<PlaynCorePlatform>)platform;
- (id)init;
@end

@protocol PlaynCorePlayN_LifecycleListener < NSObject >
- (void)onPause;
- (void)onResume;
- (void)onExit;
@end