//
//  ThirdTableViewCell.m
//  masonrylearn
//
//  Created by 黄启山 on 16/4/29.
//  Copyright © 2016年 XHG. All rights reserved.
//

#import "ThirdTableViewCell.h"
#import "Masonry.h"
@interface ThirdTableViewCell ()

@property (nonatomic, strong) ThirdTableViewCellModel *model;

@end

@implementation ThirdTableViewCell

- (void)awakeFromNib
{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = NO;
        self.image = [UIImageView new];
        self.image.backgroundColor = [UIColor greenColor];
        self.image.layer.borderColor = [UIColor redColor].CGColor;
        self.image.layer.borderWidth = 1.5;
        self.image.layer.cornerRadius = 35;
        [self.contentView addSubview:self.image];
        
        self.tittleLabel = [UILabel new];
        self.tittleLabel.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:self.tittleLabel];
        
        self.detailLabel = [UILabel new];
        self.detailLabel.numberOfLines = 0;
        self.detailLabel.backgroundColor = [UIColor orangeColor];
        
        //下面两行代码可以防止在6上面出现问题
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        // 兼容6.0
        self.detailLabel.preferredMaxLayoutWidth = w - 95 - 15;
        
        [self.contentView addSubview:self.detailLabel];
        
        [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@15);
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
        
        [self.tittleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.image.mas_right).offset(10);
            make.top.equalTo(self.image.mas_top);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.height.equalTo(@30);
        }];
        
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.tittleLabel);
            make.top.equalTo(self.tittleLabel.mas_bottom).offset(10);
        }];
        
    }
    return self;
}

#pragma mark - 赋值
-(void)configCellWithModel:(ThirdTableViewCellModel *)model
{
    self.tittleLabel.text = model.tittle;
    self.detailLabel.text = model.detail;
}

#pragma mark - 根据model的内容，返回cell的高度
+ (CGFloat)heightWithModel:(ThirdTableViewCellModel *)model
{
    ThirdTableViewCell *cell = [[ThirdTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    [cell configCellWithModel:model];
    [cell layoutIfNeeded];

    CGRect frame =  cell.detailLabel.frame;
    
    NSLog(@"===height=%.2f  ===y=%.2f",frame.size.height,frame.origin.y);
    
    return frame.origin.y + frame.size.height + 15;
}

@end

@implementation ThirdTableViewCellModel



@end


