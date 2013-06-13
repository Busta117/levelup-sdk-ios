#import "LUPaymentToken.h"

@implementation LUPaymentToken

#pragma mark - Creation

- (id)initWithData:(NSString *)data paymentTokenID:(NSNumber *)paymentTokenID {
  self = [super init];
  if (!self) return nil;

  _data = data;
  _paymentTokenID = paymentTokenID;

  return self;
}

#pragma mark - NSObject Methods

- (NSString *)description {
  return [NSString stringWithFormat:@"LUPaymentToken [data=%@, paymentTokenID=%@]", self.data, self.paymentTokenID];
}

@end
