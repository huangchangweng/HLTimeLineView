//
//  HLTimeLineView.m
//  HLTimeLineView
//
//  Created by JJB_iOS on 2022/6/23.
//

#define HLUIColorFromHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "HLTimeLineView.h"

@implementation HLTimeLineView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self build];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self build];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self drawWithFrame:self.bounds];
}

#pragma mark - Private Method

- (void)build
{
    _lineColor = HLUIColorFromHEX(0xDCE7FF);
    _lineWidth = 2;
    _nodeBackgroundColor = [UIColor whiteColor];
    _nodeColor = HLUIColorFromHEX(0x4181FE);
    _nodeBorderWidth = 2;
    _nodeTop = 10;
}

- (void)drawWithFrame:(CGRect)frame
{
    // 绘制上、下面线
    CGFloat lineX = (CGRectGetWidth(frame) - _lineWidth) / 2.0f;
    CGRect topLineRect = CGRectMake(lineX, 0, _lineWidth, _nodeTop);
    CGFloat bottomLineY = _nodeTop + CGRectGetWidth(frame);
    CGRect bottomLineRect = CGRectMake(lineX, bottomLineY, _lineWidth, CGRectGetHeight(frame) - bottomLineY);
    switch (_type) {
        case HLTimelineViewTypeBottom:
            [self drawLineFrame:bottomLineRect];
            break;
        case HLTimelineViewTypeTop:
            [self drawLineFrame:topLineRect];
            break;
        case HLTimelineViewTypeAll:
            [self drawLineFrame:topLineRect];
            [self drawLineFrame:bottomLineRect];
            break;
    }
    
    // 绘制节点
    if (_nodeBorderWidth > 0) {
        // 空心圆
        CGFloat nodeSize = CGRectGetWidth(frame) - _nodeBorderWidth;
        CGRect nodeRect = CGRectMake(_nodeBorderWidth / 2.0f, _nodeTop + _nodeBorderWidth / 2.0f, nodeSize, nodeSize);
        UIBezierPath *nodeBezierPath = [UIBezierPath bezierPathWithOvalInRect:nodeRect];
        nodeBezierPath.lineWidth = _nodeBorderWidth;
        [_nodeColor setStroke];
        [nodeBezierPath stroke];
    } else {
        // 实心圆
        CGRect nodeRect = CGRectMake(0, _nodeTop, CGRectGetWidth(frame), CGRectGetWidth(frame));
        UIBezierPath *nodeBezierPath = [UIBezierPath bezierPathWithOvalInRect:nodeRect];
        [_nodeColor setFill];
        [nodeBezierPath fill];
    }
    
}

// 绘制线
- (void)drawLineFrame:(CGRect)frame
{
    UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRect:frame];
    [_lineColor setFill];
    [rectanglePath fill];
}

#pragma mark - Stter

- (void)setLineColor:(UIColor *)lineColor {
    if (![_lineColor isEqual:lineColor]) {
        _lineColor = lineColor;
        [self setNeedsDisplay];
    }
}

- (void)setLineWidth:(CGFloat)lineWidth {
    if (_lineWidth != lineWidth) {
        _lineWidth = lineWidth;
        [self setNeedsDisplay];
    }
}

- (void)setNodeBackgroundColor:(UIColor *)nodeBackgroundColor {
    if (![_nodeBackgroundColor isEqual:nodeBackgroundColor]) {
        _nodeBackgroundColor = nodeBackgroundColor;
        [self setNeedsDisplay];
    }
}

- (void)setNodeColor:(UIColor *)nodeColor {
    if (![_nodeColor isEqual:nodeColor]) {
        _nodeColor = nodeColor;
        [self setNeedsDisplay];
    }
}

- (void)setNodeBorderWidth:(CGFloat)nodeBorderWidth {
    if (_nodeBorderWidth != nodeBorderWidth) {
        _nodeBorderWidth = nodeBorderWidth;
        [self setNeedsDisplay];
    }
}

- (void)setNodeTop:(CGFloat)nodeTop {
    if (_nodeTop != nodeTop) {
        _nodeTop = nodeTop;
        [self setNeedsDisplay];
    }
}

- (void)setType:(NSInteger)type {
    if (_type != type) {
        _type = type;
    }
    [self setNeedsDisplay];
}

@end
