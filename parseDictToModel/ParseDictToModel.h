//
//  ParseDictToModel.h
//
//  Created by James on 14/11/11.
//  Copyright (c) 2014年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

 


@interface ParseDictToModel : NSObject
@property (nonatomic,assign) CodeType code;
@property (nonatomic,strong) NSString *msg;

- (id)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)aCoder;


-(BOOL)parseData:(NSDictionary*)netData;

-(NSDictionary *)parseDictionaryFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString;
-(NSArray *)parseArrayFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString;

-(NSMutableString *)parseMutableStringFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString;
-(NSString *)parseStringFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString;
-(NSString *)parseStringFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString withArrayInterval:(NSString*)intervalStr;
-(NSUInteger)parseUIntegerFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString;
-(NSInteger)parseIntegerFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString;
-(float)parseFloatFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString;
-(int64_t)parseint64FromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString;

-(BOOL)parseBoolFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString;

-(NSString *)parseTimeStringFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString;
-(NSString *)parseShortTimeStringFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString;
-(NSDate *)parseDateFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString;


@end
