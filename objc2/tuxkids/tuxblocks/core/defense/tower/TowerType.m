//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: core/src/main/java/tuxkids/tuxblocks/core/defense/tower/TowerType.java
//
//  Created by Thomas on 7/10/13.
//

#import "java/lang/Enum.h"
#import "java/lang/IllegalArgumentException.h"
#import "tuxkids/tuxblocks/core/defense/tower/BigShooter.h"
#import "tuxkids/tuxblocks/core/defense/tower/Freezer.h"
#import "tuxkids/tuxblocks/core/defense/tower/HorizontalWall.h"
#import "tuxkids/tuxblocks/core/defense/tower/PeaShooter.h"
#import "tuxkids/tuxblocks/core/defense/tower/Tower.h"
#import "tuxkids/tuxblocks/core/defense/tower/TowerType.h"
#import "tuxkids/tuxblocks/core/defense/tower/VerticalWall.h"
#import "tuxkids/tuxblocks/core/defense/tower/Zapper.h"


static TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_PeaShooter;
static TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_Freezer;
static TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_BigShooter;
static TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_Zapper;
static TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_VerticalWall;
static TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_HorizontalWall;
IOSObjectArray *TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_values;

@implementation TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum

+ (TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *)PeaShooter {
  return TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_PeaShooter;
}
+ (TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *)Freezer {
  return TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_Freezer;
}
+ (TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *)BigShooter {
  return TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_BigShooter;
}
+ (TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *)Zapper {
  return TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_Zapper;
}
+ (TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *)VerticalWall {
  return TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_VerticalWall;
}
+ (TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *)HorizontalWall {
  return TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_HorizontalWall;
}

- (id)copyWithZone:(NSZone *)zone {
  return self;
}

@synthesize instance_ = instance__;

- (TuxkidsTuxblocksCoreDefenseTowerTower *)instance {
  return instance__;
}

- (TuxkidsTuxblocksCoreDefenseTowerTower *)newInstance OBJC_METHOD_FAMILY_NONE {
  return [((TuxkidsTuxblocksCoreDefenseTowerTower *) NIL_CHK(instance__)) copy__];
}

- (int)index {
  return [self ordinal];
}

- (id)initWithTuxkidsTuxblocksCoreDefenseTowerTower:(TuxkidsTuxblocksCoreDefenseTowerTower *)instance
                                       withNSString:(NSString *)name
                                            withInt:(int)ordinal {
  if ((self = [super initWithNSString:name withInt:ordinal])) {
    self.instance_ = instance;
  }
  return self;
}

+ (void)initialize {
  if (self == [TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum class]) {
    TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_PeaShooter = [[TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum alloc] initWithTuxkidsTuxblocksCoreDefenseTowerTower:[[TuxkidsTuxblocksCoreDefenseTowerPeaShooter alloc] init] withNSString:@"TuxkidsTuxblocksCoreDefenseTowerTowerType_PeaShooter" withInt:0];
    TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_Freezer = [[TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum alloc] initWithTuxkidsTuxblocksCoreDefenseTowerTower:[[TuxkidsTuxblocksCoreDefenseTowerFreezer alloc] init] withNSString:@"TuxkidsTuxblocksCoreDefenseTowerTowerType_Freezer" withInt:1];
    TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_BigShooter = [[TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum alloc] initWithTuxkidsTuxblocksCoreDefenseTowerTower:[[TuxkidsTuxblocksCoreDefenseTowerBigShooter alloc] init] withNSString:@"TuxkidsTuxblocksCoreDefenseTowerTowerType_BigShooter" withInt:2];
    TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_Zapper = [[TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum alloc] initWithTuxkidsTuxblocksCoreDefenseTowerTower:[[TuxkidsTuxblocksCoreDefenseTowerZapper alloc] init] withNSString:@"TuxkidsTuxblocksCoreDefenseTowerTowerType_Zapper" withInt:3];
    TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_VerticalWall = [[TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum alloc] initWithTuxkidsTuxblocksCoreDefenseTowerTower:[[TuxkidsTuxblocksCoreDefenseTowerVerticalWall alloc] init] withNSString:@"TuxkidsTuxblocksCoreDefenseTowerTowerType_VerticalWall" withInt:4];
    TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_HorizontalWall = [[TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum alloc] initWithTuxkidsTuxblocksCoreDefenseTowerTower:[[TuxkidsTuxblocksCoreDefenseTowerHorizontalWall alloc] init] withNSString:@"TuxkidsTuxblocksCoreDefenseTowerTowerType_HorizontalWall" withInt:5];
    TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_values = [[IOSObjectArray alloc] initWithObjects:(id[]){ TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_PeaShooter, TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_Freezer, TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_BigShooter, TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_Zapper, TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_VerticalWall, TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_HorizontalWall, nil } count:6 type:[IOSClass classWithClass:[TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum class]]];
  }
}

+ (IOSObjectArray *)values {
  return [IOSObjectArray arrayWithArray:TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_values];
}

+ (TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *)valueOfWithNSString:(NSString *)name {
  for (int i = 0; i < [TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_values count]; i++) {
    TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *e = [TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum_values objectAtIndex:i];
    if ([name isEqual:[e name]]) {
      return e;
    }
  }
  @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:name];
  return nil;
}

@end