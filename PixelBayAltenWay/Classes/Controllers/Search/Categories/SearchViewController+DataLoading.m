//
//  SearchViewController+DataLoading.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchViewController+DataLoading.h"
#import "PixelBayWebService.h"
#import "WBImageResults.h"
#import "WBImage.h"
#import "PixelBayDataService.h"
#import "SearchImagesParametersModel.h"
#import "Reachability.h"
#import "PixelBayCoreData.h"
#import "CDPixelBayImage+CoreDataClass.h"
#import "SearchViewController_CollectionViewProtectedProperties.h"
#import "UIAlertController+PixelBayAltenWay.h"
#import "UserDefaultsManager.h"

@implementation SearchViewController (DataLoading)

- (void)fetchImagesIfNeeded {
    
    NSError *error;
    
    if (![[self fetchedResultsController] performFetch:&error]) {
        
        [UIAlertController al_showFailedToLoadImages:self withError:error retryHandler:nil];
    }
    
    if ([[[[self fetchedResultsController] sections] objectAtIndex:0] numberOfObjects] == 0) {
        
        [self fetchImages:[UserDefaultsManager sharedUserDefaultsManager].lastSearchCriteria];
        
    } else {
        
        [self.collectionView reloadData];
    }
}

- (void)fetchImages:(NSString *)searchCriteria {
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    
    if (networkStatus != NotReachable) {
        
        [self loadImages:searchCriteria];
        
    } else {
        
        [UIAlertController al_showNoInternetConnection:self retryHandler:^(UIAlertAction *action) {
            
            [self fetchImages:searchCriteria];
        }];
    }
}

- (void)loadImages:(NSString *)searchCriteria {
    
    __weak SearchViewController *weakSelf = self;
    
    SearchImagesParametersModel *parameters = [SearchImagesParametersModel new];
    parameters.searchCriteria = searchCriteria;
    
    [PixelBayDataService getImagesWithParameters:parameters completionBlock:^(WBImageResults * _Nullable result) {
        
        NSError *error;
        
        if (![[self fetchedResultsController] performFetch:&error]) {
            
            [UIAlertController al_showFailedToLoadImages:self withError:error retryHandler:nil];
        }
        
        [self.collectionView reloadData];
        
    } errorBlock:^(NSError * _Nonnull error) {
        
        [UIAlertController al_showFailedToLoadImages:weakSelf withError:error retryHandler:^(UIAlertAction *action) {
            
            [weakSelf fetchImages:searchCriteria];
        }];
    }];
}

@end
