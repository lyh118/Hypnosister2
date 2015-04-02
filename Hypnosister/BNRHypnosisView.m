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
    
    [path2 stroke];
    // ====== #2.동심원 그리기 E ======
}

@end
