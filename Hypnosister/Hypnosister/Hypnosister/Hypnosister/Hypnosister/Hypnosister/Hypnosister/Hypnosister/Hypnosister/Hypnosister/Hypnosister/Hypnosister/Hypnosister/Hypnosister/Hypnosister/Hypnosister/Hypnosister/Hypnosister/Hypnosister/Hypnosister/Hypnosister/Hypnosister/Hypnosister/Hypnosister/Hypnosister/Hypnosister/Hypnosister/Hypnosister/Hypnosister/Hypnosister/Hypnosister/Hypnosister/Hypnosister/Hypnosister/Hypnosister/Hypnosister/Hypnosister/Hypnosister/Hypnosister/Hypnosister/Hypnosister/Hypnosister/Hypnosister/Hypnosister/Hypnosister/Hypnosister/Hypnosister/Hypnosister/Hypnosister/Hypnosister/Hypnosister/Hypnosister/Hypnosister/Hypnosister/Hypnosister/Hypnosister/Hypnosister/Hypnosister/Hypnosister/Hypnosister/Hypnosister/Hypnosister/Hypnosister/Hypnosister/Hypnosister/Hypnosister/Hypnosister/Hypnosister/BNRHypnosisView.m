//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by N3962 on 2015. 4. 2..
//  Copyright (c) 2015년 BigNerdRanch. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

// 배경색 투명으로 만들기 (안되요..ㅠㅠ)
/*
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:<#frame#>];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
*/

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    // 영역의 중심을 계산한다
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2;
    center.y = bounds.origin.y + bounds.size.height /2;
    
    // ====== #1.원 그리기 S ======
    // 뷰에 들어갈 수 있는 것 중 가장 큰 크기
    float radius = (MIN(bounds.size.width, bounds.size.height) / 2);
    
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:center
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI * 2
                 clockwise:YES];
    
    path.lineWidth = 10;
    
    [[UIColor lightGrayColor] setStroke];
    
    //[path stroke];
    // ====== #1.원 그리기 E ======
    
    
    // ====== #2.동심원 그리기 S ======
    // 뷰를 에워싸는 가장 큰 크지
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2;
    
    UIBezierPath *path2 = [[UIBezierPath alloc] init];
    
    for (float currenntRadius=maxRadius; currenntRadius>0; currenntRadius-=20) {
        
        // 그리는 지점을 이동시킨다
        [path2 moveToPoint:CGPointMake(center.x+currenntRadius, center.y)];
        
        [path2 addArcWithCenter:center
                         radius:currenntRadius
                     startAngle:0.0
                       endAngle:M_PI * 2
                      clockwise:YES];
    }
    
    path2.lineWidth = 10;
    
    //[path2 stroke];
    // ====== #2.동심원 그리기 E ======
    
    
    // ====== #동메달 과제: 이미지 그리기 S ======
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    //[logoImage drawInRect:bounds];

    // 과제1.이미지 size 조정하기
    // 과제2.이미지 관리하는 방법
    // 과제3.이미지 commit 하기
    
    // ====== #동메달 과제: 이미지 그리기 E ======
    
    
    // ====== #금메달 과제: 그림자와 그라디언트 S ======
    
    //CGContextSaveGState(logoImage);
    
    // 그림자
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    // 어떻게 이렇게 되죠??
    /*
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
    [logoImage drawInRect:bounds];
    
    CGContextRestoreGState(currentContext);
    */
    
    // 출처:http://iphone.hardking.com/326
    /*
    UIGraphicsBeginImageContext(CGSizeMake(logoImage.size.width + 6, logoImage.size.height + 6));
    CGContextSetShadow(UIGraphicsGetCurrentContext(),CGSizeMake(3.0f, -3.0f),3.0f);
    [logoImage drawInRect:CGRectMake(0, 0, logoImage.size.width, logoImage.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [newImage drawInRect:bounds];
    */
    // 그라디언트
    
    CGContextSaveGState(currentContext);
    [path stroke];
    [path addClip];
    
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0,
                            1.0, 1.0, 0.0, 1.0};
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    
    CGPoint startPoint = {0.0, 0.0};
    CGPoint endPoint = {1000.0, 1000.0};
    
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    CGContextRestoreGState(currentContext);
    
    // 하트그리기 - CGContextRef
    // 출처:http://devhkh.tistory.com/12
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 160, 60);
    CGContextAddCurveToPoint(context,
                             250, 10,
                             220, 150,
                             160, 160);
    
    CGContextAddCurveToPoint(context,
                             90, 150,
                             60, 10,
                             160, 60);
    
    CGColorRef color = [UIColor redColor].CGColor;
    CGContextSetFillColorWithColor(context, color);
    CGContextClosePath(context);
    
    //CGContextDrawPath(context, kCGPathFillStroke);
    
    // ====== #금메달 과제: 그림자와 그라디언트 E ======
    
}
@end
