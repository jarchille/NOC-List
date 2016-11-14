//
//  ViewController.m
//  NOC-List
//
//  Created by Jonathan Archille on 11/10/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "AgentDetailViewController.h"
#import "AgentTableViewController.h"
#import "AgentData.h"



@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *agents;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadNOClist];
}

- (void)loadNOClist
{
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"NOC" ofType:@"json"];
    NSArray *agentsJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filepath] options:NSJSONReadingAllowFragments error:nil];
    self.agents = [[NSMutableArray alloc] init];
    
    for (NSDictionary *aDictionary in agentsJSON)
    {
        AgentData *anAgent = [AgentData AgentDataWithDictionary:aDictionary];
        [self.agents addObject:anAgent];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.agents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NocBox" forIndexPath:indexPath];
    
    // Configure the cell...
    
    AgentData *anAgent = self.agents[indexPath.row];
    cell.textLabel.text = anAgent.coverName;
    cell.detailTextLabel.text = @"";
    
    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender

{
    if ([[segue identifier] isEqualToString:@"AgentDetailSegue"])
    {
        AgentDetailViewController *detailVC = [segue destinationViewController];
        UITableViewCell *selectedCell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
        AgentData *selectedAgent = self.agents[indexPath.row];
        
        detailVC.anAgent = selectedAgent;
    }
}

@end
