//
//  Model.h
//  TodoList
//
//  Created by Mani Sedighi on 31/01/2018.
//  Copyright © 2018 Mani Sedighi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (nonatomic) NSMutableArray *todos;
@property (nonatomic) NSMutableArray *importantTodos;
@property (nonatomic) NSMutableArray *didDos;
@property (nonatomic) NSString *notes;
@property (nonatomic) NSString *noteDetails;
@property (nonatomic) NSDictionary *myDictionary;

-(void) addNote:(NSString*)note;
-(void)addImportantNote:(NSString*)note;

-(NSUInteger)todosAmount;
-(NSUInteger)didAmount;
-(NSUInteger)importantAmount;

-(void)removeNotes:(int)index;
-(void)removeImportant:(int)index;


@end
