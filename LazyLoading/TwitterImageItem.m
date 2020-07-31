//
//  Created by Ashish on 8/20/19.
//  Copyright (c) 2019 Ashish. All rights reserved.
//

#import "TwitterImageItem.h"

@interface TwitterImageItem () {
  NSDictionary *tweetInfo;
}
@end

@implementation TwitterImageItem

@synthesize avatar = _avatar;
@synthesize content = _content;


- (id)initWithJSONObjectDict:(NSDictionary *)obj {
  self = [super init];
  if(self) {
    tweetInfo = [obj copy];
    _content = [[obj valueForKey:@"text"] retain];
    _avatar = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForImageResource:@"Blank44x44"]];
  }
  return self;
}

- (void)dealloc {
  [tweetInfo release];
  [_content release];
  [_avatar release];
  [super dealloc];
}

- (void)loadAvatarWithCallbackBlock:(TweetItemCallbackBlock)block {
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    NSURL *avatarURL = [NSURL URLWithString:[tweetInfo objectForKey:@"profile_image_url"]];
    NSImage *avatarImage = [[NSImage alloc] initWithContentsOfURL:avatarURL];
    self.avatar = avatarImage;
    [avatarImage release];
    block();
  });
}

#pragma mark - IKImageBrowserItem methods

- (NSString *)imageUID {
  return [tweetInfo objectForKey:@"profile_image_url"];
}

- (id)imageRepresentation {
  return self.avatar;
}

- (NSString *)imageRepresentationType {
  return IKImageBrowserNSImageRepresentationType;
}

- (NSString *)imageTitle {
  return [tweetInfo objectForKey:@"from_user"];
}

- (NSString *)imageSubtitle {
  return [tweetInfo objectForKey:@"text"];
}

@end
