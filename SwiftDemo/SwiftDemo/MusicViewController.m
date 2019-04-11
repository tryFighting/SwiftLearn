//
//  MusicViewController.m
//  SwiftDemo
//
//  Created by csmd on 2018/12/3.
//  Copyright © 2018年 zrq. All rights reserved.
//
/*
 
 */
#import "MusicViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface MusicViewController ()<AVPlayerViewControllerDelegate>

@end

@implementation MusicViewController

/**
 播放音效
 */
-(void)play{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"haha.wav" withExtension:nil];
    SystemSoundID soundID;
    ///自动桥接
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &soundID);
    //AudioServicesPlaySystemSound(soundID);不带震动效果播放音效
    ///带震动播放
    AudioServicesPlayAlertSound(soundID);
    
    ///释放音效内存
    //AudioServicesDisposeSystemSoundID(soundID);
}
- (void)playVieo{
    //NSURL *url = [[NSBundle mainBundle] URLForResource:@"" withExtension:nil];
    NSURL *url = [NSURL URLWithString:@"https://v.youku.com/v_show/id_XMzkwNDE1ODAyMA==.html?spm=..m_26657.5~5~1~3!2~A"];
    AVPlayerViewController *av = [AVPlayerViewController new];
    av.player = [[AVPlayer alloc] initWithURL:url];
    av.delegate = self;
    [av.player play];
}



































- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self play];
    [self playVieo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
