//
//  ViewController.m
//  新闻快速滚动栏
//
//  Created by MacBook Pro on 2019/3/6.
//  Copyright © 2019年 MacBookPro. All rights reserved.
//

#import "ViewController.h"
#import "MarqueeView.h"
@interface ViewController ()
@property (nonatomic, strong) MarqueeView *marqueeView;
@property (strong, nonatomic)NSMutableArray *dataArr;//资讯

@end

@implementation ViewController
-(NSMutableArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}
-(MarqueeView*)marqueeView{
    if (!_marqueeView) {
         self.dataArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
         MarqueeView *marqueeView =[[MarqueeView alloc]initWithFrame:CGRectMake(-5, 64, self.view.frame.size.width-95, 26) withTitle:self.dataArr];
        
         marqueeView.backgroundColor = [UIColor redColor];
         marqueeView.titleColor = [UIColor darkGrayColor];
         marqueeView.titleFont = [UIFont systemFontOfSize:12];
         __weak MarqueeView *marquee = marqueeView;
        
        marqueeView.handlerTitleClickCallBack = ^(NSInteger index){
            
            NSLog(@"%@----%zd",marquee.titleArr[index-1],index);
            
//            AlertsViewController *alertsCtl=[[AlertsViewController alloc]initWithNibName:@"AlertsViewController" bundle:nil];
//            [self.navigationController pushViewController:alertsCtl animated:YES];
       };
        _marqueeView = marqueeView;
        
        
        
    }
    return _marqueeView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    [self.view addSubview:self.marqueeView];
}


@end
