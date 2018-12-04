//
//  VideoController.m
//  SwiftDemo
//
//  Created by csmd on 2018/12/4.
//  Copyright © 2018年 zrq. All rights reserved.
//

#import "VideoController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
@interface VideoController ()<AVPlayerViewControllerDelegate>

@end

@implementation VideoController
- (void)playVideo{
    ///MP_DEPRECATED("Use AVPlayerViewController in AVKit.", ios(3.2, 9.0))
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"ffmpegdemo.mp4" withExtension:nil];
    AVPlayerViewController *av = [[AVPlayerViewController alloc] init];
    av.delegate = self;
    av.player = [[AVPlayer alloc] initWithURL:url];
    [av.player play];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self playVideo];
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
