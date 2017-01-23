//
//  UserDefaultsManager.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@interface UserDefaultsManager: NSObject

+ (UserDefaultsManager *)sharedUserDefaultsManager;

@property (copy, nonatomic) NSString *lastSearchCriteria;

@end
