//
//  RCOSelectorCache.m
//  Racoon
//
//  Created by Raphael Sobik on 23.08.13.
//  Copyright (c) 2013 Raphael Sobik. All rights reserved.
//

#import "RCOSelectorCache.h"

const SEL RCOSelectorCacheSelectorNotFound = 0;

@implementation RCOSelectorCache {
    CFMutableDictionaryRef dictionary;
}

- (id)init
{
    self = [super init];
    if (self) {
        dictionary = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, NULL, NULL);
    }

    return self;
}

- (void)dealloc
{
    if (dictionary) {
        CFRelease(dictionary);
    }
}

- (SEL)selectorForType:(Class)key
{
    return (SEL)CFDictionaryGetValue(dictionary, (__bridge const void *)(key));
}

- (void)setSelector:(SEL)selector forType:(Class)key
{
    CFDictionarySetValue(dictionary, (__bridge const void *)(key), selector);
}

- (void)evictCachedSelectors
{
    CFDictionaryRemoveAllValues(dictionary);
}

@end
