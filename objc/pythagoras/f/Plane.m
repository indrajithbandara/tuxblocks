//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/Plane.java
//
//  Created by Thomas on 7/9/13.
//

#import "IOSFloatArray.h"
#import "java/lang/Float.h"
#import "java/lang/Math.h"
#import "java/nio/FloatBuffer.h"
#import "pythagoras/f/IRay3.h"
#import "pythagoras/f/IVector3.h"
#import "pythagoras/f/MathUtil.h"
#import "pythagoras/f/Vector3.h"
#import "pythagoras/util/Platform.h"

@implementation PythagorasFPlane

static PythagorasFPlane * PythagorasFPlane_XY_PLANE_;
static PythagorasFPlane * PythagorasFPlane_XZ_PLANE_;
static PythagorasFPlane * PythagorasFPlane_YZ_PLANE_;

@synthesize constant_ = constant__;
- (PythagorasFVector3 *)_normal {
  return _normal_;
}
- (void)set_normal:(PythagorasFVector3 *)_normal {
  JreOperatorRetainedAssign(&_normal_, self, _normal);
}
@synthesize _normal = _normal_;
- (PythagorasFVector3 *)_v1 {
  return _v1_;
}
- (void)set_v1:(PythagorasFVector3 *)_v1 {
  JreOperatorRetainedAssign(&_v1_, self, _v1);
}
@synthesize _v1 = _v1_;
- (PythagorasFVector3 *)_v2 {
  return _v2_;
}
- (void)set_v2:(PythagorasFVector3 *)_v2 {
  JreOperatorRetainedAssign(&_v2_, self, _v2);
}
@synthesize _v2 = _v2_;

+ (PythagorasFPlane *)XY_PLANE {
  return PythagorasFPlane_XY_PLANE_;
}

+ (PythagorasFPlane *)XZ_PLANE {
  return PythagorasFPlane_XZ_PLANE_;
}

+ (PythagorasFPlane *)YZ_PLANE {
  return PythagorasFPlane_YZ_PLANE_;
}

- (id)initWithPythagorasFIVector3:(id<PythagorasFIVector3>)normal
                        withFloat:(float)constant {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_normal_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&_v1_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&_v2_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    (void) [self setWithPythagorasFIVector3:normal withFloat:constant];
  }
  return self;
}

- (id)initWithJavaLangFloatArray:(IOSFloatArray *)values {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_normal_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&_v1_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&_v2_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    (void) [self setWithJavaLangFloatArray:values];
  }
  return self;
}

- (id)initWithFloat:(float)a
          withFloat:(float)b
          withFloat:(float)c
          withFloat:(float)d {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_normal_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&_v1_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&_v2_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    (void) [self setWithFloat:a withFloat:b withFloat:c withFloat:d];
  }
  return self;
}

- (id)initWithPythagorasFPlane:(PythagorasFPlane *)other {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_normal_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&_v1_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&_v2_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    (void) [self setWithPythagorasFPlane:other];
  }
  return self;
}

- (id)init {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_normal_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&_v1_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
    JreOperatorRetainedAssign(&_v2_, self, [[[PythagorasFVector3 alloc] init] autorelease]);
  }
  return self;
}

- (PythagorasFPlane *)setWithPythagorasFPlane:(PythagorasFPlane *)other {
  return [self setWithPythagorasFIVector3:[((PythagorasFPlane *) NIL_CHK(other)) normal] withFloat:((PythagorasFPlane *) NIL_CHK(other)).constant_];
}

- (PythagorasFPlane *)setWithPythagorasFIVector3:(id<PythagorasFIVector3>)normal
                                       withFloat:(float)constant {
  return [self setWithFloat:[((id<PythagorasFIVector3>) NIL_CHK(normal)) x] withFloat:[((id<PythagorasFIVector3>) NIL_CHK(normal)) y] withFloat:[((id<PythagorasFIVector3>) NIL_CHK(normal)) z] withFloat:constant];
}

- (PythagorasFPlane *)setWithJavaLangFloatArray:(IOSFloatArray *)values {
  return [self setWithFloat:[((IOSFloatArray *) NIL_CHK(values)) floatAtIndex:0] withFloat:[((IOSFloatArray *) NIL_CHK(values)) floatAtIndex:1] withFloat:[((IOSFloatArray *) NIL_CHK(values)) floatAtIndex:2] withFloat:[((IOSFloatArray *) NIL_CHK(values)) floatAtIndex:3]];
}

- (PythagorasFPlane *)setWithFloat:(float)a
                         withFloat:(float)b
                         withFloat:(float)c
                         withFloat:(float)d {
  (void) [((PythagorasFVector3 *) NIL_CHK(_normal_)) setWithFloat:a withFloat:b withFloat:c];
  constant__ = d;
  return self;
}

- (PythagorasFPlane *)fromPointsWithPythagorasFIVector3:(id<PythagorasFIVector3>)p1
                                withPythagorasFIVector3:(id<PythagorasFIVector3>)p2
                                withPythagorasFIVector3:(id<PythagorasFIVector3>)p3 {
  (void) [((id<PythagorasFIVector3>) NIL_CHK(p2)) subtractWithPythagorasFIVector3:p1 withPythagorasFVector3:_v1_];
  (void) [((id<PythagorasFIVector3>) NIL_CHK(p3)) subtractWithPythagorasFIVector3:p1 withPythagorasFVector3:_v2_];
  (void) [[((PythagorasFVector3 *) NIL_CHK(_v1_)) crossWithPythagorasFIVector3:_v2_ withPythagorasFVector3:_normal_] normalizeLocal];
  constant__ = -[((PythagorasFVector3 *) NIL_CHK(_normal_)) dotWithPythagorasFIVector3:p1];
  return self;
}

