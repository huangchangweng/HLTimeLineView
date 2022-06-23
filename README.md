# HLTimeLineView
iOS时间轴，xib、storyboard中也能愉快的使用

##### 支持使用CocoaPods引入, Podfile文件中添加:

``` objc
pod 'HLTimeLineView', '1.0.0'
```

# Demonstration

![image](https://github.com/huangchangweng/HLTimeLineView/blob/main/ScreenShot.png)
![image](https://github.com/huangchangweng/HLTimeLineView/blob/main/1655965224909.jpg)

可设置属性:<p>

``` objc
/// 线颜色，默认0xDCE7FF
@property (nonatomic, strong) IBInspectable UIColor *lineColor;
/// 线宽度，默认2
@property (nonatomic, assign) IBInspectable CGFloat lineWidth;
/// 节点背景颜色，默认whiteColor
@property (nonatomic, strong) IBInspectable UIColor *nodeBackgroundColor;
/// 节点颜色，默认0x4181FE
@property (nonatomic, strong) IBInspectable UIColor *nodeColor;
/// 节点边框宽度，默认2，如果nodeBorderWidth == 0那么节点就是实心圆
@property (nonatomic, assign) IBInspectable CGFloat nodeBorderWidth;
/// 节点顶部距离，默认10
@property (nonatomic, assign) IBInspectable CGFloat nodeTop;
/// 时间轴样式，默认HLTimelineViewTypeNone
@property (nonatomic, assign) IBInspectable NSInteger type;
```

# Requirements

iOS 9.0 +, Xcode 7.0 +

# Version

* 1.0.0 :

  完成HLTimeLineView基础搭建

# License

HLTimeLineView is available under the MIT license. See the LICENSE file for more info.
