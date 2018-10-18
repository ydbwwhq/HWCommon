### 1.简介
该工程包含iOS开发中使用到的工具，文件操作，网络访问，提示UI，设备唯一ID，keychain存储，以便于开发者能迅速搭建基础模块。
###  2.使用方法

 - 下载该项目，直接导入HWRouter
 - #import"HWCommon.h"
 
 即可快速搭建项目的基础功能模块
### 3.具体工具类使用实例
#### 3.1 HWWaitV
该类主要提供加载中的提示框，如网络请求时，可以调用该方法
#### 3.1.1 API使用介绍

  - 在屏幕中间弹出加载框
          
         [HWWaitV show];           
          
   - 在屏幕指定位置弹出加载框
      
         [HWWaitV showInCenter:CGPointMake(10,10)];
 - 隐藏提示框
 
       [HWWaitV hidden];

#### 3.2 HWUtility
该类主要包含经常用到的一些工具类操作，如返回当前时间戳
#### 3.2.1 API使用介绍

- 获取字符串的字节长度

       [HWUtility getStrByteLength:@"Hale"];

-  检测字符串是否包含空格
    
       [HWUtility isIncludeSpace:@"Hale Wang"];
   
- 获取时间戳单位s
   
       [HWUtility getTimestamp];

- 获取屏屏幕缩放比例,主要获取的屏幕相对于iPhone6系列尺寸的缩放比例，在UI适配时会用到
   
       [HWUtility getScreenPer];
- 获取导航栏高度，在状态栏是否显示时，正确返回导航栏高度
  
      [HWUtility  getNavigationH];
  
- 根据时间和时间格式 返回时间字符串 针对手机系统的时区
  
      [HWUtility getDateTime:@"yyyy-mm-dd hh:mm:ss" Date:[NSDate new]];

-  根据时间和时间格式 返回时间字符串 可以自定义时区
   
       NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
       [dateFormatter setDateFormat:@"yyyy-mm-dd hh:mm:ss"];
       [HWUtility getDateFormatTime:dateFormatter  Date::[NSDate new]];
   
 - 判断字符串是否为空 其中包含字符创为nil，null或者字符串为空格的情况
    
       [HWUtility isBlankString:@"  " ];

- 判断电话号码是否合法

      [HWUtility  isLegalMoblieNum:@"322431143"];

- 判断邮箱是否合法
   
      [HWUtility  isLegalEmail:@"fasffadssdf"];

- 字典转为base64编码的字符串

      [HWUtility base64EncodingWithDic:@{@"key":@"afdsfda"}];

- NSData转化为Base64编码
   
      [HWUtility base64EncodingWithData:[NSData new]];

- 字符串转化为Base64字符串

      [HWUtility  base64EncodingWithStr:@"afsddfsa"];

- 字符串的MD5值
   
      [HWUtility getMD5String:@"fsdadfsfdsa"];
- NSData转化为字典，客户端和服务器交互，经常会返回NSData类型的数据，使用该API可以直接转化为字典
   
      [HWUtility dicFromData:[NSData new]];

- 字符串转化为字典
   
      [HWUtility dicFromJsonStr:@""];
 
   
- 字典转化为字符串

 
      [HWUtility jsonStrFromDic:@{@"key":@"asddsf"}];
   
- 字典转化为NSData
  
      [HWUtility dataFromDic:@{@"key":@"asddsf"}];   

- 字典或者数组转化为字符串

      [HWUtility jsonStrFromObj:@{@"key":@"asddsf"}]];

- 字符串转化为字典或者数组
  
      [HWUtility ObjFromJsonStr:@"fasdsfadfsa"];

- 获取当前控制器

      [HWUtility currentViewController];
  
- 判断是否在同一天
  
      [HWUtility isSameDay:11212424  Time2:24324234];

- 产生一个随机整数
  
      [HWUtility getRandomNumber:0 to ：100];

- 产生一个随机浮点数
  
      [HWUtility randomBetween:0.1 And:0.2];

   
#### 3.3 HWDevice
#### 3.3.1 API使用介绍
- 判断手机是否越狱
  
      [HWDevice isJailbroken];

