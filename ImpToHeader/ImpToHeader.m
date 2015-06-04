//
//  ImpToHeader.m
//  ImpToHeader
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "ImpToHeader.h"

static ImpToHeader *sharedPlugin;

@interface ImpToHeader()

@property (nonatomic, strong, readwrite) NSBundle *bundle;
@end

@implementation ImpToHeader

+ (void)pluginDidLoad:(NSBundle *)plugin {
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[self alloc] initWithBundle:plugin];
        });
    }
}

+ (instancetype)sharedPlugin {
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin {
    if (self = [super init]) {
        // reference to plugin's bundle, for resource access
        self.bundle = plugin;
        
        // Create menu items, initialize UI, etc.

        // Sample Menu Item:
        NSMenuItem *menuItem = [[NSApp mainMenu] itemWithTitle:@"Edit"];
        if (menuItem) {
            [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
            NSMenuItem *actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"ImpToHeader" action:@selector(doMenuAction) keyEquivalent:@""];
            [actionMenuItem setTarget:self];
            [[menuItem submenu] addItem:actionMenuItem];
        }
    }
    return self;
}

// Sample Action, for menu item:
- (void)doMenuAction {
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
