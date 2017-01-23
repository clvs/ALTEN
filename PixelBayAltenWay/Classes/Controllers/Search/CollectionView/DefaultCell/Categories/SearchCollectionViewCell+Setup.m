//
//  SearchCollectionViewCell+Setup.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchCollectionViewCell+Setup.h"
#import "TagsCollectionViewCell.h"
#import "TagsCollectionViewDelegate.h"
#import "TagsCollectionViewDataSource.h"
#import "SearchCollectionViewCell_ProtectedProperties.h"
#import "TagsCollectionViewDelegate_ProtectedProtocols.h"
#import "TagsCollectionViewDataSource_ProtectedProtocols.h"

@implementation SearchCollectionViewCell (Setup)

- (void)setupCollectionView {
    
    NSString *identifier = [TagsCollectionViewCell cellIdentifier];
    
    [self.tagsCollectionView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellWithReuseIdentifier:identifier];
}

- (void)setupCollectionViewDelegate {
    
    TagsCollectionViewDelegate *collectionViewDelegate = [TagsCollectionViewDelegate new];
    
    self.collectionViewDelegate = collectionViewDelegate;
    
    self.tagsCollectionView.delegate = collectionViewDelegate;
}

- (void)setupCollectionViewDataSource {
    
    TagsCollectionViewDataSource *collectionViewDataSource = [TagsCollectionViewDataSource new];
    
    self.collectionViewDataSource = collectionViewDataSource;
    
    self.tagsCollectionView.dataSource = collectionViewDataSource;
}

@end
