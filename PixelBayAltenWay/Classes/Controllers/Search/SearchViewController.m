//
//  SearchViewController.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchCollectionViewDelegate.h"
#import "SearchCollectionViewDataSource.h"
#import "SearchViewController+Setup.h"
#import "SearchViewController+DataLoading.h"
#import "SearchCollectionViewDelegateDelegate.h"
#import "PixelBayCoreData.h"
#import "CoreDataWrapper.h"
#import "ImageDetailsViewController.h"
#import "ImageDetailsPersistanceModel.h"
#import "SegueIdentifiers.h"
#import "SearchViewController+DataDisplay.h"
#import "UserDefaultsManager.h"
#import "SearchViewController+Animations.h"
#import "ImageDetailsViewControllerDelegate.h"
#import "CustomAnimator.h"

@interface SearchViewController () <UISearchBarDelegate, SearchCollectionViewDelegateDelegate, NSFetchedResultsControllerDelegate, ImageDetailsViewControllerDelegate, UINavigationControllerDelegate> {
    
    bool _firstAppeareance;
}

@property SearchCollectionViewDelegate *collectionViewDelegate;
@property SearchCollectionViewDataSource *collectionViewDataSource;
@property NSFetchedResultsController *fetchedResultsController;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _firstAppeareance = true;
    self.navigationController.delegate = self;
    
    [self showLastSearchCriteria];
    [self setupFetchedResultsController];
    [self setupCollectionViewDelegate];
    [self setupCollectionViewDataSource];
}

#pragma mark - Animated Transiton

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPush) {
        
        return [CustomAnimator new];
    }
    
    return nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!_firstAppeareance) {
        
        [self.collectionView reloadData]; // ensure layout is redrawn in case app rotates while in image details screen
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (_firstAppeareance) {
        _firstAppeareance = false;
        
        [self fetchImagesIfNeeded];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:searchToImageDetails]) {
        
        CDPixelBayImage *image = (CDPixelBayImage *)sender;
        
        ImageDetailsViewController *imageDetailsViewController = [segue destinationViewController];
        imageDetailsViewController.delegate = self;
        ImageDetailsPersistanceModel *persistanceModel = [[ImageDetailsPersistanceModel alloc] initWithImage:image];
        [imageDetailsViewController setPersistanceModel:persistanceModel];
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        [[self.collectionView collectionViewLayout] invalidateLayout];
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) { }];
}

- (IBAction)refresh:(UIBarButtonItem *)sender {
    
    NSError *error;
    [[PixelBayCoreData shared] clearAllEntries:&error];
    
    [self fetchImages:self.searchBar.text];
}

#pragma mark UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSError *error;
    [[PixelBayCoreData shared] clearAllEntries:&error];
    
    NSString *searchCriteria = searchBar.text;
    
    [UserDefaultsManager sharedUserDefaultsManager].lastSearchCriteria = searchCriteria;
    
    [self fetchImages:searchCriteria];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    [searchBar setShowsCancelButton:NO animated:YES];
}

#pragma mark SearchCollectionViewDelegateDelegate

- (void)searchCollectionViewDelegate:(SearchCollectionViewDelegate *)searchCollectionViewDelegate didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.searchBar resignFirstResponder]; // resign if first responder
    
    [self downScaleCollectionView];
    [self hideTopViewAnimated];
    
    CDPixelBayImage *info = [_fetchedResultsController objectAtIndexPath:indexPath];
    
    [self performSegueWithIdentifier:searchToImageDetails sender:info];
}

- (void)searchCollectionViewDelegate:(SearchCollectionViewDelegate *)searchCollectionViewDelegate willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self animateCollectionViewCellAppearance:cell];
}

#pragma mark - ImageDetailsViewControllerDelegate

- (void)imageDetailsViewController:(ImageDetailsViewController *)imageDetailsViewController didPressBack:(UIBarButtonItem *)sender {
    
    [self restoreCollectionViewScale];
    [self restoreTopViewAnimated];
}

@end
