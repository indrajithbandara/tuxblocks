//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/Json.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSClass.h"
#import "IOSObjectArray.h"
#import "JsonSink.h"
#import "java/util/Arrays.h"
#import "java/util/Iterator.h"
#import "java/util/List.h"
#import "Json.h"

@implementation PlaynCoreJson_TypedArray_Util

+ (id<PlaynCoreJson_TypedArray>)createWithJavaLangBooleanArray:(IOSObjectArray *)data {
  return ((id<PlaynCoreJson_TypedArray>) [PlaynCoreJson_TypedArray_Util toArrayWithNSObjectArray:data]);
}

+ (id<PlaynCoreJson_TypedArray>)createWithJavaLangIntegerArray:(IOSObjectArray *)data {
  return ((id<PlaynCoreJson_TypedArray>) [PlaynCoreJson_TypedArray_Util toArrayWithNSObjectArray:data]);
}

+ (id<PlaynCoreJson_TypedArray>)createWithJavaLangFloatArray:(IOSObjectArray *)data {
  return ((id<PlaynCoreJson_TypedArray>) [PlaynCoreJson_TypedArray_Util toArrayWithNSObjectArray:data]);
}

+ (id<PlaynCoreJson_TypedArray>)createWithJavaLangDoubleArray:(IOSObjectArray *)data {
  return ((id<PlaynCoreJson_TypedArray>) [PlaynCoreJson_TypedArray_Util toArrayWithNSObjectArray:data]);
}

+ (id<PlaynCoreJson_TypedArray>)createWithNSStringArray:(IOSObjectArray *)data {
  return ((id<PlaynCoreJson_TypedArray>) [PlaynCoreJson_TypedArray_Util toArrayWithNSObjectArray:data]);
}

+ (id<PlaynCoreJson_TypedArray>)createWithPlaynCoreJson_ObjectArray:(IOSObjectArray *)data {
  return ((id<PlaynCoreJson_TypedArray>) [PlaynCoreJson_TypedArray_Util toArrayWithNSObjectArray:data]);
}

+ (id<PlaynCoreJson_TypedArray>)createWithPlaynCoreJson_ArrayArray:(IOSObjectArray *)data {
  return ((id<PlaynCoreJson_TypedArray>) [PlaynCoreJson_TypedArray_Util toArrayWithNSObjectArray:data]);
}

+ (id<PlaynCoreJson_TypedArray>)toArrayWithNSObjectArray:(IOSObjectArray *)data {
  return [[[PlaynCoreJson_TypedArray_Util_$1 alloc] initWithNSObjectArray:data] autorelease];
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation PlaynCoreJson_TypedArray_Util_$1

- (IOSObjectArray *)val$data {
  return val$data_;
}
- (void)setVal$data:(IOSObjectArray *)val$data {
  JreOperatorRetainedAssign(&val$data_, self, val$data);
}
@synthesize val$data = val$data_;

- (int)length {
  return (int) [((IOSObjectArray *) NIL_CHK(val$data_)) count];
}

- (id)getWithInt:(int)index {
  id value = (id) [((IOSObjectArray *) NIL_CHK(val$data_)) objectAtIndex:index];
  return value;
}

- (id)getWithInt:(int)index
          withId:(id)dflt {
  return (index < 0 || index >= (int) [((IOSObjectArray *) NIL_CHK(val$data_)) count]) ? dflt : [self getWithInt:index];
}

- (id<JavaUtilIterator>)iterator {
  id<JavaUtilList> list = (id<JavaUtilList>) ((id<JavaUtilList>) [JavaUtilArrays asListWithNSObjectArray:val$data_]);
  return ((id<JavaUtilIterator>) [((id<JavaUtilList>) NIL_CHK(list)) iterator]);
}

- (id)initWithNSObjectArray:(IOSObjectArray *)capture$0 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&val$data_, self, capture$0);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$data_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreJson_TypedArray_Util_$1 *typedCopy = (PlaynCoreJson_TypedArray_Util_$1 *) copy;
  typedCopy.val$data = val$data_;
}

@end
