//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/AffineTransform.java
//
//  Created by Thomas on 7/9/13.
//

#import "IOSFloatArray.h"
#import "IOSObjectArray.h"
#import "java/lang/Math.h"
#import "pythagoras/f/AbstractTransform.h"
#import "pythagoras/f/FloatMath.h"
#import "pythagoras/f/IPoint.h"
#import "pythagoras/f/IVector.h"
#import "pythagoras/f/MathUtil.h"
#import "pythagoras/f/Point.h"
#import "pythagoras/f/Transform.h"
#import "pythagoras/f/Transforms.h"
#import "pythagoras/f/Vector.h"
#import "pythagoras/util/NoninvertibleTransformException.h"

@implementation PythagorasFAffineTransform

@synthesize m00 = m00_;
@synthesize m01 = m01_;
@synthesize m10 = m10_;
@synthesize m11 = m11_;
@synthesize tx_ = tx__;
@synthesize ty_ = ty__;

+ (int)GENERALITY {
  return PythagorasFAffineTransform_GENERALITY;
}

- (id)init {
  return [self initPythagorasFAffineTransformWithFloat:1 withFloat:0 withFloat:0 withFloat:1 withFloat:0 withFloat:0];
}

- (id)initWithFloat:(float)scale_
          withFloat:(float)angle
          withFloat:(float)tx
          withFloat:(float)ty {
  return [self initPythagorasFAffineTransformWithFloat:scale_ withFloat:scale_ withFloat:angle withFloat:tx withFloat:ty];
}

- (id)initPythagorasFAffineTransformWithFloat:(float)scaleX
                                    withFloat:(float)scaleY
                                    withFloat:(float)angle
                                    withFloat:(float)tx
                                    withFloat:(float)ty {
  if ((self = [super init])) {
    float sina = [PythagorasFFloatMath sinWithFloat:angle], cosa = [PythagorasFFloatMath cosWithFloat:angle];
    self.m00 = cosa * scaleX;
    self.m01 = sina * scaleY;
    self.m10 = -sina * scaleX;
    self.m11 = cosa * scaleY;
    self.tx_ = tx;
    self.ty_ = ty;
  }
  return self;
}

- (id)initWithFloat:(float)scaleX
          withFloat:(float)scaleY
          withFloat:(float)angle
          withFloat:(float)tx
          withFloat:(float)ty {
  return [self initPythagorasFAffineTransformWithFloat:scaleX withFloat:scaleY withFloat:angle withFloat:tx withFloat:ty];
}

- (id)initPythagorasFAffineTransformWithFloat:(float)m00
                                    withFloat:(float)m01
                                    withFloat:(float)m10
                                    withFloat:(float)m11
                                    withFloat:(float)tx
                                    withFloat:(float)ty {
  if ((self = [super init])) {
    self.m00 = m00;
    self.m01 = m01;
    self.m10 = m10;
    self.m11 = m11;
    self.tx_ = tx;
    self.ty_ = ty;
  }
  return self;
}

- (id)initWithFloat:(float)m00
          withFloat:(float)m01
          withFloat:(float)m10
          withFloat:(float)m11
          withFloat:(float)tx
          withFloat:(float)ty {
  return [self initPythagorasFAffineTransformWithFloat:m00 withFloat:m01 withFloat:m10 withFloat:m11 withFloat:tx withFloat:ty];
}

- (float)uniformScale {
  float cp = m00_ * m11_ - m01_ * m10_;
  return (cp < 0.0f) ? -[PythagorasFFloatMath sqrtWithFloat:-cp] : [PythagorasFFloatMath sqrtWithFloat:cp];
}

- (float)scaleX {
  return [PythagorasFFloatMath sqrtWithFloat:m00_ * m00_ + m01_ * m01_];
}

- (float)scaleY {
  return [PythagorasFFloatMath sqrtWithFloat:m10_ * m10_ + m11_ * m11_];
}

