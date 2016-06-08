//
//  ViewController.m
//  RuntimeModel
//

#import "ViewController.h"
#import "ModelClass.h"
#import "NSObject+KeyValues.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = @{@"name":@"李华",@"region":@"青岛"};
    ModelClass *model = [ModelClass objectWithKeyValues:dic];
    NSLog(@"model==%@",model);
    
    NSDictionary *dict = [model keyValuesWithObject];
//    NSLog(@"dict===%@",dict);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
