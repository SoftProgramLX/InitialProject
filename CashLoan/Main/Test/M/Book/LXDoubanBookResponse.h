//
//  LXDoubanBookResult.h
//  CashLoan
//
//  Created by lixu on 2017/11/29.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXDoubanBookTags.h"

@class LXDoubanBookRating;

@interface LXDoubanBookResponse : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *alt;
@property (nonatomic, strong) LXDoubanBookRating *rating;
@property (nonatomic, copy) NSArray *author;
@property (nonatomic, copy) NSString *alt_title;
@property (nonatomic, copy) NSDictionary *image;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *mobile_link;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *attrs;
@property (nonatomic, copy) NSArray<LXDoubanBookTags *> *tags;

@end

//get请求 https://api.douban.com/v2/book/1220562
/*
{
    alt = "https://book.douban.com/subject/1220562/";
    "alt_title" = "";
    author =     (
                  "[日] 片山恭一"
                  );
    "author_intro" = "";
    binding = "平装";
    catalog = "\n      ";
    id = 1220562;
    image = "https://img3.doubanio.com/mpic/s1747553.jpg";
    images =     {
        large = "https://img3.doubanio.com/lpic/s1747553.jpg";
        medium = "https://img3.doubanio.com/mpic/s1747553.jpg";
        small = "https://img3.doubanio.com/spic/s1747553.jpg";
    };
    isbn10 = 7543632608;
    isbn13 = 9787543632608;
    "origin_title" = "";
    pages = 180;
    price = "15.00元";
    pubdate = "2005-1";
    publisher = "青岛出版社";
    rating =     {
        average = "7.3";
        max = 10;
        min = 0;
        numRaters = 368;
    };
    subtitle = "";
    summary = "那一年，是听莫扎特、钓鲈鱼和家庭破裂的一年。说到家庭破裂，母亲怪自己当初没有找到好男人，父亲则认为当时是被狐狸精迷住了眼，失常的是母亲，但出问题的是父亲……。";
    tags =     (
                {
                    count = 144;
                    name = "片山恭一";
                    title = "片山恭一";
                },
                {
                    count = 69;
                    name = "日本";
                    title = "日本";
                },
                {
                    count = 65;
                    name = "日本文学";
                    title = "日本文学";
                },
                {
                    count = 39;
                    name = "小说";
                    title = "小说";
                },
                {
                    count = 33;
                    name = "满月之夜白鲸现";
                    title = "满月之夜白鲸现";
                },
                {
                    count = 17;
                    name = "爱情";
                    title = "爱情";
                },
                {
                    count = 10;
                    name = "純愛";
                    title = "純愛";
                },
                {
                    count = 9;
                    name = "外国文学";
                    title = "外国文学";
                }
                );
    title = "满月之夜白鲸现";
    translator =     (
                      "豫人"
                      );
    url = "https://api.douban.com/v2/book/1220562";
}
 */

