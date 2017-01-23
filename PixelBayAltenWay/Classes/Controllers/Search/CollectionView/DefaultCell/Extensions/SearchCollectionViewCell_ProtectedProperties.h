//
//  SearchCollectionViewCell_ProtectedProperties.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchCollectionViewCell.h"

@class TagsCollectionViewDelegate, TagsCollectionViewDataSource;

@interface SearchCollectionViewCell ()

@property TagsCollectionViewDelegate *collectionViewDelegate;
@property TagsCollectionViewDataSource *collectionViewDataSource;

@end
