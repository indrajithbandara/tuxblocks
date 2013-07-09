//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/AbstractCircle.java
//
//  Created by Thomas on 7/9/13.
//

@class PythagorasDCircle;
@protocol PythagorasDIPoint;

#import "JreEmulation.h"
#import "pythagoras/d/ICircle.h"

@interface PythagorasDAbstractCircle : NSObject < PythagorasDICircle > {
}

- (BOOL)intersectsWithPythagorasDICircle:(id<PythagorasDICircle>)c;
- (BOOL)containsWithPythagorasDIPoint:(id<PythagorasDIPoint>)p;
- (BOOL)containsWithDouble:(double)x
                withDouble:(double)y;
- (PythagorasDCircle *)offsetWithDouble:(double)x
                             withDouble:(double)y;
- (PythagorasDCircle *)offsetWithDouble:(double)x
                             withDouble:(double)y
                  withPythagorasDCircle:(PythagorasDCircle *)result;
- (PythagorasDCircle *)clone;
- (BOOL)isEqual:(id)obj;
- (NSUInteger)hash;
- (double)radius;
- (double)x;
- (double)y;
- (id)init;
@end
