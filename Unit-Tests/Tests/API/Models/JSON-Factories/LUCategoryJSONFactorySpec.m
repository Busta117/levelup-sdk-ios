/*
 * Copyright (C) 2014 SCVNGR, Inc. d/b/a LevelUp
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

#import "LUCategoryJSONFactory.h"

SPEC_BEGIN(LUCategoryJSONFactorySpec)

describe(@"LUCategoryJSONFactory", ^{
  __block LUCategoryJSONFactory *factory;

  beforeEach(^{
    factory = [LUCategoryJSONFactory factory];
  });

  describe(@"createFromAttributes:", ^{
    it(@"parses a JSON dictionary into an LUCategory", ^{
      NSDictionary *JSON = @{@"id" : @1, @"name" : @"Test Category"};
      LUCategory *category = [factory createFromAttributes:JSON];

      [[category.categoryID should] equal:@1];
      [[category.name should] equal:@"Test Category"];
    });
  });

  describe(@"rootKey", ^{
    it(@"is 'category'", ^{
      [[[factory rootKey] should] equal:@"category"];
    });
  });
});

SPEC_END
