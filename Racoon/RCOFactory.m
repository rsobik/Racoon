//
//  RCOFactory.m
//  Racoon
//
//  Created by Raphael Sobik on 23.08.13.
//  Copyright (c) 2013 Raphael Sobik. All rights reserved.
//

#import "RCOFactory.h"

#import "RCOSelectorCache.h"

@interface RCOFactory ()

@property (nonatomic, strong) id assembly;
@property (nonatomic, strong) RCOSelectorCache *selectorCache;

@end

@implementation RCOFactory

#pragma mark - NSObject

- (id)init
{
    self = [super init];
    if (self) {
        _selectorCache = [[RCOSelectorCache alloc] init];
    }

    return self;
}

#pragma mark - RCOFactory

- (void)configureWithAssembly:(id)assembly
{
    self.assembly = assembly;
}

- (id)componentForType:(Class)klass
{
    SEL selector = [self selectorForType:klass];

    if ([(NSObject *)self.assembly respondsToSelector:selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [(NSObject *)self.assembly performSelector:selector withObject:nil];
#pragma clang diagnostic pop
    } else {
        [NSException raise:NSInvalidArgumentException format:@"The assembly %@ is not able to provide a component of type %@", self.assembly, klass];
        return nil;
    }
}

#pragma mark - RCOFactory

- (SEL)selectorForType:(Class)klass
{
    SEL selector = [self.selectorCache selectorForType:klass];
    if (selector == RCOSelectorCacheSelectorNotFound) {
        NSString *selectorString = [NSString stringWithFormat:@"componentForType%@", NSStringFromClass(klass)];
        selector = NSSelectorFromString(selectorString);

        [self.selectorCache setSelector:selector forType:klass];
    }

    return selector;
}

@end
