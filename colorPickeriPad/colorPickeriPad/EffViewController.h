//
//  EffViewController.h
//  colorPickeriPad
//
//  Created by eff-mac-002 on 10/16/13.
//  Copyright (c) 2013 Efftronics Systems Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorPickerImageView.h"

@interface EffViewController : UIViewController
@property (weak, nonatomic) IBOutlet ColorPickerImageView *colorPicker;
@property (weak, nonatomic) IBOutlet UIButton *picker;
@property (strong, nonatomic) IBOutletCollection(UISlider) NSArray *sliders;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *sliderValues;
- (IBAction)onSliderValueChanged:(UISlider *)sender;

- (void) pickedColor:(UIColor*)color atPoint:(CGPoint) point;
- (IBAction)onPickerDrag:(id)sender forEvent:(UIEvent *)event;

@end
