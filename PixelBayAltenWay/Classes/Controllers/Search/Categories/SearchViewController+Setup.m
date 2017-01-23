//
//  SearchViewController+Setup.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchViewController+Setup.h"
#import "SearchViewController_CollectionViewProtectedProperties.h"
#import "SearchCollectionViewDelegate.h"
#import "SearchCollectionViewDataSource.h"
#import "SearchCollectionViewDelegate_ProtectedProtocols.h"
#import "SearchCollectionViewDataSource_ProtectedProtocols.h"
#import "PixelBayCoreData.h"
#import "CoreDataWrapper.h"

@implementation SearchViewController (Setup)

- (void)setupFetchedResultsController {
    
    PixelBayCoreData *shared = PixelBayCoreData.shared;
    NSManagedObjectContext *managedObjectContext = shared.coreDataWrapper.managedObjectContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:[PixelBayCoreData imageEntityIdentifier] inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"likesCount" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:@"Root"];
   
    self.fetchedResultsController = fetchedResultsController;
}

- (void)setupCollectionViewDelegate {
    
    SearchCollectionViewDelegate *collectionViewDelegate = [SearchCollectionViewDelegate new];
    
    self.collectionViewDelegate = collectionViewDelegate;
    
    collectionViewDelegate.delegate = self;
    
    self.collectionView.delegate = collectionViewDelegate;
}

- (void)setupCollectionViewDataSource {
    
    SearchCollectionViewDataSource *collectionViewDataSource = [[SearchCollectionViewDataSource alloc] initWithFetchResultController:self.fetchedResultsController];
    
    self.collectionViewDataSource = collectionViewDataSource;
    
    self.collectionView.dataSource = collectionViewDataSource;
}

@end
