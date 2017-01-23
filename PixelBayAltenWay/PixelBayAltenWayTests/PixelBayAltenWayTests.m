//
//  PixelBayAltenWayTests.m
//  PixelBayAltenWayTests
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WBImage.h"
#import "WBImageResults.h"
#import "SearchImagesParametersModel.h"

NSString *const previewURL = @"some preview url";
NSString *const webformatURL = @"some wb format url";
NSString *const user = @"John Doe";
NSString *const tags = @"juice, sport";

@interface PixelBayAltenWayTests : XCTestCase {
    
    int _likesCount;
    int _favoritesCount;
    int _commentsCount;
}

@end

@implementation PixelBayAltenWayTests

- (void)setUp {
    [super setUp];
    
    _likesCount = 45;
    _favoritesCount = 21;
    _commentsCount = 56;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (NSDictionary *)imageDictionary {
   
    return @{@"previewURL": previewURL,
             @"webformatURL": webformatURL,
             @"user": user,
             @"tags": tags,
             @"likes": [NSNumber numberWithInt:_likesCount],
             @"favorites": [NSNumber numberWithInt:_favoritesCount],
             @"comments": [NSNumber numberWithInt:_commentsCount]};
}

- (NSDictionary *)imageResultDictionary {
    
    NSDictionary *imageData = [self imageDictionary];
    
    NSArray *images = @[imageData];
    
    return @{@"hits": images};
}

- (void)assertImage:(WBImage *)image {
    
    XCTAssertTrue([image.previewURL isEqualToString:previewURL]);
    XCTAssertTrue([image.webformatURL isEqualToString:webformatURL]);
    XCTAssertTrue([image.user isEqualToString:user]);
    XCTAssertTrue([image.tags isEqualToString:tags]);
    XCTAssertTrue(image.likesCount.intValue == _likesCount);
    XCTAssertTrue(image.favoritesCount.intValue == _favoritesCount);
    XCTAssertTrue(image.commentsCount.intValue == _commentsCount);
}

- (void)testWBImageModel {
    
    NSDictionary *imageData = [self imageDictionary];
    
    WBImage *image = [[WBImage alloc] initWithServerData:imageData];
    
    [self assertImage:image];
}

- (void)testWBImageResultsModel {
    
    NSDictionary *imagesData = [self imageResultDictionary];
    
    WBImageResults *imagesResult = [[WBImageResults alloc] initWithServerData:imagesData];
    
    WBImage *image = [imagesResult.hits firstObject];
    
    [self assertImage:image];
}

- (void)testParametersModel {
    
    NSString *apiKey = @"some fake key";
    NSString *searchCriteria = @"some bananas please";
    
    SearchImagesParametersModel *parameters = [[SearchImagesParametersModel alloc] initWithApiKey:apiKey];
    parameters.searchCriteria = searchCriteria;
    
    NSString *shouldResultPath = @"https://pixabay.com/api?key=some fake key&q=some+bananas+please";
    NSString *resultingPath = [parameters getPath];
    XCTAssertTrue([shouldResultPath isEqualToString:resultingPath]);
}

@end
