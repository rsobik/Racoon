//
//  RCOSelectorCache.h
//  Racoon
//
//  Created by Raphael Sobik on 23.08.13.
//  Copyright (c) 2013 Raphael Sobik. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const SEL RCOSelectorCacheSelectorNotFound;

@interface RCOSelectorCache : NSObject

- (SEL)selectorForType:(Class)key;
- (void)setSelector:(SEL)selector forType:(Class)key;
- (void)evictCachedSelectors;

@end
