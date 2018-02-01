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
        
        self.todos = [[[NSUserDefaults standardUserDefaults] objectForKey:@"minLista"]mutableCopy];
        
        //self.importantArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"viktig"]mutableCopy];
        
        
        if (self.todos == nil) {
            self.todos = [[NSMutableArray alloc]init];
            
            
        }
    }
    
    if(self){
        
        self.details = [[[NSUserDefaults standardUserDefaults] objectForKey:@"minaDetaljer"]mutableCopy];
        
        if (self.details == nil) {
            self.details = [[NSMutableArray alloc]init];
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
    [[NSUserDefaults standardUserDefaults] setObject:self.todos forKey:@"minLista"];
    [[NSUserDefaults standardUserDefaults] setObject:self.details forKey:@"minaDetaljer"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(void)deleteNote:(NSInteger)index{
    [self.todos removeObjectAtIndex:(int)index];
    [self.details removeObjectAtIndex:(int)index];
    [[NSUserDefaults standardUserDefaults] setObject:self.todos forKey:@"minLista"];
    [[NSUserDefaults standardUserDefaults] setObject:self.details forKey:@"minaDetaljer"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

/*
-(void) addDetails:(NSString *)detail{
    [self.details addObject: detail];
    [self saveNotes];
}
*/

/*
-(void)addImportantNote:(NSString*)note{
    [self.importantArray addObject:note];
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

/*
-(void)removeImportant:(int)index{
    [self.importantArray removeObjectAtIndex:index];
    [self saveNotes];
}
*/

/*
-(void)removeDone:(int)index{
    [self.didDos removeObjectAtIndex:index];
    [self saveNotes];
}
*/





@end
