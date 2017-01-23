//
//  ImageDetailsViewController.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "ImageDetailsViewController.h"
#import "ImageDetailsViewController+DataDisplay.h"
#import "ImageDetailsViewController+Setup.h"
#import "ImageDetailsViewControllerDelegate.h"

@class TagsCollectionViewDelegate, TagsCollectionViewDataSource;

@interface ImageDetailsViewController () 

@property TagsCollectionViewDelegate *collectionViewDelegate;
@property TagsCollectionViewDataSource *collectionViewDataSource;

@end

@implementation ImageDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showPersistanceModel];
    [self setupCollectionView];
    [self setupCollectionViewDelegate];
    [self setupCollectionViewDataSource];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        [[self.collectionView collectionViewLayout] invalidateLayout];
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) { }];
}

- (void)setPersistanceModel:(ImageDetailsPersistanceModel *)persistanceModel {
    
    _persistanceModel = persistanceModel;
}

- (IBAction)back:(UIBarButtonItem *)sender {
    
    [self.delegate imageDetailsViewController:self didPressBack:sender];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
