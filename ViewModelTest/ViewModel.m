//
//  ViewModel.m
//  ViewModelTest
//
//  Created by Guido Marucci Blas on 6/1/14.
//  Copyright (c) 2014 Syrmo. All rights reserved.
//

#import "ViewModel.h"

@interface ViewModel()

@property(readonly, nonatomic) Model * model;

@end

@implementation ViewModel

- (instancetype)init {
    Model * model = [[Model alloc] init];
    model.name = @"";
    return [self initWithModel:model];
}

- (instancetype)initWithModel:(Model *)model {
    self = [super init];
    if (self) {
        _model = model;
        [self subscribeToSignals];
    }
    return self;
}

- (NSString *)name {
    return self.model.name;
}

- (void)setName:(NSString *)name {
    self.model.name = name;
}

#pragma mark - Private methods

- (void)subscribeToSignals {
    __block typeof(self) this = self;
    [RACObserve(self.model, name) subscribeNext:^(NSString * name) {
        [this configureNameTextColor];
    }];
}

- (void)configureNameTextColor {
    if (self.model.name.length > 5) {
        self.nameTextColor = [UIColor redColor];
    } else {
        self.nameTextColor = [UIColor blackColor];
    }
}

@end
