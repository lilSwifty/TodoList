//
//  DetailViewController.h
//  TodoList
//
//  Created by Mani Sedighi on 30/01/2018.
//  Copyright © 2018 Mani Sedighi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (nonatomic) NSMutableArray *detailArray;
@property (nonatomic) NSMutableArray *importantDetail;
@property (nonatomic) NSMutableArray *doneDetail;
@property (nonatomic) int detailIndex;

@end
