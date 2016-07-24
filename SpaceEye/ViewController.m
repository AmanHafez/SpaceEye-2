//  ViewController.m
//  SpaceEye
//
//  Created by mac on 12/26/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize PauseResumeIsACTIVE = PauseResumeIsACTIVE;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //setting a space-like background to create a space theme
    
    self.view.backgroundColor = [UIColor blackColor];
    
    FLAnimatedImageView *background = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"stars2-2.gif" ofType:nil]];
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:[NSData dataWithContentsOfURL:fileURL]];
    
    background.animatedImage = image;
    [self.view addSubview:background];
    
    //creating the planets and other objects as buttons
    sun = [[SunView alloc] initWithFrame:CGRectMake(0, 0, 25, 22)];
    sun.center = CGPointMake(self.view.frame.size.width/2-10, self.view.frame.size.height/2+5);
    [sun addTarget:self action:@selector(SunPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sun];
    
    
    //Mercurry's Orbit:
    mercurry = [[MercurryView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    mercurry.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:mercurry];
    [self PlanetRotation:mercurry speed:0.241];
    mercurry.layer.anchorPoint = CGPointMake(4,1);
    
    //Venus's Orbit:a
    venus = [[VenusView alloc] initWithFrame:CGRectMake(0, 0, 20, 12)];
    venus.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:venus];
    [self PlanetRotation:venus speed:0.615];
    venus.layer.anchorPoint = CGPointMake(0.5, -5);// changing the posisition and distance of the planets in orbit around the sun
    
    
    //Earth's Orbit:
    earth = [[EarthandMoonView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    earth.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:earth];
    [self PlanetRotation:earth speed:1];
    earth.layer.anchorPoint = CGPointMake(7, -0.5);// changing the posisition and distance of the planets in orbit around the sun
    
    
    //Mars's Orbit:
    mars = [[MarsView alloc] initWithFrame:CGRectMake(0, 0, 15, 10)];
    mars.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:mars];
    [self PlanetRotation:mars speed:1.880];
    mars.layer.anchorPoint = CGPointMake(2.5, -13); // changing the posisition and distance of the planets in orbit around the sun
    
    
    //Jupiter's Orbit:
    jupiter = [[JupiterView alloc] initWithFrame:CGRectMake(0, 0, 15, 10)];
    jupiter.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:jupiter];
    [self PlanetRotation:jupiter speed:1.867];
    jupiter.layer.anchorPoint = CGPointMake(4, -19);// changing the posisition and distance of the planets in orbit around the sun
    
    
    //Saturn's Orbit:
    saturn = [[SaturnView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    saturn.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:saturn];
    [self PlanetRotation:saturn speed:29.461];
    saturn.layer.anchorPoint = CGPointMake(-20, -3);// changing the posisition and distance of the planets in orbit around the sun
    
    
    //Uranus Orbit:
    uranus = [[UranusView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    uranus.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:uranus];
    [self PlanetRotation:uranus speed:84.030];
    uranus.layer.anchorPoint = CGPointMake(24,15);// changing the posisition and distance of the planets in orbit around the sun
    
    //Neptune's Orbit:
    neptune = [[NeptuneView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    neptune.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:neptune];
    [self PlanetRotation:neptune speed:164.815];
    neptune.layer.anchorPoint = CGPointMake(-5, 26);// changing the posisition and distance of the planets in orbit around the sun
    
    
    //Pluto's Orbit:
    pluto = [[PlutoView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    pluto.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview: pluto];
    pluto.layer.anchorPoint = CGPointMake(0.5, 28);// changing the posisition and distance of the planets in orbit around the sun
    
    
    //PAUSE-RESUME BUTTON!!
    PauseRes = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [PauseRes addTarget:self action:@selector(PauseResumeAnimation) forControlEvents:UIControlEventTouchUpInside];
    [PauseRes setTitle:@"Pause/Resume" forState:UIControlStateNormal];
    PauseRes.frame = CGRectMake(480, 5.5, 150, 20);
    [self.view addSubview:PauseRes];

    
    //PREDICT BUTTON!!
    Predict = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [Predict addTarget:self action:@selector(PredictPosition:) forControlEvents:UIControlEventTouchUpInside];
    [Predict setTitle:@"PREDICT" forState:UIControlStateNormal];
    Predict.frame = CGRectMake(630, 5.5, 100, 20);
    [self.view addSubview:Predict];
    
    }

-(void)SunPressed:(UIButton *)Sender
{
        NSLog(@"this is the sun");
    
}


-(void)PlanetRotation:(UIView*)planet speed:(float)period
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: -M_PI * 2.0 /* full rotation*/ * 1/period * 1 ];//multiply more to add speed
    rotationAnimation.duration = 15;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount =  HUGE_VALF;
    //rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [planet.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

-(void)PauseResumeAnimation
{
    if (PauseResumeIsACTIVE)
    {
        self.PauseResumeIsACTIVE = !self.PauseResumeIsACTIVE;
        
        CALayer *clayer = self.view.layer;
        CFTimeInterval pausedTime = [clayer convertTime:CACurrentMediaTime() fromLayer:nil];
        clayer.speed = 0.0;
        clayer.timeOffset = pausedTime;
    }
    else
    {
        self.PauseResumeIsACTIVE = !self.PauseResumeIsACTIVE;
        CALayer *clayer = self.view.layer;
        if(clayer.timeOffset != 0) {
            CFTimeInterval paused_time = [clayer timeOffset];
            clayer.speed = 1.0f;
            clayer.timeOffset = 0.0f;
            clayer.beginTime = 0.0f;
            CFTimeInterval time_since_pause = [clayer convertTime:CACurrentMediaTime() fromLayer:nil] - paused_time;
            clayer.beginTime = time_since_pause;
        }

    }
   
}

-(void)PredictPosition:(id)sender
{
    
    picker = [[DateTimePicker alloc] initWithFrame:CGRectMake(0, 0, 325, 250)];
    [picker addTargetForDoneButton:self action:@selector(donePressed)];
    [picker addTargetForCancelButton:self action:@selector(cancelPressed)];
    [self.view addSubview:picker];
    picker.hidden = NO;
    [picker setMode:UIDatePickerModeDate];
    [picker.picker addTarget:self action:@selector(datePickerDateChanged:) forControlEvents:UIControlEventValueChanged];
    
}

-(void) datePickerDateChanged:(id)sender
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM/dd/yyyy";
    NSString *dateString = [dateFormatter stringFromDate:[(UIDatePicker*)sender date]];
    NSDate *datepicked = [dateFormatter dateFromString:dateString];
    
    NSTimeInterval date = [datepicked timeIntervalSince1970];
    long long millisFromJ2000 = (long long)  date * 1000.0;
    long long blah =1000 *60*60*24*365.25 *100;
    float CenturiesFromj2000 = (float)millisFromJ2000 / (float) blah;
    NSLog(@"%.8f", CenturiesFromj2000);
    
    //Keplerian elements of each planet, with respect to the mean ecliptic and equinox of j2000; Valid for the time-interval 3000 BC -- 3000 AD
    
    //semi-major axis
    float a0[] = { 0.38709843, 0.72332102,  1.00000018, 1.52371243, 5.20248019, 9.54149883, 19.18916464 , 30.06952752, 39.48686035};
    float adot[] = {0.00000000, -0.00000026, -0.00000003, 0.00000097, -0.00002864, -0.00003065,-0.000020455, 0.00006447 , 0.00449751}; //time derivative
    float a[9];
    
    
    //eccentricity of planet orbit
    float e0[] = { 0.20563661, 0.00676399, 0.01673163, 0.09336511, 0.04853590, 0.05550825, 0.04685740, 0.00895439, 0.24885238 };
    float edot[] = {0.00002123, -0.00005107, -0.00003661, 0.00009149, 0.00018026, -0.00032044, -0.00001550, 0.00000818, 0.00006016}; //time derivative
    float e[9];
    
    
    //inclination
    float I0[] = { 7.00559432, 3.39777545, -0.00054346, 1.85181869, 1.29861416, 2.49424102, 0.77298127, 1.77005520, 17.14104260};
    float Idot[] = {-0.00590158, 0.00043494, -0.01337178,  -0.00724757,  -0.00322699,  0.00451969, -0.00180155, 0.00022400, 0.00000501}; //time derivative
    float I[9];
    
    float L0[] = {252.25166724, 181.97970850, 100.46691572, -4.56813164, 34.33479152, 50.07571329, 314.20276625, 304.22289287, 238.96535011};
    float Ldot[] ={149472.67486623, 58517.81560260, 35999.37306329, 19140.29934243, 3034.90371757, 1222.11494724, 428.4951259, 218.46515314, 145.18042903}; //time derivative
    float L[9];
    
    
    //Longtitude of periapsis
    float LongP0[] = {77.45771895, 131.76755713, 102.93005885, -23.91744784, 14.27495244, 92.86136063, 172.43404441, 46.68158724, 224.09702598, -0.00968827};
    float LongPdot[] = {0.15940013, 0.05679648, 0.31795260, 0.45223625, 0.18199196, 0.54179478, 0.09266985, 0.01009938, -0.00968827};//time derivative
    float LongP[9];
    
    
    //Longitude of ascending node
    float Longn0[] = {48.33961819, 76.67261496, -5.11260389, 49.71320984, 100.29282654, 113.63998702, 73.96250215, 131.78635853, 110.30167986};
    float Longndot[] = {-0.12214182, -0.27274174, -0.24123856, -0.26852431, 0.13024619, 73.96250215, 131.78635853, 110.30167986}; //time derivative
    float Longn[9];
    
    //Additional terms which must be added to the computation of M for Jupiter through Pluto,
    float b0[] = {-0.00012452, 0.00025899, 0.00058331, -0.00041348, -0.01262724};
    float c0[] = { 0.06064060, -0.13434469, -0.97731848, 0.68346318};
    float s0[] = {-0.35635438, 0.87320147, 0.17689245, -0.10162547};
    float f0[] = {38.35125000,38.35125000, 7.67025000, 7.67025000};
    float b[9];
    float c[8];
    float s[8];
    float f[8];
    
    
    for(int i = 4; i<9; i++)
    {
        
        b[i] = b[i] + b0[i-4];
        
    }
    
    for (int i = 4; i<8; i++)
    {
        c[i] = c[i] + c0[i-4];
        s[i] = s[i] + s0[i-4];
        f[i] = f[i] + f0[i-4];
        
    }
    
    //Calcutlation of orbital parameters
    for (int i = 0; i < 9; i++)
    {
        
        a[i] = a0[i] + adot[i] * CenturiesFromj2000;
        e[i] = e0[i] + edot[i] * CenturiesFromj2000;
        I[i] = I0[i] + Idot[i] * CenturiesFromj2000;
        L[i] = L0[i] + Ldot[i] * CenturiesFromj2000;
        LongP[i] = LongP0[i] + LongPdot[i] * CenturiesFromj2000;
        Longn[i] = Longn0[i] + Longndot[i] * CenturiesFromj2000;
        
        if (i >= 4)
        {
            L[i] = L[i] + b[i] * pow(CenturiesFromj2000, 2);
        }
        
    }
    
    //Continuing the calculation of L
    for (int i = 0; i < 8; i++)
    {
        if (i>=4)
        {
            L[i] = L[i] + c[i] * cosf(f[i] * CenturiesFromj2000) + s[i] * sinf(f[i] * CenturiesFromj2000);
        }
    }
    
    //Getting M (mean anomaly)
    float M[9];
    float w[9];
    
    for (int i = 0; i<9; i++)
    {
        M[i] = L[i] - LongP[i];
        w[i] = LongP[i] = Longn[i];
    }
    
    /*        Now we get to calculate the Equation M = E - e * sin(E)   (with M known)
     
     We can solve this numerically using Newton's method. Solving the Kepler equation is equivalent to finding the roots of f(E)= E − e * sin(E) − M.
     Given Ei => f(E) = E - e * sin(E) - M
     
     E(i+1) = Ei - f(Ei)/ f'(Ei)
     f'(E) = 1 - e * cos(E) dE
     
     Since the nonlinear part e* sin(E) is very small, we can start with the estimate E = M
     
     */
    
    float E[9];  //E Eccentric anomaly
    float dE[9]; //derivative of E
    
    //Computing E (main equation)
    for (int i = 0; i <9; i++)
    {
        E[i] = M[i];
        
        while(E[i] == M[i])
        {
            dE[i] = (E[i] - e[i] * sinf(E[i]) - M[i])/(1 - e[i] *cosf(E[i]));
            E[i] -= dE[i];
            
            if(fabs(dE[i]) < 1e-6)
                break;
        }
        
    }
    
    // P and Q form a 2d coordinate system in the plane of the orbit
    float P[9];
    float Q[9];
    
    for (int i = 0; i<9 ; i++)
    {
        P[i] = a[i] * cosf(E[i] - e[i]);
        Q[i] = a[i] * sinf(E[i]) * sqrtf(1 - powf(e[i], 2.0));
    }
    
    
    self.PlanetName = [NSArray arrayWithObjects: @"mercurry", @"venus", @"earth", @"mars", @"jupiter", @"saturn", @"uranus", @"neptune", @"pluto", nil];
    
    self.x = [NSArray arrayWithObjects:[NSNumber numberWithFloat:P[0]],[NSNumber numberWithFloat:P[1]],[NSNumber numberWithFloat:P[2]],[NSNumber numberWithFloat:P[3]],[NSNumber numberWithFloat:P[4]],[NSNumber numberWithFloat:P[5]],[NSNumber numberWithFloat:P[6]],[NSNumber numberWithFloat:P[7]],[NSNumber numberWithFloat:P[8]], nil];
    
    self.y = [NSArray arrayWithObjects:[NSNumber numberWithFloat:Q[0]],[NSNumber numberWithFloat:Q[1]],[NSNumber numberWithFloat:Q[2]],[NSNumber numberWithFloat:Q[3]],[NSNumber numberWithFloat:Q[4]],[NSNumber numberWithFloat:Q[5]],[NSNumber numberWithFloat:Q[6]],[NSNumber numberWithFloat:Q[7]],[NSNumber numberWithFloat:Q[8]], nil];
    
    self.XPosition = [NSDictionary dictionaryWithObjects:self.x forKeys:self.PlanetName];
    self.YPosition = [NSDictionary dictionaryWithObjects:self.y forKeys:self.PlanetName];
    
    
}

-(void)donePressed {
    picker.hidden = YES;
}

-(void)cancelPressed {
    picker.hidden = YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
