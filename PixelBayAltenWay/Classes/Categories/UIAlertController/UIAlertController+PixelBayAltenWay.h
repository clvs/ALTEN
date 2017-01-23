//
//  UIAlertController+PixelBayAltenWay.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (PixelBayAltenWay)

typedef void (^AlertRetryBlock)(UIAlertAction * _Nonnull action);
 
+ (void)al_showFailedToLoadImages:(UIViewController * _Nonnull)hostController withError:(NSError * _Nonnull)error retryHandler:(nullable AlertRetryBlock)retryHandler;
+ (void)al_showNoInternetConnection:(UIViewController * _Nonnull)hostController retryHandler:(nullable AlertRetryBlock)retryHandler;

@end
