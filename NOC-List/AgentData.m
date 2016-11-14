//
//  AgentData.m
//  NOC-List
//
//  Created by Jonathan Archille on 11/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "AgentData.h"

@implementation AgentData

+ (AgentData *) AgentDataWithDictionary: (NSDictionary *)AgentDataDictionary
{
    AgentData *anAgent = nil;
    if (AgentDataDictionary)
    {
        anAgent = [[AgentData alloc] init];
        anAgent.coverName = AgentDataDictionary[@"coverName"];
        anAgent.realName = AgentDataDictionary[@"realName"];
        anAgent.accessLevel = [AgentDataDictionary[@"accessLevel"] integerValue];
    }
    
    return anAgent;
}

@end
