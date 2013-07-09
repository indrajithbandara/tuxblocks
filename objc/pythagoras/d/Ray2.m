//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/Ray2.java
//
//  Created by Thomas on 7/9/13.
//

#import "java/lang/Float.h"
#import "java/lang/Math.h"
#import "pythagoras/d/IRay2.h"
#import "pythagoras/d/IVector.h"
#import "pythagoras/d/MathUtil.h"
#import "pythagoras/d/Transform.h"
#import "pythagoras/d/Vector.h"

@implementation PythagorasDRay2

- (PythagorasDVector *)origin_ {
  return origin__;
}
- (void)setOrigin_:(PythagorasDVector *)origin_ {
  JreOperatorRetainedAssign(&origin__, self, origin_);
}
@synthesize origin_ = origin__;
- (PythagorasDVector *)direction_ {
  return direction__;
}
- (void)setDirection_:(PythagorasDVector *)direction_ {
  JreOperatorRetainedAssign(&direction__, self, direction_);
}
@synthesize direction_ = direction__;

- (id)initWithPythagorasDVector:(PythagorasDVector *)origin
          withPythagorasDVector:(PythagorasDVector *)direction {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&origin__, self, [[[PythagorasDVector alloc] init] autorelease]);
    JreOperatorRetainedAssign(&direction__, self, [[[PythagorasDVector alloc] init] autorelease]);
    (void) [self setWithPythagorasDIVector:origin withPythagorasDIVector:direction];
  }
  return self;
}

- (id)initWithPythagorasDRay2:(PythagorasDRay2 *)other {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&origin__, self, [[[PythagorasDVector alloc] init] autorelease]);
    JreOperatorRetainedAssign(&direction__, self, [[[PythagorasDVector alloc] init] autorelease]);
    (void) [self setWithPythagorasDIRay2:other];
  }
  return self;
}

- (id)init {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&origin__, self, [[[PythagorasDVector alloc] init] autorelease]);
    JreOperatorRetainedAssign(&direction__, self, [[[PythagorasDVector alloc] init] autorelease]);
  }
  return self;
}

- (PythagorasDRay2 *)setWithPythagorasDIRay2:(id<PythagorasDIRay2>)other {
  return [self setWithPythagorasDIVector:[((id<PythagorasDIRay2>) NIL_CHK(other)) origin] withPythagorasDIVector:[((id<PythagorasDIRay2>) NIL_CHK(other)) direction]];
}

- (PythagorasDRay2 *)setWithPythagorasDIVector:(id<PythagorasDIVector>)origin
                        withPythagorasDIVector:(id<PythagorasDIVector>)direction {
  (void) [((PythagorasDVector *) NIL_CHK(self.origin_)) setWithPythagorasDIVector:origin];
  (void) [((PythagorasDVector *) NIL_CHK(self.direction_)) setWithPythagorasDIVector:direction];
  return self;
}

- (PythagorasDRay2 *)transformLocalWithPythagorasDTransform:(id<PythagorasDTransform>)transform {
  return [self transformWithPythagorasDTransform:transform withPythagorasDRay2:self];
}

- (id<PythagorasDIVector>)origin {
  return origin__;
}

- (id<PythagorasDIVector>)direction {
  return direction__;
}

- (PythagorasDRay2 *)transformWithPythagorasDTransform:(id<PythagorasDTransform>)transform {
  return [self transformWithPythagorasDTransform:transform withPythagorasDRay2:[[[PythagorasDRay2 alloc] init] autorelease]];
}

- (PythagorasDRay2 *)transformWithPythagorasDTransform:(id<PythagorasDTransform>)transform
                                   withPythagorasDRay2:(PythagorasDRay2 *)result {
  (void) [((id<PythagorasDTransform>) NIL_CHK(transform)) transformPointWithPythagorasDIVector:origin__ withPythagorasDVector:((PythagorasDRay2 *) NIL_CHK(result)).origin_];
  (void) [[((id<PythagorasDTransform>) NIL_CHK(transform)) transformWithPythagorasDIVector:direction__ withPythagorasDVector:((PythagorasDRay2 *) NIL_CHK(result)).direction_] normalizeLocal];
  return result;
}

- (BOOL)intersectsWithPythagorasDIVector:(id<PythagorasDIVector>)pt {
  if ([JavaLangMath absWithDouble:((PythagorasDVector *) NIL_CHK(direction__)).x_] > [JavaLangMath absWithDouble:((PythagorasDVector *) NIL_CHK(direction__)).y_]) {
    double t = ([((id<PythagorasDIVector>) NIL_CHK(pt)) x] - ((PythagorasDVector *) NIL_CHK(origin__)).x_) / ((PythagorasDVector *) NIL_CHK(direction__)).x_;
    return t >= 0.0f && ((PythagorasDVector *) NIL_CHK(origin__)).y_ + t * ((PythagorasDVector *) NIL_CHK(direction__)).y_ == [((id<PythagorasDIVector>) NIL_CHK(pt)) y];
  }
  else {
    double t = ([((id<PythagorasDIVector>) NIL_CHK(pt)) y] - ((PythagorasDVector *) NIL_CHK(origin__)).y_) / ((PythagorasDVector *) NIL_CHK(direction__)).y_;
    return t >= 0.0f && ((PythagorasDVector *) NIL_CHK(origin__)).x_ + t * ((PythagorasDVector *) NIL_CHK(direction__)).x_ == [((id<PythagorasDIVector>) NIL_CHK(pt)) x];
  }
}

