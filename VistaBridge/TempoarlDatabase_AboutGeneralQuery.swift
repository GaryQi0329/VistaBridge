//
//  TempoarlDatabase_AboutGeneralQuery.swift
//  VistaBridge
//
//  Created by 齐晴 on 16/12/26.
//  Copyright © 2016年 GaryQi. All rights reserved.
//

import Foundation

struct Car {
    let ID : Int
    let type : String
    let plateNumber : String
    let driver : String
    let driverTel : String
}

struct Worker {
    let ID : Int
    let name : String
    let tel : String
    let position : String
}

struct Department {
    let ID : Int
    let channels : Int
    let name : String
    let cars : [Int]
    let workers : [Int]
}

let departments = [
    Department(ID: 3501, channels: 1, name: "导演组", cars: [3201,3202], workers: [3301,3302,3303,3304,3305,3307,3308,3309,3310,3311,3312]),
    Department(ID: 3502, channels: 2, name: "摄影组", cars: [3203,3204,3205], workers: [3333,3334,3335,3336,3337,3338,3339,3340,3341,3342,3343]),
    Department(ID: 3503, channels: 3, name: "美术组", cars: [3206,3207], workers: [3361,3362,3363,3364,3365,3366]),
    Department(ID: 3504, channels: 4, name: "动作组", cars: [3208], workers: [3396,3397,3398,3399,3400,3401,3402,3403,3404,3405]),
    Department(ID: 3505, channels: 5, name: "梳化组", cars: [3209], workers: [3378,3379,3380,3381,3382,3383,3384,3385,3386,3387]),
    Department(ID: 3506, channels: 6, name: "服装组", cars: [3210,3211], workers: [3367,3368,3369,3370,3371,3372,3373,3374,3375,3376,3377]),
    Department(ID: 3507, channels: 7, name: "灯光组", cars: [3212,3213,3214], workers: [3347,3348,3349,3350,3351,3352,3353,3354,3355]),
    Department(ID: 3508, channels: 8, name: "机械组", cars: [3215,3216], workers: [3344,3345,3346]),
    Department(ID: 3509, channels: 9, name: "录音组", cars: [3217], workers: [3356,3357,3358,3359,3360]),
    Department(ID: 3510, channels: 10, name: "特效化妆组", cars: [3218], workers: [3388,3389,3390]),
    Department(ID: 3511, channels: 11, name: "道具组", cars: [3219,3220], workers: [3391,3392,3393,3394,3395]),
    Department(ID: 3512, channels: 12, name: "现场特效组", cars: [3221], workers: [3406,3407,3408,3409,3410,3411,3412,3413,3414]),
    Department(ID: 3513, channels: 13, name: "绿幕组", cars: [3222], workers: [3415,3416,3417,3418,3419,3420]),
    Department(ID: 3514, channels: 14, name: "制片组", cars: [3223,3224], workers: [3313,3314,3315,3316,3317,3318,3319,3320,3321,3322,3323,3324,3325,3326,3327,3328,3329,3330,3331,3332]),
]

