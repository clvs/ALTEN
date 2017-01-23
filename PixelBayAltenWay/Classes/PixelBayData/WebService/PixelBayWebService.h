//
//  PixelBayWebService.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@class WBImageResults, SearchImagesParametersModel;

@interface PixelBayWebService : NSObject

typedef void (^SearchImagesCompletionBlock)(WBImageResults * _Nullable result);
typedef void (^SearchImagesErrorBlock)(NSError * _Nonnull error);

+ (void)getImagesWithParameters:(nonnull SearchImagesParametersModel *)parameters completionBlock:(nonnull SearchImagesCompletionBlock)completionBlock errorBlock:(nonnull SearchImagesErrorBlock)errorBlock;

@end
