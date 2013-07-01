//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/canvas/LayerCanvas.java
//
//  Created by Thomas on 7/1/13.
//

#import "AbstractLayer.h"
#import "Canvas.h"
#import "InternalTransform.h"
#import "Transform.h"

@implementation PlaynCoreCanvasLayerCanvas

- (void)paintWithPlaynCoreCanvas:(id<PlaynCoreCanvas>)canvas
                       withFloat:(float)parentAlpha {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
}

- (id)initWithPlaynCoreInternalTransform:(id<PlaynCoreInternalTransform>)xform {
  return [super initWithPlaynCoreInternalTransform:xform];
}

- (void)transformWithPlaynCoreCanvas:(id<PlaynCoreCanvas>)canvas {
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) translateWithFloat:originX__ withFloat:originY__];
  id<PlaynCoreInternalTransform> transform = (id<PlaynCoreInternalTransform>) [self transform];
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) transformWithFloat:[((id<PlaynCoreInternalTransform>) NIL_CHK(transform)) m00] withFloat:[((id<PlaynCoreInternalTransform>) NIL_CHK(transform)) m01] withFloat:[((id<PlaynCoreInternalTransform>) NIL_CHK(transform)) m10] withFloat:[((id<PlaynCoreInternalTransform>) NIL_CHK(transform)) m11] withFloat:[((id<PlaynCoreInternalTransform>) NIL_CHK(transform)) tx] - originX__ withFloat:[((id<PlaynCoreInternalTransform>) NIL_CHK(transform)) ty] - originY__];
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) translateWithFloat:-originX__ withFloat:-originY__];
}

- (void)dealloc {
  [super dealloc];
}

@end