//
//  TagsCollectionViewCell.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "TagsCollectionViewCell.h"
#import "UIColor+PixelBayAltenWay.h"

@implementation TagsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.tagLabel.backgroundColor = [UIColor al_redColor];
    self.tagLabel.layer.cornerRadius = 5;
    self.tagLabel.layer.masksToBounds = YES;
}

+ (NSString *)cellIdentifier {
    
    static NSString *cellIdentifier;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        cellIdentifier = @"TagsCollectionViewCell";
    });
    
    return cellIdentifier;
}

- (void)showTag:(NSString *)tag {
    
    self.tagLabel.text = tag;
}

@end
