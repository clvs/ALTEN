//
//  SearchCollectionViewDataSource.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchCollectionViewDataSource.h"
#import "SearchCollectionViewCell.h"
#import "CDPixelBayImage+CoreDataClass.h"

@interface SearchCollectionViewDataSource () <UICollectionViewDataSource> {
    
    __weak NSFetchedResultsController *_fetchedResultsController;
}

@end

@implementation SearchCollectionViewDataSource

- (id)initWithFetchResultController:(NSFetchedResultsController *)fetchedResultsController {
    
    self = [super init];
    
    if (self) {
        
        _fetchedResultsController = fetchedResultsController;
    }
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [[[_fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = [SearchCollectionViewCell cellIdentifier];
    
    SearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    CDPixelBayImage *image = [_fetchedResultsController objectAtIndexPath:indexPath];
    
    [cell showImage:image];
     
    return cell;
}

@end
