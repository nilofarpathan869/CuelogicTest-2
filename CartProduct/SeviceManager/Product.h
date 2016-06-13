//
//  Product.h
//  CartProduct
//
//  Created by Cuelogic on 13/06/16.
//  Copyright © 2016 Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property(nonatomic,strong)NSString *productName;
@property(nonatomic,strong)NSString *vendorName;
@property(nonatomic,strong)NSString *vendorAddress;
@property(nonatomic,strong)NSString *productPrice;
@property(nonatomic,strong)NSString *productImage;
@property(nonatomic,strong)NSString *phoneNumber;

-(id)initWithDictionary:(NSDictionary*)responseDict ;

@end
