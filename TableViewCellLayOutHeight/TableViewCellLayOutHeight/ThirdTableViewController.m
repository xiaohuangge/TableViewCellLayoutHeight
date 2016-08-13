//
//  ThirdTableViewController.m
//  masonrylearn
//
//  Created by 黄启山 on 16/4/29.
//  Copyright © 2016年 XHG. All rights reserved.
//

#import "ThirdTableViewController.h"
#import "ThirdTableViewCell.h"
@interface ThirdTableViewController ()
@property(nonatomic,strong)NSMutableArray *tittleArr;

@end

@implementation ThirdTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"tableview cell自适应";
//    self.tableView.separatorStyle = NO;//去掉自带分割线
    [self.tableView registerClass:[ThirdTableViewCell class] forCellReuseIdentifier:@"cell"];
    for (NSUInteger i = 0; i < 14; ++i)
    {
        ThirdTableViewCellModel *model = [[ThirdTableViewCellModel alloc] init];
        model.tittle = @"测试标题，可能很长很长，反正随便写着先吧！";
        NSString *str = @"描述内容通常都是很长很长";
        int a = arc4random()%10 +1;
        NSMutableString *string = [NSMutableString string];
        for (int i =0; i< a; i++)
        {
           [string appendString:str];
        }
        
        model.detail = [NSString stringWithFormat:@"%@",string];
        
        [self.tittleArr addObject:model];
    }
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSMutableArray *)tittleArr
{
    if (_tittleArr == nil)
    {
        _tittleArr = [[NSMutableArray alloc]init];
    }
    return _tittleArr;
}
#pragma mark - tableview的分割线顶头设置
-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tittleArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThirdTableViewCellModel *model = _tittleArr[indexPath.row];
    return [ThirdTableViewCell heightWithModel:model];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[ThirdTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.index = indexPath;
    cell.returnIndexPath = ^(NSIndexPath *indexPath){
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    };
    
    ThirdTableViewCellModel *model = self.tittleArr[indexPath.row];
    [cell configCellWithModel:model];
    
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
