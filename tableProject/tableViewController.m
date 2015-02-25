//
//  tableViewControllerTableViewController.m
//  tableProject
//
//  Created by João Vitor dos Santos Schimmelpfeng on 25/02/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import "tableViewController.h"
#import "AppTableViewCell.h"
#import "showView.h"

@interface tableViewController ()

@end

@implementation tableViewController
@synthesize apps,imgs,desc;

BOOL isEditing;

- (void)viewDidLoad
{
 [super viewDidLoad];
    apps = [[NSMutableArray alloc] init];
    [apps addObject:[NSString stringWithFormat:@"Plants Vs Zombies"]];
    [apps addObject:[NSString stringWithFormat:@"Facebook"]];
    [apps addObject:[NSString stringWithFormat:@"Whatsapp"]];
    
    imgs = [[NSMutableArray alloc] init];
    [imgs addObject:[UIImage imageNamed:@"plantslogo.png"]];
    [imgs addObject:[UIImage imageNamed:@"facebooklogo.jpg"]];
    [imgs addObject:[UIImage imageNamed:@"whatslogo.png"]];
    
    desc = [[NSMutableArray alloc] init];
    [desc addObject:[NSString stringWithFormat:@"Diversao"]];
    [desc addObject:[NSString stringWithFormat:@"Social"]];
    [desc addObject:[NSString stringWithFormat:@"Social"]];
    isEditing = false;
    
}

/*
- (void)loadView
{
    CGRect titleRect = CGRectMake(0, 0, 300, 40);
    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
    tableTitle.textColor = [UIColor blueColor];
    tableTitle.backgroundColor = [self.tableView backgroundColor];
    tableTitle.opaque = YES;
    tableTitle.font = [UIFont boldSystemFontOfSize:18];
    tableTitle.text = [NSString stringWithFormat:@"Teste"];
    self.tableView.tableHeaderView = tableTitle;
    [self.tableView reloadData];
}
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return apps.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppTableViewCell *cell = (AppTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"celula" forIndexPath:indexPath];
    
    cell.label1.text = [apps objectAtIndex:[indexPath row]];
    cell.label2.text = [desc objectAtIndex:[indexPath row]];
    [cell.imageView setImage:[imgs objectAtIndex:[indexPath row]]];

    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSMutableArray *aux = apps;
    [apps setObject:[apps objectAtIndex:[toIndexPath row]] atIndexedSubscript:[fromIndexPath row]];
    [apps setObject:[aux objectAtIndex:[fromIndexPath row]] atIndexedSubscript:[toIndexPath row]];
    
    aux = desc;
    [desc setObject:[desc objectAtIndex:[fromIndexPath row]] atIndexedSubscript:[toIndexPath row]];
    [desc setObject:[aux objectAtIndex:[toIndexPath row]] atIndexedSubscript:[fromIndexPath row]];
    
    aux = imgs;
    [imgs setObject:[imgs objectAtIndex:[fromIndexPath row]] atIndexedSubscript:[toIndexPath row]];
    [imgs setObject:[aux objectAtIndex:[toIndexPath row]] atIndexedSubscript:[fromIndexPath row]];
    
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
 {
     
     if([[segue identifier] isEqualToString:@"passagem"])
     {
         NSIndexPath *num = [self.tableView indexPathForSelectedRow];
         showView *sView = segue.destinationViewController;
         NSMutableArray *vetorNovo = [[NSMutableArray alloc] init];
         [vetorNovo addObject:[apps objectAtIndex:[num row]]];
         [vetorNovo addObject:[desc objectAtIndex:[num row]]];
         [vetorNovo addObject:[imgs objectAtIndex:[num row]]];
         sView.vetorDados = vetorNovo;
     }
     
         
     
    
 }

- (IBAction)editar:(id)sender
{
    if(isEditing)
    {
     [self.tableView setEditing:NO animated:NO];
        isEditing = false;
    }
    else
    {
     [self.tableView setEditing:YES animated:YES];
        isEditing = true;
    }
}
@end
