//
//  EffViewController.m
//  ColorPicker
//
//  Created by eff-mac-002 on 10/5/13.
//  Copyright (c) 2013 Efftronics Systems Pvt. Ltd. All rights reserved.
//

#import "EffViewController.h"

@interface EffViewController ()

@end

@implementation EffViewController

@synthesize colorPicker,sliders,sliderValues,picker;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	colorPicker.pickedColorDelegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSliderValueChanged:(UISlider *)sender {
    
    [picker setHidden:true];
    int progressAsInt= [sender value]+0.5f;
    
    
    for(UITextField *value in sliderValues)
        if([value tag]== [sender tag])
            [value setText:[NSString stringWithFormat:@"%d",progressAsInt]];
    
    switch ([sender tag]) {
        case 1:{
                UIColor *uicolor = [self.view backgroundColor];
                CGColorRef color = [uicolor CGColor];
                int numComponents = CGColorGetNumberOfComponents(color);
                if (numComponents == 4){
                    const CGFloat *components = CGColorGetComponents(color);
                    [self.view setBackgroundColor:[UIColor colorWithRed:(CGFloat)progressAsInt/255.0f green:components[1] blue:components[2] alpha:components[3]]];
                }
            }
            break;
        case 2:{
                UIColor *uicolor = [self.view backgroundColor];
                CGColorRef color = [uicolor CGColor];
                int numComponents = CGColorGetNumberOfComponents(color);
                if (numComponents == 4){
                    const CGFloat *components = CGColorGetComponents(color);
                    [self.view setBackgroundColor:[UIColor colorWithRed:components[0] green:(CGFloat)progressAsInt/255.0f blue:components[2] alpha:components[3]]];
                }
            
            }
            break;
        case 3:{
                UIColor *uicolor = [self.view backgroundColor];
                CGColorRef color = [uicolor CGColor];
                int numComponents = CGColorGetNumberOfComponents(color);
                if (numComponents == 4){
                    const CGFloat *components = CGColorGetComponents(color);
                    [self.view setBackgroundColor:[UIColor colorWithRed:components[0] green:components[1] blue:(CGFloat)progressAsInt/255.0f alpha:components[3]]];
                }
            }
            break;
        default:
            
            break;
    }

}

- (void) pickedColor:(UIColor*)color atPoint:(CGPoint)point{
    [picker setHidden:false];
	self.view.backgroundColor = color;
//    Convert point Positions from colorpickerview to main view
    CGPoint pointInViewCoords = [self.view convertPoint:point fromView:colorPicker];
    
    [picker setCenter:pointInViewCoords];
    
    CGColorRef cgcolor = [color CGColor];
    int numComponents = CGColorGetNumberOfComponents(cgcolor);
    if (numComponents == 4){
        const CGFloat *components = CGColorGetComponents(cgcolor);
        for(UISlider *slider in sliders)
            [slider setValue: components[[slider tag]-1]*255.0f];
    
        for(UITextField *text in sliderValues){
            int intValue = components[[text tag]-1]*255;
            [text setText:[NSString stringWithFormat:@"%d",intValue]];
        }
    }
    
}

- (IBAction)onPickerDrag:(id)sender forEvent:(UIEvent *)event {
    
    [picker setHidden:false];
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    UIControl *control = sender;
    if (CGRectContainsPoint([colorPicker frame], point)) {
        control.center = point;
        [colorPicker touchesEnded:[event allTouches] withEvent:event];
    }
    
}
@end
