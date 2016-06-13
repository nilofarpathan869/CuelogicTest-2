//
//  CartViewController.m
//  CartProduct
//
//  Created by Cuelogic on 13/06/16.
//  Copyright © 2016 Cuelogic. All rights reserved.
//

#import "CartViewController.h"
#import "CartViewCustomCell.h"
#import "Product.h"
#import "ServiceManager.h"

@interface CartViewController ()
@property (weak, nonatomic) IBOutlet UITableView *productTableView;

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.productCartList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Product *product = [self.productCartList objectAtIndex:indexPath.section];
    CartViewCustomCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"CartViewCustomID"];
    customCell.productNameLabel.text = product.productName;
    customCell.vendorAddressLabel.text = product.vendorAddress;
    customCell.vendorNameLabel.text = product.vendorName;
    customCell.proceLabel.text = product.productPrice;
    [customCell.callVendorButton addTarget:self action:@selector(callVendorTouch:) forControlEvents:UIControlEventTouchUpInside];
    [customCell.removeFromCartButton addTarget:self action:@selector(removeFromCart:) forControlEvents:UIControlEventTouchUpInside];
    customCell.callVendorButton.tag = indexPath.row;
    customCell.removeFromCartButton.tag = indexPath.row;
    customCell.tag = indexPath.section;
    return customCell;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(void)callVendorTouch:(UIButton*)button{
    Product *product = [self.productCartList objectAtIndex:button.tag];
   
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",product.phoneNumber]]];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(void)removeFromCart:(UIButton*)button{
    if ([self.productCartList count]!=0) {
        [self.productCartList removeObjectAtIndex:button.tag];
    }
    [self.productTableView reloadData];
}


// Default is 1 if not implemented

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
