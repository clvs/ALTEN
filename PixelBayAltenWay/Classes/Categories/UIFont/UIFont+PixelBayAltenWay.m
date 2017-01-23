//
//  UIFont+PixelBayAltenWay.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "UIFont+PixelBayAltenWay.h"

@implementation UIFont (PixelBayAltenWay)

+ (UIFont *)al_headerTitleFont {
    
    return [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:20.0f];
}

+ (UIFont *)al_minimumSizeFont {
    
    return [UIFont fontWithName:@"Helvetica-Bold" size:9.0f];
}

+ (UIFont *)al_mediumSizeFont {
    
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
}

@end
