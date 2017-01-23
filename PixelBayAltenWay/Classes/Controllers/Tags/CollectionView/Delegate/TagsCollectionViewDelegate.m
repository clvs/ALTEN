//
//  TagsCollectionViewDelegate.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "TagsCollectionViewDelegate.h"

@interface TagsCollectionViewDelegate () <UICollectionViewDelegateFlowLayout> {
    
    NSArray<__kindof NSString *> *_tags;
}

@end

@implementation TagsCollectionViewDelegate

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        _tags = [NSArray new];
    }
    
    return self;
}

- (nonnull id)initWithTags:(nonnull NSArray<__kindof NSString *> *)tags {
    
    self = [super init];
    
    if (self) {
        
        _tags = tags;
    }
    
    return self;
}

- (void)setTags:(nonnull NSArray<__kindof NSString *> *)tags {
    
    _tags = tags;
}

#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIFont *font = [UIFont systemFontOfSize:17];
    
    NSString *tag = [_tags objectAtIndex:indexPath.row];
    
    NSDictionary *attributes = @{NSFontAttributeName: font};
    
    CGSize stringSize = [tag sizeWithAttributes:attributes];
    
    CGFloat width = stringSize.width + 30;
    
    return CGSizeMake(width, CGRectGetHeight(collectionView.frame));
}

@end
