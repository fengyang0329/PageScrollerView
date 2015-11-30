//
//  ViewController.m
//  PageScrollerView
//
//  Created by 龙章辉 on 15/11/30.
//  Copyright © 2015年 Peter. All rights reserved.
//

#import "ViewController.h"
#import "PageScrollerView.h"
#import "PushViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

#define titleArray   [NSArray arrayWithObjects:@"知识",@"问答",@"详情", nil]

@interface ViewController ()<ViewPagerDataSource,ViewPagerDelegate>

@property(nonatomic,strong)PageScrollerView  *pageScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.title = @"测试";
    
    self.pageScrollView = [[PageScrollerView alloc] init];
    self.pageScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.pageScrollView setBackgroundColor:[UIColor whiteColor]];
    self.pageScrollView.delegate = self;
    self.pageScrollView.dataSource = self;
    [self.view addSubview:self.pageScrollView];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|[_pageScrollView]|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_pageScrollView)]];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|[_pageScrollView]|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_pageScrollView)]];
    [self.pageScrollView reloadData];
}

#pragma mark - ViewPagerDataSource
- (NSUInteger)numberOfTabsForViewPager:(PageScrollerView *)viewPager
{
    return titleArray.count;
}
-(NSArray *)titlesForPager:(PageScrollerView *)viewPager
{
    return titleArray;
}

- (UIViewController *)viewPager:(PageScrollerView *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index
{
    //疾病知识
    if (index==0)
    {
        FirstViewController *ctr = [[FirstViewController alloc] init];
        return ctr;
    }
    else if(index == 1)
    {
        SecondViewController *ctr = [[SecondViewController alloc] init];
        return ctr;
    }
    //疾病问答
    ThirdViewController *ctr = [[ThirdViewController alloc] init];
    return ctr;
}


#pragma mark - ViewPagerDelegate
- (CGFloat)viewPager:(PageScrollerView *)viewPager valueForOption:(ViewPagerOption)option withDefault:(CGFloat)value {
    
    switch (option) {
        case ViewPagerOptionStartFromSecondTab:
            return 0.0;
            break;
        case ViewPagerOptionCenterCurrentTab:
            return 0.0;
            break;
        case ViewPagerOptionTabLocation:
            return 1.0;
            break;
        case ViewPagerOptionTabWidth:
            return [UIScreen mainScreen].bounds.size.width/titleArray.count;
            break;
        default:
            break;
    }
    
    return value;
}


#pragma mark NSNotification
//- (void)pushToQuestionDetail:(NSNotification *)notification
//{
//    if ([notification.name isEqualToString:PushToQuestionDetailView])
//    {
//        NSInteger questionId = [notification.object integerValue];
//        QuestionDetailViewController *questionDetailVc = [[QuestionDetailViewController alloc] init];
//        questionDetailVc.questionId = [NSString stringWithFormat:@"%zi",questionId];
//        [self.navigationController pushViewController:questionDetailVc animated:YES];
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
