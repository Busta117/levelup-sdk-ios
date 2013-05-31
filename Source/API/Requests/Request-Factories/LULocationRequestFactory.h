/**
 `LULocationRequestFactory` builds requests to retrieve locations.
 */
@class LUAPIRequest;

@interface LULocationRequestFactory : NSObject

/**
 Builds a request to return the first page of location summaries.

 On success, this request will return an array of `LULocation` instances in summary mode. Locations are returned in
 the order that were updated (ascending). The response will include a URL for the next page of results. This URL can
 be used with `requestForLocationSummaryPage:` to retrieve the next page of locations. In this way, the app can keep a
 local database of all LevelUp locations, and keep the database up to date.
 */
+ (LUAPIRequest *)requestForLocationSummaries;

/**
 Builds a request to return the given page of location summaries.

 On success, this request will return an array of `LULocation` instances in summary mode. If this page doesn't
 include any locations, the response will be empty with a status code of 204 (No Content). This URL can then be
 retried, and when results are available they will be returned. When there are additional pages of results, the response
 will also include the URL for the subsequent page of results.

 @param pageURL The next page of locations to request.
 */
+ (LUAPIRequest *)requestForLocationSummaryPage:(NSURL *)pageURL;

/**
 Builds a request to return all the locations associated with the given merchant ID.

 On success, this request will full `LULocation` instances for each location. If there isn't a merchant
 with the given ID, the response will be empty with a status code of 404 (Not found).

 @param merchantID The merchant ID to request.
 */
+ (LUAPIRequest *)requestForLocationsWithMerchantID:(NSNumber *)merchantID;

/**
 Builds a request to return the details for a specific location.

 On success, this request will return a `LULocation` instance for the specified ID. If there isn't a location
 with that id, the response will be empty with a status code of 404 (Not found).

 @param locationID The location ID to request.
 */
+ (LUAPIRequest *)requestForLocationWithID:(NSNumber *)locationID;

@end
