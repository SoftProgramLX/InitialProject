//
//  LXDoubanUserResponse.h
//  CashLoan
//
//  Created by lixu on 2017/11/30.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "LXDoubanUserUsers.h"

@interface LXDoubanUserResponse : NSObject

@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *start;
@property (nonatomic, copy) NSString *total;
@property (nonatomic, strong) NSArray<LXDoubanUserUsers *> *users;

@end

/*
{
    "count": 10,
    "start": 0,
    "total": 605,
    "users": [
              {
                  "loc_id": "118198",
                  "name": "积木iOS",
                  "created": "2016-03-13 12:08:23",
                  "is_banned": false,
                  "is_suicide": false,
                  "loc_name": "安徽池州",
                  "avatar": "https://img3.doubanio.com/icon/u143177144-1.jpg",
                  "signature": "",
                  "uid": "143177144",
                  "alt": "https://www.douban.com/people/143177144/",
                  "desc": "诗意与生活，我却独爱你",
                  "type": "user",
                  "id": "143177144",
                  "large_avatar": "https://img3.doubanio.com/icon/up143177144-1.jpg"
              },
              {
                  "name": "ios",
                  "created": "2016-01-19 18:03:43",
                  "is_banned": false,
                  "is_suicide": false,
                  "avatar": "https://img3.doubanio.com/icon/u140789960-1.jpg",
                  "signature": "",
                  "uid": "140789960",
                  "alt": "https://www.douban.com/people/140789960/",
                  "desc": "",
                  "type": "user",
                  "id": "140789960",
                  "large_avatar": "https://img3.doubanio.com/icon/up140789960-1.jpg"
              }
              ]
}
*/
