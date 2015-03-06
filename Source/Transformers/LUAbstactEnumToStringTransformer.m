/*
 * Copyright (C) 2015 SCVNGR, Inc. d/b/a LevelUp
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "LUAbstactEnumToStringTransformer.h"

@interface LUAbstactEnumToStringTransformer ()

@property (nonatomic, copy, readonly) NSDictionary *mapping;
@property (nonatomic, copy, readonly) NSDictionary *reverseMapping;

@end

@implementation LUAbstactEnumToStringTransformer

#pragma mark - Object Creation

- (id)initWithMapping:(NSDictionary *)mapping {
  self = [super init];
  if (!self) return nil;

  _mapping = mapping;

  NSArray *reverseKeys = [_mapping allValues];
  NSArray *reverseValues = [_mapping allKeys];
  _reverseMapping = [NSDictionary dictionaryWithObjects:reverseValues forKeys:reverseKeys];

  return self;
}

#pragma mark - NSValueTransformer Methods

+ (Class)transformedValueClass {
  return [NSString class];
}

- (id)reverseTransformedValue:(id)value {
  return [self.reverseMapping objectForKey:value];
}

- (id)transformedValue:(id)value {
  return self.mapping[value];
}

@end
