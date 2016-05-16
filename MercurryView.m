//
//  MercurryView.m
//  SpaceEye
//
//  Created by mac on 2/24/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import "MercurryView.h"

@implementation MercurryView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        FLAnimatedImageView *mercurry = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height/2)];
        mercurry.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"mercury.gif" ofType:nil]];
        FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:fileURL]];
        
        mercurry.animatedImage = image;
        [self addSubview:mercurry];
        
    }
    return self;
}



@end
