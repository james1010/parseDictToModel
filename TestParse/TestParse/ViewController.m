//
//  ViewController.m
//  TestParse
//
//  Created by James on 16/11/28.
//  Copyright © 2016年 James. All rights reserved.
//

#import "ViewController.h"
#import "PersonModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *_personDict = @{@"name":@"james",@"age":@"32",@"clothes":@[@"clothes1",@"clothes2",@"clothes3"]};
    
    PersonModel *aModel = [[PersonModel alloc] init];
    aModel.name = [aModel parseStringFromDict:_personDict forKey:@"name"];
    
    
    
    NSLog(@"Dict%@ \n aModel name:%@",_personDict,aModel.name);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
