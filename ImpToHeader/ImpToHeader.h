//
//  ImpToHeader.h
//  ImpToHeader
//
//  Created by apple on 15/5/21.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface ImpToHeader : NSObject

+ (instancetype)sharedPlugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end