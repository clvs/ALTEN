//
//  PixelBayConstants.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "PixelBayConstants.h"

NSString *const rootPath = @"https://pixabay.com";
NSString *const apiPath = @"/api";

NSString *const pixelBayApiKey = @"4255053-8039014114d5037a77429fc7a";

@implementation PixelBayConstants

+ (NSString *)apiPath {
    
    return [rootPath stringByAppendingString:apiPath];
}

@end
