//
//  ResearchKitSupport.h
//  Wellbeing
//
//  Compatibility import helper so the project can use either:
//  - Swift Package Manager / embedded framework (<ResearchKit/ResearchKit.h>)
//  - Submodule/header-only include layout ("ResearchKit.h")
//

#ifndef ResearchKitSupport_h
#define ResearchKitSupport_h

#if __has_include(<ResearchKit/ResearchKit.h>)
#import <ResearchKit/ResearchKit.h>
#elif __has_include("ResearchKit.h")
#import "ResearchKit.h"
#else
#error "ResearchKit headers were not found. Add ResearchKit via SPM or as a submodule/framework and ensure header search paths are configured."
#endif

#endif /* ResearchKitSupport_h */

