//
//  ContainerViewController.m
//  MapModule
//

#import "ContainerViewController.h"

@interface ContainerViewController (){
    UIView * testView;
}

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    testView = [[UIView alloc] initWithFrame:CGRectMake(187.0f, 55.0f, 375, 5.0f)];
    [testView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:testView];
 
    // Initialization of the segmented control
    AKASegmentedControl *segmentedControl = [[AKASegmentedControl alloc] initWithFrame:self.tabBarView.frame];
    [segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    // Setting the content edge insets to adapte to you design
//    [segmentedControl setContentEdgeInsets:UIEdgeInsetsMake(2.0, 2.0, 3.0, 2.0)];
    
    // Setting the behavior mode of the control
    [segmentedControl setSegmentedControlMode:AKASegmentedControlModeSticky];
    
    // Setting the separator image
//    [segmentedControl setSeparatorImage:[UIImage imageNamed:@"segmented-separator.png"]];
    
    UIImage *buttonBackgroundImagePressedLeft = [UIImage imageNamed:@"segmented-bg-pressed-leftt.png"]; //resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 4.0, 0.0, 1.0)];
   
    UIImage *buttonBackgroundImagePressedRight = [UIImage imageNamed:@"segmented-bg-pressed-rightt.png"]; //resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 1.0, 0.0, 4.0)];
    
    // Button 1
    UIButton *buttonSocial = [[UIButton alloc] init];
    UIImage *buttonSocialImageNormal = [UIImage imageNamed:@"social-icon@2x.png"];
    [buttonSocial setTitle:@"marcel" forState:UIControlStateNormal];
    [buttonSocial setTitleEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    [buttonSocial setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
//    [buttonSocial setImageEdgeInsets:UIEdgeInsetsMake(0.0, 4.0, 0.0, 5.0)];
    [buttonSocial setBackgroundImage:buttonBackgroundImagePressedLeft forState:UIControlStateHighlighted];
    [buttonSocial setBackgroundImage:buttonBackgroundImagePressedLeft forState:UIControlStateSelected];
    [buttonSocial setBackgroundImage:buttonBackgroundImagePressedLeft forState:(UIControlStateHighlighted|UIControlStateSelected)];
    [buttonSocial setImage:buttonSocialImageNormal forState:UIControlStateNormal];
    [buttonSocial setImage:buttonSocialImageNormal forState:UIControlStateSelected];
    [buttonSocial setImage:buttonSocialImageNormal forState:UIControlStateHighlighted];
    [buttonSocial setImage:buttonSocialImageNormal forState:(UIControlStateHighlighted|UIControlStateSelected)];
    
    
    // Button 3
    UIButton *buttonSettings = [[UIButton alloc] init];
    UIImage *buttonSettingsImageNormal = [UIImage imageNamed:@"settings-icon.png"];
    
    [buttonSettings setBackgroundImage:buttonBackgroundImagePressedRight forState:UIControlStateHighlighted];
    [buttonSettings setBackgroundImage:buttonBackgroundImagePressedRight forState:UIControlStateSelected];
    [buttonSettings setBackgroundImage:buttonBackgroundImagePressedRight forState:(UIControlStateHighlighted|UIControlStateSelected)];
    [buttonSettings setImage:buttonSettingsImageNormal forState:UIControlStateNormal];
    [buttonSettings setImage:buttonSettingsImageNormal forState:UIControlStateSelected];
    [buttonSettings setImage:buttonSettingsImageNormal forState:UIControlStateHighlighted];
    [buttonSettings setImage:buttonSettingsImageNormal forState:(UIControlStateHighlighted|UIControlStateSelected)];
    
    
    
    // Setting the UIButtons used in the segmented control
    [segmentedControl setButtonsArray:@[buttonSocial, buttonSettings]];
    [segmentedControl setSelectedIndex:1];
    // Adding your control to the view
    [self.view addSubview:segmentedControl];
    
}

-(void)segmentedControlValueChanged:(AKASegmentedControl *) sender {
    
    if (sender.selectedIndexes.firstIndex == 0) {
        [UIView animateWithDuration:(0.5) animations:^{
            [testView removeFromSuperview];
            self.timelineViewChild.alpha = 1;
            self.mapViewChild.alpha = 0;
            [self rightToLeftAnimation];
        }];
    } else {
        [UIView animateWithDuration:(0.5) animations:^{
            [testView removeFromSuperview];
            self.timelineViewChild.alpha = 0;
            self.mapViewChild.alpha = 1;
            [self leftToRightAnimation];
        }];
    }
}

-(void) rightToLeftAnimation{
    testView = [[UIView alloc] initWithFrame:CGRectMake(187.0f, 55.0f, 187, 5.0f)];
    [testView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:testView];
    
    [UIView animateWithDuration:30.0f
                          delay:0.0f
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [testView setFrame:CGRectMake(0.0f, 55.0f, 187, 5.0f)];
                     }
                     completion:nil];

}

-(void) leftToRightAnimation{
    testView = [[UIView alloc] initWithFrame:CGRectMake(0, 55.0f, 187, 5.0f)];
    [testView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:testView];
    
    [UIView animateWithDuration:30.0f
                          delay:0.0f
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [testView setFrame:CGRectMake(188.0f, 55.0f, 188, 5.0f)];
                     }
                     completion:nil];
    
}

@end
