//
//  MiniPay.h
//  MiniPay
//
//  Created by cui on 2020/1/18.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"
#import "WXApiObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface MiniPay : NSObject

- (instancetype)initWithAppId:(NSString *)appId;

/**
 * @param prepayId 预支付ID
 * @return 成功返回YES，失败返回NO。
 */
- (BOOL)payWithPrepayId:(NSString *)prepayId;

/**
 * @param prepayId 预支付ID
 * @param miniProgramType 可选打开 开发版，体验版和正式版
 * @return 成功返回YES，失败返回NO。
 */
- (BOOL)payWithPrepayId:(NSString *)prepayId miniProgramType:(WXMiniProgramType)miniProgramType;

/**
 * @param prepayId 预支付ID
 * @param miniOriginalId 填小程序原始id
 * @return 成功返回YES，失败返回NO。
 */
- (BOOL)payWithPrepayId:(NSString *)prepayId miniOriginalId:(NSString *)miniOriginalId;

/**
 * @param prepayId 预支付ID
 * @param miniOriginalId 填小程序原始id
 * @param miniProgramType 可选打开 开发版，体验版和正式版
 * @return 成功返回YES，失败返回NO。
 */
- (BOOL)payWithPrepayId:(NSString *)prepayId miniProgramType:(WXMiniProgramType)miniProgramType miniOriginalId:(NSString *)miniOriginalId;

/**
 * @param payReq 微信原生支付所用PayReq
 * @return 成功返回YES，失败返回NO。
 */
- (BOOL)payWithPayReq:(PayReq *)payReq;

/**
 * @param payReq 微信原生支付所用PayReq
 * @param miniOriginalId 填小程序原始id
 */
- (BOOL)payWithPayReq:(PayReq *)payReq miniOriginalId:(NSString *)miniOriginalId;

/**
 * @param payReq 微信原生支付所用PayReq
 * @param miniOriginalId 填小程序原始id
 * @param miniProgramType 可选打开 开发版，体验版和正式版
 */
- (BOOL)payWithPayReq:(PayReq *)payReq miniOriginalId:(NSString *)miniOriginalId miniProgramType:(WXMiniProgramType)miniProgramType;

@end

NS_ASSUME_NONNULL_END
