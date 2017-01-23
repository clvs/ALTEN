//
//  ImageDetailsPersistanceModel.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "ImageDetailsPersistanceModel.h"

@implementation ImageDetailsPersistanceModel

- (nonnull id)initWithImage:(nonnull CDPixelBayImage *)image {
    
    self = [super init];
    
    if (self) {
        
        _image = image;
    }
    
    return self;
}

@end
