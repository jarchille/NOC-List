//
//  AgentData.h
//  NOC-List
//
//  Created by Jonathan Archille on 11/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AgentData : NSObject

@property (nonatomic) NSString *coverName;
@property (nonatomic) NSString *realName;
@property (assign) NSInteger accessLevel;

+ (AgentData *)AgentDataWithDictionary: (NSDictionary *)AgentDataDictionary;

@end
