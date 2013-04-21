#import "LUAPIClient.h"
#import "LUAuthenticatedAPIRequest.h"
#import "LUOAuthTokenJSONFactory.h"
#import "LUUser.h"
#import "LUUserJSONFactory.h"
#import "LUUserParameterBuilder.h"
#import "LUUserRequestFactory.h"

@implementation LUUserRequestFactory

#pragma mark - Public Methods

+ (LUAPIRequest *)requestForCurrentUser {
  NSString *path = [NSString stringWithFormat:@"users/%@", [LUAPIClient sharedClient].currentUserID];

  return [LUAuthenticatedAPIRequest apiRequestWithMethod:@"GET"
                                                    path:path
                                              parameters:nil
                                            modelFactory:[LUUserJSONFactory factory]];
}

+ (LUAPIRequest *)requestToConnectToFacebookWithAccessToken:(NSString *)facebookAccessToken {
  NSString *path = [NSString stringWithFormat:@"users/%@/facebook_connections", [LUAPIClient sharedClient].currentUserID];

  return [LUAuthenticatedAPIRequest apiRequestWithMethod:@"POST"
                                                    path:path
                                              parameters:@{@"facebook_access_token" : facebookAccessToken}
                                            modelFactory:[LUUserJSONFactory factory]];
}

+ (LUAPIRequest *)requestToCreateUser:(LUUser *)user {
  NSMutableDictionary *params = [NSMutableDictionary dictionary];
  params[@"client_id"] = [LUAPIClient sharedClient].apiKey;
  params[@"user"] = [LUUserParameterBuilder parametersForUser:user];

  return [LUAPIRequest apiRequestWithMethod:@"POST"
                                       path:@"users"
                                 parameters:params
                               modelFactory:[LUOAuthTokenJSONFactory factory]];
}

+ (LUAPIRequest *)requestToDisconnectFromFacebook {
  NSString *path = [NSString stringWithFormat:@"users/%@/facebook_connections", [LUAPIClient sharedClient].currentUserID];

  return [LUAuthenticatedAPIRequest apiRequestWithMethod:@"DELETE"
                                                    path:path
                                              parameters:nil
                                            modelFactory:[LUUserJSONFactory factory]];
}

+ (LUAPIRequest *)requestToRemoveCauseAffiliation {
  return [LUAuthenticatedAPIRequest apiRequestWithMethod:@"DELETE" path:@"cause_affiliation" parameters:nil modelFactory:nil];
}

+ (LUAPIRequest *)requestToResetPasswordWithEmail:(NSString *)email {
  return [LUAuthenticatedAPIRequest apiRequestWithMethod:@"POST"
                                                    path:@"users/forgot_password"
                                              parameters:@{@"user" : @{@"email" : email}}
                                            modelFactory:nil];
}

+ (LUAPIRequest *)requestToSetCauseId:(NSNumber *)causeId {
  return [LUAuthenticatedAPIRequest apiRequestWithMethod:@"POST"
                                                    path:@"cause_affiliation"
                                              parameters:@{@"cause_id" : causeId}
                                            modelFactory:nil];
}

+ (LUAPIRequest *)requestToUpdateUser:(LUUser *)user {
  NSString *path = [NSString stringWithFormat:@"users/%@", [LUAPIClient sharedClient].currentUserID];

  return [LUAuthenticatedAPIRequest apiRequestWithMethod:@"PUT"
                                                    path:path
                                              parameters:@{@"user" : [LUUserParameterBuilder parametersForUser:user]}
                                            modelFactory:[LUUserJSONFactory factory]];
}

@end
