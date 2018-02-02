//
//  Model.m
//  TodoList
//
//  Created by Mani Sedighi on 31/01/2018.
//  Copyright © 2018 Mani Sedighi. All rights reserved.
//

#import "Model.h"

@implementation Model

-(instancetype)init {
    self = [super init];
    
    if(self){
        
       
            self.todos = [[[NSUserDefaults standardUserDefaults] objectForKey:@"TODO's"]mutableCopy];
            self.details = [[[NSUserDefaults standardUserDefaults] objectForKey:@"TODO-DETAIL"]mutableCopy];
            self.importantArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"IMPORTANT"]mutableCopy];
            self.importantDetails = [[[NSUserDefaults standardUserDefaults] objectForKey:@"IMPORTANT-DETAIL"]mutableCopy];
            self.didDos = [[[NSUserDefaults standardUserDefaults] objectForKey:@"DONE"]mutableCopy];
            self.doneDetails = [[[NSUserDefaults standardUserDefaults] objectForKey:@"DONE-DETAIL"]mutableCopy];
        
        
        self.todos = [[[NSUserDefaults standardUserDefaults] objectForKey:@"TODO's"]mutableCopy];
        
        //self.importantArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"viktig"]mutableCopy];
        
        
        if (self.todos == nil) {
            self.todos = [[NSMutableArray alloc]init];
            
            
        }
    }
    
    if(self){
        
        self.details = [[[NSUserDefaults standardUserDefaults] objectForKey:@"TODO-DETAIL"]mutableCopy];
        
        if (self.details == nil) {
            self.details = [[NSMutableArray alloc]init];
        }
        
    }
    
    if (self) {
        self.importantArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"IMPORTANT"]mutableCopy];
        
        if (self.importantArray == nil) {
            self.importantArray = [[NSMutableArray alloc]init];
        }
    }
    
    if (self) {
        self.importantDetails = [[[NSUserDefaults standardUserDefaults] objectForKey:@"IMPORTANT-DETAIL"]mutableCopy];
        
        if (self.importantDetails == nil) {
            self.importantDetails = [[NSMutableArray alloc]init];
        }
    }
    
    if (self) {
        self.didDos = [[[NSUserDefaults standardUserDefaults] objectForKey:@"DONE"]mutableCopy];
        
        if (self.didDos == nil) {
            self.didDos = [[NSMutableArray alloc]init];
        }
    }
    
    if (self) {
        self.doneDetails = [[[NSUserDefaults standardUserDefaults] objectForKey:@"DONE-DETAILS"]mutableCopy];
        
        if (self.doneDetails == nil) {
            self.doneDetails = [[NSMutableArray alloc]init];
        }
    }
    
    
    return self;
}



/*
-(instancetype)initShit{
    self = [super init];
    
    if (self) {
        self.importantTodos = [[[NSUserDefaults standardUserDefaults] objectForKey:@"viktigLista"]mutableCopy];
        
        if (self.importantTodos == nil) {
            self.importantTodos =@[].mutableCopy;
        }
    }
    
    return self;
}
*/
 
/*
 -(void) addNote:(NSString*)note{
     [self.todos addObject: note];
     [self saveNotes];
 }
*/

-(void) addNote:(NSString *)note :(NSString *)detail{
    [self.todos addObject:note];
    [self.details addObject:detail];
    [[NSUserDefaults standardUserDefaults] setObject:self.todos forKey:@"TODO's"];
    [[NSUserDefaults standardUserDefaults] setObject:self.details forKey:@"TODO-DETAIL"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    /*
    [[NSUserDefaults standardUserDefaults] setObject:self.importantArray forKey:@"IMPORTANT"];
    [[NSUserDefaults standardUserDefaults] setObject:self.importantDetails forKey:@"IMPORTANT-DETAIL"];
    [[NSUserDefaults standardUserDefaults] setObject:self.didDos forKey:@"DONE"];
    [[NSUserDefaults standardUserDefaults] setObject:self.doneDetails forKey:@"DONE-DETAIL"];
    
    */
}

-(void)addImportantNote:(NSString*)note : (NSString *)detail{
    [self.importantArray addObject:note];
    [self.importantDetails addObject:detail];
    [[NSUserDefaults standardUserDefaults] setObject:self.importantArray forKey:@"IMPORTANT"];
    [[NSUserDefaults standardUserDefaults] setObject:self.importantDetails forKey:@"IMPORTANT-DETAIL"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/*
-(void)moveNote:(NSString *)note:(NSString *) detail{
    
}
*/

-(void)deleteNote:(NSInteger)index{
    [self.todos removeObjectAtIndex:(int)index];
    [self.details removeObjectAtIndex:(int)index];
    [[NSUserDefaults standardUserDefaults] setObject:self.todos forKey:@"TODO's"];
    [[NSUserDefaults standardUserDefaults] setObject:self.details forKey:@"TODO-DETAIL"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(void)removeImportant:(int)index{
    [self.importantArray removeObjectAtIndex:(int)index];
    [self.importantDetails removeObjectAtIndex:(int)index];
    [[NSUserDefaults standardUserDefaults] setObject:self.importantArray forKey:@"IMPORTANT"];
    [[NSUserDefaults standardUserDefaults] setObject:self.importantDetails forKey:@"IMPORTANT-DETAIL"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



-(void)removeDone:(int)index{
    [self.didDos removeObjectAtIndex:index];
    [self.doneDetails removeObjectAtIndex:(int)index];
    [[NSUserDefaults standardUserDefaults] setObject:self.didDos forKey:@"DONE"];
    [[NSUserDefaults standardUserDefaults] setObject:self.doneDetails forKey:@"DONE-DETAIL"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


-(void)saveTables{
    [[NSUserDefaults standardUserDefaults] setObject:self.todos forKey:@"TODO's"];
    [[NSUserDefaults standardUserDefaults] setObject:self.details forKey:@"TODO-DETAIL"];
    [[NSUserDefaults standardUserDefaults] setObject:self.importantArray forKey:@"IMPORTANT"];
    [[NSUserDefaults standardUserDefaults] setObject:self.importantDetails forKey:@"IMPORTANT-DETAIL"];
    [[NSUserDefaults standardUserDefaults] setObject:self.didDos forKey:@"DONE"];
    [[NSUserDefaults standardUserDefaults] setObject:self.doneDetails forKey:@"DONE-DETAIL"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}



/*
-(void) addDetails:(NSString *)detail{
    [self.details addObject: detail];
    [self saveNotes];
}
*/






/*
-(void) importantDetails:(NSString *)important{
    [self.importantArray addObject:important];
    [self saveNotes];
}


-(void) isNotImportant{
    [self.importantArray addObject:@"inte viktig"];
    [self saveNotes];
}
*/



-(NSUInteger)todosAmount{
    return self.todos.count;
}



-(NSUInteger)importantAmount{
    return self.importantArray.count;
}



-(NSUInteger)didAmount{
    return self.didDos.count;
}




/*
-(void)removeNotes:(int)index{
    [self.todos removeObjectAtIndex:index];
    [self saveNotes];
}
*/









@end
