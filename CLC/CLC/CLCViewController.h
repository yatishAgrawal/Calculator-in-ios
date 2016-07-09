//
//  ViewController.h
//  Caculater
//
//  Created by Yatish on 01/07/16.
//  Copyright © 2016 Yatish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLCViewController : UIViewController<UIAlertViewDelegate>

- (IBAction)Clear:(id)sender;
- (IBAction)CalculatorButton:(id)sender;
- (IBAction)ClearValue:(id)sender;
- (IBAction)Result:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnOutletCollection;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldResult;
@end

