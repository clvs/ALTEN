//
//  UIAlertController+PixelBayAltenWay.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "UIAlertController+PixelBayAltenWay.h"

@implementation UIAlertController (PixelBayAltenWay)

+ (void)al_showFailedToLoadImages:(UIViewController * _Nonnull)hostController withError:(NSError * _Nonnull)error retryHandler:(nullable AlertRetryBlock)retryHandler {
    
    NSString *errorMessage = [NSString stringWithFormat:NSLocalizedString(@"fetchImagesError_message", "Fetch images message error"), error.code];
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:NSLocalizedString(@"fetchImagesError_title", "Fetch images title error")
                                          message:errorMessage
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *retryAction = [UIAlertAction
                                  actionWithTitle:NSLocalizedString(@"alertUtils_retry", "Retry button title")
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction *action) {
                                      
                                      retryHandler(action);
                                  }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"alertUtils_ok", "Ok button title")
                               style:UIAlertActionStyleDefault
                               handler:nil];
    
    [alertController addAction:retryAction];
    [alertController addAction:okAction];
    
    [hostController presentViewController:alertController animated:YES completion:nil];
}

+ (void)al_showNoInternetConnection:(UIViewController * _Nonnull)hostController retryHandler:(nullable AlertRetryBlock)retryHandler {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:NSLocalizedString(@"requestNoInternetConnectionError_title", "No internet connection title")
                                          message:NSLocalizedString(@"requestNoInternetConnectionError_message", "No internet connection message")
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *retryAction = [UIAlertAction
                                  actionWithTitle:NSLocalizedString(@"alertUtils_retry", "Retry button title")
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction *action) {
                                      
                                      retryHandler(action);
                                  }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"alertUtils_ok", "Ok button title")
                               style:UIAlertActionStyleDefault
                               handler:nil];
    
    [alertController addAction:retryAction];
    [alertController addAction:okAction];
    
    [hostController presentViewController:alertController animated:YES completion:nil];
}

@end
