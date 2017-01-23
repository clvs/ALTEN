//
//  PixelBayDataService.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "PixelBayDataService.h"
#import "PixelBayWebService.h"
#import "PixelBayCoreData.h"
#import "CDPixelBayImage+CoreDataClass.h"
#import "WBImage.h"
#import "WBImageResults.h"

@implementation PixelBayDataService

+ (void)getImagesWithParameters:(nonnull SearchImagesParametersModel *)parameters completionBlock:(nonnull LoadImagesCompletionBlock)completionBlock errorBlock:(nonnull LoadImagesErrorBlock)errorBlock {
    
    [PixelBayWebService getImagesWithParameters:parameters completionBlock:^(WBImageResults * _Nullable result) {
        
        PixelBayCoreData *pixelBayCoreData = [PixelBayCoreData shared];
        
        for (WBImage *image in result.hits) {
            
            CDPixelBayImage *newImage = [pixelBayCoreData insertNewImage];
            
            [PixelBayDataService mapWebModelIntoCoreDataModel:image coreDataModel:newImage];
        }
        
        NSError *error = nil;
        
        [pixelBayCoreData saveContext:&error];
        
        if (error == nil) {
            
            completionBlock();
            
        } else {
            
            errorBlock(error);
        }
        
    } errorBlock:^(NSError * _Nonnull error) {
        
        errorBlock(error);
    }];
}

+ (void)mapWebModelIntoCoreDataModel:(WBImage *)image coreDataModel:(CDPixelBayImage *)newImage {
    
    newImage.previewURL = image.previewURL;
    newImage.webformatURL = image.webformatURL;
    newImage.user = image.user;
    newImage.tags = image.tags;
    newImage.likesCount = image.likesCount;
    newImage.favoritesCount = image.favoritesCount;
    newImage.commentsCount = image.commentsCount;
}

@end
