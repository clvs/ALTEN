//
//  PixelBayDataService.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@class SearchImagesParametersModel;

@interface PixelBayDataService : NSObject

typedef void (^LoadImagesCompletionBlock)();
typedef void (^LoadImagesErrorBlock)(NSError * _Nonnull error);

+ (void)getImagesWithParameters:(nonnull SearchImagesParametersModel *)parameters completionBlock:(nonnull LoadImagesCompletionBlock)completionBlock errorBlock:(nonnull LoadImagesErrorBlock)errorBlock;

@end
