//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: core/src/main/java/tuxkids/tuxblocks/core/defense/Pathing.java
//
//  Created by Thomas on 7/10/13.
//

#import "IOSBooleanArray.h"
#import "IOSIntArray.h"
#import "IOSObjectArray.h"
#import "java/lang/Float.h"
#import "java/lang/Math.h"
#import "java/util/ArrayList.h"
#import "java/util/Collections.h"
#import "java/util/Comparator.h"
#import "java/util/HashMap.h"
#import "java/util/List.h"
#import "pythagoras/f/FloatMath.h"
#import "pythagoras/i/Point.h"
#import "tuxkids/tuxblocks/core/defense/Grid.h"
#import "tuxkids/tuxblocks/core/defense/Pathing.h"

@implementation TuxkidsTuxblocksCoreDefensePathing

static IOSIntArray * TuxkidsTuxblocksCoreDefensePathing_offRows_;
static IOSIntArray * TuxkidsTuxblocksCoreDefensePathing_offCols_;

+ (IOSIntArray *)offRows {
  return TuxkidsTuxblocksCoreDefensePathing_offRows_;
}

+ (IOSIntArray *)offCols {
  return TuxkidsTuxblocksCoreDefensePathing_offCols_;
}

+ (id<JavaUtilList>)getPathWithTuxkidsTuxblocksCoreDefenseGrid:(TuxkidsTuxblocksCoreDefenseGrid *)grid
                                          withPythagorasIPoint:(PythagorasIPoint *)from
                                          withPythagorasIPoint:(PythagorasIPoint *)to {
  id<JavaUtilList> closedSet = [[JavaUtilArrayList alloc] init], openSet = [[JavaUtilArrayList alloc] init];
  JavaUtilHashMap *cameFrom = [[JavaUtilHashMap alloc] init];
  JavaUtilHashMap *gScore = [[JavaUtilHashMap alloc] init], *fScore = [[JavaUtilHashMap alloc] init];
  id<JavaUtilComparator> openSetComparator = [[TuxkidsTuxblocksCoreDefensePathing_$1 alloc] initWithJavaUtilHashMap:fScore];
  [((id<JavaUtilList>) NIL_CHK(openSet)) addWithId:from];
  (void) [((JavaUtilHashMap *) NIL_CHK(gScore)) putWithId:from withId:[JavaLangFloat valueOfWithFloat:0.0f]];
  (void) [((JavaUtilHashMap *) NIL_CHK(fScore)) putWithId:from withId:[JavaLangFloat valueOfWithFloat:[PythagorasFFloatMath sqrtWithFloat:[((PythagorasIPoint *) NIL_CHK(from)) distanceSqWithPythagorasIIPoint:to]]]];
  while (![((id<JavaUtilList>) NIL_CHK(openSet)) isEmpty]) {
    [JavaUtilCollections sortWithJavaUtilList:openSet withJavaUtilComparator:openSetComparator];
    PythagorasIPoint *current = ((PythagorasIPoint *) [((id<JavaUtilList>) NIL_CHK(openSet)) removeWithInt:0]);
    if ([((PythagorasIPoint *) NIL_CHK(current)) isEqual:to]) {
      return [TuxkidsTuxblocksCoreDefensePathing reconstructPathWithJavaUtilHashMap:cameFrom withPythagorasIPoint:to];
    }
    [((id<JavaUtilList>) NIL_CHK(closedSet)) addWithId:current];
    for (int i = 0; i < (int) [((IOSIntArray *) NIL_CHK(TuxkidsTuxblocksCoreDefensePathing_offRows_)) count]; i++) {
      int row = ((PythagorasIPoint *) NIL_CHK(current)).x_ + [((IOSIntArray *) NIL_CHK(TuxkidsTuxblocksCoreDefensePathing_offRows_)) intAtIndex:i];
      int col = ((PythagorasIPoint *) NIL_CHK(current)).y_ + [((IOSIntArray *) NIL_CHK(TuxkidsTuxblocksCoreDefensePathing_offCols_)) intAtIndex:i];
      if (row < 0 || row >= [((TuxkidsTuxblocksCoreDefenseGrid *) NIL_CHK(grid)) rows]) continue;
      if (col < 0 || col >= [((TuxkidsTuxblocksCoreDefenseGrid *) NIL_CHK(grid)) cols]) continue;
      if (![((IOSBooleanArray *) [[((TuxkidsTuxblocksCoreDefenseGrid *) NIL_CHK(grid)) getPassability] objectAtIndex:row]) booleanAtIndex:col]) continue;
      PythagorasIPoint *neighbor = [[PythagorasIPoint alloc] initWithInt:row withInt:col];
      float tentativeGScore = [((JavaLangFloat *) [((JavaUtilHashMap *) NIL_CHK(gScore)) getWithId:current]) floatValue] + 1;
      if ([((id<JavaUtilList>) NIL_CHK(closedSet)) containsWithId:neighbor] && tentativeGScore >= [((JavaLangFloat *) [((JavaUtilHashMap *) NIL_CHK(gScore)) getWithId:neighbor]) floatValue]) {
        continue;
      }
      if (![((id<JavaUtilList>) NIL_CHK(openSet)) containsWithId:neighbor] || tentativeGScore < [((JavaLangFloat *) [((JavaUtilHashMap *) NIL_CHK(gScore)) getWithId:neighbor]) floatValue]) {
        (void) [((JavaUtilHashMap *) NIL_CHK(cameFrom)) putWithId:neighbor withId:current];
        (void) [((JavaUtilHashMap *) NIL_CHK(gScore)) putWithId:neighbor withId:[JavaLangFloat valueOfWithFloat:tentativeGScore]];
        (void) [((JavaUtilHashMap *) NIL_CHK(fScore)) putWithId:neighbor withId:[JavaLangFloat valueOfWithFloat:tentativeGScore + [PythagorasFFloatMath sqrtWithFloat:[((PythagorasIPoint *) NIL_CHK(neighbor)) distanceSqWithPythagorasIIPoint:to]]]];
        if (![((id<JavaUtilList>) NIL_CHK(openSet)) containsWithId:neighbor]) {
          [((id<JavaUtilList>) NIL_CHK(openSet)) addWithId:neighbor];
        }
      }
    }
  }
  return nil;
}

