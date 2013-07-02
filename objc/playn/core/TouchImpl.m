//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/TouchImpl.java
//
//  Created by Thomas on 7/1/13.
//

#import "AbstractLayer.h"
#import "Dispatcher.h"
#import "Events.h"
#import "Graphics.h"
#import "GroupLayer.h"
#import "IOSObjectArray.h"
#import "Layer.h"
#import "PlayN.h"
#import "Point.h"
#import "Touch.h"
#import "Transform.h"
#import "java/lang/Integer.h"
#import "java/util/HashMap.h"
#import "java/util/Iterator.h"
#import "java/util/Map.h"
#import "java/util/Set.h"
#import "TouchImpl.h"

@implementation PlaynCoreTouchImpl

static id<PlaynCoreAbstractLayer_Interaction> PlaynCoreTouchImpl_START_;
static id<PlaynCoreAbstractLayer_Interaction> PlaynCoreTouchImpl_MOVE_;
static id<PlaynCoreAbstractLayer_Interaction> PlaynCoreTouchImpl_END_;
static id<PlaynCoreAbstractLayer_Interaction> PlaynCoreTouchImpl_CANCEL_;

@synthesize enabled = enabled_;
- (id<PlaynCoreDispatcher>)dispatcher {
  return dispatcher_;
}
- (void)setDispatcher:(id<PlaynCoreDispatcher>)dispatcher {
  JreOperatorRetainedAssign(&dispatcher_, self, dispatcher);
}
@synthesize dispatcher = dispatcher_;
- (id<PlaynCoreTouch_Listener>)listener_ {
  return listener__;
}
- (void)setListener_:(id<PlaynCoreTouch_Listener>)listener_ {
  JreOperatorRetainedAssign(&listener__, self, listener_);
}
@synthesize listener_ = listener__;
- (id<JavaUtilMap>)activeLayers {
  return activeLayers_;
}
- (void)setActiveLayers:(id<JavaUtilMap>)activeLayers {
  JreOperatorRetainedAssign(&activeLayers_, self, activeLayers);
}
@synthesize activeLayers = activeLayers_;

+ (id<PlaynCoreAbstractLayer_Interaction>)START {
  return PlaynCoreTouchImpl_START_;
}

+ (void)setSTART:(id<PlaynCoreAbstractLayer_Interaction>)START {
  JreOperatorRetainedAssign(&PlaynCoreTouchImpl_START_, self, START);
}

+ (id<PlaynCoreAbstractLayer_Interaction>)MOVE {
  return PlaynCoreTouchImpl_MOVE_;
}

+ (void)setMOVE:(id<PlaynCoreAbstractLayer_Interaction>)MOVE {
  JreOperatorRetainedAssign(&PlaynCoreTouchImpl_MOVE_, self, MOVE);
}

+ (id<PlaynCoreAbstractLayer_Interaction>)END {
  return PlaynCoreTouchImpl_END_;
}

+ (void)setEND:(id<PlaynCoreAbstractLayer_Interaction>)END {
  JreOperatorRetainedAssign(&PlaynCoreTouchImpl_END_, self, END);
}

+ (id<PlaynCoreAbstractLayer_Interaction>)CANCEL {
  return PlaynCoreTouchImpl_CANCEL_;
}

+ (void)setCANCEL:(id<PlaynCoreAbstractLayer_Interaction>)CANCEL {
  JreOperatorRetainedAssign(&PlaynCoreTouchImpl_CANCEL_, self, CANCEL);
}

- (BOOL)hasTouch {
  return YES;
}

- (BOOL)isEnabled {
  return enabled_;
}

- (void)setEnabledWithBOOL:(BOOL)enabled {
  self.enabled = enabled;
}

- (id<PlaynCoreTouch_Listener>)listener {
  return listener__;
}

- (void)setListenerWithPlaynCoreTouch_Listener:(id<PlaynCoreTouch_Listener>)listener {
  self.listener_ = listener;
}

