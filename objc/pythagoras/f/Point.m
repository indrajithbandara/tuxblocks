//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/Point.java
//
//  Created by Thomas on 7/9/13.
//

#import "pythagoras/f/AbstractPoint.h"
#import "pythagoras/f/IPoint.h"

@implementation PythagorasFPoint

@synthesize x_ = x__;
@synthesize y_ = y__;

- (id)init {
  return [super init];
}

- (id)initWithFloat:(float)x
          withFloat:(float)y {
  if ((self = [super init])) {
    (void) [self setWithFloat:x withFloat:y];
  }
  return self;
}

- (id)initWithPythagorasFIPoint:(id<PythagorasFIPoint>)p {
  if ((self = [super init])) {
    (void) [self setWithFloat:[((id<PythagorasFIPoint>) NIL_CHK(p)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(p)) y]];
  }
  return self;
}

- (PythagorasFPoint *)setWithPythagorasFIPoint:(id<PythagorasFIPoint>)p {
  return [self setWithFloat:[((id<PythagorasFIPoint>) NIL_CHK(p)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(p)) y]];
}

- (PythagorasFPoint *)setWithFloat:(float)x
                         withFloat:(float)y {
  self.x_ = x;
  self.y_ = y;
  return self;
}

- (PythagorasFPoint *)multLocalWithFloat:(float)s {
  return [self multWithFloat:s withPythagorasFPoint:self];
}

- (PythagorasFPoint *)addLocalWithFloat:(float)dx
                              withFloat:(float)dy {
  return [self addWithFloat:dx withFloat:dy withPythagorasFPoint:self];
}

- (PythagorasFPoint *)rotateLocalWithFloat:(float)angle {
  return [self rotateWithFloat:angle withPythagorasFPoint:self];
}

- (PythagorasFPoint *)subtractLocalWithFloat:(float)x
                                   withFloat:(float)y {
  return [self subtractWithFloat:x withFloat:y withPythagorasFPoint:self];
}

- (float)x {
  return x__;
}

- (float)y {
  return y__;
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasFPoint *typedCopy = (PythagorasFPoint *) copy;
  typedCopy.x_ = x__;
  typedCopy.y_ = y__;
}

@end
