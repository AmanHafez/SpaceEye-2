//
//  UranusView.m
//  SpaceEye
//
//  Created by mac on 2/24/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import "UranusView.h"

@implementation UranusView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        FLAnimatedImageView *uranus = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height/2)];
        uranus.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        
        NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Uranus.gif" ofType:nil]];
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:fileURL]];
        
        uranus.animatedImage = image;
        [self addSubview:uranus];

        
    }
    return self;
}



@end
