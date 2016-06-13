//
//  ServiceManager.h
//  CartProduct
//
//  Created by Cuelogic on 13/06/16.
//  Copyright © 2016 Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceManager : NSObject{
    NSMutableArray *productsArray;
}
typedef void (^DownloadCompletionBlock)(NSMutableArray *resultsArray, NSError *error);
typedef void (^DownloadImageBlock)(NSData *date, NSError *error);


@property(nonatomic,strong)NSURLSession *urlSession;
-(void)createRequestToGetProductsWithCallback:(DownloadCompletionBlock)completion;
-(void)createRequestToDownloadImage:(NSURL*)imageUrl withCallback:(DownloadImageBlock)downloadImageTask ;
+ (ServiceManager*)sharedManager ;

@end
