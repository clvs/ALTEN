//
//  SearchViewController.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@interface SearchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationBar *topView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewTopConstraint;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
