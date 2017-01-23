//
//  ImageDetailsViewController+DataDisplay.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "ImageDetailsViewController+DataDisplay.h"
#import "ImageDetailsPersistanceModel.h"
#import "CDPixelBayImage+CoreDataClass.h"
#import "UIImageView+WebCache.h"

@implementation ImageDetailsViewController (DataDisplay)

- (void)showPersistanceModel {
    
    CDPixelBayImage *image = self.persistanceModel.image;
    
    NSURL *imageURL = [NSURL URLWithString:image.webformatURL];
    [self.imageView sd_setImageWithURL:imageURL];
    
    self.userNameLabel.text = image.user;
    self.likesCountLabel.text = [image.likesCount stringValue];
    self.favoritesCountLabel.text = [image.favoritesCount stringValue];
    self.commentsCountLabel.text = [image.commentsCount stringValue];
}

@end
