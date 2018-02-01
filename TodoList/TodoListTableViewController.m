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


@end

@implementation TodoListTableViewController



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


- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[Model alloc] init];
    
    
       
    
    // init-metoden för Model kan ladda från NSUserDefaults
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"i listan finns: %@", self.model.todos);
    self.model.todos = [[[NSUserDefaults standardUserDefaults] objectForKey:@"minLista"]mutableCopy];
    self.model.details = [[[NSUserDefaults standardUserDefaults] objectForKey:@"minaDetaljer"]mutableCopy];
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
    
    
    
    //return [self.model todosAmount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodosCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    //cell.textLabel.text = self.model.todos[indexPath.row];
    
    
    if (indexPath.section == 0) {
        cell.textLabel.text = self.model.importantArray[indexPath.row];
    }else if(indexPath.section == 1){
        cell.textLabel.text = self.model.todos[indexPath.row];
    }else{
        cell.textLabel.text = self.model.didDos[indexPath.row];
    }
    
   

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/
 

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.model deleteNote:(int)indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}




// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    if (fromIndexPath != toIndexPath) {
        <#statements#>
    }
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"read"]) {
        UITableViewCell *cell = sender;
        DetailViewController *detail = [segue destinationViewController];
        detail.title = cell.textLabel.text;
        int index = (int)[self.tableView indexPathForCell:cell].row;
        detail.detailArray = self.model.details;
        detail.detailIndex = index;
        NSLog(@"list contains %@", self.model.details);
    }else if([segue.identifier isEqualToString:@"write"]){
        AddNoteViewController *add = [segue destinationViewController];
        add.model = self.model;
     }
    
    /*
     if ([segue.identifier isEqualToString:@"read"]) {
     UIViewController *personalNote = [segue destinationViewController];
     UITableViewCell *cell = sender;
     personalNote.title = cell.textLabel.text;
     }else if([segue.identifier isEqualToString:@"write"]){
     AddNoteViewController *add = [segue destinationViewController];
     add.model = self.model;
     }
    */
  
    
    
    
}


@end
