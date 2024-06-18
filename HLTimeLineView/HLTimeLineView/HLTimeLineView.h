//
//  HLTimeLineView.h
//  HLTimeLineView
//
//  Created by JJB_iOS on 2022/6/23.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HLTimeLineViewType) {
    HLTimelineViewTypeAll,      ///< 前后都有
    HLTimelineViewTypeAfter,    ///< 只有前面
    HLTimelineViewTypeBefore,   ///< 只有后面
    HLTimelineViewTypeNone,     ///< 前后都没有
};

IB_DESIGNABLE
@interface HLTimeLineView : UIView
/// 时间轴方向，默认0
/// 0竖向，1横向
@property (nonatomic, assign) IBInspectable NSInteger direction;
/// 线颜色，默认0xDCE7FF
@property (nonatomic, strong) IBInspectable UIColor *lineColor UI_APPEARANCE_SELECTOR;
/// 前线颜色，默认nil
@property (nonatomic, strong) IBInspectable UIColor *lineAfterColor UI_APPEARANCE_SELECTOR;
/// 后线颜色，默认nil
@property (nonatomic, strong) IBInspectable UIColor *lineBeforeColor UI_APPEARANCE_SELECTOR;
/// 线宽度，默认2
@property (nonatomic, assign) IBInspectable CGFloat lineWidth UI_APPEARANCE_SELECTOR;
/// 节点背景颜色，默认whiteColor
@property (nonatomic, strong) IBInspectable UIColor *nodeBackgroundColor UI_APPEARANCE_SELECTOR;
/// 节点颜色，默认0x4181FE
@property (nonatomic, strong) IBInspectable UIColor *nodeColor UI_APPEARANCE_SELECTOR;
/// 节点边框宽度，默认2，如果nodeBorderWidth == 0那么节点就是实心圆
@property (nonatomic, assign) IBInspectable CGFloat nodeBorderWidth UI_APPEARANCE_SELECTOR;
/// 节点前面距离，默认10
@property (nonatomic, assign) IBInspectable CGFloat nodeAfter;
/// 时间轴样式，默认HLTimelineViewTypeNone
@property (nonatomic, assign) IBInspectable NSInteger type;
/// 节点前面距离线间隙，默认0
@property (nonatomic, assign) IBInspectable CGFloat nodeAfterSpace UI_APPEARANCE_SELECTOR;
/// 节点后面距离线间隙，默认0
@property (nonatomic, assign) IBInspectable CGFloat nodeBeforeSpace UI_APPEARANCE_SELECTOR;
/// 节点自定义图片，默认nil
@property (nonatomic, strong) IBInspectable UIImage *nodeImage UI_APPEARANCE_SELECTOR;
@end
