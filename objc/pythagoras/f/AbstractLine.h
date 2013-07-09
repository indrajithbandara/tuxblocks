//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/AbstractLine.java
//
//  Created by Thomas on 7/9/13.
//

@class IOSFloatArray;
@class PythagorasFLine;
@class PythagorasFPoint;
@class PythagorasFRectangle;
@protocol PythagorasFIPoint;
@protocol PythagorasFIRectangle;
@protocol PythagorasFTransform;

#import "JreEmulation.h"
#import "pythagoras/f/ILine.h"
#import "pythagoras/f/PathIterator.h"

@interface PythagorasFAbstractLine : NSObject < PythagorasFILine > {
}

- (PythagorasFPoint *)p1;
- (PythagorasFPoint *)p1WithPythagorasFPoint:(PythagorasFPoint *)target;
- (PythagorasFPoint *)p2;
- (PythagorasFPoint *)p2WithPythagorasFPoint:(PythagorasFPoint *)target;
- (float)pointLineDistSqWithFloat:(float)px
                        withFloat:(float)py;
- (float)pointLineDistSqWithPythagorasFIPoint:(id<PythagorasFIPoint>)p;
- (float)pointLineDistWithFloat:(float)px
                      withFloat:(float)py;
- (float)pointLineDistWithPythagorasFIPoint:(id<PythagorasFIPoint>)p;
- (float)pointSegDistSqWithFloat:(float)px
                       withFloat:(float)py;
- (float)pointSegDistSqWithPythagorasFIPoint:(id<PythagorasFIPoint>)p;
- (float)pointSegDistWithFloat:(float)px
                     withFloat:(float)py;
- (float)pointSegDistWithPythagorasFIPoint:(id<PythagorasFIPoint>)p;
- (int)relativeCCWWithFloat:(float)px
                  withFloat:(float)py;
- (int)relativeCCWWithPythagorasFIPoint:(id<PythagorasFIPoint>)p;
- (PythagorasFLine *)clone;
- (BOOL)isEmpty;
- (BOOL)containsWithFloat:(float)x
                withFloat:(float)y;
- (BOOL)containsWithPythagorasFIPoint:(id<PythagorasFIPoint>)point;
- (BOOL)containsWithFloat:(float)x
                withFloat:(float)y
                withFloat:(float)w
                withFloat:(float)h;
- (BOOL)containsWithPythagorasFIRectangle:(id<PythagorasFIRectangle>)r;
- (BOOL)intersectsWithFloat:(float)rx
                  withFloat:(float)ry
                  withFloat:(float)rw
                  withFloat:(float)rh;
- (BOOL)intersectsWithPythagorasFIRectangle:(id<PythagorasFIRectangle>)r;
- (PythagorasFRectangle *)bounds;
- (PythagorasFRectangle *)boundsWithPythagorasFRectangle:(PythagorasFRectangle *)target;
- (id<PythagorasFPathIterator>)pathIteratorWithPythagorasFTransform:(id<PythagorasFTransform>)at;
- (id<PythagorasFPathIterator>)pathIteratorWithPythagorasFTransform:(id<PythagorasFTransform>)at
                                                          withFloat:(float)flatness;
- (float)x1;
- (float)x2;
- (float)y1;
- (float)y2;
- (id)init;
- (id)copyWithZone:(NSZone *)zone;
@end

@interface PythagorasFAbstractLine_Iterator : NSObject < PythagorasFPathIterator > {
 @public
  float x1_, y1_, x2_, y2_;
  id<PythagorasFTransform> t_;
  int index_;
}

@property (nonatomic, assign) float x1;
@property (nonatomic, assign) float y1;
@property (nonatomic, assign) float x2;
@property (nonatomic, assign) float y2;
@property (nonatomic, retain) id<PythagorasFTransform> t;
@property (nonatomic, assign) int index;

- (id)initWithPythagorasFILine:(id<PythagorasFILine>)l
      withPythagorasFTransform:(id<PythagorasFTransform>)at;
- (int)windingRule;
- (BOOL)isDone;
- (void)next;
- (int)currentSegmentWithJavaLangFloatArray:(IOSFloatArray *)coords;
@end
