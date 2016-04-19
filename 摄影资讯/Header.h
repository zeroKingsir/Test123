//
//  Header.h
//  Photography Life
//
//  Created by qianfeng on 15/11/3.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#ifndef Photography_Life_Header_h
#define Photography_Life_Header_h




//首页table接口
#define Top_URL @"http://api.fengniao.com/app_ipad/news_list.php?appImei=864572011127498&osType=Android&osVersion=4.2.2&cid=190&page=%d"

//进入页
#define Start_URL @"http://api.fengniao.com/app_ipad//focus_pic.php?appImei=864572011127498&osType=Android&osVersion=4.2.2&mid=19931"

//首页详细页
#define TopDetail_URL @"http://api.fengniao.com/app_ipad/news_doc.php?docid=%@&isPad=1"

//每日一图
//人像
#define Portrait_URL @"http://api.fengniao.com/app_ipad/pic_bbs_list_v2.php?appImei=864572011127498&osType=Android&osVersion=4.2.2&fid=%@&page=%d"
//人像详细页
#define PortraitDetail_URL @"http://api.fengniao.com/app_ipad/pic_bbs_detail.php?id=5129450&fid=101"


//风光
#define Scene_URL @"http://api.fengniao.com/app_ipad/pic_bbs_list_v2.php?appImei=864572011127498&osType=Android&osVersion=4.2.2&fid=%@&page=%d"
//风光详细页
#define SceneDetail_URL @"http://api.fengniao.com/app_ipad/pic_bbs_detail.php?id=5099978&fid=125"

//生态`
#define Ecology_URL @"http://api.fengniao.com/app_ipad/pic_bbs_list_v2.php?appImei=864572011127498&osType=Android&osVersion=4.2.2&fid=%@&page=%d"

//数码
#define Digital_URL @"http://api.fengniao.com/app_ipad/pic_bbs_list_v2.php?appImei=864572011127498&osType=Android&osVersion=4.2.2&fid=%@&page=%d"

//新手
#define NewLearner_URL @"http://api.fengniao.com/app_ipad/pic_bbs_list_v2.php?appImei=864572011127498&osType=Android&osVersion=4.2.2&fid=%@&page=%d"

//宠物
#define Pat_URL @"http://api.fengniao.com/app_ipad/pic_bbs_list_v2.php?appImei=864572011127498&osType=Android&osVersion=4.2.2&fid=%@&page=%d"

//生活
#define Life_URL @"http://api.fengniao.com/app_ipad/pic_bbs_list_v2.php?appImei=864572011127498&osType=Android&osVersion=4.2.2&fid=%@&page=%d"

//建筑
#define Construct @"http://api.fengniao.com/app_ipad/pic_bbs_list_v2.php?appImei=864572011127498&osType=Android&osVersion=4.2.2&fid=%@&page=%d"


//摄影技巧
//新手入门
#define NEWBIE_URL @"http://tips.photopai.com/ppapi/get_category_posts/?slug=newbie&page=%d"

//摄影技巧
#define TIPS_URL @"http://tips.photopai.com/ppapi/get_category_posts/?slug=tips&page=%d"

//构图美学
#define ART_URL @"http://tips.photopai.com/ppapi/get_category_posts/?slug=art&page=%d"

//器材装备
#define CAMERA_URL @"http://tips.photopai.com/ppapi/get_category_posts/?slug=camera&page=%d"

//后期处理
#define PHOTOSHOP_URL @"http://tips.photopai.com/ppapi/get_category_posts/?slug=photoshop&page=%d"

//人像摄影
#define PEOPLE_URL @"http://tips.photopai.com/ppapi/get_category_posts/?slug=people&page=%d"

//纪实摄影
#define LIFE_URL @"http://tips.photopai.com/ppapi/get_category_posts/?slug=life&page=%d"

//风光摄影
#define LANDSCAPE_URL @"http://tips.photopai.com/ppapi/get_category_posts/?slug=landscape&page=%d"

//生态摄影
#define NATURE_URL @"http://tips.photopai.com/ppapi/get_category_posts/?slug=nature&page=%d"

//商业摄影
#define COMMERCIAL_URL @"http://tips.photopai.com/ppapi/get_category_posts/?slug=commercial&page=%d"

//杂志详细页面
#define MGDetail_URL @"http://tips.photopai.com/ppapi/get_post/?id=%@"


//评论
#define COMMENTS_URL @"http://tips.photopai.com/ppapi/get_comments/?id=%@"

#endif
