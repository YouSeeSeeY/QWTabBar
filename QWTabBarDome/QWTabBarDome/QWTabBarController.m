//
//  QWTabBarController.m
//  Mehmet
//  微微卿 制作
//  Created by jonh on 2017/8/14.
//    Copyright © 2017年 jonh. All rights reserved.
//
//  Copyright © 2017年 jonh. All rights reserved.
//

#import "QWTabBarController.h"



static QWTabBarController *tabbarCtl;
@interface QWTabBarController ()

@end
@implementation QWTabBarController
+ (QWTabBarController *)qwTabbarController{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabbarCtl = [[QWTabBarController alloc] init];
    });
    return tabbarCtl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewControllers];
}
- (void)addChildViewControllers
{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"UIViewController",@"UIViewController",@"UIViewController",@"UIViewController",@"UIViewController"]];
    NSArray *imgArray = @[@"homePage",@"task",@"complaint",@"home_activity",@"me"];
    NSArray *selectImageArray = @[@"homePage_select",@"task_select",@"complaint_select",@"home_activity_select",@"me_select"];
    NSArray *titles = @[@"首页",@"已接任务",@"申诉中心",@"活动中心",@"我的"];
    
    for(int i =0;i<array.count;i++)
    {
        UIViewController *vc = [[NSClassFromString(array[i]) alloc] init];
      
        vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        vc.tabBarItem.title = titles[i];
        vc.tabBarItem.image = [UIImage imageNamed:imgArray[i]];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [array replaceObjectAtIndex:i withObject:vc];
    }
    self.viewControllers = array;
    self.tabBar.tintColor = [UIColor orangeColor];
    
    self.qwTabBar = [[QWTabBar alloc] initWithTitles:titles itemImages:imgArray selectImages:selectImageArray];
    self.qwTabBar.frame = self.tabBar.bounds;
    self.qwTabBar.backgroundColor = [UIColor whiteColor];
    self.qwTabBar.delegate = self;
    self.qwTabBar.tintColor = [UIColor orangeColor];
    [self.tabBar addSubview:self.qwTabBar];
    
    
}
- (void)selectIndex:(NSInteger)index{
    [self setSelectedIndex:index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