let cars = [
    Car(ID: 3201, type: "金杯", plateNumber: "浙A 8E698", driver: "侯成光", driverTel: "15839685532"),
    Car(ID: 3202, type: "考斯特", plateNumber: "浙C F8358", driver: "沈章", driverTel: "15996846312"),
    Car(ID: 3203, type: "金杯", plateNumber: "浙A 3D284", driver: "韦华", driverTel: "15124899492"),
    Car(ID: 3204, type: "金杯", plateNumber: "浙C 837H2", driver: "陈俊", driverTel: "13701095047"),
    Car(ID: 3205, type: "厢车", plateNumber: "浙A U8271", driver: "卞伟", driverTel: "15102184729"),
    Car(ID: 3206, type: "金杯", plateNumber: "浙C 85J89", driver: "曹子清", driverTel: "18611421055"),
    Car(ID: 3207, type: "金杯", plateNumber: "浙A 14P82", driver: "陈勇", driverTel: "13611237882"),
    Car(ID: 3208, type: "考斯特", plateNumber: "浙C K8271", driver: "张守一", driverTel: "18510540465"),
    Car(ID: 3209, type: "考斯特", plateNumber: "浙A 82L10", driver: "陈超", driverTel: "13581641386"),
    Car(ID: 3210, type: "金杯", plateNumber: "浙C 22H38", driver: "岑浩", driverTel: "15001195386"),
    Car(ID: 3211, type: "厢车", plateNumber: "浙A K2931", driver: "陈竟", driverTel: "13146892374"),
    Car(ID: 3212, type: "金杯", plateNumber: "浙D 22H38", driver: "柏亚鹏", driverTel: "13264074331"),
    Car(ID: 3213, type: "金杯", plateNumber: "浙A K9312", driver: "陈松", driverTel: "13811493940"),
    Car(ID: 3214, type: "厢车", plateNumber: "浙E K2931", driver: "张舰", driverTel: "13224770388"),
    Car(ID: 3215, type: "金杯", plateNumber: "浙A 12N56", driver: "陈宇宁", driverTel: "13410713849"),
    Car(ID: 3216, type: "厢车", plateNumber: "浙C P9641", driver: "李书英", driverTel: "13015911293"),
    Car(ID: 3217, type: "金杯", plateNumber: "浙A 12G29", driver: "程广运", driverTel: "15811924550"),
    Car(ID: 3218, type: "金杯", plateNumber: "浙C 21084", driver: "陈晓峰", driverTel: "18210923373"),
    Car(ID: 3219, type: "金杯", plateNumber: "浙A 12745", driver: "方硕", driverTel: "15101038291"),
    Car(ID: 3220, type: "金杯", plateNumber: "浙C 84027", driver: "陈盛超", driverTel: "15010954124"),
    Car(ID: 3221, type: "金杯", plateNumber: "浙A J12K2", driver: "王春生", driverTel: "13943752815"),
    Car(ID: 3222, type: "金杯", plateNumber: "浙C 27F39", driver: "王杨", driverTel: "15314180027"),
    Car(ID: 3223, type: "金杯", plateNumber: "浙A 7Y896", driver: "周晶", driverTel: "15810101780"),
    Car(ID: 3224, type: "考斯特", plateNumber: "浙C 2T921", driver: "陈洋", driverTel: "13127378009"),
]

