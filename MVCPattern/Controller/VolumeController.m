//
//  VolumeController.m
//  MVCPattern
//
//  Created by Michael Vilabrera on 1/20/17.
//  Copyright © 2017 Michael Vilabrera. All rights reserved.
//

#import "VolumeController.h"

@implementation VolumeController

- (id)init {
    self = [super init];
    if (self) {
        _volumeData = [[VolumeData alloc] init];
        
        NSLog(@"Volume slider: %@", self.volumeSlider);
    }
    return self;
}

- (void)awakeFromNib {
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld;
    [self.volumeData addObserver:self forKeyPath:@"isMuted" options:options context:NULL];
    [self.volumeData addObserver:self forKeyPath:@"volumeWithoutMute" options:options context:NULL];
    
    
    [self synchronizeWithData];
}

- (void)synchronizeWithData {
    // Display mute status
    if (self.volumeData.isMuted) {
        self.muteButton.title = @"Unmute";
    } else {
        self.muteButton.title = @"Mute";
    }
    
    // Display volume in label
    self.volumeTextField.stringValue = [NSString stringWithFormat:@"%ld", self.volumeData.volume];
    
    // Display volume in slider
    self.volumeSlider.integerValue = self.volumeData.volume;
    
    if (self.volumeData.isMuted) {
        [self.volumeSlider setEnabled:NO];
    } else {
        [self.volumeSlider setEnabled:YES];
    }
}

- (IBAction)changeMute:(id)sender {
    // Toggle the mute status
    self.volumeData.isMuted = !self.volumeData.isMuted;
    
    // Update the view layer
    // remove [sync with data] call
}

- (IBAction)changeVolume:(id)sender {
    // Set the volume
    self.volumeData.volumeWithoutMute = self.volumeSlider.integerValue;
    
    // Update the view layer
    // remove [sync with data] call
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (object == self.volumeData) {
        
        [self synchronizeWithData];
    }
}

- (void) dealloc {
    [self.volumeData removeObserver:self forKeyPath:@"isMuted"];
    [self.volumeData removeObserver:self forKeyPath:@"volumeWithoutMute"];
}

@end
