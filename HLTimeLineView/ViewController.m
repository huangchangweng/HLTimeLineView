//
//  ViewController.m
//  HLTimeLineView
//
//  Created by JJB_iOS on 2022/6/23.
//

#import "ViewController.h"
#import "HLCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HLCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HLCell" forIndexPath:indexPath];
    
    // 根据数据设置时间轴样式
    if (indexPath.row == 0) {
        cell.timeLineView.type = HLTimelineViewTypeBefore;
        cell.timeLineView.nodeBorderWidth = 0; // 设置节点为实心圆
    } else if (indexPath.row == 6) {
        cell.timeLineView.type = HLTimelineViewTypeAfter;
    } else {
        cell.timeLineView.type = HLTimelineViewTypeAll;
    }
    
    // 随机高度
    NSString *str = @"UIBezierPath中文叫贝塞尔曲线，其作用是 UIBezierPath 类允许你在自定义的 View 中绘制和渲染由直线和曲线组成的路径. 你可以在初始化的时候, 直接为你的 UIBezierPath 指定一个几何图形. 路径可以是简单的几何图形例如: 矩形、椭圆、弧线之类的, 也可以是相对比较复杂的由直线和曲线组成的多边形. 当你定义完图形以后, 你可以使用额外的方法将你的路径直接绘制在当前的绘图上下文中。";
    NSInteger random = arc4random()%(150-20+1)+20;
    cell.cTitleLabel.text = [str substringToIndex:random];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
