//
//  MoonView.m
//  SpaceEye
//
//  Created by mac on 2/21/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import "MoonView.h"

@implementation MoonView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {

        FLAnimatedImageView *moon = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height/2)];
       
        moon.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"moon.gif" ofType:nil]];
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:fileURL]];
        
        moon.animatedImage = image;
        [self addSubview:moon];

    }
    return self;
 
}
@end
