//
//  JupiterView.m
//  SpaceEye
//
//  Created by mac on 2/24/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import "JupiterView.h"

@implementation JupiterView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        FLAnimatedImageView *Jupiter = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height/2)];
        Jupiter.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"jupiter.gif" ofType:nil]];
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:fileURL]];
        
        Jupiter.animatedImage = image;
        [self addSubview:Jupiter];
         
    }
    return self;
}


@end
