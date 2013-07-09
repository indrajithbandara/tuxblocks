//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/Circle.java
//
//  Created by Thomas on 7/9/13.
//

#import "pythagoras/d/ICircle.h"
#import "pythagoras/d/IPoint.h"

@implementation PythagorasDCircle

@synthesize x_ = x__;
@synthesize y_ = y__;
@synthesize radius_ = radius__;

- (id)init {
  return [super init];
}

- (id)initPythagorasDCircleWithDouble:(double)x
                           withDouble:(double)y
                           withDouble:(double)radius {
  if ((self = [super init])) {
    (void) [self setWithDouble:x withDouble:y withDouble:radius];
  }
  return self;
}

- (id)initWithDouble:(double)x
          withDouble:(double)y
          withDouble:(double)radius {
  return [self initPythagorasDCircleWithDouble:x withDouble:y withDouble:radius];
}

- (id)initWithPythagorasDIPoint:(id<PythagorasDIPoint>)p
                     withDouble:(double)radius {
  return [self initPythagorasDCircleWithDouble:[((id<PythagorasDIPoint>) NIL_CHK(p)) x] withDouble:[((id<PythagorasDIPoint>) NIL_CHK(p)) y] withDouble:radius];
}

- (id)initWithPythagorasDICircle:(id<PythagorasDICircle>)c {
  return [self initPythagorasDCircleWithDouble:[((id<PythagorasDICircle>) NIL_CHK(c)) x] withDouble:[((id<PythagorasDICircle>) NIL_CHK(c)) y] withDouble:[((id<PythagorasDICircle>) NIL_CHK(c)) radius]];
}

- (PythagorasDCircle *)setWithPythagorasDICircle:(id<PythagorasDICircle>)c {
  return [self setWithDouble:[((id<PythagorasDICircle>) NIL_CHK(c)) x] withDouble:[((id<PythagorasDICircle>) NIL_CHK(c)) y] withDouble:[((id<PythagorasDICircle>) NIL_CHK(c)) radius]];
}

- (PythagorasDCircle *)setWithDouble:(double)x
                          withDouble:(double)y
                          withDouble:(double)radius {
  self.x_ = x;
  self.y_ = y;
  self.radius_ = radius;
  return self;
}

- (double)x {
  return x__;
}

- (double)y {
  return y__;
}

- (double)radius {
  return radius__;
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasDCircle *typedCopy = (PythagorasDCircle *) copy;
  typedCopy.x_ = x__;
  typedCopy.y_ = y__;
  typedCopy.radius_ = radius__;
}

@end
