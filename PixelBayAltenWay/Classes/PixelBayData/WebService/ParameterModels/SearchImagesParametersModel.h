//
//  SearchImagesParametersModel.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@interface SearchImagesParametersModel : NSObject

@property (nonnull, readonly, nonatomic) NSString *apiKey;
@property (nullable, copy, nonatomic) NSString *searchCriteria;

- (nonnull id)initWithApiKey:(nonnull NSString *)apiKey;
- (nonnull NSString *)getPath;

@end
