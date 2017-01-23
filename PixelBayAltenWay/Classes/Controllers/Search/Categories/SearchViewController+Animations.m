//
//  SearchViewController+Animations.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchViewController+Animations.h"

@implementation SearchViewController (Animations)

#pragma mark Cell animations

- (void)animateCollectionViewCellAppearance:(UICollectionViewCell *)cell {
    
    cell.alpha = 0;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        cell.alpha = 1;
    }];
}

- (void)downScaleCollectionView {
    
    [UIView animateWithDuration: 1.1 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:-1.0  options:0 animations:^{
        
        self.collectionView.transform = CGAffineTransformMakeScale(0.9, 0.9);
        
    } completion:NULL];
}

- (void)restoreCollectionViewScale {
    
    [UIView animateWithDuration: 1.2 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:-1.0 options:0 animations:^{
        
        self.collectionView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    } completion:NULL];
}

- (void)hideTopViewAnimated {
    
    self.topViewTopConstraint.constant = -CGRectGetHeight(self.topView.frame);
    
    [UIView animateWithDuration:1.0 animations:^{
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        self.topView.hidden = YES; // hides topview to prevent it from beeing visible while ImageDetailsViewController is presented and rotating
    }];
}

- (void)restoreTopViewAnimated {
    
    self.topViewTopConstraint.constant = 0;
    
    self.topView.hidden = NO;
    
    [UIView animateWithDuration:1.0 animations:^{
        
        [self.view layoutIfNeeded];
    }];
}

- (void)bounceCollectionView {
    
    [UIView animateWithDuration:1.4 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:10.0 options:UIViewAnimationOptionTransitionNone animations:^{
        
        [self.collectionView reloadData];
        
    } completion:nil];
}

@end
