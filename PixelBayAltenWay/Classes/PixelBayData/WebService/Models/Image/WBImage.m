//
//  WBImage.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "WBImage.h"

static NSString *const previewURLKey = @"previewURL";
static NSString *const webformatURLKey = @"webformatURL";
static NSString *const userKey = @"user";
static NSString *const tagsKey = @"tags";
static NSString *const likesCountKey = @"likes";
static NSString *const favoritesCountKey = @"favorites";
static NSString *const commentsCountKey = @"comments";
 
@implementation WBImage

- (nonnull id)initWithServerData:(nonnull NSDictionary *)serverData {
    
    _previewURL = serverData[previewURLKey];
    _webformatURL = serverData[webformatURLKey];
    _user = serverData[userKey];
    _tags = serverData[tagsKey];
    _likesCount = serverData[likesCountKey];
    _favoritesCount = serverData[favoritesCountKey];
    _commentsCount = serverData[commentsCountKey];
    
    return self;
}

@end
