//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/Ray2.java
//
//  Created by Thomas on 7/9/13.
//

@class PythagorasDVector;
@protocol PythagorasDIVector;
@protocol PythagorasDTransform;

#import "JreEmulation.h"
#import "pythagoras/d/IRay2.h"

@interface PythagorasDRay2 : NSObject < PythagorasDIRay2 > {
 @public
  PythagorasDVector *origin__;
  PythagorasDVector *direction__;
}

@property (nonatomic, retain) PythagorasDVector *origin_;
@property (nonatomic, retain) PythagorasDVector *direction_;

- (id)initWithPythagorasDVector:(PythagorasDVector *)origin
          withPythagorasDVector:(PythagorasDVector *)direction;
- (id)initWithPythagorasDRay2:(PythagorasDRay2 *)other;
- (id)init;
- (PythagorasDRay2 *)setWithPythagorasDIRay2:(id<PythagorasDIRay2>)other;
- (PythagorasDRay2 *)setWithPythagorasDIVector:(id<PythagorasDIVector>)origin
                        withPythagorasDIVector:(id<PythagorasDIVector>)direction;
- (PythagorasDRay2 *)transformLocalWithPythagorasDTransform:(id<PythagorasDTransform>)transform;
- (id<PythagorasDIVector>)origin;
- (id<PythagorasDIVector>)direction;
- (PythagorasDRay2 *)transformWithPythagorasDTransform:(id<PythagorasDTransform>)transform;
- (PythagorasDRay2 *)transformWithPythagorasDTransform:(id<PythagorasDTransform>)transform
                                   withPythagorasDRay2:(PythagorasDRay2 *)result;
- (BOOL)intersectsWithPythagorasDIVector:(id<PythagorasDIVector>)pt;
- (BOOL)getIntersectionWithPythagorasDIVector:(id<PythagorasDIVector>)start
                       withPythagorasDIVector:(id<PythagorasDIVector>)end
                        withPythagorasDVector:(PythagorasDVector *)result;
- (BOOL)getIntersectionWithPythagorasDIVector:(id<PythagorasDIVector>)start
                       withPythagorasDIVector:(id<PythagorasDIVector>)end
                                   withDouble:(double)radius
                        withPythagorasDVector:(PythagorasDVector *)result;
- (BOOL)getIntersectionWithPythagorasDIVector:(id<PythagorasDIVector>)center
                                   withDouble:(double)radius
                        withPythagorasDVector:(PythagorasDVector *)result;
- (PythagorasDVector *)getNearestPointWithPythagorasDIVector:(id<PythagorasDIVector>)point
                                       withPythagorasDVector:(PythagorasDVector *)result;
- (NSString *)description;
- (double)getIntersectionWithPythagorasDIVector:(id<PythagorasDIVector>)pt;
@end
