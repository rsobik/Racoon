//
//  RCOFactory.h
//  Racoon
//
//  Created by Raphael Sobik on 23.08.13.
//  Copyright (c) 2013 Raphael Sobik. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This is an abstract class that forms a basic factory that uses the
 provided assembly to construct the required components.
 
 The components are constructed by calling a specific method on the
 assembly. The method must have the following name: componentForType##TYPE##.

 For example, when you call [SomeFactory componentForType:[FooBar class]],
 the factory will call componentForTypeFooBar on the assembly.
 */
@interface RCOFactory : NSObject

/**
 Configures the factory to use the provided assembly to construct requested components.

 @param assembly The assembly that shall be used to constuct the requested components.
 **/
- (void)configureWithAssembly:(id)assembly;

/**
 Requests the factory to provide a component of the requested type.
 
 @warning Will raise an exception when an unkown type is requested.

 @param klass The type of the requested component.
 @return The constructed object.
 **/
- (id)componentForType:(Class)klass;

@end
