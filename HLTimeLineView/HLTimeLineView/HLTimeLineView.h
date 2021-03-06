//
//  HLTimeLineView.h
//  HLTimeLineView
//
//  Created by JJB_iOS on 2022/6/23.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HLTimeLineViewType) {
    HLTimelineViewTypeAll,      ///< 上下都有
    HLTimelineViewTypeBottom,   ///< 只有下面
    HLTimelineViewTypeTop,      ///< 只有上面
    HLTimelineViewTypeNone,     ///< 下面都没有
};

IB_DESIGNABLE
@interface HLTimeLineView : UIView
/// 线颜色，默认0xDCE7FF
@property (nonatomic, strong) IBInspectable UIColor *lineColor UI_APPEARANCE_SELECTOR;
/// 线宽度，默认2
@property (nonatomic, assign) IBInspectable CGFloat lineWidth UI_APPEARANCE_SELECTOR;
/// 节点背景颜色，默认whiteColor
@property (nonatomic, strong) IBInspectable UIColor *nodeBackgroundColor UI_APPEARANCE_SELECTOR;
/// 节点颜色，默认0x4181FE
@property (nonatomic, strong) IBInspectable UIColor *nodeColor UI_APPEARANCE_SELECTOR;
/// 节点边框宽度，默认2，如果nodeBorderWidth == 0那么节点就是实心圆
@property (nonatomic, assign) IBInspectable CGFloat nodeBorderWidth UI_APPEARANCE_SELECTOR;
/// 节点顶部距离，默认10
@property (nonatomic, assign) IBInspectable CGFloat nodeTop;
/// 时间轴样式，默认HLTimelineViewTypeNone
@property (nonatomic, assign) IBInspectable NSInteger type;
/// 节点顶部距离线间隙，默认0
@property (nonatomic, assign) IBInspectable CGFloat nodeTopSpace UI_APPEARANCE_SELECTOR;
/// 节点底部距离线间隙，默认0
@property (nonatomic, assign) IBInspectable CGFloat nodeBottomSpace UI_APPEARANCE_SELECTOR;
/// 节点自定义图片，默认nil
@property (nonatomic, strong) IBInspectable UIImage *nodeImage UI_APPEARANCE_SELECTOR;
@end
