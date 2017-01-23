//
//  SearchImagesParametersModel.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchImagesParametersModel.h"
#import "PixelBayConstants.h"

NSString *const apiKeyKey = @"key";
NSString *const searchCriteriaKey = @"q";

@implementation SearchImagesParametersModel

- (nonnull id)init {
    
    self = [super init];
    
    if (self) {
        
        _apiKey = pixelBayApiKey;
    }
    
    return self;
}

- (nonnull id)initWithApiKey:(nonnull NSString *)apiKey {
    
    self = [super init];
    
    if (self) {
        
        _apiKey = apiKey;
    }
    
    return self;
}
 
- (nonnull NSString *)getPath {
    
    NSMutableArray *parameters = [NSMutableArray new];
    
    NSString *apiKeyParameter = [NSString stringWithFormat:@"%@=%@", apiKeyKey, _apiKey];
    
    [parameters addObject:apiKeyParameter];
    
    if (_searchCriteria) {
        
        NSString *formattedSearchCriteria = [_searchCriteria stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        
        [parameters addObject:[NSString stringWithFormat:@"%@=%@", searchCriteriaKey, formattedSearchCriteria]];
    }
    
    NSString *joinedParameters = [parameters componentsJoinedByString:@"&"];
    
    return [NSString stringWithFormat:@"%@?%@", [PixelBayConstants apiPath], joinedParameters];
}

@end

