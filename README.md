# HLTimeLineView
iOS时间轴，xib、storyboard中也能愉快的使用



✅1.自定义上下线颜色宽度

✅2.自定义节点颜色、实心、空心

✅3.自定义节点与线的距离

✅4.自定义节点为图片

##### 支持使用CocoaPods引入, Podfile文件中添加:

``` objc
pod 'HLTimeLineView', '1.0.3'
```

# Demonstration

![image](https://github.com/huangchangweng/HLTimeLineView/blob/main/ScreenShot.png)
![image](https://github.com/huangchangweng/HLTimeLineView/blob/main/1655965224909.jpg)

可设置属性:<p>

``` objc
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
```

# GlobalSetting

如果您项目中多个地方使用到该组件，您可以全局设置样式，例在`AppDelegate`添加

``` objc
[HLTimeLineView appearance].lineColor = [UIColor redColor];
```

> 注意：`代码` > `appearance` > `interface builder`，所以appearance设置的会覆盖在xib或storyboard中设置的属性，当然`代码`会覆盖`appearance`设置

# Requirements

iOS 9.0 +, Xcode 7.0 +

# Version
* 1.0.3 :

  支持横向时间轴样式

* 1.0.2 :

  自定义节点与线的距离
  
  自定义节点为图片
  
* 1.0.1 :

  添加全局设置HLTimeLineView样式功能
  
* 1.0.0 :

  完成HLTimeLineView基础搭建

# License

HLTimeLineView is available under the MIT license. See the LICENSE file for more info.