- (BOOL)getIntersectionWithPythagorasDIVector:(id<PythagorasDIVector>)start
                       withPythagorasDIVector:(id<PythagorasDIVector>)end
                        withPythagorasDVector:(PythagorasDVector *)result {
  double ax = ((PythagorasDVector *) NIL_CHK(origin__)).x_, ay = ((PythagorasDVector *) NIL_CHK(origin__)).y_;
  double bx = ((PythagorasDVector *) NIL_CHK(direction__)).x_, by = ((PythagorasDVector *) NIL_CHK(direction__)).y_;
  double cx = [((id<PythagorasDIVector>) NIL_CHK(start)) x], cy = [((id<PythagorasDIVector>) NIL_CHK(start)) y];
  double dx = [((id<PythagorasDIVector>) NIL_CHK(end)) x] - [((id<PythagorasDIVector>) NIL_CHK(start)) x], dy = [((id<PythagorasDIVector>) NIL_CHK(end)) y] - [((id<PythagorasDIVector>) NIL_CHK(start)) y];
  double divisor = bx * dy - by * dx;
  if ([JavaLangMath absWithDouble:divisor] < PythagorasDMathUtil_EPSILON) {
    double t = [JavaLangMath minWithDouble:[self getIntersectionWithPythagorasDIVector:start] withDouble:[self getIntersectionWithPythagorasDIVector:end]];
    BOOL isect = (t != JavaLangFloat_MAX_VALUE);
    if (isect) {
      (void) [((PythagorasDVector *) NIL_CHK(origin__)) addScaledWithPythagorasDIVector:direction__ withDouble:t withPythagorasDVector:result];
    }
    return isect;
  }
  double cxax = cx - ax, cyay = cy - ay;
  double s = (by * cxax - bx * cyay) / divisor;
  if (s < 0.0f || s > 1.0f) {
    return NO;
  }
  double t = (dy * cxax - dx * cyay) / divisor;
  BOOL isect = (t >= 0.0f);
  if (isect) {
    (void) [((PythagorasDVector *) NIL_CHK(origin__)) addScaledWithPythagorasDIVector:direction__ withDouble:t withPythagorasDVector:result];
  }
  return isect;
}

- (BOOL)getIntersectionWithPythagorasDIVector:(id<PythagorasDIVector>)start
                       withPythagorasDIVector:(id<PythagorasDIVector>)end
                                   withDouble:(double)radius
                        withPythagorasDVector:(PythagorasDVector *)result {
  double startx = [((id<PythagorasDIVector>) NIL_CHK(start)) x], starty = [((id<PythagorasDIVector>) NIL_CHK(start)) y];
  double a = starty - [((id<PythagorasDIVector>) NIL_CHK(end)) y], b = [((id<PythagorasDIVector>) NIL_CHK(end)) x] - startx;
  double len = [JavaLangMath hypotWithDouble:a withDouble:b];
  if (len < PythagorasDMathUtil_EPSILON) {
    return [self getIntersectionWithPythagorasDIVector:start withDouble:radius withPythagorasDVector:result];
  }
  double rlen = 1.0f / len;
  a *= rlen;
  b *= rlen;
  double c = -a * startx - b * starty;
  double dist = a * ((PythagorasDVector *) NIL_CHK(origin__)).x_ + b * ((PythagorasDVector *) NIL_CHK(origin__)).y_ + c;
  BOOL above = (dist > +radius), below = (dist < -radius);
  double x, y;
  if (above || below) {
    double divisor = a * ((PythagorasDVector *) NIL_CHK(direction__)).x_ + b * ((PythagorasDVector *) NIL_CHK(direction__)).y_;
    if ([JavaLangMath absWithDouble:divisor] < PythagorasDMathUtil_EPSILON) {
      return NO;
    }
    c += (above ? -radius : +radius);
    double t = (-a * ((PythagorasDVector *) NIL_CHK(origin__)).x_ - b * ((PythagorasDVector *) NIL_CHK(origin__)).y_ - c) / divisor;
    if (t < 0.0f) {
      return NO;
    }
    x = ((PythagorasDVector *) NIL_CHK(origin__)).x_ + t * ((PythagorasDVector *) NIL_CHK(direction__)).x_;
    y = ((PythagorasDVector *) NIL_CHK(origin__)).y_ + t * ((PythagorasDVector *) NIL_CHK(direction__)).y_;
  }
  else {
    x = ((PythagorasDVector *) NIL_CHK(origin__)).x_;
    y = ((PythagorasDVector *) NIL_CHK(origin__)).y_;
  }
  double tmp = a;
  a = b;
  b = -tmp;
  c = -a * startx - b * starty;
  dist = a * x + b * y + c;
  if (dist < 0.0f) {
    return [self getIntersectionWithPythagorasDIVector:start withDouble:radius withPythagorasDVector:result];
  }
  else if (dist > len) {
    return [self getIntersectionWithPythagorasDIVector:end withDouble:radius withPythagorasDVector:result];
  }
  else {
    (void) [((PythagorasDVector *) NIL_CHK(result)) setWithDouble:x withDouble:y];
    return YES;
  }
}

