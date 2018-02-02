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
@property (nonatomic) NSMutableArray *details;
@property (nonatomic) NSMutableArray *importantArray;
@property (nonatomic) NSMutableArray *importantDetails;
@property (nonatomic) NSMutableArray *didDos;
@property (nonatomic) NSMutableArray *doneDetails;


@property (nonatomic) NSString *notes;
@property (nonatomic) NSString *noteDetails;

-(void) addNote:(NSString *)note :(NSString *)detail;
-(void)deleteNote:(NSInteger)index;
-(void)saveTables;

-(void)addImportantNote:(NSString*)note : (NSString *)detail;

-(NSUInteger)todosAmount;
-(NSUInteger)didAmount;
-(NSUInteger)importantAmount;

-(void)removeImportant:(int)index;
-(void)removeDone:(int)index;


@end
