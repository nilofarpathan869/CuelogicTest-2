//
//  ProductListCustomCell.h
//  CartProduct
//
//  Created by Cuelogic on 13/06/16.
//  Copyright © 2016 Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductListCustomCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UILabel *vendorName;
@property (weak, nonatomic) IBOutlet UILabel *vendorAddress;
@property (weak, nonatomic) IBOutlet UIButton *addToCart;

@end
