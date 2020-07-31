//
//  Created by Ashish on 8/20/19.
//  Copyright (c) 2019 Ashish. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
  IKImageBrowserView *_ImageBrowserView;
  NSProgressIndicator *_progressSpinner;
}


@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet IKImageBrowserView *imageBrowserView;
@property (assign) IBOutlet NSProgressIndicator *progressSpinner;

@end
