//
//  PixelBayAltenWayUITests.m
//  PixelBayAltenWayUITests
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CDPixelBayImage+CoreDataClass.h"
#import "SearchViewController.h"
#import "SearchCollectionViewCell.h"
#import "ImageDetailsViewController.h"
#import "PixelBayCoreData.h"
#import "ImageDetailsPersistanceModel.h"
#import "ImageDetailsViewController+DataDisplay.h"

NSString *const previewURL = @"https://static.pixabay.com/photo/2013/10/15/09/12/flower-195893_150.jpg";
NSString *const webformatURL = @"https://static.pixabay.com/photo/2013/10/15/09/12/flower-195893_150.jpg";
NSString *const user = @"John Doe";
NSString *const tags = @"juice, sport";

@interface PixelBayAltenWayUITests : XCTestCase  {
    
    int _likesCount;
    int _favoritesCount;
    int _commentsCount;
    
    UIWindow *_window;
    
    CDPixelBayImage *_image;
    
    SearchViewController *_searchViewController;
    SearchCollectionViewCell *_searchCollectionViewCell;
    
    ImageDetailsViewController *_imageDetailsViewController;
}

@end

@implementation PixelBayAltenWayUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    _window = [UIWindow new];
    
    _likesCount = 45;
    _favoritesCount = 21;
    _commentsCount = 56;
    
    PixelBayCoreData *pixelBayCoreData = [PixelBayCoreData shared];
    
    CDPixelBayImage *newImage = [pixelBayCoreData insertNewImage];
    
    newImage.previewURL = previewURL;
    newImage.webformatURL = webformatURL;
    newImage.user = user;
    newImage.tags = tags;
    newImage.likesCount = [NSNumber numberWithInt:_likesCount];
    newImage.favoritesCount = [NSNumber numberWithInt:_favoritesCount];
    newImage.commentsCount = [NSNumber numberWithInt:_commentsCount];
    
    NSError *error;
    
    [pixelBayCoreData saveContext:&error];
    
    _image = newImage;
}

- (void)loadSearchViewController {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle bundleForClass:[SearchViewController class]]];
    SearchViewController *searchViewController = [storyboard instantiateViewControllerWithIdentifier:@"Search"];
    
    _searchViewController = searchViewController;
    
    [_window addSubview:searchViewController.view];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
}

- (void)loadImageDetailsViewController {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle bundleForClass:[ImageDetailsViewController class]]];
    ImageDetailsViewController *imageDetailsViewController = [storyboard instantiateViewControllerWithIdentifier:@"ImageDetails"];
    
    ImageDetailsPersistanceModel *persistanceModel = [[ImageDetailsPersistanceModel alloc] initWithImage:_image];
    [imageDetailsViewController setPersistanceModel:persistanceModel];
    
    _imageDetailsViewController = imageDetailsViewController;
    
    [_window addSubview:imageDetailsViewController.view];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
}

- (void)tearDown {
    
    _window = nil;
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSearchCollectionViewCell {
    
    [self loadSearchViewController];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    SearchCollectionViewCell *collectionViewCell = [_searchViewController.collectionView dequeueReusableCellWithReuseIdentifier:[SearchCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    
    [collectionViewCell showImage:_image];
    
    XCTAssertTrue([collectionViewCell.userNameLabel.text isEqualToString:user]);
}

- (void)testImageDetailsViewController {
    
    [self loadImageDetailsViewController];
    
    [_imageDetailsViewController showPersistanceModel];
    
    XCTAssertTrue([_imageDetailsViewController.userNameLabel.text isEqualToString:user]);
    
    NSString *likesCountString = [NSString stringWithFormat:@"%d", _likesCount];
    XCTAssertTrue([_imageDetailsViewController.likesCountLabel.text isEqualToString:likesCountString]);
    
    NSString *favoritesCountString = [NSString stringWithFormat:@"%d", _favoritesCount];
    XCTAssertTrue([_imageDetailsViewController.favoritesCountLabel.text isEqualToString:favoritesCountString]);
    
    NSString *commentsCountString = [NSString stringWithFormat:@"%d", _commentsCount];
    XCTAssertTrue([_imageDetailsViewController.commentsCountLabel.text isEqualToString:commentsCountString]);
}

@end
