//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/Rectangle.java
//
//  Created by Thomas on 7/9/13.
//

@protocol PythagorasFIDimension;
@protocol PythagorasFIPoint;
@protocol PythagorasFIRectangle;

#import "JreEmulation.h"
#import "java/io/Serializable.h"
#import "pythagoras/f/AbstractRectangle.h"

@interface PythagorasFRectangle : PythagorasFAbstractRectangle < JavaIoSerializable > {
 @public
  float x__;
  float y__;
  float width__;
  float height__;
}

@property (nonatomic, assign) float x_;
@property (nonatomic, assign) float y_;
@property (nonatomic, assign) float width_;
@property (nonatomic, assign) float height_;

- (id)init;
- (id)initWithPythagorasFIPoint:(id<PythagorasFIPoint>)p;
- (id)initWithPythagorasFIDimension:(id<PythagorasFIDimension>)d;
- (id)initWithPythagorasFIPoint:(id<PythagorasFIPoint>)p
      withPythagorasFIDimension:(id<PythagorasFIDimension>)d;
- (id)initWithFloat:(float)x
          withFloat:(float)y
          withFloat:(float)width
          withFloat:(float)height;
- (id)initWithPythagorasFIRectangle:(id<PythagorasFIRectangle>)r;
- (void)setLocationWithFloat:(float)x
                   withFloat:(float)y;
- (void)setLocationWithPythagorasFIPoint:(id<PythagorasFIPoint>)p;
- (void)setSizeWithFloat:(float)width
               withFloat:(float)height;
- (void)setSizeWithPythagorasFIDimension:(id<PythagorasFIDimension>)d;
- (void)setBoundsWithFloat:(float)x
                 withFloat:(float)y
                 withFloat:(float)width
                 withFloat:(float)height;
- (void)setBoundsWithPythagorasFIRectangle:(id<PythagorasFIRectangle>)r;
- (void)growWithFloat:(float)dx
            withFloat:(float)dy;
- (void)translateWithFloat:(float)mx
                 withFloat:(float)my;
- (void)addWithFloat:(float)px
           withFloat:(float)py;
- (void)addWithPythagorasFIPoint:(id<PythagorasFIPoint>)p;
- (void)addWithPythagorasFIRectangle:(id<PythagorasFIRectangle>)r;
- (float)x;
- (float)y;
- (float)width;
- (float)height;
- (void)setFrameWithFloat:(float)x
                withFloat:(float)y
                withFloat:(float)width
                withFloat:(float)height;
@end
