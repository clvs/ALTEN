//
//  PixelBayWebService.m
//  PixelBayAltenWay
//
//  Created by Cociu Laurentiu-Victor on 13/01/2017.
//  Copyright © 2017 ALTEN GmbH. All rights reserved.
//

#import "PixelBayWebService.h"
#import "SearchImagesParametersModel.h"
#import "WBImage.h"
#import "WBImageResults.h"

@implementation PixelBayWebService

+ (void)getImagesWithParameters:(nonnull SearchImagesParametersModel *)parameters completionBlock:(nonnull SearchImagesCompletionBlock)completionBlock errorBlock:(nonnull SearchImagesErrorBlock)errorBlock {
    
    NSString *urlString = [parameters getPath];
   
    NSURL *URL = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            
            errorBlock(error);
            
        } else {
            
            if (data) {
                
                NSDictionary *dataJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                
                WBImageResults *imagesResult = [[WBImageResults alloc] initWithServerData:dataJSON];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    completionBlock(imagesResult);
                });
                
            } else {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    completionBlock(nil);
                });
            }
        }
    }];
    
    [dataTask resume];
}

@end
