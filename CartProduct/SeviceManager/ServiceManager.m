//
//  ServiceManager.m
//  CartProduct
//
//  Created by Cuelogic on 13/06/16.
//  Copyright © 2016 Cuelogic. All rights reserved.
//

#import "ServiceManager.h"
#import "Product.h"
static ServiceManager *serviceManager = nil;

@implementation ServiceManager

+ (ServiceManager*)sharedManager{
    if (!serviceManager) {
        serviceManager = [[ServiceManager alloc] init];
    }
    return serviceManager;
}

-(void)createRequestToGetProductsWithCallback:(DownloadCompletionBlock)completion
{
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://mobiletest-hackathon.herokuapp.com/getdata/"]];
    urlRequest.allowsCellularAccess = YES;
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSURLSessionDataTask *dataTask = [[self session] dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *responseArray = [responseDict objectForKey:@"products"];
//        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//        NSArray *productsArray = []
        NSLog(@"Printing String - %@",responseArray);
        for (NSDictionary *productDict in responseArray) {
            Product *product = [[Product alloc] initWithDictionary:productDict];
            if (!productsArray) {
                productsArray = [[NSMutableArray alloc] init];
            }
            [productsArray addObject:product];
        }
        if (!error) {
            completion(productsArray,nil);
        }
    }];
    [dataTask resume];
}

-(void)createRequestToDownloadImage:(NSURL*)imageUrl withCallback:(DownloadImageBlock)downloadImageTask{
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:imageUrl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              // 4: Handle response here
                                              if (!error) {
                                                  downloadImageTask(data,nil);
                                              }
                                          }];
    
    
    // 3
    [downloadTask resume];}
-(NSURLSession*)session{
    if (!self.urlSession) {
        NSURLSessionConfiguration *urlSessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        self.urlSession = [NSURLSession sessionWithConfiguration:urlSessionConfiguration];
    }
    return self.urlSession;
    
}
@end
