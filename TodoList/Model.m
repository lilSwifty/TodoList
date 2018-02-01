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
        self.details = [[[NSUserDefaults standardUserDefaults] objectForKey:@"minaDetaljer"]mutableCopy];
        
        
        if (self.todos == nil) {
            self.todos = @[].mutableCopy;
            self.details = @[].mutableCopy;
            
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
 

 -(void) addNote:(NSString*)note{
     [self.todos addObject: note];
     [self saveNotes];
 }

-(void) addDetails:(NSString *)detail{
    [self.details addObject: detail];
    [self saveNotes];
}
/*
-(void)addImportantNote:(NSString*)note{
    [self.importantTodos addObject:note];
    [self saveNotes];
}
*/


-(NSUInteger)todosAmount{
    return self.todos.count;
}


/*
-(NSUInteger)importantAmount{
    return self.importantTodos.count;
}
*/

/*
-(NSUInteger)didAmount{
    return self.didDos.count;
}
*/

-(void)saveNotes{
    [[NSUserDefaults standardUserDefaults] setObject:self.todos forKey:@"minLista"];
    [[NSUserDefaults standardUserDefaults] setObject:self.details forKey:@"minaDetaljer"];
    //[[NSUserDefaults standardUserDefaults] setObject:self.importantTodos forKey:@"viktigLista"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)removeNotes:(int)index{
    [self.todos removeObjectAtIndex:index];
    [self saveNotes];
}

/*
-(void)removeImportant:(int)index{
    [self.importantTodos removeObjectAtIndex:index];
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
