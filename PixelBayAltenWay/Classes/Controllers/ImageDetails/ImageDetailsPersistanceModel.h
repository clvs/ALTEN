//
//  ImageDetailsPersistanceModel.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@class CDPixelBayImage;

@interface ImageDetailsPersistanceModel : NSObject

NS_ASSUME_NONNULL_BEGIN

@property (readonly) CDPixelBayImage *image;

NS_ASSUME_NONNULL_END

- (nonnull id)initWithImage:(nonnull CDPixelBayImage *)image;

@end
