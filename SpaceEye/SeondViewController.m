//
//  SeondViewController.m
//  SpaceEye
//
//  Created by mac on 6/20/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import "SeondViewController.h"

@interface SeondViewController ()

@end

@implementation SeondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    //creating the planets and other objects as buttons
    sun = [[SunView alloc] initWithFrame:CGRectMake(0, 0, 200, 170)];
    sun.center = CGPointMake(89, 200);
    [self.view addSubview:sun];
    
    
    //Mercurry's Orbit:
    mercurry = [[MercurryView alloc] initWithFrame:CGRectMake(0, 0, 34, 30)];
    mercurry.center = CGPointMake(189, 230);
    [self.view addSubview:mercurry];
    
    //Venus's Orbit:
    venus = [[VenusView alloc] initWithFrame:CGRectMake(0, 0, 48, 41)];
    venus.center = CGPointMake(215, 230);
    [self.view addSubview:venus];
    
    
    //Earth's Orbit:
    earth = [[EarthandMoonView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    earth.center = CGPointMake(243, 230);
    [self.view addSubview:earth];
    
    
    //Mars's Orbit:
    mars = [[MarsView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    mars.center = CGPointMake(279, 230);
    [self.view addSubview:mars];
    
    
    //Jupiter's Orbit:
    jupiter = [[JupiterView alloc] initWithFrame:CGRectMake(0, 0, 150, 120)];
    jupiter.center = CGPointMake(350, 230);
    [self.view addSubview:jupiter];
    
    
    //Saturn's Orbit:
    saturn = [[SaturnView alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
    saturn.center = CGPointMake(450, 230);
    [self.view addSubview:saturn];
    
    
    //Uranus Orbit:
    uranus = [[UranusView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
    uranus.center = CGPointMake(540, 230);
    [self.view addSubview:uranus];
    
    //Neptune's Orbit:
    neptune = [[NeptuneView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    neptune.center = CGPointMake(600, 230);
    [self.view addSubview:neptune];
    
    
    //Pluto's Orbit:
    pluto = [[PlutoView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    pluto.center = CGPointMake(660, 230);
    [pluto setTitle:@"PLUTO" forState:UIControlStateNormal];
    [self.view addSubview: pluto];
    
    
    //Resume BUTTON!!
    Resume = [UIButton buttonWithType:UIButtonTypeCustom];
    [Resume addTarget:self action:@selector(resumeAnimation) forControlEvents:UIControlEventTouchUpInside];
    [Resume setTitle:@"RESUME" forState:UIControlStateNormal];
    Resume.frame = CGRectMake(550, 5.5, 100, 20);
    [self.view addSubview:Resume];
    
    
    //Differentiating between each planet when being pressed
    sun.tag = 1;
    mercurry.tag = 2;
    venus.tag = 3;
    earth.tag = 4;
    mars.tag = 5;
    jupiter.tag = 6;
    saturn.tag = 7;
    uranus.tag = 8;
    neptune.tag = 9;
    pluto.tag = 10;
    
    [sun addTarget:self action:@selector(objectPressed:) forControlEvents:UIControlEventTouchUpInside];
    [mercurry addTarget:self action:@selector(objectPressed:) forControlEvents:UIControlEventTouchUpInside];
    [venus addTarget:self action:@selector(objectPressed:) forControlEvents:UIControlEventTouchUpInside];
    [earth addTarget:self action:@selector(objectPressed:) forControlEvents:UIControlEventTouchUpInside];
    [mars addTarget:self action:@selector(objectPressed:) forControlEvents:UIControlEventTouchUpInside];
    [jupiter addTarget:self action:@selector(objectPressed:) forControlEvents:UIControlEventTouchUpInside];
    [saturn addTarget:self action:@selector(objectPressed:) forControlEvents:UIControlEventTouchUpInside];
    [uranus addTarget:self action:@selector(objectPressed:) forControlEvents:UIControlEventTouchUpInside];
    [neptune addTarget:self action:@selector(objectPressed:) forControlEvents:UIControlEventTouchUpInside];
    [pluto addTarget:self action:@selector(objectPressed:) forControlEvents:UIControlEventTouchUpInside];

}

-(void)objectPressed:(UIButton *)Sender
{
    if (Sender.tag == 1)
    {
        NSLog(@"this is the sun");
    }
    
    else if (Sender.tag == 2)
    {
        NSLog(@"this is the mercury");
    }
    
    else if (Sender.tag == 3)
    {
        NSLog(@"this is the venus");
    }
    
    else if (Sender.tag == 4)
    {
        NSLog(@"this is the earth");
    }
    
    else if (Sender.tag == 5)
    {
        NSLog(@"this is the mars");
    }
    
    else if (Sender.tag == 6)
    {
        NSLog(@"this is the jupiter");
    }
    
    else if (Sender.tag == 7)
    {
        NSLog(@"this is the saturn");
    }
    
    else if (Sender.tag == 8)
    {
        NSLog(@"this is the uranus");
    }
    else if (Sender.tag == 9)
    {
        NSLog(@"this is the neptune");
    }
    else if (Sender.tag == 10)
    {
        NSLog(@"this is the pluto");
    }
    
    
}

- (void)resumeAnimation
{
    
    CALayer *clayer = self.view.layer;
    
    CFTimeInterval paused_time = [clayer timeOffset];
    clayer.speed = 1.0f;
    clayer.timeOffset = 0.0f;
    clayer.beginTime = 0.0f;
    CFTimeInterval time_since_pause = [clayer convertTime:CACurrentMediaTime() fromLayer:nil] - paused_time;
    clayer.beginTime = time_since_pause;
    
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
