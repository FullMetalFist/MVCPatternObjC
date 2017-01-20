//
//  VolumeData.h
//  MVCPattern
//
//  Created by Michael Vilabrera on 1/20/17.
//  Copyright © 2017 Michael Vilabrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VolumeData : NSObject

@property (nonatomic) BOOL isMuted;
@property (nonatomic) NSUInteger volumeWithoutMute;
@property (nonatomic, readonly) NSUInteger volume;

@end
