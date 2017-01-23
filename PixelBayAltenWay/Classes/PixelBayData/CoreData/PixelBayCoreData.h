//
//  PixelBayCoreData.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@class CDPixelBayImage, CoreDataWrapper;

@interface PixelBayCoreData : NSObject

@property (readonly, nonatomic) CoreDataWrapper *coreDataWrapper;

+ (PixelBayCoreData *)shared;
- (CDPixelBayImage *)insertNewImage;
- (BOOL)saveContext:(NSError **)error;
- (BOOL)clearAllEntries:(NSError **)error;
+ (NSString *)imageEntityIdentifier;

@end
