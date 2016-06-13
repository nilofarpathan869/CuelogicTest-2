//
//  StoredProduct+CoreDataProperties.h
//  CartProduct
//
//  Created by Cuelogic on 13/06/16.
//  Copyright © 2016 Cuelogic. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "StoredProduct.h"

NS_ASSUME_NONNULL_BEGIN

@interface StoredProduct (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *productName;
@property (nullable, nonatomic, retain) NSString *productVendorName;
@property (nullable, nonatomic, retain) NSString *productVendorPrice;
@property (nullable, nonatomic, retain) NSString *productImage;
@property (nullable, nonatomic, retain) NSString *productPrice;

@end

NS_ASSUME_NONNULL_END
