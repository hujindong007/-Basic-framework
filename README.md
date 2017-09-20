# -Basic-framework
简单基本框架
-Basic-framework 是一个简单基本框架。<br/>

<br/>


## 使用Podfile文件导入


platform :ios, '8.0' 
#use_frameworks!个别需要用到它，比如reactiveCocoa
target 'ProjectName' do
pod 'Basic', '~> 0.0.3',:inhibit_warnings => false #忽略xcode8 注释里面的警告
end

<br/>


## 模块说明
* 首页          
* 消息       
* 发布      
* 发现 
* 我  


## 功能介绍
* 就是简单的用字典创建的5个首页面，以后可以后台传json数据，动态修改
* 完美解决了中间突出点击事件
* 处理了导航返回直接，变成渐变消融
* 加入全屏右滑手势
* 以后不断加入吧

<br/>


