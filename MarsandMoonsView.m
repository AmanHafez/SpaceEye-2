//
//  MarsView.m
//  SpaceEye
//
//  Created by mac on 2/17/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import "MarsandMoonsView.h"

@implementation MarsView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        
        FLAnimatedImageView *mars = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height/2)];
        mars.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"mars.gif" ofType:nil]];
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:fileURL]];
        
        mars.animatedImage = image;
        [self addSubview:mars];
        
        //Moons of mars: Phobos and Deimos
        
        CABasicAnimation* rotationAnimation;
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * 1/7.66 * 1 ];//multiply more to add speed
        rotationAnimation.duration = 0.25;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount =  HUGE_VALF;
        
        UIButton *Phobos = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/5, self.frame.size.height/5)];
        UIImage *PhobosImage = [UIImage imageNamed:@"Phobos.jpg"];
        [Phobos setImage:PhobosImage forState:UIControlStateNormal];
        Phobos.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addSubview:Phobos];
        
        Phobos.layer.anchorPoint = CGPointMake(0.5, (self.frame.size.height/2)/(self.frame.size.height/6));
        [Phobos.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
        
        
       // CABasicAnimation* rotationAnimation1;
     //   rotationAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
       // rotationAnimation1.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * 1/30.35 * 1 ];//multiply more to add speed
     //   rotationAnimation1.duration = 0.25;
    //    rotationAnimation1.cumulative = YES;
   //     rotationAnimation1.repeatCount =  HUGE_VALF;
        
 //       UIButton *Deimos = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height/2)];
   //     UIImage *deimosImage = [UIImage imageNamed:@"Deimos.jpg"];
     //   [Deimos setImage:deimosImage forState:UIControlStateNormal];
       // Deimos.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
 //       [self addSubview:Deimos];
        
   //     Deimos.layer.anchorPoint = CGPointMake(0.5, (self.frame.size.height)/(self.frame.size.height/4));
     //   [Deimos.layer addAnimation:rotationAnimation1 forKey:@"rotationAnimation1"];
    }
    return self;
}


@end
