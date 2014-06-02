//
//  Delegator.h
//  ViewModelTest
//
//  Created by Guido Marucci Blas on 6/1/14.
//  Copyright (c) 2014 Syrmo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Delegator : NSObject

@property(nonatomic, readonly) id targetObject;

- (instancetype)initWithTargetObject:(id)targetObject;

@end