+ (id<JavaUtilList>)reconstructPathWithJavaUtilHashMap:(JavaUtilHashMap *)cameFrom
                                  withPythagorasIPoint:(PythagorasIPoint *)currentNode {
  if ([((JavaUtilHashMap *) NIL_CHK(cameFrom)) containsKeyWithId:currentNode]) {
    id<JavaUtilList> p = [TuxkidsTuxblocksCoreDefensePathing reconstructPathWithJavaUtilHashMap:cameFrom withPythagorasIPoint:((PythagorasIPoint *) [((JavaUtilHashMap *) NIL_CHK(cameFrom)) getWithId:currentNode])];
    [((id<JavaUtilList>) NIL_CHK(p)) addWithId:currentNode];
    return p;
  }
  JavaUtilArrayList *path = [[JavaUtilArrayList alloc] init];
  [((JavaUtilArrayList *) NIL_CHK(path)) addWithId:currentNode];
  return path;
}

- (id)init {
  return [super init];
}

+ (void)initialize {
  if (self == [TuxkidsTuxblocksCoreDefensePathing class]) {
    TuxkidsTuxblocksCoreDefensePathing_offRows_ = [IOSIntArray arrayWithInts:(int[]){ 0, 1, 0, -1 } count:4];
    TuxkidsTuxblocksCoreDefensePathing_offCols_ = [IOSIntArray arrayWithInts:(int[]){ 1, 0, -1, 0 } count:4];
  }
}

@end
@implementation TuxkidsTuxblocksCoreDefensePathing_$1

@synthesize val$fScore = val$fScore_;

- (int)compareWithId:(PythagorasIPoint *)o1
              withId:(PythagorasIPoint *)o2 {
  return (int) [JavaLangMath signumWithFloat:[((JavaLangFloat *) [((JavaUtilHashMap *) NIL_CHK(val$fScore_)) getWithId:o1]) floatValue] - [((JavaLangFloat *) [((JavaUtilHashMap *) NIL_CHK(val$fScore_)) getWithId:o2]) floatValue]];
}

- (id)initWithJavaUtilHashMap:(JavaUtilHashMap *)capture$0 {
  if ((self = [super init])) {
    val$fScore_ = capture$0;
  }
  return self;
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TuxkidsTuxblocksCoreDefensePathing_$1 *typedCopy = (TuxkidsTuxblocksCoreDefensePathing_$1 *) copy;
  typedCopy.val$fScore = val$fScore_;
}

@end