//
//  ViewModel.h
//  ViewModelTest
//
//  Created by Guido Marucci Blas on 6/1/14.
//  Copyright (c) 2014 Syrmo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Delegator.h"
#import "Model.h"

@interface ViewModel : NSObject

// Model Properties
@property(nonatomic) NSString * name;

// View Model Specific Properties
@property(nonatomic) UIColor * nameTextColor;

@end
