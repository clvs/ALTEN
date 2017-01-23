//
//  TagsCollectionViewDataSource.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "TagsCollectionViewDataSource.h"
#import "TagsCollectionViewCell.h"

@interface TagsCollectionViewDataSource () <UICollectionViewDataSource>

@end

@implementation TagsCollectionViewDataSource

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        _tags = [NSArray new];
    }
    
    return self;
}

- (nonnull id)initWithTags:(nonnull NSArray<__kindof NSString *> *)tags {
    
    self = [super init];
    
    if (self) {
        
        _tags = tags;
    }
    
    return self;
}

- (void)setTags:(nonnull NSArray<__kindof NSString *> *)tags {
    
    _tags = tags;
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _tags.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = [TagsCollectionViewCell cellIdentifier];
    
    TagsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSString *tag = [_tags objectAtIndex:indexPath.row];
    
    [cell showTag:tag];
    
    return cell;
}

@end
