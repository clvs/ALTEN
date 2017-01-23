//
//  ImageDetailsViewController+Setup.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "ImageDetailsViewController+Setup.h"
#import "TagsCollectionViewCell.h"
#import "TagsCollectionViewDelegate.h"
#import "TagsCollectionViewDataSource.h"
#import "CDPixelBayImage+CoreDataClass.h"
#import "ImageDetailsViewController_CollectionViewProtectedProperties.h"
#import "ImageDetailsPersistanceModel.h"
#import "TagsCollectionViewDelegate_ProtectedProtocols.h"
#import "TagsCollectionViewDataSource_ProtectedProtocols.h"

@implementation ImageDetailsViewController (Setup)

- (void)setupCollectionView {
    
    NSString *identifier = [TagsCollectionViewCell cellIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellWithReuseIdentifier:identifier];
}

- (void)setupCollectionViewDelegate {
    
    CDPixelBayImage *image = self.persistanceModel.image;
    NSArray *tagsAsArray = [image.tags componentsSeparatedByString:@", "];
    
    TagsCollectionViewDelegate *collectionViewDelegate = [[TagsCollectionViewDelegate alloc] initWithTags:tagsAsArray];
    
    self.collectionViewDelegate = collectionViewDelegate;
    
    self.collectionView.delegate = collectionViewDelegate;
}

- (void)setupCollectionViewDataSource {
    
    CDPixelBayImage *image = self.persistanceModel.image;
    NSArray *tagsAsArray = [image.tags componentsSeparatedByString:@", "];
    
    TagsCollectionViewDataSource *collectionViewDataSource = [[TagsCollectionViewDataSource alloc] initWithTags:tagsAsArray];
    
    self.collectionViewDataSource = collectionViewDataSource;
    
    self.collectionView.dataSource = collectionViewDataSource;
}

@end