- (PythagorasFPlane *)fromPointNormalWithPythagorasFIVector3:(id<PythagorasFIVector3>)pt
                                     withPythagorasFIVector3:(id<PythagorasFIVector3>)normal {
  return [self setWithPythagorasFIVector3:normal withFloat:-[((id<PythagorasFIVector3>) NIL_CHK(normal)) dotWithPythagorasFIVector3:pt]];
}

- (PythagorasFPlane *)negateLocal {
  return [self negateWithPythagorasFPlane:self];
}

- (float)constant {
  return constant__;
}

- (id<PythagorasFIVector3>)normal {
  return _normal_;
}

- (JavaNioFloatBuffer *)getWithJavaNioFloatBuffer:(JavaNioFloatBuffer *)buf {
  return [[[[((JavaNioFloatBuffer *) NIL_CHK(buf)) putWithFloat:((PythagorasFVector3 *) NIL_CHK(_normal_)).x_] putWithFloat:((PythagorasFVector3 *) NIL_CHK(_normal_)).y_] putWithFloat:((PythagorasFVector3 *) NIL_CHK(_normal_)).z_] putWithFloat:constant__];
}

- (float)distanceWithPythagorasFIVector3:(id<PythagorasFIVector3>)pt {
  return [((PythagorasFVector3 *) NIL_CHK(_normal_)) dotWithPythagorasFIVector3:pt] + constant__;
}

- (PythagorasFPlane *)negate {
  return [self negateWithPythagorasFPlane:[[[PythagorasFPlane alloc] init] autorelease]];
}

- (PythagorasFPlane *)negateWithPythagorasFPlane:(PythagorasFPlane *)result {
  (void) [((PythagorasFVector3 *) NIL_CHK(_normal_)) negateWithPythagorasFVector3:((PythagorasFPlane *) NIL_CHK(result))._normal];
  ((PythagorasFPlane *) NIL_CHK(result)).constant_ = -constant__;
  return result;
}

- (BOOL)intersectionWithPythagorasFIRay3:(id<PythagorasFIRay3>)ray
                  withPythagorasFVector3:(PythagorasFVector3 *)result {
  float distance = [self distanceWithPythagorasFIRay3:ray];
  if ([JavaLangFloat isNaNWithFloat:distance] || distance < 0.0f) {
    return NO;
  }
  else {
    (void) [((id<PythagorasFIVector3>) [((id<PythagorasFIRay3>) NIL_CHK(ray)) origin]) addScaledWithPythagorasFIVector3:[((id<PythagorasFIRay3>) NIL_CHK(ray)) direction] withFloat:distance withPythagorasFVector3:result];
    return YES;
  }
}

- (float)distanceWithPythagorasFIRay3:(id<PythagorasFIRay3>)ray {
  float dividend = -[self distanceWithPythagorasFIVector3:[((id<PythagorasFIRay3>) NIL_CHK(ray)) origin]];
  float divisor = [((PythagorasFVector3 *) NIL_CHK(_normal_)) dotWithPythagorasFIVector3:[((id<PythagorasFIRay3>) NIL_CHK(ray)) direction]];
  if ([JavaLangMath absWithFloat:dividend] < PythagorasFMathUtil_EPSILON) {
    return 0.0f;
  }
  else if ([JavaLangMath absWithFloat:divisor] < PythagorasFMathUtil_EPSILON) {
    return JavaLangFloat_NaN;
  }
  else {
    return dividend / divisor;
  }
}

- (NSUInteger)hash {
  return [((PythagorasFVector3 *) NIL_CHK(_normal_)) hash] ^ [PythagorasUtilPlatform hashCodeWithFloat:constant__];
}

- (BOOL)isEqual:(id)other {
  if (!([other isKindOfClass:[PythagorasFPlane class]])) {
    return NO;
  }
  PythagorasFPlane *oplane = (PythagorasFPlane *) other;
  return constant__ == ((PythagorasFPlane *) NIL_CHK(oplane)).constant_ && [((PythagorasFVector3 *) NIL_CHK(_normal_)) isEqual:[((PythagorasFPlane *) NIL_CHK(oplane)) normal]];
}

+ (void)initialize {
  if (self == [PythagorasFPlane class]) {
    JreOperatorRetainedAssign(&PythagorasFPlane_XY_PLANE_, self, [[[PythagorasFPlane alloc] initWithPythagorasFIVector3:[PythagorasFVector3 UNIT_Z] withFloat:0.0f] autorelease]);
    JreOperatorRetainedAssign(&PythagorasFPlane_XZ_PLANE_, self, [[[PythagorasFPlane alloc] initWithPythagorasFIVector3:[PythagorasFVector3 UNIT_Y] withFloat:0.0f] autorelease]);
    JreOperatorRetainedAssign(&PythagorasFPlane_YZ_PLANE_, self, [[[PythagorasFPlane alloc] initWithPythagorasFIVector3:[PythagorasFVector3 UNIT_X] withFloat:0.0f] autorelease]);
  }
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_v2_, self, nil);
  JreOperatorRetainedAssign(&_v1_, self, nil);
  JreOperatorRetainedAssign(&_normal_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasFPlane *typedCopy = (PythagorasFPlane *) copy;
  typedCopy.constant_ = constant__;
  typedCopy._normal = _normal_;
  typedCopy._v1 = _v1_;
  typedCopy._v2 = _v2_;
}

@end
