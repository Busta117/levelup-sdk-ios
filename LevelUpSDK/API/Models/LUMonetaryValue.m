#import "LUMonetaryValue.h"

@implementation LUMonetaryValue

#pragma mark - Public Methods

+ (LUMonetaryValue *)monetaryValueWithUSD:(NSNumber *)amount {
  LUMonetaryValue *value = [[LUMonetaryValue alloc] init];
  value.amount = @(amount.floatValue * 100.0f);
  value.currencyCode = @"USD";
  value.currencySymbol = @"$";
  value.formattedAmount = [NSString stringWithFormat:@"%.2f", amount.floatValue];

  return value;
}

- (NSString *)formattedAmountWithSymbol {
  return [self.currencySymbol stringByAppendingString:self.formattedAmount];
}

- (NSString *)shortFormatWithSymbol {
  NSString *formattedAmountWithSymbol = [self formattedAmountWithSymbol];

  if([formattedAmountWithSymbol hasSuffix:@".00"]) {
    return [formattedAmountWithSymbol substringToIndex:[formattedAmountWithSymbol length] - 3];
  } else {
    return formattedAmountWithSymbol;
  }
}

#pragma mark - NSObject Methods

- (NSString *)debugDescription {
  return [NSString stringWithFormat:@"MonetaryValue [amount=%@, currencyCode=%@, currencySymbol=%@, formattedAmount=%@]",
          self.amount, self.currencyCode, self.currencySymbol, self.formattedAmount];
}

- (NSString *)description {
  return [NSString stringWithFormat:@"MonetaryValue [%@]", [self formattedAmountWithSymbol]];
}

@end
