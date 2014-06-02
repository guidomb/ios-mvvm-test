//
//  Delegator.m
//  ViewModelTest
//
//  Created by Guido Marucci Blas on 6/1/14.
//  Copyright (c) 2014 Syrmo. All rights reserved.
//

#import "Delegator.h"

@implementation Delegator

- (instancetype)initWithTargetObject:(id)targetObject {
    self = [super init];
    if (self) {
        _targetObject = targetObject;
    }
    return self;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL selector = [invocation selector];
    if ([self.targetObject respondsToSelector:selector]) {
        [invocation invokeWithTarget:self.targetObject];
    } else {
        [super forwardInvocation:invocation];
    }
}

- (BOOL)respondsToSelector:(SEL)selector {
    return [super respondsToSelector:selector] || [self.targetObject respondsToSelector:selector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    NSMethodSignature * methodSignature = [super methodSignatureForSelector:selector];
    if (methodSignature == nil) {
        methodSignature = [self.targetObject methodSignatureForSelector:selector];
    }
    return methodSignature;
}

@end