- 获取设备的唯一ID
   
      [HWDevice getDeviceID];
- 获取系统版本号，如iOS9.0

       [HWDevice systemVersion];

- 获取手机型号,如iPhone6,iPhone7
  
      [HWDevice phoneModel];

- 获取手机分辨率
  
      [HWDevice screenResolution];
    
#### 3.4 HWKeyChain
#### 3.4.1 API使用介绍
- 保存数据到KeyChain
    
       [HWKeyChain save:@"key" data:@"value"];
 
 - 从KeyChain中读取值
    
       [HWKeyChain load:@"key"];

- 删除KeyChain中的数据
    
      [HWKeyChain  deleteData:@"key"];

#### 3.5 HWRequest
该类继承了 NSMutableURLRequest，所以可以支持所有原生Request的属性，可根据自己的需求自行设定超时时间等。
#### 3.5.1 API使用介绍
- Get请求
   
      HWRequest *request = [[HWRequest alloc]initWithURLStr:@"https://dasfdsdfs"];
    
      [request asynGetRequest:@{@"key":@"value"} onSuccess:^(NSData *data) {
        if(successCallBack)
        {
            successCallBack(data);
        }
      } onFailure:^(NSError *error) {
        if(failureCallBack)
        {
            failureCallBack(error);
        }
      }];
      [request startRequest];
- Post请求,默认设置超时时间为30s，content-type为application/json，
   
      HWRequest *request = [[HWRequest alloc]initWithURLStr:@"https://dasfdsdfs"];
      [request asynPostRequest:@{@"key":@"value"} onSuccess:^(NSData *data) {
        if(successCallBack)
        {
            successCallBack(data);
        }
      } onFailure:^(NSError *error) {
        if(failureCallBack)
        {
            failureCallBack(error);
        }
      }];
      [request startRequest];

#### 3.6 HWTipView
该类提供提示语的吐司，类似android的吐司效果
#### 3.6.1 API使用介绍
- 弹出吐司
  
      [HWTipView showTip：@"登录成功"];
 
- 隐藏吐司
  
      [HWTipView hiddenTip];

- 设置提示框字体大小
  
      [HWTipView setFontSize:12];
  
 - 设置提示框背景色
  
       [HWTipView setBgColor:[UIColor redColor]];

- 设置提示框圆角大小
   
      [HWTipView setCornerRadius:2];
   
#### 3.7 HWFile
#### 3.7.1 API使用介绍
- 创建文件
 
      [HWFile createFile:@"user/info.txt"];
    
- 删除文件
   
      [HWFile deleteFile:@"user/info.txt"];
- 判断文件是否存在
    
      [HWFile fileExistsAtPath:@"user/info.txt"];
   
 - 写文件操作，其中append表示是否是在原有内容后面写入内容或者覆盖写入
 
       [HWFile writeFile:@"dsadfsafd" filePath:@"user/info.txt" append:false];
   
 - 读取文件，返回的是NSData类型的数据
      
       [HWFile readFile:@"user/info.txt"];
- 获取Document路径
     
      [HWFile getDocumentPath];
- 从文件中读取对象,返回NSObject类型
      
      [HWFile readObjFromFile:@"user/info.txt"];
    
 - 把对象存入文件，该对象是自定义的对象或者包含自定义的对象，该自定义的对象需要实现NSCoder协议
    
       [HWFile writeObjTofile:[NSObject new]  filePath:@"user/info.txt"];
   
#### 3.8 HWNetwork
#### 3.8.1 API使用介绍
- 获取网络类型 wifi 无网络 3G 4G 2G
  
      [HWNetwork networkType];


 - 获取网络运营商 中国联通 中国移动
    
      [HWNetwork networkOperator];
- 判断网络是否可用
  
      [HWNetwork isConnectionAvailable];
- 判断是否连接到wifi
    
      [HWNetwork isConnectWifi];

- 判断是否连接网络
   
      [HWNetwork isConnectInternet];

- 网络状态码，WLAN网，无线网，无网络的状态码
   
      [HWNetwork networkStatus];
   
### 4.总结
后续工具类还会持续更新，如果有任何疑问或者建议，请邮箱联系1334849513@qq.com