- (void)cancelLayerTouchesWithPlaynCoreLayer:(id<PlaynCoreLayer>)except {
  double now = [PlaynCorePlayN currentTime];
  id<JavaUtilIterator> iter = ((id<JavaUtilIterator>) [((id<JavaUtilSet>) [((id<JavaUtilMap>) NIL_CHK(activeLayers_)) entrySet]) iterator]);
  while ([((id<JavaUtilIterator>) NIL_CHK(iter)) hasNext]) {
    id<JavaUtilMap_Entry> entry = ((id<JavaUtilMap_Entry>) [((id<JavaUtilIterator>) NIL_CHK(iter)) next]);
    PlaynCoreAbstractLayer *layer = ((PlaynCoreAbstractLayer *) [((id<JavaUtilMap_Entry>) NIL_CHK(entry)) getValue]);
    if (layer == except) continue;
    [((id<JavaUtilIterator>) NIL_CHK(iter)) remove];
    PlaynCoreTouch_Event_Impl *event = [[[PlaynCoreTouch_Event_Impl alloc] initWithPlaynCoreEvents_Flags:[[[PlaynCoreEvents_Flags_Impl alloc] init] autorelease] withDouble:now withFloat:0 withFloat:0 withInt:[((JavaLangInteger *) [((id<JavaUtilMap_Entry>) NIL_CHK(entry)) getKey]) intValue]] autorelease];
    [((id<PlaynCoreDispatcher>) NIL_CHK(dispatcher_)) dispatchWithPlaynCoreAbstractLayer:layer withIOSClass:[IOSClass classWithProtocol:@protocol(PlaynCoreTouch_LayerListener)] withId:event withPlaynCoreAbstractLayer_Interaction:PlaynCoreTouchImpl_CANCEL_];
  }
}

- (void)setPropagateEventsWithBOOL:(BOOL)propagate {
  JreOperatorRetainedAssign(&dispatcher_, self, [PlaynCoreDispatcher_Util selectWithBOOL:propagate]);
}

- (void)onTouchStartWithPlaynCoreTouch_Event_ImplArray:(IOSObjectArray *)touches {
  if (!enabled_) return;
  if (listener__ != nil) [listener__ onTouchStartWithPlaynCoreTouch_EventArray:touches];
  id<PlaynCoreGroupLayer> root = [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) rootLayer];
  if ([((id<PlaynCoreGroupLayer>) NIL_CHK(root)) interactive]) {
    {
      IOSObjectArray *a__ = touches;
      int n__ = (int) [((IOSObjectArray *) NIL_CHK(a__)) count];
      for (int i__ = 0; i__ < n__; i__++) {
        PlaynCoreTouch_Event_Impl *event = ((PlaynCoreTouch_Event_Impl *) [((IOSObjectArray *) NIL_CHK(a__)) objectAtIndex:i__]);
        PythagorasFPoint *p = [[[PythagorasFPoint alloc] initWithFloat:[((PlaynCoreTouch_Event_Impl *) NIL_CHK(event)) x] withFloat:[((PlaynCoreTouch_Event_Impl *) NIL_CHK(event)) y]] autorelease];
        (void) [((id<PythagorasFTransform>) [((id<PlaynCoreGroupLayer>) NIL_CHK(root)) transform]) inverseTransformWithPythagorasFIPoint:p withPythagorasFPoint:p];
        ((PythagorasFPoint *) NIL_CHK(p)).x_ += [((id<PlaynCoreGroupLayer>) NIL_CHK(root)) originX];
        ((PythagorasFPoint *) NIL_CHK(p)).y_ += [((id<PlaynCoreGroupLayer>) NIL_CHK(root)) originY];
        PlaynCoreAbstractLayer *hitLayer = (PlaynCoreAbstractLayer *) [((id<PlaynCoreGroupLayer>) NIL_CHK(root)) hitTestWithPythagorasFPoint:p];
        if (hitLayer != nil) {
          (void) [((id<JavaUtilMap>) NIL_CHK(activeLayers_)) putWithId:[JavaLangInteger valueOfWithInt:[((PlaynCoreTouch_Event_Impl *) NIL_CHK(event)) id__]] withId:hitLayer];
          [((id<PlaynCoreDispatcher>) NIL_CHK(dispatcher_)) dispatchWithPlaynCoreAbstractLayer:hitLayer withIOSClass:[IOSClass classWithProtocol:@protocol(PlaynCoreTouch_LayerListener)] withId:event withPlaynCoreAbstractLayer_Interaction:PlaynCoreTouchImpl_START_];
        }
      }
    }
  }
}