- (BOOL)getIntersectionWithPythagorasDIVector:(id<PythagorasDIVector>)center
                                   withDouble:(double)radius
                        withPythagorasDVector:(PythagorasDVector *)result {
  if ([((PythagorasDVector *) NIL_CHK(origin__)) distanceSqWithPythagorasDIVector:center] <= radius * radius) {
    (void) [((PythagorasDVector *) NIL_CHK(result)) setWithPythagorasDIVector:origin__];
    return YES;
  }
  double ax = ((PythagorasDVector *) NIL_CHK(origin__)).x_ - [((id<PythagorasDIVector>) NIL_CHK(center)) x], ay = ((PythagorasDVector *) NIL_CHK(origin__)).y_ - [((id<PythagorasDIVector>) NIL_CHK(center)) y];
  double b = 2.0f * (((PythagorasDVector *) NIL_CHK(direction__)).x_ * ax + ((PythagorasDVector *) NIL_CHK(direction__)).y_ * ay);
  double c = ax * ax + ay * ay - radius * radius;
  double radicand = b * b - 4.0f * c;
  if (radicand < 0.0f) {
    return NO;
  }
  double t = (-b - [JavaLangMath sqrtWithDouble:radicand]) * 0.5f;
  BOOL isect = (t >= 0.0f);
  if (isect) {
    (void) [((PythagorasDVector *) NIL_CHK(origin__)) addScaledWithPythagorasDIVector:direction__ withDouble:t withPythagorasDVector:result];
  }
  return isect;
}

- (PythagorasDVector *)getNearestPointWithPythagorasDIVector:(id<PythagorasDIVector>)point
                                       withPythagorasDVector:(PythagorasDVector *)result {
  if (result == nil) {
    result = [[[PythagorasDVector alloc] init] autorelease];
  }
  double r = [[((id<PythagorasDIVector>) NIL_CHK(point)) subtractWithPythagorasDIVector:origin__] dotWithPythagorasDIVector:direction__];
  (void) [((PythagorasDVector *) NIL_CHK(result)) setWithPythagorasDIVector:[((PythagorasDVector *) NIL_CHK(origin__)) addWithPythagorasDIVector:[((PythagorasDVector *) NIL_CHK(direction__)) scale__WithDouble:r]]];
  return result;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"[origin=%@, direction=%@]", origin__, direction__];
}

- (double)getIntersectionWithPythagorasDIVector:(id<PythagorasDIVector>)pt {
  if ([JavaLangMath absWithDouble:((PythagorasDVector *) NIL_CHK(direction__)).x_] > [JavaLangMath absWithDouble:((PythagorasDVector *) NIL_CHK(direction__)).y_]) {
    double t = ([((id<PythagorasDIVector>) NIL_CHK(pt)) x] - ((PythagorasDVector *) NIL_CHK(origin__)).x_) / ((PythagorasDVector *) NIL_CHK(direction__)).x_;
    return (t >= 0.0f && ((PythagorasDVector *) NIL_CHK(origin__)).y_ + t * ((PythagorasDVector *) NIL_CHK(direction__)).y_ == [((id<PythagorasDIVector>) NIL_CHK(pt)) y]) ? t : JavaLangFloat_MAX_VALUE;
  }
  else {
    double t = ([((id<PythagorasDIVector>) NIL_CHK(pt)) y] - ((PythagorasDVector *) NIL_CHK(origin__)).y_) / ((PythagorasDVector *) NIL_CHK(direction__)).y_;
    return (t >= 0.0f && ((PythagorasDVector *) NIL_CHK(origin__)).x_ + t * ((PythagorasDVector *) NIL_CHK(direction__)).x_ == [((id<PythagorasDIVector>) NIL_CHK(pt)) x]) ? t : JavaLangFloat_MAX_VALUE;
  }
}

- (void)dealloc {
  JreOperatorRetainedAssign(&direction__, self, nil);
  JreOperatorRetainedAssign(&origin__, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasDRay2 *typedCopy = (PythagorasDRay2 *) copy;
  typedCopy.origin_ = origin__;
  typedCopy.direction_ = direction__;
}

@end
