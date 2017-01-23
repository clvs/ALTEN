//
//  SearchCollectionViewDelegateDelegate.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@class SearchCollectionViewDelegate;

@protocol SearchCollectionViewDelegateDelegate <NSObject>

- (void)searchCollectionViewDelegate:(SearchCollectionViewDelegate *)searchCollectionViewDelegate didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)searchCollectionViewDelegate:(SearchCollectionViewDelegate *)searchCollectionViewDelegate willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath;

@end
