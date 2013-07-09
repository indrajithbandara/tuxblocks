//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/Vector.java
//
//  Created by Thomas on 7/9/13.
//

@class IOSDoubleArray;
@protocol PythagorasDIVector;

#import "JreEmulation.h"
#import "pythagoras/d/AbstractVector.h"

@interface PythagorasDVector : PythagorasDAbstractVector {
 @public
  double x__;
  double y__;
}

@property (nonatomic, assign) double x_;
@property (nonatomic, assign) double y_;

- (id)initWithDouble:(double)x
          withDouble:(double)y;
- (id)initWithPythagorasDIVector:(id<PythagorasDIVector>)other;
- (id)init;
- (PythagorasDVector *)crossLocalWithPythagorasDIVector:(id<PythagorasDIVector>)other;
- (PythagorasDVector *)negateLocal;
- (PythagorasDVector *)normalizeLocal;
- (PythagorasDVector *)scaleLocalWithDouble:(double)v;
- (PythagorasDVector *)scaleLocalWithPythagorasDIVector:(id<PythagorasDIVector>)other;
- (PythagorasDVector *)addLocalWithPythagorasDIVector:(id<PythagorasDIVector>)other;
- (PythagorasDVector *)subtractLocalWithPythagorasDIVector:(id<PythagorasDIVector>)other;
- (PythagorasDVector *)addLocalWithDouble:(double)x
                               withDouble:(double)y;
- (PythagorasDVector *)subtractLocalWithDouble:(double)x
                                    withDouble:(double)y;
- (PythagorasDVector *)addScaledLocalWithPythagorasDIVector:(id<PythagorasDIVector>)other
                                                 withDouble:(double)v;
- (PythagorasDVector *)rotateLocalWithDouble:(double)angle;
- (PythagorasDVector *)lerpLocalWithPythagorasDIVector:(id<PythagorasDIVector>)other
                                            withDouble:(double)t;
- (PythagorasDVector *)setWithPythagorasDIVector:(id<PythagorasDIVector>)other;
- (PythagorasDVector *)setWithJavaLangDoubleArray:(IOSDoubleArray *)values;
- (PythagorasDVector *)setWithDouble:(double)x
                          withDouble:(double)y;
- (PythagorasDVector *)setAngleWithDouble:(double)angle;
- (PythagorasDVector *)setLengthWithDouble:(double)length;
- (double)x;
- (double)y;
@end
