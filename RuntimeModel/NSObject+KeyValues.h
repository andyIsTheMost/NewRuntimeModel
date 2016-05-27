//
//  NSObject+KeyValues.h
//  RuntimeModel
//

#import <Foundation/Foundation.h>

@interface NSObject (KeyValues)

/**
 *  将传过来的字典对象转换为Model对象
 *
 *  @param aDictionary 字典
 *
 *  @return
 */
+(id)objectWithKeyValues:(NSDictionary *)aDictionary;

/**
 *  将Model对象转换为字典对象
 *
 *  @return 
 */
- (NSDictionary *)keyValuesWithObject;
@end
