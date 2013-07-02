//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/AssetWatcher.java
//
//  Created by Thomas on 7/1/13.
//

#import "Asserts.h"
#import "Callback.h"
#import "Image.h"
#import "Sound.h"
#import "java/lang/Throwable.h"
#import "AssetWatcher.h"

@implementation PlaynCoreAssetWatcher

@synthesize total = total_;
@synthesize loaded = loaded_;
@synthesize errors = errors_;
@synthesize start_ = start__;
- (PlaynCoreAssetWatcher_Listener *)listener {
  return listener_;
}
- (void)setListener:(PlaynCoreAssetWatcher_Listener *)listener {
  JreOperatorRetainedAssign(&listener_, self, listener);
}
@synthesize listener = listener_;
- (id<PlaynCoreUtilCallback>)callback {
  return callback_;
}
- (void)setCallback:(id<PlaynCoreUtilCallback>)callback {
  JreOperatorRetainedAssign(&callback_, self, callback);
}
@synthesize callback = callback_;

- (id)init {
  if ((self = [self initPlaynCoreAssetWatcherWithPlaynCoreAssetWatcher_Listener:nil])) {
    [self start];
  }
  return self;
}

- (id)initPlaynCoreAssetWatcherWithPlaynCoreAssetWatcher_Listener:(PlaynCoreAssetWatcher_Listener *)listener {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&callback_, self, [[[PlaynCoreAssetWatcher_$1 alloc] initWithPlaynCoreAssetWatcher:self] autorelease]);
    self.listener = listener;
  }
  return self;
}

- (id)initWithPlaynCoreAssetWatcher_Listener:(PlaynCoreAssetWatcher_Listener *)listener {
  return [self initPlaynCoreAssetWatcherWithPlaynCoreAssetWatcher_Listener:listener];
}

- (void)addWithPlaynCoreImage:(id<PlaynCoreImage>)image {
  [PlaynCoreAsserts checkStateWithBOOL:!start__ || listener_ == nil];
  ++total_;
  [((id<PlaynCoreImage>) NIL_CHK(image)) addCallbackWithPlaynCoreUtilCallback:callback_];
}

- (void)addWithPlaynCoreSound:(id<PlaynCoreSound>)sound {
  [PlaynCoreAsserts checkStateWithBOOL:!start__ || listener_ == nil];
  ++total_;
  [((id<PlaynCoreSound>) NIL_CHK(sound)) addCallbackWithPlaynCoreUtilCallback:callback_];
}

- (BOOL)isDone {
  return start__ && (loaded_ + errors_ == total_);
}

- (void)start {
  start__ = YES;
  [self update];
}

- (void)update {
  if (listener_ == nil) return;
  [((PlaynCoreAssetWatcher_Listener *) NIL_CHK(listener_)) progressWithInt:loaded_ withInt:errors_ withInt:total_];
  if ([self isDone]) [((PlaynCoreAssetWatcher_Listener *) NIL_CHK(listener_)) done];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&callback_, self, nil);
  JreOperatorRetainedAssign(&listener_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreAssetWatcher *typedCopy = (PlaynCoreAssetWatcher *) copy;
  typedCopy.total = total_;
  typedCopy.loaded = loaded_;
  typedCopy.errors = errors_;
  typedCopy.start_ = start__;
  typedCopy.listener = listener_;
  typedCopy.callback = callback_;
}

@end
@implementation PlaynCoreAssetWatcher_Listener

- (void)progressWithInt:(int)loaded
                withInt:(int)errors
                withInt:(int)total {
}

- (void)done {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
}

- (void)errorWithJavaLangThrowable:(JavaLangThrowable *)e {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation PlaynCoreAssetWatcher_$1

- (PlaynCoreAssetWatcher *)this$0 {
  return this$0_;
}
- (void)setThis$0:(PlaynCoreAssetWatcher *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;

- (void)onSuccessWithId:(id)resource {
  ++this$0_.loaded;
  [this$0_ update];
}

- (void)onFailureWithJavaLangThrowable:(JavaLangThrowable *)e {
  ++this$0_.errors;
  if (this$0_.listener != nil) [this$0_.listener errorWithJavaLangThrowable:e];
  [this$0_ update];
}

- (id)initWithPlaynCoreAssetWatcher:(PlaynCoreAssetWatcher *)outer$ {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreAssetWatcher_$1 *typedCopy = (PlaynCoreAssetWatcher_$1 *) copy;
  typedCopy.this$0 = this$0_;
}

@end
