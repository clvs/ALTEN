//
//  CDPixelBayImage+CoreDataProperties.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "CDPixelBayImage+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface CDPixelBayImage (CoreDataProperties)

+ (NSFetchRequest<CDPixelBayImage *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *previewURL;
@property (nullable, nonatomic, copy) NSString *webformatURL;
@property (nullable, nonatomic, copy) NSString *user;
@property (nullable, nonatomic, copy) NSString *tags;
@property (nullable, nonatomic, copy) NSNumber *likesCount;
@property (nullable, nonatomic, copy) NSNumber *favoritesCount;
@property (nullable, nonatomic, copy) NSNumber *commentsCount;
 
@end

NS_ASSUME_NONNULL_END
