# parseDictToModel
parse dict to model(NSString,or int\NSarray\BOOL...)
hel

## Demo Code:
NSDictionary *_personDict = @{@"name":@"james",@"age":@"32",@"clothes":@[@"clothes1",@"clothes2",@"clothes3"]};
    
    PersonModel *aModel = [[PersonModel alloc] init];
    aModel.name = [aModel parseStringFromDict:_personDict forKey:@"name"];
    
    
    
    NSLog(@"Dict%@ \n aModel name:%@",_personDict,aModel.name);
