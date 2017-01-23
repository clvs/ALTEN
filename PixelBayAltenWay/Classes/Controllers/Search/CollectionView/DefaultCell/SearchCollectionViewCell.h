//
//  SearchCollectionViewCell.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@class CDPixelBayImage;

@interface SearchCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *tagsCollectionView;

+ (NSString *)cellIdentifier;
- (void)showImage:(CDPixelBayImage *)image;

@end
