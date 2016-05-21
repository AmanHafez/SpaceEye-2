//
//  Satallite.h
//  SpaceEye
//
//  Created by Omar Almasri on 05/21/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Satallite : NSManagedObject

@property (nonatomic, strong)  NSNumber  * SatalliteID;
@property (nonatomic, strong) NSString * Diameter;
@property (nonatomic, strong) NSString * Mass;
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) NSString * SolarSystem;
@property (nonatomic, strong) NSString * Temp;
@property (nonatomic, strong) NSString * Type;
@property (nonatomic, strong) NSNumber * PlanetID;

@end
