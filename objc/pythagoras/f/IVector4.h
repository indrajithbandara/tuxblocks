//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/IVector4.java
//
//  Created by Thomas on 7/9/13.
//

@class JavaNioFloatBuffer;
@class PythagorasFVector4;
@protocol PythagorasFIMatrix4;

#import "JreEmulation.h"

@protocol PythagorasFIVector4 < NSObject >
- (float)x;
- (float)y;
- (float)z;
- (float)w;
- (JavaNioFloatBuffer *)getWithJavaNioFloatBuffer:(JavaNioFloatBuffer *)buf;
- (BOOL)epsilonEqualsWithPythagorasFIVector4:(id<PythagorasFIVector4>)other
                                   withFloat:(float)epsilon;
- (PythagorasFVector4 *)negate;
- (PythagorasFVector4 *)negateWithPythagorasFVector4:(PythagorasFVector4 *)result;
- (PythagorasFVector4 *)abs;
- (PythagorasFVector4 *)absWithPythagorasFVector4:(PythagorasFVector4 *)result;
- (PythagorasFVector4 *)multWithFloat:(float)v;
- (PythagorasFVector4 *)multWithFloat:(float)v
               withPythagorasFVector4:(PythagorasFVector4 *)result;
- (PythagorasFVector4 *)multWithPythagorasFIMatrix4:(id<PythagorasFIMatrix4>)matrix;
- (PythagorasFVector4 *)multWithPythagorasFIMatrix4:(id<PythagorasFIMatrix4>)matrix
                             withPythagorasFVector4:(PythagorasFVector4 *)result;
@end
