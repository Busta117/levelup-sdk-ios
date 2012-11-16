#import <Foundation/Foundation.h>

@class LUDivision;
@class LUCause;
@class LUMonetaryValue;
@class LUQRCode;
@class LUUserAddress;

@interface LUUser : NSObject

@property (nonatomic, copy) NSNumber *ableToRefer;
@property (nonatomic, copy) NSString *bornAt;
@property (nonatomic, strong) LUCause *cause;
@property (nonatomic, copy) NSNumber *causeId;
@property (nonatomic, strong) LUMonetaryValue *credit;
@property (nonatomic, copy, readonly) NSString *deviceIdentifier;
@property (nonatomic, strong) LUDivision *division;
@property (nonatomic, copy) NSNumber *divisionId;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *employer;
@property (nonatomic, copy) NSString *facebookUserId;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSNumber *lat;
@property (nonatomic, copy) NSNumber *lng;
@property (nonatomic, strong) LUMonetaryValue *loyaltiesSavings;
@property (nonatomic, copy) NSNumber *merchantsVisitedCount;
@property (nonatomic, copy) NSNumber *modelId;
@property (nonatomic, copy, getter = theNewPassword) NSString *newPassword;
@property (nonatomic, copy, getter = theNewPasswordConfirmation) NSString *newPasswordConfirmation;
@property (nonatomic, copy) NSNumber *ordersCount;
@property (nonatomic, copy) NSNumber *paymentEligible;
@property (nonatomic, copy) NSNumber *percentDonation;
@property (nonatomic, copy) NSString *promotionCode;
@property (nonatomic, strong) LUQRCode *qrCode;
@property (nonatomic, copy) NSString *referralCode;
@property (nonatomic, copy) NSNumber *subscribed;
@property (nonatomic, copy) NSNumber *twitterAuthenticated;
@property (nonatomic, copy) NSArray *userAddresses;
@property (nonatomic, copy) NSNumber *xUserId;

- (NSInteger)ageInYears;
- (LUUserAddress *)homeAddress;
- (BOOL)isAbleToRefer;
- (BOOL)isPaymentEligible;
- (BOOL)isSubscribed;
- (NSDictionary *)parameters;
- (NSString *)referralFacebookDescription;
- (NSString *)referralTweetString;
- (NSString *)referralUrl;

@end
