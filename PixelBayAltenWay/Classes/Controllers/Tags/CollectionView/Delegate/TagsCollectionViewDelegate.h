//
//  TagsCollectionViewDelegate.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@interface TagsCollectionViewDelegate : NSObject

- (nonnull id)initWithTags:(nonnull NSArray<__kindof NSString *> *)tags;
- (void)setTags:(nonnull NSArray<__kindof NSString *> *)tags;

@end
