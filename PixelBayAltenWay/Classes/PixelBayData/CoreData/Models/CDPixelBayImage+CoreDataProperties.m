//
//  CDPixelBayImage+CoreDataProperties.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "CDPixelBayImage+CoreDataProperties.h"
#import "PixelBayCoreData.h"

@implementation CDPixelBayImage (CoreDataProperties)

+ (NSFetchRequest<CDPixelBayImage *> *)fetchRequest {
    return [[NSFetchRequest alloc] initWithEntityName:[PixelBayCoreData imageEntityIdentifier]];
}

@dynamic previewURL;
@dynamic webformatURL;
@dynamic user;
@dynamic tags;
@dynamic likesCount;
@dynamic favoritesCount;
@dynamic commentsCount;
 
@end
