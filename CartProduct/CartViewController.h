//
//  CartViewController.h
//  CartProduct
//
//  Created by Cuelogic on 13/06/16.
//  Copyright © 2016 Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *productCartList;
@end
