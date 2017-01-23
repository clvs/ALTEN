//
//  SearchCollectionViewDelegate.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@protocol SearchCollectionViewDelegateDelegate;

@interface SearchCollectionViewDelegate : NSObject

@property (weak, nonatomic) id<SearchCollectionViewDelegateDelegate> delegate;

@end
