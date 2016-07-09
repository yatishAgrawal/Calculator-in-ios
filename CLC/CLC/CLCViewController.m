//
//  ViewController.m
//  Caculater
//
//  Created by Yatish on 01/07/16.
//  Copyright © 2016 Yatish. All rights reserved.
//

#import "CLCViewController.h"

@interface CLCViewController (){
    NSString *Cal;
}
@end

@implementation CLCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for(int i=0;i<_btnOutletCollection.count;i++){
        UIButton *mybtn= [self.btnOutletCollection objectAtIndex:i];
        mybtn.layer.cornerRadius=10.0f;
        mybtn.clipsToBounds=YES;
    }
   
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ClearValue:(id)sender {
    NSString *string=[NSString stringWithFormat:@"%@",_TextFieldResult.text];
    if ([string length] > 0) {
    _TextFieldResult.text=[string substringToIndex:[string length]-1];
     Cal=[string substringToIndex:[string length]-1];
    }
}


- (IBAction)Result:(id)sender {
          @try {
            NSExpression *expression = [NSExpression expressionWithFormat:Cal];
            NSString *res=[expression expressionValueWithObject:nil context:nil];
            _TextFieldResult.text=[NSString stringWithFormat:@"%@",res];
            Cal=[NSString stringWithFormat:@"%@",res];
        } @catch (NSException *exception) {
            if ([[exception name] isEqualToString:NSInvalidArgumentException]) {
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:nil message:@"Invalid Statement" delegate:self cancelButtonTitle:@"okay" otherButtonTitles:nil];
                [alert show];
            }
        }
}


- (IBAction)Clear:(id)sender {
    _TextFieldResult.text=@"";
    Cal=NULL;
}

- (IBAction)CalculatorButton:(id)sender {
    [self appendstr:[sender currentTitle]];
}

-(void)appendstr:(NSString*)str{
 _TextFieldResult.text=[NSString stringWithFormat:@"%@%@",_TextFieldResult.text,str];
        if(Cal){
        Cal=[NSString stringWithFormat:@"%@%@",Cal,str];
        }else{
        Cal=[NSString stringWithFormat:@"%@",str];
        }
}
@end
