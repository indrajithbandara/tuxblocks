//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/IRoundRectangle.java
//
//  Created by Thomas on 7/9/13.
//

@class PythagorasDRoundRectangle;

#import "JreEmulation.h"
#import "pythagoras/d/IRectangularShape.h"

@protocol PythagorasDIRoundRectangle < PythagorasDIRectangularShape, NSCopying, NSObject >
- (double)arcWidth;
- (double)arcHeight;
- (PythagorasDRoundRectangle *)clone;
- (id)copyWithZone:(NSZone *)zone;
@end
