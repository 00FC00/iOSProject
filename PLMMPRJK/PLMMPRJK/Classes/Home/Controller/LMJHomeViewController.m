//
//  LMJHomeViewController.m
//  PLMMPRJK
//
//  Created by NJHu on 2017/3/29.
//  Copyright © 2017年 GoMePrjk. All rights reserved.
//

#import "LMJHomeViewController.h"
#import "LMJActivityViewController.h"
#import "LMJLiftCycleViewController.h"
#import "LMJRunTimeViewController.h"

@interface LMJHomeViewController ()

@end

@implementation LMJHomeViewController

#pragma mark viewController生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIEdgeInsets edgeInsets = self.tableView.contentInset;
    edgeInsets.bottom += self.tabBarController.tabBar.height;
    self.tableView.contentInset = edgeInsets;
    
    LMJWordArrowItem *item0 = [LMJWordArrowItem itemWithTitle:@"ViewController的生命周期" subTitle: nil];
    item0.destVc = [LMJLiftCycleViewController class];
    
    LMJWordArrowItem *item1 = [LMJWordArrowItem itemWithTitle:@"运行时RunTime 的知识运用" subTitle: nil];
    item1.destVc = [LMJRunTimeViewController class];
    
    LMJWordArrowItem *item2 = [LMJWordArrowItem itemWithTitle:@"多线程知识运用" subTitle: nil];
    item2.destVc = [LMJBaseViewController class];
    
    LMJWordArrowItem *item3 = [LMJWordArrowItem itemWithTitle:@"Protocol 的实现类" subTitle: nil];
    item3.destVc = [LMJBaseViewController class];
    
    
    LMJWordArrowItem *item4 = [LMJWordArrowItem itemWithTitle:@"Block 内存释放" subTitle: nil];
    item4.destVc = [LMJBaseViewController class];
    
    
    LMJItemSection *section0 = [LMJItemSection sectionWithItems:@[item0, item1, item2, item3, item4] andHeaderTitle:nil footerTitle:nil];
    
    [self.sections addObject:section0];
    
}








#pragma mark 重写BaseViewController设置内容


- (void)left_button_event:(UIButton *)sender
{
    NSLog(@"%s", __func__);
}

- (void)right_button_event:(UIButton *)sender
{
    LMJActivityViewController *ac = [LMJActivityViewController new];
    ac.gotoURL = @"http://www.baidu.com";
    
    [self.navigationController pushViewController:ac animated:YES];
    NSLog(@"%s", __func__);
}

- (void)title_click_event:(UILabel *)sender
{
    NSLog(@"%@", sender);
}

- (NSMutableAttributedString *)setTitle
{
    return [self changeTitle:@"基础知识点"];
}

- (UIButton *)set_leftButton
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    
    [btn setTitle:@"😁" forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    
    return btn;
}


- (UIButton *)set_rightButton
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    btn.backgroundColor = [UIColor yellowColor];
    
    [btn setAttributedTitle:[self changeTitle:@"百度"] forState:UIControlStateNormal];
    
    return btn;
}



#pragma mark 自定义代码

-(NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle];
    
    [title addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x333333) range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:CHINESE_SYSTEM(18) range:NSMakeRange(0, title.length)];
    
    return title;
}


@end




