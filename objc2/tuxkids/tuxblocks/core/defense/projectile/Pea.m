//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: core/src/main/java/tuxkids/tuxblocks/core/defense/projectile/Pea.java
//
//  Created by Thomas on 7/10/13.
//

#import "playn/core/CanvasImage.h"
#import "playn/core/Image.h"
#import "tripleplay/util/Colors.h"
#import "tuxkids/tuxblocks/core/defense/projectile/Pea.h"
#import "tuxkids/tuxblocks/core/utils/CanvasUtils.h"

@implementation TuxkidsTuxblocksCoreDefenseProjectilePea

- (float)maxSpeed {
  return 0.5f;
}

- (id<PlaynCoreImage>)createImage {
  return [TuxkidsTuxblocksCoreUtilsCanvasUtils createCircleWithFloat:3 withInt:[TripleplayUtilColors LIGHT_GRAY] withFloat:1 withInt:[TripleplayUtilColors BLACK]];
}

- (float)acceleration {
  return 1.0f;
}

- (id)init {
  return [super init];
}

@end