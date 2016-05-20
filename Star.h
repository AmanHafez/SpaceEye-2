//
//  Star.h
//  SpaceEye
//
//  Created by Omar Almasri on 05/21/16.
//  Copyright © 2016 mac. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Star : NSManagedObject

@property (nonatomic, strong) NSNumber * StarID;
@property (nonatomic,strong) NSString * Diameter;
@property (nonatomic,strong) NSString * GeneralInfo;
@property (nonatomic,strong) NSString * Name;
@property (nonatomic, strong) NSString * Temp;
@property (nonatomic, strong) NSArray * Planets;
@end
