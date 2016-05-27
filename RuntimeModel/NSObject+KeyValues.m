//
//  NSObject+KeyValues.m
//  RuntimeModel
//

#import "NSObject+KeyValues.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (KeyValues)

+(id)objectWithKeyValues:(NSDictionary *)aDictionary{
    id objc = [[self alloc] init];
    for (NSString *key in aDictionary.allKeys) {
        id value = aDictionary[key];
        //这段代码是用来判断属性的类型，是int,NSNumber类型
//        objc_property_t property = class_getProperty(self, key.UTF8String);
//        u_int outCount;
//        objc_property_attribute_t *attributes = property_copyAttributeList(property, &outCount);
//        objc_property_attribute_t attribute = attributes[0];
        NSString *methodName = [NSString stringWithFormat:@"set%@%@:",[[key substringToIndex:1] uppercaseString],[key substringFromIndex:1]];
        SEL setter = sel_registerName(methodName.UTF8String);
        if ([objc respondsToSelector:setter]) {
            ((void (*)(id,SEL,id)) objc_msgSend) (objc,setter,value);
        }
    }
    return objc;
}

- (NSDictionary *)keyValuesWithObject {
    u_int outCount = 0;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (int i=0; i < outCount; i++) {
        objc_property_t property = properties[i];
        SEL getter = sel_registerName(property_getName(property));
        if ([self respondsToSelector:getter]) {
            id value = ((id(*)(id,SEL))objc_msgSend)(self,getter);
            if (value) {
                NSString *key = [NSString stringWithUTF8String:property_getName(property)];
                [dict setObject:value forKey:key];
            }
        }
    }
    return dict;
}

@end
