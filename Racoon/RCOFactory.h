//
//  RCOFactory.h
//  Racoon
//
//  Created by Raphael Sobik on 23.08.13.
//  Copyright (c) 2013 Raphael Sobik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCOFactory : NSObject

- (void)configureWithAssembly:(id)assembly;
- (id)componentForType:(Class)klass;

@end
