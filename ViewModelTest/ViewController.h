//
//  ViewController.h
//  ViewModelTest
//
//  Created by Guido Marucci Blas on 6/1/14.
//  Copyright (c) 2014 Syrmo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (IBAction)buttonPressed:(id)sender;
@end
