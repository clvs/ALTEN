//
//  WBImageResults.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "LCDecodable.h"

@class WBImage;

@interface WBImageResults : NSObject <LCDecodable>

NS_ASSUME_NONNULL_BEGIN

@property (copy,readonly) NSArray<__kindof WBImage *> *hits;

NS_ASSUME_NONNULL_END

@end

