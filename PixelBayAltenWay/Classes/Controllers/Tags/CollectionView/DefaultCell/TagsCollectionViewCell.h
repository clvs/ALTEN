//
//  TagsCollectionViewCell.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@interface TagsCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

+ (NSString *)cellIdentifier;
- (void)showTag:(NSString *)tag;

@end
