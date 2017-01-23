//
//  UserDefaultsManager.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "UserDefaultsManager.h"

NSString * const lastSearchCriteriaKey= @"lastSearchCriteria";

@implementation UserDefaultsManager

SINGLETON_FOR_CLASS(UserDefaultsManager)

- (NSString *)lastSearchCriteria {
    
    return (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:lastSearchCriteriaKey];
}

- (void)setLastSearchCriteria:(NSString *)lastSearchCriteria {
    
    [[NSUserDefaults standardUserDefaults] setObject:lastSearchCriteria forKey:lastSearchCriteriaKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end

