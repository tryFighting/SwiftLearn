//
//  MusicTool.m
//  SwiftDemo
//
//  Created by csmd on 2018/12/3.
//  Copyright © 2018年 zrq. All rights reserved.
//

#import "MusicTool.h"
#import <AVFoundation/AVFoundation.h>
static NSMutableDictionary *_cachDic;
@implementation MusicTool
///方法头文件只要导入就走该文件
+ (void)load{
    
}
+ (void)initialize{
    _cachDic = [NSMutableDictionary dictionaryWithCapacity:1];
}
+ (void)playShortMusic:(NSString *)musicName isSlient:(BOOL)isSlient{
    NSURL *url = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
    //1.获取url字符串
    NSString *keyUrl = url.absoluteString;
    //2.从缓存字典取soundid
    SystemSoundID soundID = [_cachDic[keyUrl] intValue];
    if (soundID == 0) {
        ///重新创建
        ///自动桥接
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &soundID);
    }
    if (isSlient) {
        //不带震动效果播放音效
        AudioServicesPlaySystemSound(soundID);
    }else{
       ///带震动播放
        AudioServicesPlayAlertSound(soundID);
    }
    
}
///需要扩展
- (void)dealloc{
    ///释放音效内存
    //AudioServicesDisposeSystemSoundID(soundID);
}
+ (void)clearMemory{
    [_cachDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        SystemSoundID soundID = [obj intValue];
        AudioServicesDisposeSystemSoundID(soundID);
    }];
}
@end
