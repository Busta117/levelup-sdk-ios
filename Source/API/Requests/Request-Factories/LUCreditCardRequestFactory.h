// Copyright 2013 SCVNGR, Inc., D.B.A. LevelUp. All rights reserved.

@class LUAPIRequest;
@class LUCreditCard;

/**
 `LUCreditCardRequestFactory` is used to build requests related to credit cards.
 */
@interface LUCreditCardRequestFactory : NSObject

/**
 Builds a request to return all credit cards added by the current user.

 On success, this request will return an array of `LUCreditCard` instances.

 @warning Use of this request requires an Enterprise SDK license.
 */
+ (LUAPIRequest *)requestForCreditCards;

/**
 Builds a request to create a credit card.

 On success, this request will return the newly created `LUCreditCard`.

 @warning Non-Enterprise SDK clients can only create a user's first card, and require an access token
 with the `create_first_credit_card` permission.
 @param creditCard The `LUCreditCard` to create.
 */
+ (LUAPIRequest *)requestToCreateCreditCard:(LUCreditCard *)creditCard;

/**
 Builds a request to delete a credit card.

 On success, this request will return the deleted `LUCreditCard`.

 @warning Use of this request requires an Enterprise SDK license.
 @param creditCardID The ID of a credit card to delete.
 */
+ (LUAPIRequest *)requestToDeleteCreditCardWithID:(NSNumber *)creditCardID;

/**
 Builds a request to promote a credit card.

 The promoted card will be the first attempted when charging a user. When a credit card is promoted,
 if there is another promoted card, that card will be un-promoted.

 On success, this request will return the `LUCreditCard` that was promoted.

 @warning Use of this request requires an Enterprise SDK license.
 @param creditCardID The ID of a credit card to promote.
 */
+ (LUAPIRequest *)requestToPromoteCreditCardWithID:(NSNumber *)creditCardID;

@end
