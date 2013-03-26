//
//  ViewController.h
//  iOS
//
//  Created by Nicholas Haurus on 3/27/12.
//  Copyright (c) 2012 Haurus Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BonjourClient.h"

@interface ViewController : UIViewController {
    IBOutlet UITextView *textView;
    BonjourClient *bonjourClient;
}

@end
