// Autogenerated from Pigeon (v10.1.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class AlbumA;

@interface AlbumA : NSObject
+ (instancetype)makeWithId:(nullable NSString *)id
    title:(nullable NSString *)title
    artist:(nullable NSString *)artist
    price:(nullable NSNumber *)price;
@property(nonatomic, copy, nullable) NSString * id;
@property(nonatomic, copy, nullable) NSString * title;
@property(nonatomic, copy, nullable) NSString * artist;
@property(nonatomic, strong, nullable) NSNumber * price;
@end

/// The codec used by AlbumApi.
NSObject<FlutterMessageCodec> *AlbumApiGetCodec(void);

@protocol AlbumApi
/// @return `nil` only when `error != nil`.
- (nullable NSArray<AlbumA *> *)getAlbumWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void AlbumApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<AlbumApi> *_Nullable api);

NS_ASSUME_NONNULL_END