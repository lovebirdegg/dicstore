//
//  ViewController.m
//  dicstore
//
//  Created by liu-chao on 2017/12/19.
//  Copyright © 2017年 neng. All rights reserved.
//

#import "ViewController.h"
#import "DicStoreTableViewController.h"

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.btn addTarget:self
                 action:@selector(opentalbeview)
        forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) opentalbeview{
    
    DicStoreTableViewController *dic = [[DicStoreTableViewController alloc] init];
    
    [self presentViewController:dic animated:YES completion:^{
        
    }];
}

@end
