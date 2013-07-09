//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/CubicCurve.java
//
//  Created by Thomas on 7/9/13.
//

#import "IOSFloatArray.h"
#import "IOSObjectArray.h"
#import "pythagoras/f/ICubicCurve.h"
#import "pythagoras/f/IPoint.h"

@implementation PythagorasFCubicCurve

@synthesize x1_ = x1__;
@synthesize y1_ = y1__;
@synthesize ctrlx1 = ctrlx1_;
@synthesize ctrly1 = ctrly1_;
@synthesize ctrlx2 = ctrlx2_;
@synthesize ctrly2 = ctrly2_;
@synthesize x2_ = x2__;
@synthesize y2_ = y2__;

- (id)init {
  return [super init];
}

- (id)initWithFloat:(float)x1
          withFloat:(float)y1
          withFloat:(float)ctrlx1
          withFloat:(float)ctrly1
          withFloat:(float)ctrlx2
          withFloat:(float)ctrly2
          withFloat:(float)x2
          withFloat:(float)y2 {
  if ((self = [super init])) {
    [self setCurveWithFloat:x1 withFloat:y1 withFloat:ctrlx1 withFloat:ctrly1 withFloat:ctrlx2 withFloat:ctrly2 withFloat:x2 withFloat:y2];
  }
  return self;
}

- (void)setCurveWithFloat:(float)x1
                withFloat:(float)y1
                withFloat:(float)ctrlx1
                withFloat:(float)ctrly1
                withFloat:(float)ctrlx2
                withFloat:(float)ctrly2
                withFloat:(float)x2
                withFloat:(float)y2 {
  self.x1_ = x1;
  self.y1_ = y1;
  self.ctrlx1 = ctrlx1;
  self.ctrly1 = ctrly1;
  self.ctrlx2 = ctrlx2;
  self.ctrly2 = ctrly2;
  self.x2_ = x2;
  self.y2_ = y2;
}

- (void)setCurveWithPythagorasFIPoint:(id<PythagorasFIPoint>)p1
                withPythagorasFIPoint:(id<PythagorasFIPoint>)cp1
                withPythagorasFIPoint:(id<PythagorasFIPoint>)cp2
                withPythagorasFIPoint:(id<PythagorasFIPoint>)p2 {
  [self setCurveWithFloat:[((id<PythagorasFIPoint>) NIL_CHK(p1)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(p1)) y] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(cp1)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(cp1)) y] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(cp2)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(cp2)) y] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(p2)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(p2)) y]];
}

- (void)setCurveWithJavaLangFloatArray:(IOSFloatArray *)coords
                               withInt:(int)offset {
  [self setCurveWithFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:offset + 0] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:offset + 1] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:offset + 2] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:offset + 3] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:offset + 4] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:offset + 5] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:offset + 6] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:offset + 7]];
}

- (void)setCurveWithPythagorasFIPointArray:(IOSObjectArray *)points
                                   withInt:(int)offset {
  [self setCurveWithFloat:[((id<PythagorasFIPoint>) [((IOSObjectArray *) NIL_CHK(points)) objectAtIndex:offset + 0]) x] withFloat:[((id<PythagorasFIPoint>) [((IOSObjectArray *) NIL_CHK(points)) objectAtIndex:offset + 0]) y] withFloat:[((id<PythagorasFIPoint>) [((IOSObjectArray *) NIL_CHK(points)) objectAtIndex:offset + 1]) x] withFloat:[((id<PythagorasFIPoint>) [((IOSObjectArray *) NIL_CHK(points)) objectAtIndex:offset + 1]) y] withFloat:[((id<PythagorasFIPoint>) [((IOSObjectArray *) NIL_CHK(points)) objectAtIndex:offset + 2]) x] withFloat:[((id<PythagorasFIPoint>) [((IOSObjectArray *) NIL_CHK(points)) objectAtIndex:offset + 2]) y] withFloat:[((id<PythagorasFIPoint>) [((IOSObjectArray *) NIL_CHK(points)) objectAtIndex:offset + 3]) x] withFloat:[((id<PythagorasFIPoint>) [((IOSObjectArray *) NIL_CHK(points)) objectAtIndex:offset + 3]) y]];
}

- (void)setCurveWithPythagorasFICubicCurve:(id<PythagorasFICubicCurve>)curve {
  [self setCurveWithFloat:[((id<PythagorasFICubicCurve>) NIL_CHK(curve)) x1] withFloat:[((id<PythagorasFICubicCurve>) NIL_CHK(curve)) y1] withFloat:[((id<PythagorasFICubicCurve>) NIL_CHK(curve)) ctrlX1] withFloat:[((id<PythagorasFICubicCurve>) NIL_CHK(curve)) ctrlY1] withFloat:[((id<PythagorasFICubicCurve>) NIL_CHK(curve)) ctrlX2] withFloat:[((id<PythagorasFICubicCurve>) NIL_CHK(curve)) ctrlY2] withFloat:[((id<PythagorasFICubicCurve>) NIL_CHK(curve)) x2] withFloat:[((id<PythagorasFICubicCurve>) NIL_CHK(curve)) y2]];
}

- (float)x1 {
  return x1__;
}

- (float)y1 {
  return y1__;
}

- (float)ctrlX1 {
  return ctrlx1_;
}

- (float)ctrlY1 {
  return ctrly1_;
}

- (float)ctrlX2 {
  return ctrlx2_;
}

- (float)ctrlY2 {
  return ctrly2_;
}

- (float)x2 {
  return x2__;
}

- (float)y2 {
  return y2__;
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasFCubicCurve *typedCopy = (PythagorasFCubicCurve *) copy;
  typedCopy.x1_ = x1__;
  typedCopy.y1_ = y1__;
  typedCopy.ctrlx1 = ctrlx1_;
  typedCopy.ctrly1 = ctrly1_;
  typedCopy.ctrlx2 = ctrlx2_;
  typedCopy.ctrly2 = ctrly2_;
  typedCopy.x2_ = x2__;
  typedCopy.y2_ = y2__;
}

@end
