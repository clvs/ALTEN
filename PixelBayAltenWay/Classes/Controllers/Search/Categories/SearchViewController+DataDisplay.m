//
//  SearchViewController+DataDisplay.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "SearchViewController+DataDisplay.h"
#import "UserDefaultsManager.h"

@implementation SearchViewController (DataDisplay)

- (void)showLastSearchCriteria {
    
    self.searchBar.text = [UserDefaultsManager sharedUserDefaultsManager].lastSearchCriteria;
}

@end
