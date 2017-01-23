//
//  CoreDataWrapper.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@class NSManagedObjectContext, NSManagedObjectModel, NSPersistentStoreCoordinator;

@interface CoreDataWrapper : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (CoreDataWrapper *)shared;
- (BOOL)saveContext:(NSError **)error;
- (NSURL *)applicationDocumentsDirectory;

@end
