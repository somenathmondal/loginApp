//
//  ViewController.h
//  loginApp
//
//  Created by Somenath Mondal on 10/07/15.
//  Copyright (c) 2015 Somenath Mondal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
/*{
    IBOutlet UITextField *username;
    IBOutlet UITextField *password;
    
    NSDictionary *infodictionary;
    
}

- (IBAction)loginUser:(id)sender;
*/
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

- (IBAction)loginUser:(id)sender;
- (IBAction)registerUser:(id)sender;


@end

