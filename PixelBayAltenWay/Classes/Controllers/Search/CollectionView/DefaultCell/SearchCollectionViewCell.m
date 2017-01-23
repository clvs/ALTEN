//
//  SearchCollectionViewCell.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchCollectionViewCell.h"
#import "CDPixelBayImage+CoreDataClass.h"
#import "UIImageView+WebCache.h"
#import "SearchCollectionViewCell+Setup.h"
#import "TagsCollectionViewDelegate.h"
#import "TagsCollectionViewDataSource.h"

@interface SearchCollectionViewCell ()

@property TagsCollectionViewDelegate *collectionViewDelegate;
@property TagsCollectionViewDataSource *collectionViewDataSource;

@end

@implementation SearchCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupCollectionView];
    [self setupCollectionViewDelegate];
    [self setupCollectionViewDataSource];
}

+ (NSString *)cellIdentifier {
    
    static NSString *cellIdentifier;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        cellIdentifier = @"SearchCollectionViewCell";
    });
    
    return cellIdentifier;
}

#pragma mark Data display

- (void)showImage:(CDPixelBayImage *)image {
    
    NSURL *imageURL = [NSURL URLWithString:image.previewURL];
    [self.imageView sd_setImageWithURL:imageURL];
    
    self.userNameLabel.text = image.user;
    
    NSArray *tagsAsArray = [image.tags componentsSeparatedByString:@", "];
    
    [self showTags:tagsAsArray];
}

- (void)showTags:(nonnull NSArray<__kindof NSString *> *)tags {
    
    [_collectionViewDelegate setTags:tags];
    [_collectionViewDataSource setTags:tags];
    
    [self.tagsCollectionView reloadData];
}

@end
