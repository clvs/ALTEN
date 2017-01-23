//
//  SearchCollectionViewDelegate.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchCollectionViewDelegate.h"
#import "SearchCollectionViewDelegateDelegate.h"

@interface SearchCollectionViewDataSource : NSObject <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation SearchCollectionViewDelegate

#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.delegate searchCollectionViewDelegate:self didSelectItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.delegate searchCollectionViewDelegate:self willDisplayCell:cell forItemAtIndexPath:indexPath];
}

#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        
        return CGSizeMake(CGRectGetWidth(collectionView.frame) / 2, CGRectGetHeight(collectionView.frame));
        
    } else {
        
        return CGSizeMake(CGRectGetWidth(collectionView.frame) / 2, CGRectGetHeight(collectionView.frame) / 2);
    }
}

@end
