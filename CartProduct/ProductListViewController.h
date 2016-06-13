//
//  ViewController.h
//  CartProduct
//
//  Created by Cuelogic on 13/06/16.
//  Copyright © 2016 Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductListViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSMutableArray *productsAddedToCart;

@end

