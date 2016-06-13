//
//  ViewController.m
//  CartProduct
//
//  Created by Cuelogic on 13/06/16.
//  Copyright © 2016 Cuelogic. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductListCustomCell.h"
#import "ServiceManager.h"
#import "Product.h"
#include "CartViewController.h"
//CartViewId

#define Identifier @"ProductListId"
@interface ProductListViewController (){
IBOutlet UICollectionView *productListColloectionView;
    ServiceManager *serviceManager;
    NSMutableArray *listArray ;
}
@property (weak, nonatomic) IBOutlet UICollectionView *listCollectionView;
- (IBAction)showCartTouchUpInside:(id)sender;

@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [productListColloectionView registerNib:[UINib nibWithNibName:@"ProductListCustomCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:Identifier];
    [productListColloectionView registerClass:[ProductListCustomCell class] forCellWithReuseIdentifier:Identifier];
    [self.navigationItem setTitle:@"Products"];
    [self getProducts];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [listArray count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductListCustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    Product *product = [listArray objectAtIndex:indexPath.item];
    cell.productName.text = product.productName ;
    cell.productPrice.text = product.productPrice;
    cell.vendorName.text = product.vendorName;
    cell.vendorAddress.text = product.vendorAddress;
    cell.addToCart.tag = indexPath.item;
    [cell.addToCart addTarget:self action:@selector(addedToCart:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1 ;
}

-(void)getProducts{
    serviceManager = [ServiceManager sharedManager];
    [serviceManager createRequestToGetProductsWithCallback:^(NSMutableArray *results, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            listArray = results;
            
            [self.listCollectionView reloadData];
        });
    }];
}

-(void)addedToCart:(UIButton*)button{
    NSLog(@"Prnting tag =%d",button.tag);
    Product *p = [listArray objectAtIndex:button.tag];
    if (!self.productsAddedToCart) {
        self.productsAddedToCart = [[NSMutableArray alloc] init];
    }
    [self.productsAddedToCart addObject:[listArray objectAtIndex:button.tag]];
}
- (IBAction)showCartTouchUpInside:(id)sender {
    if ([self.productsAddedToCart count] == 0) {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Alert"
                                      message:@"Product Not added To Cart"
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                       //Handel no, thanks button
                                       
                                   }];
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    CartViewController *cartViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CartViewId"];
    [self.navigationController pushViewController:cartViewController animated:YES];
    cartViewController.productCartList = self.productsAddedToCart
    ;
}
@end
