//
//  SearchViewController+Animations.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController (Animations)

- (void)animateCollectionViewCellAppearance:(UICollectionViewCell *)cell;

- (void)downScaleCollectionView;
- (void)restoreCollectionViewScale;

- (void)hideTopViewAnimated;
- (void)restoreTopViewAnimated;

- (void)bounceCollectionView;

@end
