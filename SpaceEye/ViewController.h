//
//  ViewController.h
//  SpaceEye
//
//  Created by mac on 12/26/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SunView.h"
#import "MercurryView.h"
#import "VenusView.h"
#import "EarthandMoonView.h"
#import "MarsandMoonsView.h"
#import "JupiterView.h"
#import "SaturnView.h"
#import "UranusView.h"
#import "NeptuneView.h"
#import "PlutoView.h"
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"
#import "SeondViewController.h"

@interface ViewController : UIViewController

{
    UIButton *sun;
    UIView *mercurry;
    UIView *venus;
    UIView *earth;
    UIView *mars;
    UIView *jupiter;
    UIView *saturn;
    UIView *uranus;
    UIView *neptune;
    UIView *pluto;
    UIView *comets;
    UIButton *PauseRes;
    UIButton *Predict;
        
}

@property (nonatomic) BOOL PauseResumeIsACTIVE;

@end

