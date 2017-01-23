//
//  WBImage.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "LCDecodable.h"
 
@interface WBImage : NSObject <LCDecodable>

NS_ASSUME_NONNULL_BEGIN

@property (copy,readonly) NSString *previewURL;
@property (copy,readonly) NSString *webformatURL;
@property (copy,readonly) NSString *user;
@property (copy,readonly) NSString *tags;
@property (copy,readonly) NSNumber *likesCount;
@property (copy,readonly) NSNumber *favoritesCount;
@property (copy,readonly) NSNumber *commentsCount;

NS_ASSUME_NONNULL_END

@end
