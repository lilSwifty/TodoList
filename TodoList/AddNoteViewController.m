//
//  AddNoteViewController.m
//  TodoList
//
//  Created by Mani Sedighi on 30/01/2018.
//  Copyright © 2018 Mani Sedighi. All rights reserved.
//

#import "AddNoteViewController.h"
#import "TodoListTableViewController.h"
#import "Model.h"

@interface AddNoteViewController ()

@property (weak, nonatomic) IBOutlet UITextField *noteHead;
@property (weak, nonatomic) IBOutlet UITextView *noteText;
@property (weak, nonatomic) IBOutlet UISwitch *important;


@end

@implementation AddNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PRESSED ADD NEW");
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:
                                   self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard {
    [self.noteHead resignFirstResponder];
    [self.noteText resignFirstResponder];
}

- (IBAction)addNote:(id)sender {
    
    if (self.important.isOn) {
        [self.model addImportantNote:self.noteHead.text: self.noteText.text ];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self.model addNote:self.noteHead.text: self.noteText.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
    NSLog(@"PRESSED SAVE");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //
    
    //Dispose of any resources that can be recreated.
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
