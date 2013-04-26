#import "LUAPIModel.h"

/**
 `LULoyalty` represents a user's loyalty information at a specific merchant. At most merchants, users will build
 loyalty as they make purchases at that merchant. Periodically, they will be rewarded with credit after spending a
 merchant-defined amount of money. For example, a merchant may choose to provide the user with $10 in credit for every
 $100 they spend. This is ongoing, so after spending $100 and receiving $10 in credit, the user must spend another
 $100 before they receive another $10 in credit.

 In addition, users may receive credit at a merchant through other means, such as campaigns or global credit.
 `LULoyalty` includes this information as well.
 */
@class LUMonetaryValue;

@interface LULoyalty : LUAPIModel

/**
 The ID of the merchant this `LULoyalty` is for.
 */
@property (nonatomic, copy) NSNumber *merchantId;

/**
 The number of orders the user has made at this merchant.
 */
@property (nonatomic, copy) NSNumber *ordersCount;

/**
 The total amount of credit available to the user at this merchant. This includes merchant-specific credit, global
 credit and campaign credit.
 */
@property (nonatomic, strong) LUMonetaryValue *potentialCredit;

/**
 The user's progress towards receiving more loyalty credit, as a number between 0.0 and 1.0. For example, if a merchant
 provides $5 in credit for every $50 spent, and the user has spent $10, this number would be 0.2.
 */
@property (nonatomic, assign) float progress;

/**
 Same as the `progress` property, but represented as a percentage from 0.0 to 100.0.
 */
@property (nonatomic, assign) float progressPercent;

/**
 The total amount of money that this user has saved at this merchant; that is, the total amount of credit that has been
 applied to orders at this merchant over all time.
 */
@property (nonatomic, strong) LUMonetaryValue *savings;

/**
 The amount of money a user spends at this merchant before receiving loyalty credit. For example if a merchant provides
 $10 of credit for every $100 spent, this will return $100.
 */
@property (nonatomic, strong) LUMonetaryValue *shouldSpend;

/**
 The amount of money remaining for the user before they will receive loyalty credit. For example if a merchant provides
 $10 of credit for every $100 spent, and the user has spent $25 since the last time they received loyalty, this would
 return $75.
 */
@property (nonatomic, strong) LUMonetaryValue *spendRemaining;

/**
 The total amount money the user has spent at this merchant over all time.
 */
@property (nonatomic, strong) LUMonetaryValue *totalVolume;

/**
 The amount of loyalty credit a user receives at this merchant. For example if a merchant provides $10 of credit for
 every $100 spent, this will return $10.
 */
@property (nonatomic, strong) LUMonetaryValue *willEarn;

@end