- (float)rotation {
  float n00 = m00_, n10 = m10_;
  float n01 = m01_, n11 = m11_;
  for (int ii = 0; ii < 10; ii++) {
    float o00 = n00, o10 = n10;
    float o01 = n01, o11 = n11;
    float det = o00 * o11 - o10 * o01;
    if ([JavaLangMath absWithFloat:det] == 0.0f) {
      @throw [[[PythagorasUtilNoninvertibleTransformException alloc] initWithNSString:[self description]] autorelease];
    }
    float hrdet = 0.5f / det;
    n00 = +o11 * hrdet + o00 * 0.5f;
    n10 = -o01 * hrdet + o10 * 0.5f;
    n01 = -o10 * hrdet + o01 * 0.5f;
    n11 = +o00 * hrdet + o11 * 0.5f;
    float d00 = n00 - o00, d10 = n10 - o10;
    float d01 = n01 - o01, d11 = n11 - o11;
    if (d00 * d00 + d10 * d10 + d01 * d01 + d11 * d11 < PythagorasFMathUtil_EPSILON) {
      break;
    }
  }
  return [PythagorasFFloatMath atan2WithFloat:n01 withFloat:n00];
}

- (float)tx {
  return self.tx_;
}

- (float)ty {
  return self.ty_;
}

- (void)getWithJavaLangFloatArray:(IOSFloatArray *)matrix {
  [((IOSFloatArray *) NIL_CHK(matrix)) replaceFloatAtIndex:0 withFloat:m00_];
  [((IOSFloatArray *) NIL_CHK(matrix)) replaceFloatAtIndex:1 withFloat:m01_];
  [((IOSFloatArray *) NIL_CHK(matrix)) replaceFloatAtIndex:2 withFloat:m10_];
  [((IOSFloatArray *) NIL_CHK(matrix)) replaceFloatAtIndex:3 withFloat:m11_];
  [((IOSFloatArray *) NIL_CHK(matrix)) replaceFloatAtIndex:4 withFloat:tx__];
  [((IOSFloatArray *) NIL_CHK(matrix)) replaceFloatAtIndex:5 withFloat:ty__];
}

- (id<PythagorasFTransform>)setUniformScaleWithFloat:(float)scale_ {
  return [self setScaleWithFloat:scale_ withFloat:scale_];
}

- (id<PythagorasFTransform>)setScaleXWithFloat:(float)scaleX {
  float mult = scaleX / [self scaleX];
  m00_ *= mult;
  m01_ *= mult;
  return self;
}

- (id<PythagorasFTransform>)setScaleYWithFloat:(float)scaleY {
  float mult = scaleY / [self scaleY];
  m10_ *= mult;
  m11_ *= mult;
  return self;
}

- (id<PythagorasFTransform>)setRotationWithFloat:(float)angle {
  float sx = [self scaleX], sy = [self scaleY];
  float sina = [PythagorasFFloatMath sinWithFloat:angle], cosa = [PythagorasFFloatMath cosWithFloat:angle];
  m00_ = cosa * sx;
  m01_ = sina * sx;
  m10_ = -sina * sy;
  m11_ = cosa * sy;
  return self;
}

- (id<PythagorasFTransform>)setTranslationWithFloat:(float)tx
                                          withFloat:(float)ty {
  self.tx_ = tx;
  self.ty_ = ty;
  return self;
}

- (id<PythagorasFTransform>)setTxWithFloat:(float)tx {
  self.tx_ = tx;
  return self;
}

- (id<PythagorasFTransform>)setTyWithFloat:(float)ty {
  self.ty_ = ty;
  return self;
}

- (id<PythagorasFTransform>)setTransformWithFloat:(float)m00
                                        withFloat:(float)m01
                                        withFloat:(float)m10
                                        withFloat:(float)m11
                                        withFloat:(float)tx
                                        withFloat:(float)ty {
  self.m00 = m00;
  self.m01 = m01;
  self.m10 = m10;
  self.m11 = m11;
  self.tx_ = tx;
  self.ty_ = ty;
  return self;
}

- (id<PythagorasFTransform>)uniformScaleWithFloat:(float)scale_ {
  return [self scale__WithFloat:scale_ withFloat:scale_];
}

- (id<PythagorasFTransform>)scale__WithFloat:(float)scaleX
                                   withFloat:(float)scaleY {
  return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:self withFloat:scaleX withFloat:0 withFloat:0 withFloat:scaleY withFloat:0 withFloat:0 withId:self]);
}

