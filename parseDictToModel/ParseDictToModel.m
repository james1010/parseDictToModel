//
//  ParseDictToModel.m

//
//  Created by James on 14/11/11.
//  Copyright (c) 2014年 James. All rights reserved.
//

#import "ParseDictToModel.h"
#import <objc/runtime.h>

@implementation ParseDictToModel


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        unsigned int outCount;
        Ivar * ivars = class_copyIvarList([self class], &outCount);
        for (int i = 0; i < outCount; i ++) {
            Ivar ivar = ivars[i];
            NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
        free(ivars);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int outCount;
    Ivar * ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(ivars);
}



-(BOOL)parseData:(NSDictionary*)netData
{
    BOOL bSafeData = YES;
    if (netData  == nil || [netData isEqual:[NSNull null]])
    {
         bSafeData == NO;
    }
    
    return bSafeData;
}
-(NSDictionary *)parseDictionaryFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString
{
    if (theDict  == nil || [theDict isEqual:[NSNull null]] || theKeyString == nil || [theKeyString length] == 0)
    {
        //NSLog(@"parseMutableStringFromDict data has error");
        return nil;
    }
    if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSDictionary class]])
    {
        NSDictionary * theString = [[NSDictionary alloc] initWithDictionary:[theDict objectForKey:theKeyString]];
        return theString;
    }
    else
    {
        //NSLog(@"parseMutableStringFromDict data theKey:%@ error",theKeyString);
        return nil;
    }
}
-(NSArray *)parseArrayFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString
{
    if (theDict  == nil || [theDict isEqual:[NSNull null]] || theKeyString == nil || [theKeyString length] == 0)
    {
        //NSLog(@"parseMutableStringFromDict data has error");
        return nil;
    }
    if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSArray class]])
    {
        NSArray * theString = [[NSArray alloc] initWithArray:[theDict objectForKey:theKeyString]];
        return theString;
    }
    else
    {
        //NSLog(@"parseMutableStringFromDict data theKey:%@ error",theKeyString);
        return nil;
    }

}
-(NSMutableString *)parseMutableStringFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString
{
    if (theDict  == nil || [theDict isEqual:[NSNull null]] || theKeyString == nil || [theKeyString length] == 0)
    {
        //NSLog(@"parseMutableStringFromDict data has error");
        return nil;
    }
    if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSNumber class]])
    {
        NSMutableString * theString = [[NSMutableString alloc] initWithString:[[theDict objectForKey:theKeyString] stringValue]];
        return theString;
    }
    else if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSString class]])
    {
        NSMutableString * theString = [[NSMutableString alloc] initWithString: [theDict objectForKey:theKeyString]];
        return theString;
    }
    else
    {
        //NSLog(@"parseMutableStringFromDict data theKey:%@ error",theKeyString);
        return nil;
    }
}
-(NSString *)parseStringFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString
{
    return [self parseStringFromDict:theDict forKey:theKeyString withArrayInterval:nil];
}
-(NSString *)parseStringFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString withArrayInterval:(NSString*)intervalStr
{
    if (theDict  == nil  || [theDict isEqual:[NSNull null]] || theKeyString == nil || [theKeyString length] == 0)
    {
        //NSLog(@"parseStringFromDict data has error");
        return @"";
    }
    if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSNumber class]])
    {
        NSString * theString = [[NSString alloc] initWithString:[[theDict objectForKey:theKeyString] stringValue]];
        return theString;
    }
    else if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSString class]])
    {
        NSString * theString = [[NSString alloc] initWithString: [theDict objectForKey:theKeyString]];
        return theString;
    }
    else if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSArray class]])
    {
        NSString *intervalStr1 = @" ";
        if([intervalStr length] > 0)
        {
            intervalStr1 = intervalStr;
        }
        NSString * theString = [[theDict objectForKey:theKeyString] componentsJoinedByString:intervalStr1];
        return theString;
    }
    else
    {
        //NSLog(@"parseStringFromDict data theKey:%@ error",theKeyString);
        return @"";
    }
}
-(NSUInteger)parseUIntegerFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString
{
    if (theDict  == nil || [theDict isEqual:[NSNull null]] || theKeyString == nil || [theKeyString length] == 0)
    {
        //NSLog(@"parseUIntegerFromDict data has error");
        return 0;
    }
    if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSNumber class]])
    {
        NSUInteger theInt = [[theDict objectForKey:theKeyString] unsignedIntegerValue];
        return theInt;
    }
    else if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSString class]])
    {
        NSUInteger theInt = [[theDict objectForKey:theKeyString] unsignedIntegerValue];
        return theInt;
    }
    else
    {
        // NSLog(@"parseUIntegerFromDict data theKey:%@ error",theKeyString);
        return 0;
    }
}
-(NSInteger)parseIntegerFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString
{
    if (theDict  == nil || [theDict isEqual:[NSNull null]] || theKeyString == nil || [theKeyString length] == 0)
    {
        //NSLog(@"parseUIntegerFromDict data has error");
        return -1;
    }
    if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSNumber class]])
    {
        NSInteger theInt = [[theDict objectForKey:theKeyString] integerValue];
        return theInt;
    }
    else if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSString class]])
    {
        NSInteger theInt = [[theDict objectForKey:theKeyString] integerValue];
        return theInt;
    }
    else
    {
        // NSLog(@"parseUIntegerFromDict data theKey:%@ error",theKeyString);
        return -1;
    }
}
-(float)parseFloatFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString
{
    if (theDict  == nil  || [theDict isEqual:[NSNull null]] || theKeyString == nil || [theKeyString length] == 0)
    {
        // NSLog(@"parseFloatFromDict data has error");
        return 0.0f;
    }
    if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSNumber class]])
    {
        float theInt = [[theDict objectForKey:theKeyString] floatValue];
        return theInt;
    }
    else if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSString class]])
    {
        float theInt = [[theDict objectForKey:theKeyString] floatValue];
        return theInt;
    }
    else
    {
        // NSLog(@"parseUIntegerFromDict data theKey:%@ error",theKeyString);
        return 0.0f;
    }
}
-(int64_t)parseint64FromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString
{
    if (theDict  == nil  || [theDict isEqual:[NSNull null]] || theKeyString == nil || [theKeyString length] == 0)
    {
        // NSLog(@"parseFloatFromDict data has error");
        return 0.0f;
    }
    if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSNumber class]])
    {
        int64_t theInt = [[theDict objectForKey:theKeyString] longLongValue];
        return theInt;
    }
    else if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSString class]])
    {
        int64_t theInt = [[theDict objectForKey:theKeyString] longLongValue];
        return theInt;
    }
    else
    {
        // NSLog(@"parseUIntegerFromDict data theKey:%@ error",theKeyString);
        return 0.0f;
    }
}
-(BOOL)parseBoolFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString
{
    if (theDict  == nil  || [theDict isEqual:[NSNull null]] || theKeyString == nil || [theKeyString length] == 0)
    {
        return NO;
    }
    if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSNumber class]])
    {
        NSNumber *theInt = [theDict objectForKey:theKeyString];
        return [theInt boolValue];
    }
    else if ([[theDict objectForKey:theKeyString] isKindOfClass:[NSString class]])
    {
        NSNumber *theInt = [theDict objectForKey:theKeyString];
        return [theInt boolValue];
    }
    else
    {
        return NO;
    }
}
-(NSString *)parseTimeStringFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString
{
    int64_t time = [self parseint64FromDict:theDict forKey:theKeyString];
    NSString * theString = [Utility timeLongToStr:time];
    return theString;
}
-(NSString *)parseShortTimeStringFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString
{
    int64_t time = [self parseint64FromDict:theDict forKey:theKeyString];
    NSString * theString = [Utility timeShortToStr:time];
    return theString;
}

-(NSDate *)parseDateFromDict:(NSDictionary *)theDict forKey:(NSString*)theKeyString
{
    int64_t time = [self parseint64FromDict:theDict forKey:theKeyString];
    int64_t tSec = time/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:tSec];
    return date;
}

@end
