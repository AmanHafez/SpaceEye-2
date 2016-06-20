//
//  EarthandMoonView.m
//  SpaceEye
//
//  Created by mac on 2/24/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import "EarthandMoonView.h"

@implementation EarthandMoonView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];

        FLAnimatedImageView *Earth = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height/2)];
        Earth.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Rotating_earth.gif" ofType:nil]];
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:fileURL]];
        
        Earth.animatedImage = image;
        [self addSubview:Earth];
        
      
        //The Moon
        
        CABasicAnimation* rotationAnimation;
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * 0.0748 * 1 ];//multiply more to add speed
        rotationAnimation.duration = 0.25;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount =  HUGE_VALF;
        
        MoonView *moon = [[MoonView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
        moon.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addSubview:moon];
        
        moon.layer.anchorPoint = CGPointMake(0.5, (self.frame.size.height/2)/(self.frame.size.height/6));
        [moon.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    }
    return self;
}


@end