let workers = [
    Worker(ID: 3301, name: "袁卫东", tel: "13910508499", position: "执行导演"),
    Worker(ID: 3302, name: "方颖亮", tel: "13871665881", position: "第一副导演"),
    Worker(ID: 3303, name: "沈豫", tel: "13349834576", position: "统筹"),
    Worker(ID: 3304, name: "王晓娟", tel: "15071496654", position: "副导演"),
    Worker(ID: 3305, name: "王成", tel: "13161787815", position: "副导演"),
    Worker(ID: 3306, name: "李嘉浩", tel: "13910938770", position: "副导演"),
    Worker(ID: 3307, name: "黄甜", tel: "13581960404", position: "副导演"),
    Worker(ID: 3308, name: "李芬妮", tel: "15001247865", position: "场记"),
    Worker(ID: 3309, name: "朱来成", tel: "15811181810", position: "演员副导演"),
    Worker(ID: 3310, name: "蒲双成", tel: "13126568716", position: "导演助理"),
    Worker(ID: 3311, name: "代丽圆", tel: "18513554774", position: "统筹助理"),
    Worker(ID: 3312, name: "费学豪", tel: "18801017141", position: "故事板"),
    Worker(ID: 3313, name: "马正强", tel: "13126569209", position: "制片主任"),
    Worker(ID: 3314, name: "王益民", tel: "13051169133", position: "制片副主任"),
    Worker(ID: 3315, name: "蔡笑魁", tel: "15210924924", position: "执行制片"),
    Worker(ID: 3316, name: "朱子亮", tel: "13544459555", position: "制片人助理"),
    Worker(ID: 3317, name: "张海忠", tel: "18601087005", position: "现场制片"),
    Worker(ID: 3318, name: "马国志", tel: "15807152014", position: "外联制片"),
    Worker(ID: 3319, name: "李超", tel: "13681595886", position: "外联制片"),
    Worker(ID: 3320, name: "李梦", tel: "15201655255", position: "外联制片"),
    Worker(ID: 3321, name: "刘文彬", tel: "18201507288", position: "外联制片"),
    Worker(ID: 3322, name: "赵乐恒", tel: "13911619372", position: "生活制片"),
    Worker(ID: 3323, name: "雷明", tel: "13811074057", position: "演员制片"),
    Worker(ID: 3324, name: "王宇", tel: "18810782385", position: "制片助理"),
    Worker(ID: 3325, name: "周金龙", tel: "15210769302", position: "制片助理"),
    Worker(ID: 3326, name: "崔征", tel: "13910487362", position: "制片助理"),
    Worker(ID: 3327, name: "陆添", tel: "13260485598", position: "制片助理"),
    Worker(ID: 3328, name: "惠青文", tel: "18515693116", position: "财务助理"),
    Worker(ID: 3329, name: "张楠", tel: "13146692299", position: "财务助理"),
    Worker(ID: 3330, name: "于淑琴", tel: "15901523536", position: "采购"),
    Worker(ID: 3331, name: "姚佳", tel: "15610480990", position: "采购"),
    Worker(ID: 3332, name: "李鹏", tel: "13601921984", position: "采购"),
    Worker(ID: 3333, name: "高虎", tel: "13651380648", position: "B组摄影师"),
    Worker(ID: 3334, name: "刘寅", tel: "13581917435", position: "掌机"),
    Worker(ID: 3335, name: "苏彦龙", tel: "15811244522", position: "跟焦员"),
    Worker(ID: 3336, name: "孙全明", tel: "13466820123", position: "3D摄影助理"),
    Worker(ID: 3337, name: "黄循迪", tel: "13810391898", position: "摄影小助"),
    Worker(ID: 3338, name: "曾武森", tel: "13683146767", position: "数字影像工程师"),
    Worker(ID: 3339, name: "李子衡", tel: "13552860826", position: "侧录师操作员"),
    Worker(ID: 3340, name: "王辉龙", tel: "13810334829", position: "档案管理"),
    Worker(ID: 3341, name: "刘忠平", tel: "13658632789", position: "航拍项目协调人"),
    Worker(ID: 3342, name: "王猛", tel: "13810903313", position: "多旋翼飞手"),
    Worker(ID: 3343, name: "黄振伟", tel: "18511928906", position: "多旋翼工程师"),
    Worker(ID: 3344, name: "张世谦", tel: "18901339756", position: "机械组组长"),
    Worker(ID: 3345, name: "乔文科", tel: "15589250381", position: "机械组大助理"),
    Worker(ID: 3346, name: "曹百兵", tel: "13161234764", position: "炮轨操控员"),
    Worker(ID: 3347, name: "梅环松", tel: "13904008654", position: "灯光组组长"),
    Worker(ID: 3348, name: "孙建伟", tel: "13811610019", position: "组员"),
    Worker(ID: 3349, name: "周志伟", tel: "18600195659", position: "组员"),
    Worker(ID: 3350, name: "孙军政", tel: "13241939499", position: "组员"),
    Worker(ID: 3351, name: "周汗鹏", tel: "13164296023", position: "组员"),
    Worker(ID: 3352, name: "赵向龙", tel: "18106891628", position: "组员"),
    Worker(ID: 3353, name: "吴永光", tel: "15811172553", position: "组员"),
    Worker(ID: 3354, name: "邱志伟", tel: "15911041312", position: "组员"),
    Worker(ID: 3355, name: "乙亮", tel: "15811182556", position: "组员"),
    Worker(ID: 3356, name: "吴京京", tel: "13581703283", position: "录音师"),
    Worker(ID: 3357, name: "任亮", tel: "13100688621", position: "副录音"),
    Worker(ID: 3358, name: "王玮", tel: "15201865045", position: "副录音"),
    Worker(ID: 3359, name: "王卓", tel: "18600929295", position: "副录音"),
    Worker(ID: 3360, name: "郝安平", tel: "17701081052", position: "副录音"),
    Worker(ID: 3361, name: "许亮", tel: "18920451232", position: "组员"),
    Worker(ID: 3362, name: "郑飞", tel: "13554220249", position: "组员"),
    Worker(ID: 3363, name: "易广雷", tel: "13521426055", position: "组员"),
    Worker(ID: 3364, name: "刘丽娜", tel: "13581620419", position: "组员"),
    Worker(ID: 3365, name: "齐文贤", tel: "18285024054", position: "组员"),
    Worker(ID: 3366, name: "郭普", tel: "13689283192", position: "组员"),
    Worker(ID: 3367, name: "郭永森", tel: "13148319238", position: "设计师"),
    Worker(ID: 3368, name: "杨威", tel: "13312384534", position: "设计师"),
    Worker(ID: 3369, name: "林承姬", tel: "17759261394", position: "翻译"),
    Worker(ID: 3370, name: "吴尚珍", tel: "18683829192", position: "组长"),
    Worker(ID: 3371, name: "崔红花", tel: "13583859182", position: "组员"),
    Worker(ID: 3372, name: "刘晓丽", tel: "13284581275", position: "组员"),
    Worker(ID: 3373, name: "郑军", tel: "13967348213", position: "组员"),
    Worker(ID: 3374, name: "郭尚进", tel: "13812394721", position: "组员"),
    Worker(ID: 3375, name: "徐卫平", tel: "13573921842", position: "组员"),
    Worker(ID: 3376, name: "段雪峰", tel: "13312753833", position: "裁缝"),
    Worker(ID: 3377, name: "苏小荣", tel: "18523752912", position: "裁缝"),
    Worker(ID: 3378, name: "万燕", tel: "18937582204", position: "造型"),
    Worker(ID: 3379, name: "许和川", tel: "13127594023", position: "化妆师"),
    Worker(ID: 3380, name: "陈道华", tel: "13573829174", position: "化妆师"),
    Worker(ID: 3381, name: "王华", tel: "18274829374", position: "梳妆师"),
    Worker(ID: 3382, name: "谭长明", tel: "18927364891", position: "梳妆"),
    Worker(ID: 3383, name: "董威清", tel: "13683658391", position: "毛发制作"),
    Worker(ID: 3384, name: "陈岚岚", tel: "13134883921", position: "组员"),
    Worker(ID: 3385, name: "冯雅欢", tel: "13127482391", position: "组员"),
    Worker(ID: 3386, name: "王志英", tel: "13773956463", position: "组员"),
    Worker(ID: 3387, name: "田鑫", tel: "13757394622", position: "组员"),
    Worker(ID: 3388, name: "童江玲", tel: "13683028769", position: "总监"),
    Worker(ID: 3389, name: "朱娴", tel: "13128575977", position: "化妆师"),
    Worker(ID: 3390, name: "朱明", tel: "18329375422", position: "化妆师"),
    Worker(ID: 3391, name: "陶新建", tel: "18764920662", position: "组长"),
    Worker(ID: 3392, name: "胡燕伍", tel: "13129573924", position: "组长"),
    Worker(ID: 3393, name: "张会鹏", tel: "13228405723", position: "领班"),
    Worker(ID: 3394, name: "张伟杰", tel: "15829375922", position: "领班"),
    Worker(ID: 3395, name: "谭齐", tel: "13682739402", position: "采购"),
    Worker(ID: 3396, name: "王程", tel: "13718285920", position: "组员"),
    Worker(ID: 3397, name: "王振宇", tel: "18187472920", position: "组员"),
    Worker(ID: 3398, name: "孙义飞", tel: "13528374920", position: "组员"),
    Worker(ID: 3399, name: "熊永为", tel: "13682894495", position: "组员"),
    Worker(ID: 3400, name: "刘发", tel: "13847261823", position: "组员"),
    Worker(ID: 3401, name: "胡思乐", tel: "13398575330", position: "组员"),
    Worker(ID: 3402, name: "侯磊", tel: "17793037594", position: "组员"),
    Worker(ID: 3403, name: "赵培刚", tel: "15001247865", position: "组员"),
    Worker(ID: 3404, name: "任安梁", tel: "15811181810", position: "组员"),
    Worker(ID: 3405, name: "李翔", tel: "13126568716", position: "组员"),
    Worker(ID: 3406, name: "金哲", tel: "18513554774", position: "组员"),
    Worker(ID: 3407, name: "胡龙", tel: "18801017141", position: "组员"),
    Worker(ID: 3408, name: "桂勇春", tel: "13126569209", position: "组员"),
    Worker(ID: 3409, name: "李斌", tel: "13051169133", position: "组员"),
    Worker(ID: 3410, name: "朴新培", tel: "15210924924", position: "组员"),
    Worker(ID: 3411, name: "裴在浩", tel: "13544459555", position: "组员"),
    Worker(ID: 3412, name: "鲁国收", tel: "18601087005", position: "组员"),
    Worker(ID: 3413, name: "尹星云", tel: "15807152014", position: "组员"),
    Worker(ID: 3414, name: "杨加才", tel: "13658632789", position: "组员"),
    Worker(ID: 3415, name: "张健", tel: "13810903313", position: "组员"),
    Worker(ID: 3416, name: "宋开军", tel: "18511928906", position: "组员"),
    Worker(ID: 3417, name: "王任华", tel: "18901339756", position: "组员"),
    Worker(ID: 3418, name: "贾军峰", tel: "15589250381", position: "组员"),
    Worker(ID: 3419, name: "于志国", tel: "13161234764", position: "组员"),
    Worker(ID: 3420, name: "陈立刚", tel: "13651380648", position: "组员"),
]