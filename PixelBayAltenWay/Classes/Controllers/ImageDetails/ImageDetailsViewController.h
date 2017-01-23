//
//  ImageDetailsViewController.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@class ImageDetailsPersistanceModel;
@protocol ImageDetailsViewControllerDelegate;

@interface ImageDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *likesCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoritesCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsCountLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (readonly, nonatomic) ImageDetailsPersistanceModel *persistanceModel;

@property (weak, nonatomic) id<ImageDetailsViewControllerDelegate> delegate;

- (void)setPersistanceModel:(ImageDetailsPersistanceModel *)persistanceModel;

@end
