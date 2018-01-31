//
//  AddNoteViewController.m
//  TodoList
//
//  Created by Mani Sedighi on 30/01/2018.
//  Copyright © 2018 Mani Sedighi. All rights reserved.
//

#import "AddNoteViewController.h"
#import "TodoListTableViewController.h"

@interface AddNoteViewController ()

@property (weak, nonatomic) IBOutlet UITextField *noteHead;
@property (weak, nonatomic) IBOutlet UITextView *noteText;

@end

@implementation AddNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)addNote:(id)sender {
    
    [self.notes addObject: self.noteHead.text];
    [self.noteDetails addObject:self.noteText.text];
    [self.navigationController popViewControllerAnimated:YES];
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
