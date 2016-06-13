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

#define Identifier @"ProductListId"
@interface ProductListViewController (){
IBOutlet UICollectionView *productListColloectionView;
    ServiceManager *serviceManager;
    NSMutableArray *listArray ;
}
@property (weak, nonatomic) IBOutlet UICollectionView *listCollectionView;

@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [productListColloectionView registerNib:[UINib nibWithNibName:@"ProductListCustomCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:Identifier];
    [productListColloectionView registerClass:[ProductListCustomCell class] forCellWithReuseIdentifier:Identifier];
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
    cell.productName.text = @"Nilofar" ;
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
@end
