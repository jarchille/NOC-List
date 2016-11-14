//
//  AgentDetailViewController.m
//  NOC-List
//
//  Created by Jonathan Archille on 11/13/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "AgentDetailViewController.h"

@interface AgentDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *coverNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *realNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *accessLevelLabel;


@end

@implementation AgentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *fullAgentName = [self.anAgent.realName componentsSeparatedByString:@" "];
    self.title = [NSString stringWithFormat:@"Agent %@", [fullAgentName objectAtIndex:1]];
    self.coverNameLabel.text = self.anAgent.coverName;
    self.realNameLabel.text = [NSString stringWithFormat:@"Real Name: %@", self.anAgent.realName];
    self.accessLevelLabel.text = [NSString stringWithFormat:@"Access Level %ld", (long)self.anAgent.accessLevel];
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
