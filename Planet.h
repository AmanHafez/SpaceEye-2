//
//  Planet.h
//  SpaceEye
//
//  Created by Omar Almasri on 05/21/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface Planet : NSManagedObject

@property (nonatomic, strong) NSNumber * PlanetID;
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) NSString * Diameter;
@property (nonatomic, strong) NSString * Distance;
@property (nonatomic, strong) NSString * GeneralInfo;
@property (nonatomic, strong) NSString * Gravity;
@property (nonatomic, strong) NSString * Mass;
@property (nonatomic, strong) NSNumber * NumOfMoon;
@property (nonatomic, strong) NSString * Period;
@property (nonatomic, strong) NSString * Speed;
@property (nonatomic, strong) NSString * Temp;
@property (nonatomic, strong) NSString * Type;
@property (nonatomic, strong) NSNumber * StarID;
@property (nonatomic, strong) NSArray * SataliteArray;

@end
