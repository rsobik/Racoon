//
//  RCOFactory.h
//  Racoon
//
//  Created by Raphael Sobik on 23.08.13.
//  Copyright (c) 2013 Raphael Sobik. All rights reserved.
//

#import <Foundation/Foundation.h>

/***
 This is an abstract class that forms a basic factory that uses the
 provided assembly to construct the required components.
 
 The components are constructed by calling a specific method on the
 assembly. The method must have the following name: componentForType##TYPE##.

 For example, when you call [SomeFactory componentForType:[FooBar class]],
 the factory will call componentForTypeFooBar on the assembly.
 */
@interface RCOFactory : NSObject

/***
 @param assembly The assembly that shall be used to constuct the requested components.
 **/
- (void)configureWithAssembly:(id)assembly;

/***
 @param klass The type of the requested component.
 @return An object that is kind of klass.
 **/
- (id)componentForType:(Class)klass;

@end
