//
//  ImageDetailsViewControllerDelegate.h
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 14/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

@class ImageDetailsViewController;

@protocol ImageDetailsViewControllerDelegate <NSObject>

- (void)imageDetailsViewController:(ImageDetailsViewController *)imageDetailsViewController didPressBack:(UIBarButtonItem *)sender;

@end
