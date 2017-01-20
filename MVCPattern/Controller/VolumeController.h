//
//  VolumeController.h
//  MVCPattern
//
//  Created by Michael Vilabrera on 1/20/17.
//  Copyright © 2017 Michael Vilabrera. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "VolumeData.h"

@interface VolumeController : NSObject

@property (nonatomic) VolumeData *volumeData;

@property (weak) IBOutlet NSButton *muteButton;
@property (weak) IBOutlet NSTextField *volumeTextField;
@property (weak) IBOutlet NSSlider *volumeSlider;

- (IBAction)changeMute:(id)sender;
- (IBAction)changeVolume:(id)sender;

@end
