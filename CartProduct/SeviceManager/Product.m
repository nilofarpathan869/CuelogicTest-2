//
//  Product.m
//  CartProduct
//
//  Created by Cuelogic on 13/06/16.
//  Copyright © 2016 Cuelogic. All rights reserved.
//

#import "Product.h"

@implementation Product
-(id)initWithDictionary:(NSDictionary*)responseDict{
    self = [super init];
    if (self) {
        if (responseDict) {
            self.productName = [responseDict valueForKey:@"productname"];
            self.productImage = [responseDict valueForKey:@"productImg"];
            self.productPrice = [NSString stringWithFormat:@"%lf",[responseDict objectForKey:@"price"]];
            self.vendorAddress =[responseDict valueForKey:@"vendoraddress"];
            self.vendorName = [responseDict valueForKey:@"vendorname"];
            self.phoneNumber = [responseDict valueForKey:@"phoneNumber"];

        }
    }
    return self;
}
@end
