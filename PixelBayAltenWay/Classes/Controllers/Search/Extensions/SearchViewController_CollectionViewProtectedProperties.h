//
//  SearchViewController_CollectionViewProtectedProperties.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchCollectionViewDelegateDelegate.h"
#import <CoreData/CoreData.h>

@class SearchCollectionViewDelegate, SearchCollectionViewDataSource;

@interface SearchViewController () <SearchCollectionViewDelegateDelegate>

@property SearchCollectionViewDelegate *collectionViewDelegate;
@property SearchCollectionViewDataSource *collectionViewDataSource;
@property NSFetchedResultsController *fetchedResultsController;

@end
