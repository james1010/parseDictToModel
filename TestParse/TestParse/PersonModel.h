//
//  PersonModel.h
//  TestParse
//
//  Created by James on 16/11/28.
//  Copyright © 2016年 James. All rights reserved.
//

#import "ParseDictToModel.h"

@interface PersonModel : ParseDictToModel
@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSUInteger age;
@property(nonatomic,strong)NSArray *clothes;
@end
