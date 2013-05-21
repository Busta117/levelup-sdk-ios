@interface LUCoreDataStack : NSObject

+ (NSManagedObjectContext *)managedObjectContext;

+ (NSString *)metadataStringForKey:(NSString *)key;
+ (void)setMetadataString:(NSString *)string forKey:(NSString *)key;

+ (NSURL *)initialDatabaseURL;
+ (NSURL *)storeDatabaseURL;

@end