- (id<PythagorasFTransform>)scaleXWithFloat:(float)scaleX {
  return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:self withFloat:scaleX withFloat:0 withFloat:0 withFloat:1 withFloat:0 withFloat:0 withId:self]);
}

- (id<PythagorasFTransform>)scaleYWithFloat:(float)scaleY {
  return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:self withFloat:1 withFloat:0 withFloat:0 withFloat:scaleY withFloat:0 withFloat:0 withId:self]);
}

- (id<PythagorasFTransform>)rotateWithFloat:(float)angle {
  float sina = [PythagorasFFloatMath sinWithFloat:angle], cosa = [PythagorasFFloatMath cosWithFloat:angle];
  return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:self withFloat:cosa withFloat:sina withFloat:-sina withFloat:cosa withFloat:0 withFloat:0 withId:self]);
}

- (id<PythagorasFTransform>)translateWithFloat:(float)tx
                                     withFloat:(float)ty {
  return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:self withFloat:1 withFloat:0 withFloat:0 withFloat:1 withFloat:tx withFloat:ty withId:self]);
}

- (id<PythagorasFTransform>)translateXWithFloat:(float)tx {
  return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:self withFloat:1 withFloat:0 withFloat:0 withFloat:1 withFloat:tx withFloat:0 withId:self]);
}

- (id<PythagorasFTransform>)translateYWithFloat:(float)ty {
  return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:self withFloat:1 withFloat:0 withFloat:0 withFloat:1 withFloat:0 withFloat:ty withId:self]);
}

- (id<PythagorasFTransform>)shearWithFloat:(float)sx
                                 withFloat:(float)sy {
  return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:self withFloat:1 withFloat:sy withFloat:sx withFloat:1 withFloat:0 withFloat:0 withId:self]);
}

- (id<PythagorasFTransform>)shearXWithFloat:(float)sx {
  return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:self withFloat:1 withFloat:0 withFloat:sx withFloat:1 withFloat:0 withFloat:0 withId:self]);
}

- (id<PythagorasFTransform>)shearYWithFloat:(float)sy {
  return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:self withFloat:1 withFloat:sy withFloat:0 withFloat:1 withFloat:0 withFloat:0 withId:self]);
}

- (id<PythagorasFTransform>)invert {
  float det = m00_ * m11_ - m10_ * m01_;
  if ([JavaLangMath absWithFloat:det] == 0.0f) {
    @throw [[[PythagorasUtilNoninvertibleTransformException alloc] initWithNSString:[self description]] autorelease];
  }
  float rdet = 1.0f / det;
  return [[[PythagorasFAffineTransform alloc] initWithFloat:+m11_ * rdet withFloat:-m10_ * rdet withFloat:-m01_ * rdet withFloat:+m00_ * rdet withFloat:(m10_ * ty__ - m11_ * tx__) * rdet withFloat:(m01_ * tx__ - m00_ * ty__) * rdet] autorelease];
}

- (id<PythagorasFTransform>)concatenateWithPythagorasFTransform:(id<PythagorasFTransform>)other {
  if ([self generality] < [((id<PythagorasFTransform>) NIL_CHK(other)) generality]) {
    return [((id<PythagorasFTransform>) NIL_CHK(other)) preConcatenateWithPythagorasFTransform:self];
  }
  if ([(id) other isKindOfClass:[PythagorasFAffineTransform class]]) {
    return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:self withPythagorasFAffineTransform:(PythagorasFAffineTransform *) other withId:[[[PythagorasFAffineTransform alloc] init] autorelease]]);
  }
  else {
    PythagorasFAffineTransform *oaff = [[[PythagorasFAffineTransform alloc] initWithPythagorasFTransform:other] autorelease];
    return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:self withPythagorasFAffineTransform:oaff withId:oaff]);
  }
}

