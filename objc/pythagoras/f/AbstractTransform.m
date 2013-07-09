//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/AbstractTransform.java
//
//  Created by Thomas on 7/9/13.
//

#import "IOSFloatArray.h"
#import "IOSObjectArray.h"
#import "java/lang/UnsupportedOperationException.h"
#import "pythagoras/f/IPoint.h"
#import "pythagoras/f/IVector.h"
#import "pythagoras/f/Point.h"
#import "pythagoras/f/Transform.h"
#import "pythagoras/f/Vector.h"

@implementation PythagorasFAbstractTransform

- (PythagorasFVector *)scale__ {
  return [[[PythagorasFVector alloc] initWithFloat:[self scaleX] withFloat:[self scaleY]] autorelease];
}

- (PythagorasFVector *)translation {
  return [[[PythagorasFVector alloc] initWithFloat:[self tx] withFloat:[self ty]] autorelease];
}

- (id<PythagorasFTransform>)setUniformScaleWithFloat:(float)scale_ {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)setScaleWithFloat:(float)scaleX
                                    withFloat:(float)scaleY {
  (void) [self setScaleXWithFloat:scaleX];
  (void) [self setScaleYWithFloat:scaleY];
  return self;
}

- (id<PythagorasFTransform>)setScaleXWithFloat:(float)scaleX {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)setScaleYWithFloat:(float)scaleY {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)setRotationWithFloat:(float)angle {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)setTranslationWithFloat:(float)tx
                                          withFloat:(float)ty {
  (void) [self setTxWithFloat:tx];
  (void) [self setTyWithFloat:ty];
  return self;
}

- (id<PythagorasFTransform>)uniformScaleWithFloat:(float)scale_ {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)scale__WithFloat:(float)scaleX
                                   withFloat:(float)scaleY {
  (void) [self scaleXWithFloat:scaleX];
  (void) [self scaleYWithFloat:scaleY];
  return self;
}

- (id<PythagorasFTransform>)scaleXWithFloat:(float)scaleX {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)scaleYWithFloat:(float)scaleY {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)rotateWithFloat:(float)angle {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)translateWithFloat:(float)tx
                                     withFloat:(float)ty {
  (void) [self translateXWithFloat:tx];
  (void) [self translateYWithFloat:ty];
  return self;
}

- (id<PythagorasFTransform>)translateXWithFloat:(float)tx {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)translateYWithFloat:(float)ty {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)shearWithFloat:(float)sx
                                 withFloat:(float)sy {
  (void) [self shearXWithFloat:sx];
  (void) [self shearYWithFloat:sy];
  return self;
}

- (id<PythagorasFTransform>)shearXWithFloat:(float)sx {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)shearYWithFloat:(float)sy {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)setTxWithFloat:(float)tx {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)setTyWithFloat:(float)ty {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)setTransformWithFloat:(float)m00
                                        withFloat:(float)m01
                                        withFloat:(float)m10
                                        withFloat:(float)m11
                                        withFloat:(float)tx
                                        withFloat:(float)ty {
  @throw [[[JavaLangUnsupportedOperationException alloc] init] autorelease];
}

- (id<PythagorasFTransform>)clone {
  return [self copy__];
}

- (id<PythagorasFTransform>)copy__ OBJC_METHOD_FAMILY_NONE {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (id<PythagorasFTransform>)concatenateWithPythagorasFTransform:(id<PythagorasFTransform>)param0 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (int)generality {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (void)getWithJavaLangFloatArray:(IOSFloatArray *)param0 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
}

- (PythagorasFPoint *)inverseTransformWithPythagorasFIPoint:(id<PythagorasFIPoint>)param0
                                       withPythagorasFPoint:(PythagorasFPoint *)param1 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (PythagorasFVector *)inverseTransformWithPythagorasFIVector:(id<PythagorasFIVector>)param0
                                        withPythagorasFVector:(PythagorasFVector *)param1 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (id<PythagorasFTransform>)invert {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (id<PythagorasFTransform>)lerpWithPythagorasFTransform:(id<PythagorasFTransform>)param0
                                               withFloat:(float)param1 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (id<PythagorasFTransform>)preConcatenateWithPythagorasFTransform:(id<PythagorasFTransform>)param0 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (float)rotation {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (float)scaleX {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (float)scaleY {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (PythagorasFPoint *)transformWithPythagorasFIPoint:(id<PythagorasFIPoint>)param0
                                withPythagorasFPoint:(PythagorasFPoint *)param1 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (void)transformWithPythagorasFIPointArray:(IOSObjectArray *)param0
                                    withInt:(int)param1
                  withPythagorasFPointArray:(IOSObjectArray *)param2
                                    withInt:(int)param3
                                    withInt:(int)param4 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
}

- (void)transformWithJavaLangFloatArray:(IOSFloatArray *)param0
                                withInt:(int)param1
                 withJavaLangFloatArray:(IOSFloatArray *)param2
                                withInt:(int)param3
                                withInt:(int)param4 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
}

- (PythagorasFVector *)transformWithPythagorasFIVector:(id<PythagorasFIVector>)param0
                                 withPythagorasFVector:(PythagorasFVector *)param1 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (PythagorasFVector *)transformPointWithPythagorasFIVector:(id<PythagorasFIVector>)param0
                                      withPythagorasFVector:(PythagorasFVector *)param1 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (float)tx {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (float)ty {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (float)uniformScale {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
