//
//  NeptuneView.m
//  SpaceEye
//
//  Created by mac on 2/24/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import "NeptuneView.h"

@implementation NeptuneView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        
        FLAnimatedImageView *Neptune = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height/2)];
        Neptune.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"neptune.gif" ofType:nil]];
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:fileURL]];
        
        Neptune.animatedImage = image;
        [self addSubview:Neptune];
        
       
        
    }
    return self;
}



@end