- (id<PythagorasFTransform>)preConcatenateWithPythagorasFTransform:(id<PythagorasFTransform>)other {
  if ([self generality] < [((id<PythagorasFTransform>) NIL_CHK(other)) generality]) {
    return [((id<PythagorasFTransform>) NIL_CHK(other)) concatenateWithPythagorasFTransform:self];
  }
  if ([(id) other isKindOfClass:[PythagorasFAffineTransform class]]) {
    return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:(PythagorasFAffineTransform *) other withPythagorasFAffineTransform:self withId:[[[PythagorasFAffineTransform alloc] init] autorelease]]);
  }
  else {
    PythagorasFAffineTransform *oaff = [[[PythagorasFAffineTransform alloc] initWithPythagorasFTransform:other] autorelease];
    return ((PythagorasFAffineTransform *) [PythagorasFTransforms multiplyWithPythagorasFAffineTransform:oaff withPythagorasFAffineTransform:self withId:oaff]);
  }
}

- (id<PythagorasFTransform>)lerpWithPythagorasFTransform:(id<PythagorasFTransform>)other
                                               withFloat:(float)t {
  if ([self generality] < [((id<PythagorasFTransform>) NIL_CHK(other)) generality]) {
    return [((id<PythagorasFTransform>) NIL_CHK(other)) lerpWithPythagorasFTransform:self withFloat:-t];
  }
  PythagorasFAffineTransform *ot = ([(id) other isKindOfClass:[PythagorasFAffineTransform class]]) ? (PythagorasFAffineTransform *) other : [[[PythagorasFAffineTransform alloc] initWithPythagorasFTransform:other] autorelease];
  return [[[PythagorasFAffineTransform alloc] initWithFloat:m00_ + t * (((PythagorasFAffineTransform *) NIL_CHK(ot)).m00 - m00_) withFloat:m01_ + t * (((PythagorasFAffineTransform *) NIL_CHK(ot)).m01 - m01_) withFloat:m10_ + t * (((PythagorasFAffineTransform *) NIL_CHK(ot)).m10 - m10_) withFloat:m11_ + t * (((PythagorasFAffineTransform *) NIL_CHK(ot)).m11 - m11_) withFloat:tx__ + t * (((PythagorasFAffineTransform *) NIL_CHK(ot)).tx_ - tx__) withFloat:ty__ + t * (((PythagorasFAffineTransform *) NIL_CHK(ot)).ty_ - ty__)] autorelease];
}

- (PythagorasFPoint *)transformWithPythagorasFIPoint:(id<PythagorasFIPoint>)p
                                withPythagorasFPoint:(PythagorasFPoint *)into {
  float x = [((id<PythagorasFIPoint>) NIL_CHK(p)) x], y = [((id<PythagorasFIPoint>) NIL_CHK(p)) y];
  return [((PythagorasFPoint *) NIL_CHK(into)) setWithFloat:m00_ * x + m10_ * y + tx__ withFloat:m01_ * x + m11_ * y + ty__];
}

- (void)transformWithPythagorasFIPointArray:(IOSObjectArray *)src
                                    withInt:(int)srcOff
                  withPythagorasFPointArray:(IOSObjectArray *)dst
                                    withInt:(int)dstOff
                                    withInt:(int)count {
  for (int ii = 0; ii < count; ii++) {
    (void) [self transformWithPythagorasFIPoint:((id<PythagorasFIPoint>) [((IOSObjectArray *) NIL_CHK(src)) objectAtIndex:srcOff++]) withPythagorasFPoint:((PythagorasFPoint *) [((IOSObjectArray *) NIL_CHK(dst)) objectAtIndex:dstOff++])];
  }
}

- (void)transformWithJavaLangFloatArray:(IOSFloatArray *)src
                                withInt:(int)srcOff
                 withJavaLangFloatArray:(IOSFloatArray *)dst
                                withInt:(int)dstOff
                                withInt:(int)count {
  for (int ii = 0; ii < count; ii++) {
    float x = [((IOSFloatArray *) NIL_CHK(src)) floatAtIndex:srcOff++], y = [((IOSFloatArray *) NIL_CHK(src)) floatAtIndex:srcOff++];
    [((IOSFloatArray *) NIL_CHK(dst)) replaceFloatAtIndex:dstOff++ withFloat:m00_ * x + m10_ * y + tx__];
    [((IOSFloatArray *) NIL_CHK(dst)) replaceFloatAtIndex:dstOff++ withFloat:m01_ * x + m11_ * y + ty__];
  }
}

