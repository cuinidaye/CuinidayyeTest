//
//  MiniPay.m
//  MiniPay
//
//  Created by cui on 2020/1/18.
//

#import "MiniPay.h"

static NSString *kPath = @"pages/pay/pay";
static NSString *kDefaultMiniOriginalId = @"gh_6171153c0770";

@interface MiniPay ()

@property (nonatomic, copy) NSString *appId;

@end

@implementation MiniPay

- (instancetype)initWithAppId:(NSString *)appId
{
    self = [super init];
    if (self) {
        self.appId = appId;
    }
    return self;
}

- (BOOL)payWithPrepayId:(NSString *)prepayId
{
    return [self payWithPrepayId:prepayId miniProgramType:WXMiniProgramTypeRelease miniOriginalId:kDefaultMiniOriginalId];
}

- (BOOL)payWithPrepayId:(NSString *)prepayId miniProgramType:(WXMiniProgramType)miniProgramType
{
    return [self payWithPrepayId:prepayId miniProgramType:miniProgramType miniOriginalId:kDefaultMiniOriginalId];
}

- (BOOL)payWithPrepayId:(NSString *)prepayId miniOriginalId:(NSString *)miniOriginalId
{
    return [self payWithPrepayId:prepayId miniProgramType:WXMiniProgramTypeRelease miniOriginalId:miniOriginalId];
}

- (BOOL)payWithPrepayId:(NSString *)prepayId miniProgramType:(WXMiniProgramType)miniProgramType miniOriginalId:(NSString *)miniOriginalId
{
    WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object];
    launchMiniProgramReq.userName = miniOriginalId;
    
    NSString *path = [NSString stringWithFormat:@"%@?prepay_id=%@", kPath, prepayId];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *appName = [bundle objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    path = [path stringByAppendingFormat:@"&app_name=%@", appName];
    launchMiniProgramReq.path = path;    ////拉起小程序页面的可带参路径
    launchMiniProgramReq.miniProgramType = miniProgramType; //拉起小程序的类型
    return  [WXApi sendReq:launchMiniProgramReq];
}

- (BOOL)payWithPayReq:(PayReq *)payReq
{
    return [self payWithPayReq:payReq miniOriginalId:kDefaultMiniOriginalId miniProgramType:WXMiniProgramTypeRelease];
}

- (BOOL)payWithPayReq:(PayReq *)payReq miniOriginalId:(NSString *)miniOriginalId
{
    return [self payWithPayReq:payReq miniOriginalId:miniOriginalId miniProgramType:WXMiniProgramTypeRelease];
}

- (BOOL)payWithPayReq:(PayReq *)payReq miniOriginalId:(NSString *)miniOriginalId miniProgramType:(WXMiniProgramType)miniProgramType
{
    return [self payWithPrepayId:payReq.prepayId miniProgramType:miniProgramType miniOriginalId:miniOriginalId];
}

@end
