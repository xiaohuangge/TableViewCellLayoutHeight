//
//  ThirdTableViewCell.h
//  masonrylearn
//
//  Created by 黄启山 on 16/4/29.
//  Copyright © 2016年 XHG. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ThirdTableViewCellModel : NSObject

@property(nonatomic,copy)NSString *tittle;
@property(nonatomic,copy)NSString *detail;
@property(nonatomic,assign)BOOL isClick;

@end

@interface ThirdTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView*image;
@property(nonatomic,strong)UILabel *tittleLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)NSIndexPath *index;
@property(nonatomic,copy)void (^returnIndexPath)(NSIndexPath*index);

-(void)configCellWithModel:(ThirdTableViewCellModel *)model;
+ (CGFloat)heightWithModel:(ThirdTableViewCellModel *)model;

@end
