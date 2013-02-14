/**
 `LUCategoryRequestBuilder` is used to build requests related to categories.
 */
@class LUAPIRequest;

@interface LUCategoryRequestBuilder : NSObject

/**
 Builds a request to return the list of all merchant categories.

 On success, this request will return an array of `LUCategory` instances.
 */
+ (LUAPIRequest *)requestForAllCategories;

/**
 Builds a request to return the list of all cause categories.

 On success, this request will return an array of `LUCauseCategory` instances.
 */
+ (LUAPIRequest *)requestForAllCauseCategories;

@end
