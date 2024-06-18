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
    _nodeAfter = 10;
    _nodeAfterSpace = 0;
    _nodeBeforeSpace = 0;
}

- (void)drawWithFrame:(CGRect)frame
{
    if (_direction == 0) {
        [self verticalDraw:frame];
    } else {
        [self horizontalDraw:frame];
    }
}

- (void)verticalDraw:(CGRect)frame
{
    // 绘制上/下面线
    CGFloat size = CGRectGetWidth(frame);
    CGFloat lineX = (size - _lineWidth) / 2.0f;
    CGRect topLineRect = CGRectMake(lineX, 0, _lineWidth, _nodeAfter - _nodeAfterSpace);
    CGFloat bottomLineY = _nodeAfter + _nodeAfterSpace + size + _nodeBeforeSpace;
    CGRect bottomLineRect = CGRectMake(lineX, bottomLineY, _lineWidth, CGRectGetHeight(frame) - bottomLineY);
    [self drawLine:frame size:size afterLineRect:topLineRect beforeLineRect:bottomLineRect];
    
    // 图片节点
    if (_nodeImage) {
        [self drawNodeImageSize:size];
    }
    // 普通节点
    else {
        if (_nodeBorderWidth > 0) {
            // 空心圆
            CGFloat nodeSize = size - _nodeBorderWidth;
            CGRect nodeRect = CGRectMake(_nodeBorderWidth / 2.0f, _nodeAfter + _nodeBorderWidth / 2.0f, nodeSize, nodeSize);
            UIBezierPath *nodeBezierPath = [UIBezierPath bezierPathWithOvalInRect:nodeRect];
            nodeBezierPath.lineWidth = _nodeBorderWidth;
            [_nodeColor setStroke];
            [nodeBezierPath stroke];
        } else {
            // 实心圆
            CGRect nodeRect = CGRectMake(0, _nodeAfter, CGRectGetWidth(frame), CGRectGetWidth(frame));
            UIBezierPath *nodeBezierPath = [UIBezierPath bezierPathWithOvalInRect:nodeRect];
            [_nodeColor setFill];
            [nodeBezierPath fill];
        }
    }
}

- (void)horizontalDraw:(CGRect)frame
{
    // 绘制左/右面线
    CGFloat size = CGRectGetHeight(frame);
    CGFloat lineY = (CGRectGetHeight(frame) - _lineWidth) / 2.0f;
    CGRect leftLineRect = CGRectMake(0, lineY, _nodeAfter - _nodeAfterSpace, _lineWidth);
    CGFloat rightLineX = _nodeAfter + _nodeAfterSpace + size + _nodeBeforeSpace;
    CGRect rightLineRect = CGRectMake(rightLineX, lineY, CGRectGetWidth(frame) - rightLineX, _lineWidth);
    [self drawLine:frame size:size afterLineRect:leftLineRect beforeLineRect:rightLineRect];
    
    // 图片节点
    if (_nodeImage) {
        [self drawNodeImageSize:size];
    }
    // 普通节点
    else {
        if (_nodeBorderWidth > 0) {
            // 空心圆
            CGFloat nodeSize = size - _nodeBorderWidth;
            CGRect nodeRect = CGRectMake(_nodeAfter + _nodeBorderWidth / 2.0f, _nodeBorderWidth / 2.0f, nodeSize, nodeSize);
            UIBezierPath *nodeBezierPath = [UIBezierPath bezierPathWithOvalInRect:nodeRect];
            nodeBezierPath.lineWidth = _nodeBorderWidth;
            [_nodeColor setStroke];
            [nodeBezierPath stroke];
        } else {
            // 实心圆
            CGRect nodeRect = CGRectMake(_nodeAfter, 0, CGRectGetHeight(frame), CGRectGetHeight(frame));
            UIBezierPath *nodeBezierPath = [UIBezierPath bezierPathWithOvalInRect:nodeRect];
            [_nodeColor setFill];
            [nodeBezierPath fill];
        }
    }
}

- (void)drawLine:(CGRect)frame
            size:(CGFloat)size
   afterLineRect:(CGRect)afterLineRect
  beforeLineRect:(CGRect)beforeLineRect
{
    switch (_type) {
        case HLTimelineViewTypeAfter:
            [self drawLineFrame:afterLineRect color:_lineAfterColor ? : _lineColor];
            break;
        case HLTimelineViewTypeBefore:
            [self drawLineFrame:beforeLineRect color:_lineBeforeColor ? : _lineColor];
            break;
        case HLTimelineViewTypeAll:
            [self drawLineFrame:afterLineRect color:_lineAfterColor ? : _lineColor];
            [self drawLineFrame:beforeLineRect color:_lineBeforeColor ? : _lineColor];
            break;
    }
}

// 绘制图片
- (void)drawNodeImageSize:(CGFloat)size
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGRect imageRect = CGRectMake(_direction == 0 ? 0 : _nodeAfter, _direction == 0 ? _nodeAfter : 0, size, size);
    [_nodeImage drawInRect:imageRect];
    CGContextRestoreGState(context);
}

// 绘制线
- (void)drawLineFrame:(CGRect)frame color:(UIColor *)color
{
    UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRect:frame];
    [color setFill];
    [rectanglePath fill];
}

#pragma mark - Stter

- (void)setDirection:(NSInteger)direction {
    if (_direction != direction) {
        _direction = direction;
    }
    [self setNeedsDisplay];
}

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

- (void)setLineAfterColor:(UIColor *)lineAfterColor {
    if (![_lineAfterColor isEqual:lineAfterColor]) {
        _lineAfterColor = lineAfterColor;
        [self setNeedsDisplay];
    }
}

- (void)setLineBeforeColor:(UIColor *)lineBeforeColor {
    if (![_lineBeforeColor isEqual:lineBeforeColor]) {
        _lineBeforeColor = lineBeforeColor;
        [self setNeedsDisplay];
    }
}

- (void)setNodeBorderWidth:(CGFloat)nodeBorderWidth {
    if (_nodeBorderWidth != nodeBorderWidth) {
        _nodeBorderWidth = nodeBorderWidth;
        [self setNeedsDisplay];
    }
}

- (void)setnodeAfter:(CGFloat)nodeAfter {
    if (_nodeAfter != nodeAfter) {
        _nodeAfter = nodeAfter;
        [self setNeedsDisplay];
    }
}

- (void)setType:(NSInteger)type {
    if (_type != type) {
        _type = type;
    }
    [self setNeedsDisplay];
}

- (void)setNodeAfterSpace:(CGFloat)nodeAfterSpace {
    if (_nodeAfterSpace != nodeAfterSpace) {
        _nodeAfterSpace = nodeAfterSpace;
    }
    [self setNeedsDisplay];
}

- (void)setNodeBeforeSpace:(CGFloat)nodeBeforeSpace {
    if (_nodeBeforeSpace != nodeBeforeSpace) {
        _nodeBeforeSpace = nodeBeforeSpace;
    }
    [self setNeedsDisplay];
}

- (void)setNodeImage:(UIImage *)nodeImage {
    if (_nodeImage != nodeImage) {
        _nodeImage = nodeImage;
    }
    [self setNeedsDisplay];
}

@end
