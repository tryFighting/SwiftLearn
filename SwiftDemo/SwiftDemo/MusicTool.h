//
//  MusicTool.h
//  SwiftDemo
//
//  Created by csmd on 2018/12/3.
//  Copyright © 2018年 zrq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicTool : NSObject
/**
 播放短视频文件

 @param musicName <#musicName description#>
 */
+ (void)playShortMusic:(NSString *)musicName isSlient:(BOOL)isSlient;
@end
