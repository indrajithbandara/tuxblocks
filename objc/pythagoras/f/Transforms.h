//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/Transforms.java
//
//  Created by Thomas on 7/9/13.
//

@class PythagorasFAffineTransform;
@protocol PythagorasFIShape;
@protocol PythagorasFTransform;

#import "JreEmulation.h"

@interface PythagorasFTransforms : NSObject {
}

+ (id<PythagorasFIShape>)createTransformedShapeWithPythagorasFTransform:(id<PythagorasFTransform>)t
                                                  withPythagorasFIShape:(id<PythagorasFIShape>)src;
+ (id)multiplyWithPythagorasFAffineTransform:(PythagorasFAffineTransform *)a
              withPythagorasFAffineTransform:(PythagorasFAffineTransform *)b
                                      withId:(id<PythagorasFTransform>)into;
+ (id)multiplyWithPythagorasFAffineTransform:(PythagorasFAffineTransform *)a
                                   withFloat:(float)m00
                                   withFloat:(float)m01
                                   withFloat:(float)m10
                                   withFloat:(float)m11
                                   withFloat:(float)tx
                                   withFloat:(float)ty
                                      withId:(id<PythagorasFTransform>)into;
+ (id)multiplyWithFloat:(float)m00
              withFloat:(float)m01
              withFloat:(float)m10
              withFloat:(float)m11
              withFloat:(float)tx
              withFloat:(float)ty
withPythagorasFAffineTransform:(PythagorasFAffineTransform *)b
                 withId:(id<PythagorasFTransform>)into;
+ (id)multiplyWithFloat:(float)am00
              withFloat:(float)am01
              withFloat:(float)am10
              withFloat:(float)am11
              withFloat:(float)atx
              withFloat:(float)aty
              withFloat:(float)bm00
              withFloat:(float)bm01
              withFloat:(float)bm10
              withFloat:(float)bm11
              withFloat:(float)btx
              withFloat:(float)bty
                 withId:(id<PythagorasFTransform>)into;
- (id)init;
@end
