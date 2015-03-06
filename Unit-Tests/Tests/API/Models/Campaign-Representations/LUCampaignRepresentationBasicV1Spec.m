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

#import "LUCampaignRepresentationBasicV1.h"

SPEC_BEGIN(LUCampaignRepresentationBasicV1Spec)

describe(@"LUCampaignRepresentationBasicV1", ^{
  beforeEach(^{
    [LUAPIClient setupWithAppID:@"1" APIKey:@"api-key"];
  });

  it(@"is an LUAPIModel", ^{
    [[[LUCampaignRepresentationBasicV1 class] should] beSubclassOfClass:[LUAPIModel class]];
  });

  // Public Methods

  context(@"icon URLs", ^{
    LUCampaignRepresentationBasicV1 *campaign = [LUCampaignRepresentationBasicV1 fixture];

    void (^itShouldBeAnIconURL)(NSURL *(^)(void)) = ^(NSURL *(^iconURL)(void)) {
      it(@"should have the same host as the API base URL", ^{
        [[[iconURL() host] should] equal:[[LUAPIClient sharedClient].baseURL host]];
      });

      it(@"should have the path of a campaign icon URL", ^{
        NSString *expectedPath = [NSString stringWithFormat:@"/%@/campaigns/%@/icon", LUAPIVersion15,
                                  campaign.campaignID];

        [[[iconURL() path] should] equal:expectedPath];
      });

      it(@"should contain the device's density as a query parameter", ^{
        NSString *densityParameter = [NSString stringWithFormat:@"density=%d",
                                      (int)[UIScreen mainScreen].scale];

        [[[iconURL() query] should] containString:densityParameter];
      });
    };

    describe(@"largeIconURL", ^{
      __block NSURL *largeIconURL;

      beforeEach(^{
        largeIconURL = [campaign largeIconURL];
      });

      itShouldBeAnIconURL(^{ return largeIconURL; });

      it(@"should have height 200", ^{
        [[[largeIconURL query] should] containString:@"height=200"];
      });

      it(@"should have width 200", ^{
        [[[largeIconURL query] should] containString:@"width=200"];
      });
    });

    describe(@"mediumIconURL", ^{
      __block NSURL *mediumIconURL;

      beforeEach(^{
        mediumIconURL = [campaign mediumIconURL];
      });

      itShouldBeAnIconURL(^{ return mediumIconURL; });

      it(@"should have height 100", ^{
        [[[mediumIconURL query] should] containString:@"height=100"];
      });

      it(@"should have width 100", ^{
        [[[mediumIconURL query] should] containString:@"width=100"];
      });
    });

    describe(@"smallIconURL", ^{
      __block NSURL *smallIconURL;

      beforeEach(^{
        smallIconURL = [campaign smallIconURL];
      });

      itShouldBeAnIconURL(^{ return smallIconURL; });

      it(@"should have height 50", ^{
        [[[smallIconURL query] should] containString:@"height=50"];
      });

      it(@"should have width 50", ^{
        [[[smallIconURL query] should] containString:@"width=50"];
      });
    });
  });
});

SPEC_END
