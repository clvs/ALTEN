//
//  SearchViewController+DataLoading.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController (DataLoading)

- (void)fetchImagesIfNeeded;
- (void)fetchImages:(NSString *)searchCriteria;
 
@end
