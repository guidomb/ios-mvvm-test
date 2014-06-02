//
//  ViewController.m
//  ViewModelTest
//
//  Created by Guido Marucci Blas on 6/1/14.
//  Copyright (c) 2014 Syrmo. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "Model.h"

@interface ViewController ()

@property(readonly, nonatomic) ViewModel * viewModel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _viewModel = [[ViewModel alloc] init];
    [self bindProperties];
}

- (void)viewWillAppear:(BOOL)animated {
    self.viewModel.name = @"Foo";
}

- (void)viewWillDisappear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)bindProperties {
    __block typeof(self) this = self;
    
    // Uni-directional bindings ViewModel -> View
    RAC(self.nameLabel, text) = RACObserve(self.viewModel, name);
    RAC(self.nameLabel, textColor) = RACObserve(self.viewModel, nameTextColor);
    
    // Uni-directional bindings View -> ViewModel
    [[self.nameTextField.rac_textSignal distinctUntilChanged] subscribeNext:^(NSString * name) {
		this.viewModel.name = name;
	}];
}

- (IBAction)buttonPressed:(id)sender {
    self.viewModel.nameTextColor = [UIColor blueColor];
}

@end
