//
//  ImageDetailsViewController_CollectionViewProtectedProperties.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "ImageDetailsViewController.h"

@class TagsCollectionViewDelegate, TagsCollectionViewDataSource;

@interface ImageDetailsViewController ()

@property TagsCollectionViewDelegate *collectionViewDelegate;
@property TagsCollectionViewDataSource *collectionViewDataSource;

@end
