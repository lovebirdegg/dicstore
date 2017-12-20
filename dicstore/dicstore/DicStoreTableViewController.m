//
//  DicStoreTableViewController.m
//  dicstore
//
//  Created by liu-chao on 2017/12/19.
//  Copyright © 2017年 neng. All rights reserved.
//

#import "DicStoreTableViewController.h"
#import <BmobSDK/Bmob.h>


@interface DicStoreTableViewController ()

@property(nonatomic,retain) NSMutableArray *dicArray;

@end

@implementation DicStoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"DicStore"];
    self.dicArray  = [NSMutableArray array];
    //查找GameScore表的数据
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        //        self.dicArray = [array copy];
        for (BmobObject *obj in array) {
            [self.dicArray addObject:obj];
            //打印playerName
            NSLog(@"obj.playerName = %@", [obj objectForKey:@"name"]);
            //打印objectId,createdAt,updatedAt
            NSLog(@"obj.objectId = %@", [obj objectId]);
            NSLog(@"obj.createdAt = %@", [obj createdAt]);
            NSLog(@"obj.updatedAt = %@", [obj updatedAt]);
        }
        [self.tableView reloadData];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.dicArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"SetingCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    BmobObject *obj = [self.dicArray objectAtIndex:[indexPath row]];
    cell.textLabel.text = [obj objectForKey:@"name"];
    cell.detailTextLabel.text = [obj objectForKey:@"price"];
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[obj objectForKey:@"icon"]]];
    cell.imageView.image = [UIImage imageWithData:imageData];

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