- (void)onTouchMoveWithPlaynCoreTouch_Event_ImplArray:(IOSObjectArray *)touches {
  if (!enabled_) return;
  if (listener__ != nil) [listener__ onTouchMoveWithPlaynCoreTouch_EventArray:touches];
  {
    IOSObjectArray *a__ = touches;
    int n__ = (int) [((IOSObjectArray *) NIL_CHK(a__)) count];
    for (int i__ = 0; i__ < n__; i__++) {
      PlaynCoreTouch_Event_Impl *event = ((PlaynCoreTouch_Event_Impl *) [((IOSObjectArray *) NIL_CHK(a__)) objectAtIndex:i__]);
      PlaynCoreAbstractLayer *activeLayer = ((PlaynCoreAbstractLayer *) [((id<JavaUtilMap>) NIL_CHK(activeLayers_)) getWithId:[JavaLangInteger valueOfWithInt:[((PlaynCoreTouch_Event_Impl *) NIL_CHK(event)) id__]]]);
      if (activeLayer != nil) {
        [((id<PlaynCoreDispatcher>) NIL_CHK(dispatcher_)) dispatchWithPlaynCoreAbstractLayer:activeLayer withIOSClass:[IOSClass classWithProtocol:@protocol(PlaynCoreTouch_LayerListener)] withId:event withPlaynCoreAbstractLayer_Interaction:PlaynCoreTouchImpl_MOVE_];
      }
    }
  }
}

- (void)onTouchEndWithPlaynCoreTouch_Event_ImplArray:(IOSObjectArray *)touches {
  if (!enabled_) return;
  if (listener__ != nil) [listener__ onTouchEndWithPlaynCoreTouch_EventArray:touches];
  {
    IOSObjectArray *a__ = touches;
    int n__ = (int) [((IOSObjectArray *) NIL_CHK(a__)) count];
    for (int i__ = 0; i__ < n__; i__++) {
      PlaynCoreTouch_Event_Impl *event = ((PlaynCoreTouch_Event_Impl *) [((IOSObjectArray *) NIL_CHK(a__)) objectAtIndex:i__]);
      PlaynCoreAbstractLayer *activeLayer = ((PlaynCoreAbstractLayer *) [((id<JavaUtilMap>) NIL_CHK(activeLayers_)) getWithId:[JavaLangInteger valueOfWithInt:[((PlaynCoreTouch_Event_Impl *) NIL_CHK(event)) id__]]]);
      if (activeLayer != nil) {
        [((id<PlaynCoreDispatcher>) NIL_CHK(dispatcher_)) dispatchWithPlaynCoreAbstractLayer:activeLayer withIOSClass:[IOSClass classWithProtocol:@protocol(PlaynCoreTouch_LayerListener)] withId:event withPlaynCoreAbstractLayer_Interaction:PlaynCoreTouchImpl_END_];
        (void) [((id<JavaUtilMap>) NIL_CHK(activeLayers_)) removeWithId:[JavaLangInteger valueOfWithInt:[((PlaynCoreTouch_Event_Impl *) NIL_CHK(event)) id__]]];
      }
    }
  }
}

