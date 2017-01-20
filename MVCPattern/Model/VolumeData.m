//
//  VolumeData.m
//  MVCPattern
//
//  Created by Michael Vilabrera on 1/20/17.
//  Copyright © 2017 Michael Vilabrera. All rights reserved.
//

#import "VolumeData.h"

@implementation VolumeData

- (id)init {
    self = [super init];
    if (self) {
        _volumeWithoutMute = 100;
        _isMuted = NO;
    }
    return self;
}

- (NSUInteger)volume {
    if (self.isMuted) {
        return 0;
    } else {
        return self.volumeWithoutMute;
    }
}

@end
