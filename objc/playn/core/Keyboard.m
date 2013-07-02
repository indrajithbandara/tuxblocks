//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/Keyboard.java
//
//  Created by Thomas on 7/1/13.
//

#import "Callback.h"
#import "Events.h"
#import "Key.h"
#import "java/lang/IllegalArgumentException.h"
#import "java/lang/StringBuilder.h"
#import "Keyboard.h"

@implementation PlaynCoreKeyboard_Event_Impl

- (PlaynCoreKeyEnum *)key_ {
  return key__;
}
- (void)setKey_:(PlaynCoreKeyEnum *)key_ {
  JreOperatorRetainedAssign(&key__, self, key_);
}
@synthesize key_ = key__;

- (PlaynCoreKeyEnum *)key {
  return key__;
}

- (id)initWithPlaynCoreEvents_Flags:(id<PlaynCoreEvents_Flags>)flags
                         withDouble:(double)time
               withPlaynCoreKeyEnum:(PlaynCoreKeyEnum *)key {
  if ((self = [super initWithPlaynCoreEvents_Flags:flags withDouble:time])) {
    self.key_ = key;
  }
  return self;
}

- (NSString *)name {
  return @"Keyboard.Event";
}

- (void)addFieldsWithJavaLangStringBuilder:(JavaLangStringBuilder *)builder {
  [super addFieldsWithJavaLangStringBuilder:builder];
  (void) [[((JavaLangStringBuilder *) NIL_CHK(builder)) appendWithNSString:@", key="] appendWithId:key__];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&key__, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreKeyboard_Event_Impl *typedCopy = (PlaynCoreKeyboard_Event_Impl *) copy;
  typedCopy.key_ = key__;
}

@end
@implementation PlaynCoreKeyboard_TypedEvent_Impl

@synthesize typedChar_ = typedChar__;

- (unichar)typedChar {
  return typedChar__;
}

- (id)initWithPlaynCoreEvents_Flags:(id<PlaynCoreEvents_Flags>)flags
                         withDouble:(double)time
                        withUnichar:(unichar)typedChar {
  if ((self = [super initWithPlaynCoreEvents_Flags:flags withDouble:time])) {
    self.typedChar_ = typedChar;
  }
  return self;
}

- (NSString *)name {
  return @"Keyboard.TypedEvent";
}

- (void)addFieldsWithJavaLangStringBuilder:(JavaLangStringBuilder *)builder {
  [super addFieldsWithJavaLangStringBuilder:builder];
  (void) [[((JavaLangStringBuilder *) NIL_CHK(builder)) appendWithNSString:@", typedChar="] appendWithUnichar:typedChar__];
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreKeyboard_TypedEvent_Impl *typedCopy = (PlaynCoreKeyboard_TypedEvent_Impl *) copy;
  typedCopy.typedChar_ = typedChar__;
}

@end
@implementation PlaynCoreKeyboard_Adapter

- (void)onKeyDownWithPlaynCoreKeyboard_Event:(id<PlaynCoreKeyboard_Event>)event {
}

- (void)onKeyTypedWithPlaynCoreKeyboard_TypedEvent:(id<PlaynCoreKeyboard_TypedEvent>)event {
}

- (void)onKeyUpWithPlaynCoreKeyboard_Event:(id<PlaynCoreKeyboard_Event>)event {
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end

static PlaynCoreKeyboard_TextTypeEnum *PlaynCoreKeyboard_TextTypeEnum_DEFAULT;
static PlaynCoreKeyboard_TextTypeEnum *PlaynCoreKeyboard_TextTypeEnum_NUMBER;
static PlaynCoreKeyboard_TextTypeEnum *PlaynCoreKeyboard_TextTypeEnum_EMAIL;
static PlaynCoreKeyboard_TextTypeEnum *PlaynCoreKeyboard_TextTypeEnum_URL;
IOSObjectArray *PlaynCoreKeyboard_TextTypeEnum_values;

@implementation PlaynCoreKeyboard_TextTypeEnum

+ (PlaynCoreKeyboard_TextTypeEnum *)DEFAULT {
  return PlaynCoreKeyboard_TextTypeEnum_DEFAULT;
}
+ (PlaynCoreKeyboard_TextTypeEnum *)NUMBER {
  return PlaynCoreKeyboard_TextTypeEnum_NUMBER;
}
+ (PlaynCoreKeyboard_TextTypeEnum *)EMAIL {
  return PlaynCoreKeyboard_TextTypeEnum_EMAIL;
}
+ (PlaynCoreKeyboard_TextTypeEnum *)URL {
  return PlaynCoreKeyboard_TextTypeEnum_URL;
}

- (id)copyWithZone:(NSZone *)zone {
  return [self retain];
}

- (id)initWithNSString:(NSString *)name withInt:(int)ordinal {
  return [super initWithNSString:name withInt:ordinal];
}

+ (void)initialize {
  if (self == [PlaynCoreKeyboard_TextTypeEnum class]) {
    PlaynCoreKeyboard_TextTypeEnum_DEFAULT = [[PlaynCoreKeyboard_TextTypeEnum alloc] initWithNSString:@"DEFAULT" withInt:0];
    PlaynCoreKeyboard_TextTypeEnum_NUMBER = [[PlaynCoreKeyboard_TextTypeEnum alloc] initWithNSString:@"NUMBER" withInt:1];
    PlaynCoreKeyboard_TextTypeEnum_EMAIL = [[PlaynCoreKeyboard_TextTypeEnum alloc] initWithNSString:@"EMAIL" withInt:2];
    PlaynCoreKeyboard_TextTypeEnum_URL = [[PlaynCoreKeyboard_TextTypeEnum alloc] initWithNSString:@"URL" withInt:3];
    PlaynCoreKeyboard_TextTypeEnum_values = [[IOSObjectArray alloc] initWithObjects:(id[]){ PlaynCoreKeyboard_TextTypeEnum_DEFAULT, PlaynCoreKeyboard_TextTypeEnum_NUMBER, PlaynCoreKeyboard_TextTypeEnum_EMAIL, PlaynCoreKeyboard_TextTypeEnum_URL, nil } count:4 type:[IOSClass classWithClass:[PlaynCoreKeyboard_TextTypeEnum class]]];
  }
}

+ (IOSObjectArray *)values {
  return [IOSObjectArray arrayWithArray:PlaynCoreKeyboard_TextTypeEnum_values];
}

+ (PlaynCoreKeyboard_TextTypeEnum *)valueOfWithNSString:(NSString *)name {
  for (int i = 0; i < [PlaynCoreKeyboard_TextTypeEnum_values count]; i++) {
    PlaynCoreKeyboard_TextTypeEnum *e = [PlaynCoreKeyboard_TextTypeEnum_values objectAtIndex:i];
    if ([name isEqual:[e name]]) {
      return e;
    }
  }
  @throw [[[JavaLangIllegalArgumentException alloc] initWithNSString:name] autorelease];
  return nil;
}

@end
