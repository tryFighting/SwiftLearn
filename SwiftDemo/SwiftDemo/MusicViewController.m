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
#import "MusicTool.h"
@interface MusicViewController ()
@property(nonatomic,strong)AVAudioPlayer *player;
@property(nonatomic,strong)AVAudioRecorder *recorder;
@end

@implementation MusicViewController

/**
 播放音效
 */
-(void)play{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"tapped.caf" withExtension:nil];
    SystemSoundID soundID;
    ///自动桥接
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &soundID);
    //AudioServicesPlaySystemSound(soundID);不带震动效果播放音效
    ///带震动播放
    AudioServicesPlayAlertSound(soundID);
    
    ///释放音效内存
    //AudioServicesDisposeSystemSoundID(soundID);
}

- (void)playMusic{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"bg.mp3" withExtension:nil];
    NSError *error;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
}


































- (void)record1{
    NSArray *pathArr = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [[pathArr lastObject] stringByAppendingPathComponent:@"record.wav"];
    NSURL *fileUrl = [NSURL fileURLWithPath:path];
    NSMutableDictionary *setting = [NSMutableDictionary dictionaryWithCapacity:1];
    NSError *error;
    NSLog(@"home == %@",NSHomeDirectory());
    self.recorder = [[AVAudioRecorder alloc] initWithURL:fileUrl settings:setting error:&error];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[MusicTool playShortMusic:@"tapped.caf" isSlient:NO];
    [self playMusic];///播放器初始化操作
    [self record1];///录音器初始化操作
    NSArray *array = @[ @"播放/暂停", @"停止播放", @"录音", @"停止录音", @"我的订单", @"拇指理赔", @"身份证识别", @"手写签名回调", @"加载H5", @"我要续缴", @"电子保单下载" ];
    for (int i = 0; i < array.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(50, 40 * (i) + 88, 200, 30);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.tag = i;
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAct:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
}
- (void)btnAct:(UIButton *)sender {
    if (sender.tag == 0) {
        self.player.isPlaying ? [self.player pause]:[self.player play];
    }else if (sender.tag == 1){
        [self.player stop];
        self.player.currentTime = 0;
    }else if (sender.tag == 2){
        self.recorder.isRecording ? [self.recorder pause]:[self.recorder record];
    }else if (sender.tag == 3){
        [self.recorder stop];
    }
    
//    if (sender.tag == 0) {
//        //利用反射机制加载控制器
//        Class my = NSClassFromString(@"NewReportViewController");
//
//        [self.navigationController pushViewController:[my new] animated:YES];
//        //        MyInsuranceController *my = [MyInsuranceController new];
//        //        my.hidesBottomBarWhenPushed = YES;
//        //        [self.navigationController pushViewController:my animated:YES];
//    }
}
///接收内存警告 当前controller接收警告 全局则再appdelegate书写
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
