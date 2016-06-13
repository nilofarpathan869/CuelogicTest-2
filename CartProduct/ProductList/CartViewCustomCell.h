//
//  CartViewCustomCell.h
//  CartProduct
//
//  Created by Cuelogic on 13/06/16.
//  Copyright © 2016 Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartViewCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cartProductImageView;
@property (weak, nonatomic) IBOutlet UIButton *callVendorButton;
@property (weak, nonatomic) IBOutlet UIButton *removeFromCartButton;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *vendorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *vendorAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *proceLabel;

@end