- (PythagorasFPoint *)inverseTransformWithPythagorasFIPoint:(id<PythagorasFIPoint>)p
                                       withPythagorasFPoint:(PythagorasFPoint *)into {
  float x = [((id<PythagorasFIPoint>) NIL_CHK(p)) x] - tx__, y = [((id<PythagorasFIPoint>) NIL_CHK(p)) y] - ty__;
  float det = m00_ * m11_ - m01_ * m10_;
  if ([JavaLangMath absWithFloat:det] == 0.0f) {
    @throw [[[PythagorasUtilNoninvertibleTransformException alloc] initWithNSString:[self description]] autorelease];
  }
  float rdet = 1 / det;
  return [((PythagorasFPoint *) NIL_CHK(into)) setWithFloat:(x * m11_ - y * m10_) * rdet withFloat:(y * m00_ - x * m01_) * rdet];
}

- (PythagorasFVector *)transformPointWithPythagorasFIVector:(id<PythagorasFIVector>)v
                                      withPythagorasFVector:(PythagorasFVector *)into {
  float x = [((id<PythagorasFIVector>) NIL_CHK(v)) x], y = [((id<PythagorasFIVector>) NIL_CHK(v)) y];
  return [((PythagorasFVector *) NIL_CHK(into)) setWithFloat:m00_ * x + m10_ * y + tx__ withFloat:m01_ * x + m11_ * y + ty__];
}

- (PythagorasFVector *)transformWithPythagorasFIVector:(id<PythagorasFIVector>)v
                                 withPythagorasFVector:(PythagorasFVector *)into {
  float x = [((id<PythagorasFIVector>) NIL_CHK(v)) x], y = [((id<PythagorasFIVector>) NIL_CHK(v)) y];
  return [((PythagorasFVector *) NIL_CHK(into)) setWithFloat:m00_ * x + m10_ * y withFloat:m01_ * x + m11_ * y];
}

- (PythagorasFVector *)inverseTransformWithPythagorasFIVector:(id<PythagorasFIVector>)v
                                        withPythagorasFVector:(PythagorasFVector *)into {
  float x = [((id<PythagorasFIVector>) NIL_CHK(v)) x], y = [((id<PythagorasFIVector>) NIL_CHK(v)) y];
  float det = m00_ * m11_ - m01_ * m10_;
  if ([JavaLangMath absWithFloat:det] == 0.0f) {
    @throw [[[PythagorasUtilNoninvertibleTransformException alloc] initWithNSString:[self description]] autorelease];
  }
  float rdet = 1 / det;
  return [((PythagorasFVector *) NIL_CHK(into)) setWithFloat:(x * m11_ - y * m10_) * rdet withFloat:(y * m00_ - x * m01_) * rdet];
}

- (id<PythagorasFTransform>)copy__ OBJC_METHOD_FAMILY_NONE {
  return [[[PythagorasFAffineTransform alloc] initWithFloat:m00_ withFloat:m01_ withFloat:m10_ withFloat:m11_ withFloat:tx__ withFloat:ty__] autorelease];
}

- (int)generality {
  return PythagorasFAffineTransform_GENERALITY;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"affine [%@ %@ %@ %@ %@]", [PythagorasFMathUtil toStringWithFloat:m00_], [PythagorasFMathUtil toStringWithFloat:m01_], [PythagorasFMathUtil toStringWithFloat:m10_], [PythagorasFMathUtil toStringWithFloat:m11_], [self translation]];
}

- (id)initWithPythagorasFTransform:(id<PythagorasFTransform>)other {
  return [self initPythagorasFAffineTransformWithFloat:[((id<PythagorasFTransform>) NIL_CHK(other)) scaleX] withFloat:[((id<PythagorasFTransform>) NIL_CHK(other)) scaleY] withFloat:[((id<PythagorasFTransform>) NIL_CHK(other)) rotation] withFloat:[((id<PythagorasFTransform>) NIL_CHK(other)) tx] withFloat:[((id<PythagorasFTransform>) NIL_CHK(other)) ty]];
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasFAffineTransform *typedCopy = (PythagorasFAffineTransform *) copy;
  typedCopy.m00 = m00_;
  typedCopy.m01 = m01_;
  typedCopy.m10 = m10_;
  typedCopy.m11 = m11_;
  typedCopy.tx_ = tx__;
  typedCopy.ty_ = ty__;
}

@end