- (void)onTouchCancelWithPlaynCoreTouch_Event_ImplArray:(IOSObjectArray *)touches {
  if (!enabled_) return;
  if (listener__ != nil) [listener__ onTouchCancelWithPlaynCoreTouch_EventArray:touches];
  {
    IOSObjectArray *a__ = touches;
    int n__ = (int) [((IOSObjectArray *) NIL_CHK(a__)) count];
    for (int i__ = 0; i__ < n__; i__++) {
      PlaynCoreTouch_Event_Impl *event = ((PlaynCoreTouch_Event_Impl *) [((IOSObjectArray *) NIL_CHK(a__)) objectAtIndex:i__]);
      PlaynCoreAbstractLayer *activeLayer = ((PlaynCoreAbstractLayer *) [((id<JavaUtilMap>) NIL_CHK(activeLayers_)) getWithId:[JavaLangInteger valueOfWithInt:[((PlaynCoreTouch_Event_Impl *) NIL_CHK(event)) id__]]]);
      if (activeLayer != nil) {
        [((id<PlaynCoreDispatcher>) NIL_CHK(dispatcher_)) dispatchWithPlaynCoreAbstractLayer:activeLayer withIOSClass:[IOSClass classWithProtocol:@protocol(PlaynCoreTouch_LayerListener)] withId:event withPlaynCoreAbstractLayer_Interaction:PlaynCoreTouchImpl_CANCEL_];
        (void) [((id<JavaUtilMap>) NIL_CHK(activeLayers_)) removeWithId:[JavaLangInteger valueOfWithInt:[((PlaynCoreTouch_Event_Impl *) NIL_CHK(event)) id__]]];
      }
    }
  }
}

- (id)init {
  if ((self = [super init])) {
    enabled_ = YES;
    JreOperatorRetainedAssign(&dispatcher_, self, [PlaynCoreDispatcher SINGLE]);
    JreOperatorRetainedAssign(&activeLayers_, self, [[[JavaUtilHashMap alloc] init] autorelease]);
  }
  return self;
}

+ (void)initialize {
  if (self == [PlaynCoreTouchImpl class]) {
    JreOperatorRetainedAssign(&PlaynCoreTouchImpl_START_, self, [[[PlaynCoreTouchImpl_$1 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&PlaynCoreTouchImpl_MOVE_, self, [[[PlaynCoreTouchImpl_$2 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&PlaynCoreTouchImpl_END_, self, [[[PlaynCoreTouchImpl_$3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&PlaynCoreTouchImpl_CANCEL_, self, [[[PlaynCoreTouchImpl_$4 alloc] init] autorelease]);
  }
}

- (void)dealloc {
  JreOperatorRetainedAssign(&activeLayers_, self, nil);
  JreOperatorRetainedAssign(&listener__, self, nil);
  JreOperatorRetainedAssign(&dispatcher_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreTouchImpl *typedCopy = (PlaynCoreTouchImpl *) copy;
  typedCopy.enabled = enabled_;
  typedCopy.dispatcher = dispatcher_;
  typedCopy.listener_ = listener__;
  typedCopy.activeLayers = activeLayers_;
}

@end
@implementation PlaynCoreTouchImpl_$1

- (void)interactWithId:(id<PlaynCoreTouch_LayerListener>)l
                withId:(PlaynCoreTouch_Event_Impl *)ev {
  [((id<PlaynCoreTouch_LayerListener>) NIL_CHK(l)) onTouchStartWithPlaynCoreTouch_Event:ev];
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation PlaynCoreTouchImpl_$2

- (void)interactWithId:(id<PlaynCoreTouch_LayerListener>)l
                withId:(PlaynCoreTouch_Event_Impl *)ev {
  [((id<PlaynCoreTouch_LayerListener>) NIL_CHK(l)) onTouchMoveWithPlaynCoreTouch_Event:ev];
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation PlaynCoreTouchImpl_$3

- (void)interactWithId:(id<PlaynCoreTouch_LayerListener>)l
                withId:(PlaynCoreTouch_Event_Impl *)ev {
  [((id<PlaynCoreTouch_LayerListener>) NIL_CHK(l)) onTouchEndWithPlaynCoreTouch_Event:ev];
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation PlaynCoreTouchImpl_$4

- (void)interactWithId:(id<PlaynCoreTouch_LayerListener>)l
                withId:(PlaynCoreTouch_Event_Impl *)ev {
  [((id<PlaynCoreTouch_LayerListener>) NIL_CHK(l)) onTouchCancelWithPlaynCoreTouch_Event:ev];
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
