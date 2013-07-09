//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/IdentityTransform.java
//
//  Created by Thomas on 7/9/13.
//

@class IOSFloatArray;
@class IOSObjectArray;
@class PythagorasFPoint;
@class PythagorasFVector;
@protocol PythagorasFIPoint;
@protocol PythagorasFIVector;
@protocol PythagorasFTransform;

#import "JreEmulation.h"
#import "pythagoras/f/AbstractTransform.h"

#define PythagorasFIdentityTransform_GENERALITY 0

@interface PythagorasFIdentityTransform : PythagorasFAbstractTransform {
}

+ (int)GENERALITY;
- (float)uniformScale;
- (float)scaleX;
- (float)scaleY;
- (float)rotation;
- (float)tx;
- (float)ty;
- (void)getWithJavaLangFloatArray:(IOSFloatArray *)matrix;
- (id<PythagorasFTransform>)invert;
- (id<PythagorasFTransform>)concatenateWithPythagorasFTransform:(id<PythagorasFTransform>)other;
- (id<PythagorasFTransform>)preConcatenateWithPythagorasFTransform:(id<PythagorasFTransform>)other;
- (id<PythagorasFTransform>)lerpWithPythagorasFTransform:(id<PythagorasFTransform>)other
                                               withFloat:(float)t;
- (PythagorasFPoint *)transformWithPythagorasFIPoint:(id<PythagorasFIPoint>)p
                                withPythagorasFPoint:(PythagorasFPoint *)into;
- (void)transformWithPythagorasFIPointArray:(IOSObjectArray *)src
                                    withInt:(int)srcOff
                  withPythagorasFPointArray:(IOSObjectArray *)dst
                                    withInt:(int)dstOff
                                    withInt:(int)count;
- (void)transformWithJavaLangFloatArray:(IOSFloatArray *)src
                                withInt:(int)srcOff
                 withJavaLangFloatArray:(IOSFloatArray *)dst
                                withInt:(int)dstOff
                                withInt:(int)count;
- (PythagorasFPoint *)inverseTransformWithPythagorasFIPoint:(id<PythagorasFIPoint>)p
                                       withPythagorasFPoint:(PythagorasFPoint *)into;
- (PythagorasFVector *)transformPointWithPythagorasFIVector:(id<PythagorasFIVector>)v
                                      withPythagorasFVector:(PythagorasFVector *)into;
- (PythagorasFVector *)transformWithPythagorasFIVector:(id<PythagorasFIVector>)v
                                 withPythagorasFVector:(PythagorasFVector *)into;
- (PythagorasFVector *)inverseTransformWithPythagorasFIVector:(id<PythagorasFIVector>)v
                                        withPythagorasFVector:(PythagorasFVector *)into;
- (id<PythagorasFTransform>)copy__ OBJC_METHOD_FAMILY_NONE;
- (int)generality;
- (NSString *)description;
- (id)init;
@end
