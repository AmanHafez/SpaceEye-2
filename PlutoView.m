//
//  PlutoView.m
//  SpaceEye
//
//  Created by mac on 2/24/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import "PlutoView.h"

@implementation PlutoView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        CABasicAnimation* rotationAnimation233;
        rotationAnimation233 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation233.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * 1 * 1 ];//multiply more to add speed
        rotationAnimation233.duration = 3;
        rotationAnimation233.cumulative = YES;
        rotationAnimation233.repeatCount =  HUGE_VALF;
        
        
        UIButton *Pluto = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height/2)];
        UIImage *PlutoImage = [UIImage imageNamed:@"pluto.jpg"];
        [Pluto setImage: PlutoImage forState:UIControlStateNormal];
        Pluto.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addSubview:Pluto];
        
        Pluto.layer.anchorPoint = CGPointMake(0.5, 0.5);
        [Pluto.layer addAnimation:rotationAnimation233 forKey:@"rotationAnimation233"];
        
        
    }
    return self;
}



@end
