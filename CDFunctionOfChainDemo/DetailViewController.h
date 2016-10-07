//
//  DetailViewController.h
//  CDFunctionOfChainDemo
//
//  Created by chendi on 16/10/7.
//  Copyright © 2016年 chendi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

