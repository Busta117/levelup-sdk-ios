#import "LUCause.h"
#import "LUCauseJSONFactory.h"
#import "LUMonetaryValueJSONFactory.h"
#import "LUUser.h"
#import "LUUserJSONFactory.h"
#import "NSDictionary+ObjectClassAccess.h"

@implementation LUUserJSONFactory

#pragma mark - Public Methods

- (id)createFromAttributes:(NSDictionary *)attributes {
  NSDate *birthdate = [attributes dateForKey:@"born_at"];
  BOOL connectedToFacebook = [attributes stringForKey:@"facebook_access_token"].length > 0;
  NSDictionary *customAttributes = [attributes dictionaryForKey:@"custom_attributes"];
  NSString *email = [attributes stringForKey:@"email"];
  NSString *firstName = [attributes stringForKey:@"first_name"];
  LUGender gender = [self genderFromString:[attributes stringForKey:@"gender"]];
  LUMonetaryValue *globalCredit = [[LUMonetaryValueJSONFactory factory] fromJSONObject:attributes[@"credit"]];
  NSString *lastName = [attributes stringForKey:@"last_name"];
  NSNumber *merchantsVisitedCount = [attributes numberForKey:@"merchants_visited_count"];
  NSNumber *ordersCount = [attributes numberForKey:@"orders_count"];
  BOOL termsAccepted = [attributes dateForKey:@"terms_accepted_at"] != nil;
  LUMonetaryValue *totalSavings = [[LUMonetaryValueJSONFactory factory] fromJSONObject:attributes[@"loyalties_savings"]];
  NSNumber *userID = [attributes numberForKey:@"id"];

  LUCause *cause = [[LUCauseJSONFactory factory] fromJSONObject:attributes[@"cause"]];

  return [[LUUser alloc] initWithBirthdate:birthdate causeID:cause.causeID connectedToFacebook:connectedToFacebook
                          customAttributes:customAttributes email:email firstName:firstName gender:gender
                              globalCredit:globalCredit lastName:lastName merchantsVisitedCount:merchantsVisitedCount
                               ordersCount:ordersCount termsAccepted:termsAccepted totalSavings:totalSavings
                                    userID:userID];
}

- (NSString *)rootKey {
  return @"user";
}

#pragma mark - Private Methods

- (LUGender)genderFromString:(NSString *)genderString {
  if ([genderString isEqualToString:@"male"]) {
    return LUGenderMale;
  } else if ([genderString isEqualToString:@"female"]) {
    return LUGenderFemale;
  } else {
    return LUGenderUnspecified;
  }
}

@end
