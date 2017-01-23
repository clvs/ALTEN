//
//  PixelBayCoreData.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "PixelBayCoreData.h"
#import "CoreDataWrapper.h"

@implementation PixelBayCoreData

+ (PixelBayCoreData *)shared {
    
    static PixelBayCoreData *shared = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        shared = [self new];
    });
    
    return shared;
}

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        _coreDataWrapper = [CoreDataWrapper new];
    }
    
    return self;
}

- (BOOL)saveContext:(NSError **)error {
    
    return [_coreDataWrapper saveContext:error];
}

- (BOOL)clearAllEntries:(NSError **)error {
    
    NSManagedObjectContext *context = _coreDataWrapper.managedObjectContext;
    
    NSFetchRequest *allImages = [[NSFetchRequest alloc] init];
    [allImages setEntity:[NSEntityDescription entityForName:[PixelBayCoreData imageEntityIdentifier] inManagedObjectContext:context]];
    [allImages setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSArray *images = [context executeFetchRequest:allImages error:error];
    
    for (NSManagedObject *image in images) {
        
        [context deleteObject:image];
    }
    
    return [self saveContext:error];
}

- (CDPixelBayImage *)insertNewImage {
    
    return (CDPixelBayImage *)[NSEntityDescription insertNewObjectForEntityForName:[PixelBayCoreData imageEntityIdentifier] inManagedObjectContext:_coreDataWrapper.managedObjectContext];
}

+ (NSString *)imageEntityIdentifier {
    
    static NSString *cellIdentifier;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        cellIdentifier = @"CDPixelBayImage";
    });
    
    return cellIdentifier;
}

@end
