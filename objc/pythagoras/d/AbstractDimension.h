//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/AbstractDimension.java
//
//  Created by Thomas on 7/9/13.
//

@class PythagorasDDimension;

#import "JreEmulation.h"
#import "pythagoras/d/IDimension.h"

@interface PythagorasDAbstractDimension : NSObject < PythagorasDIDimension > {
}

- (PythagorasDDimension *)clone;
- (NSUInteger)hash;
- (BOOL)isEqual:(id)obj;
- (NSString *)description;
- (double)height;
- (double)width;
- (id)init;
- (id)copyWithZone:(NSZone *)zone;
@end
