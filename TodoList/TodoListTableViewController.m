//
//  TodoListTableViewController.m
//  TodoList
//
//  Created by Mani Sedighi on 30/01/2018.
//  Copyright © 2018 Mani Sedighi. All rights reserved.
//

#import "TodoListTableViewController.h"
#import "AddNoteViewController.h"
#import "Model.h"
#import "DetailViewController.h"

@interface TodoListTableViewController ()


@property (weak, nonatomic) IBOutlet UIBarButtonItem *addNote;
@property (nonatomic) Model *model;
//@property (nonatomic) NSMutableArray *selectedArray;


@end

@implementation TodoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[Model alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if(section == 0){
        return @"Important";
    }else if(section == 1){
        return @"To-Do";
    }else{
        return @"Done";
    }
    
    //return @"To-Do";
}



-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"TODO LISTAN: %@", self.model.todos);
    NSLog(@"VIKTIG LISTAN: %@", self.model.importantArray);
    NSLog(@"DETALJ-LISTAN: %@", self.model.details);
    NSLog(@"VIKTIG-DETALJ-LISTAN: %@", self.model.importantDetails);
    NSLog(@"DONE-DETALJ-LISTAN: %@", self.model.didDos);
    NSLog(@"DONE-DETALJ-LISTAN: %@", self.model.doneDetails);

    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [self.model importantAmount];
    }else if(section == 1){
        return [self.model todosAmount];
    }else{
        return [self.model didAmount];
    }
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodosCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (indexPath.section == 0) {
        cell.textLabel.text = self.model.importantArray[indexPath.row];
        [cell setBackgroundColor: [UIColor redColor]];
        
    }else if(indexPath.section == 1){
        cell.textLabel.text = self.model.todos[indexPath.row];
        [cell setBackgroundColor: [UIColor yellowColor]];
    }else{
        cell.textLabel.text = self.model.didDos[indexPath.row];
        [cell setBackgroundColor: [UIColor greenColor]];
    }

    return cell;
}


- (IBAction)editBUtton:(id)sender {
    if ([self isEditing]) {
        [self setEditing:NO animated:YES];
        [self.model saveTables];
        [self.tableView reloadData];
    } else {
        [self setEditing:YES animated:YES];
    }
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

 

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (indexPath.section == 0) {
            [self.model removeImportant:(int)indexPath.row];
        }else if (indexPath.section == 1){
            [self.model deleteNote:(int)indexPath.row];
        }else if (indexPath.section == 2){
            [self.model removeDone:(int)indexPath.row];
        }
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
   
    
    NSMutableArray *moveTextFrom;
    NSMutableArray *moveDetailFrom;
    NSMutableArray *moveTextTo;
    NSMutableArray *moveDetailTo;
    
    if (fromIndexPath.section == 0) {
        moveTextFrom = self.model.importantArray;
        moveDetailFrom = self.model.importantDetails;
    }else if (fromIndexPath.section == 1){
        moveTextFrom = self.model.todos;
        moveDetailFrom = self.model.details;
    }else if(fromIndexPath.section == 2){
        moveTextFrom = self.model.didDos;
        moveDetailFrom = self.model.doneDetails;
    }
    
    if (toIndexPath.section == 0) {
        moveTextTo = self.model.importantArray;
        moveDetailTo = self.model.importantDetails;
    }else if (toIndexPath.section == 1){
        moveTextTo = self.model.todos;
        moveDetailTo = self.model.details;
    }else if (toIndexPath.section == 2){
        moveTextTo = self.model.didDos;
        moveDetailTo = self.model.doneDetails;
    }
    
    
    NSString *stringToMove = moveTextFrom[fromIndexPath.row];
    NSString *detailToMove = moveDetailFrom[fromIndexPath.row];
    
    
    
    [moveTextFrom removeObjectAtIndex:fromIndexPath.row];
    [moveTextTo insertObject:stringToMove atIndex:toIndexPath.row];
    [moveDetailFrom removeObjectAtIndex:fromIndexPath.row];
    [moveDetailTo insertObject:detailToMove atIndex:toIndexPath.row];
    
    [self.model saveTables];
    
    
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

/*
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if( sourceIndexPath.section != proposedDestinationIndexPath.section )
    {
        return sourceIndexPath;
    }
    else
    {
        return proposedDestinationIndexPath;
    }
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    if ([segue.identifier isEqualToString:@"read"]) {
        UITableViewCell *cell = sender;
        
        NSIndexPath *path = [self.tableView indexPathForCell:cell];
        
        DetailViewController *detail = [segue destinationViewController];
        detail.title = cell.textLabel.text;
        //int index = (int)[self.tableView indexPathForCell:cell].row;
        
        if(path.section == 0) {
        detail.detailArray = self.model.importantArray;
        }else if(path.section == 1){
            detail.detailArray = self.model.details;
        }else if(path.section == 2){
            detail.detailArray = self.model.doneDetails;
        }
        detail.detailIndex = path.row;
        NSLog(@"DETAIL CONTAINS %@", self.model.details);
    } else if([segue.identifier isEqualToString:@"write"]){
        AddNoteViewController *add = [segue destinationViewController];
        add.model = self.model;
     }
    
    
}

@end
