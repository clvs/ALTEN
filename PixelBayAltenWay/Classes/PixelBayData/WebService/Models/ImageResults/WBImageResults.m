//
//  WBImageResults.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "WBImageResults.h"
#import "WBImage.h"

static NSString *const hitsKey = @"hits";

@interface WBImageResults() <LCDecodable>
@end

@implementation WBImageResults

- (nonnull id)initWithServerData:(nonnull NSDictionary *)serverData {
    
    NSMutableArray *decodedImages = [NSMutableArray new];
    
    NSArray *encodedImages = serverData[hitsKey];
    
    for (NSDictionary *encodedImage in encodedImages) {
        
        WBImage *decodedImage = [[WBImage alloc] initWithServerData:encodedImage];
        [decodedImages addObject:decodedImage];
    }
    
    _hits = decodedImages;
    
    return self;
}

@end
