//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/IShape.java
//
//  Created by Thomas on 7/9/13.
//

@class PythagorasFRectangle;
@protocol PythagorasFIPoint;
@protocol PythagorasFIRectangle;
@protocol PythagorasFPathIterator;
@protocol PythagorasFTransform;

#import "JreEmulation.h"

@protocol PythagorasFIShape < NSObject >
- (BOOL)isEmpty;
- (BOOL)containsWithFloat:(float)x
                withFloat:(float)y;
- (BOOL)containsWithPythagorasFIPoint:(id<PythagorasFIPoint>)point;
- (BOOL)containsWithFloat:(float)x
                withFloat:(float)y
                withFloat:(float)width
                withFloat:(float)height;
- (BOOL)containsWithPythagorasFIRectangle:(id<PythagorasFIRectangle>)r;
- (BOOL)intersectsWithFloat:(float)x
                  withFloat:(float)y
                  withFloat:(float)width
                  withFloat:(float)height;
- (BOOL)intersectsWithPythagorasFIRectangle:(id<PythagorasFIRectangle>)r;
- (PythagorasFRectangle *)bounds;
- (PythagorasFRectangle *)boundsWithPythagorasFRectangle:(PythagorasFRectangle *)target;
- (id<PythagorasFPathIterator>)pathIteratorWithPythagorasFTransform:(id<PythagorasFTransform>)at;
- (id<PythagorasFPathIterator>)pathIteratorWithPythagorasFTransform:(id<PythagorasFTransform>)at
                                                          withFloat:(float)flatness;
@end
