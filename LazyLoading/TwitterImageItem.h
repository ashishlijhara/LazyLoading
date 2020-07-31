//
//  Created by Ashish on 8/20/19.
//  Copyright (c) 2019 Ashish. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TweetItemCallbackBlock)(void);

@interface TwitterImageItem : NSObject

@property (retain) NSImage *avatar;
@property (copy) NSString *content;

- (id)initWithJSONObjectDict:(NSDictionary *)obj;
- (void)loadAvatarWithCallbackBlock:(TweetItemCallbackBlock)block;


@end
