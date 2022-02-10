# icpbox

ICPBox

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on
mobile development, and a full API reference.

### 终端运行

* 1、source ~/.bash_profile
* flutter doctor
* 2、flutter run
*
* 终端快捷键： 热加载 r 、 切换平台 o 、 展示/隐藏网格 p 、退出预览 q 、 清屏 c

### 快捷操作

-快捷创建有状态的页面 stful  
-快捷创建无状态的页面 stless -快捷创建页面刷新方法 ss   (仅限有状态的页面可用)


### Flutter和原生Android控件对比：
|Flutter控件|    Android控件|
| --- | --- |
| AppBar    | ActionBar/ToolBar
| ListView    | ListView/RecyclerView
| Text    | TextView
| Center    | ViewGroup
| FloatingActionButton|    FloatingActionButton(design库里面的)
| BottomNavigationBar    | BottomNavigation(design库里面的)
| RaisedButton/Button    | Button
| Column|    LinearLayout的android:orientation="vertical"
| Row    | android:orientation="horizontal"
| DecorationImage    | ImageView
| Image    | ImageView
| Stack|    FrameLayout/RelativeLayout
| Container    | RelativeLayout
| CustomMultiChildLayout    | RelativeLayout
| Algin    | alginParentXXX属性
| resizeToAvoidBottomPadding    | android:windowSoftInputMode=”adjustResize属性
| SingleChildScrollView    | ScrollView
| CustomScrollerView    | Recyclerview

| 根目录 | 包名 |
| --- | --- |
| 保存图片   | imgs |
| 保存Icon文件   | fonts |
| 将Json转成Dart Model类  |  jsons |

| lib文件下 | 释义|
| --- | --- |
| view       | 页面类 |
| api        | 接口URl |
| utils      | 一些工具类，如通用方法类、网络接口类、保存全局变量的静态类等 |
| generated  | 国际化自动生成 |
| l10n       | 国际化相关的类 |
| models     | Json文件对应的Dart Model类 |
| net        | 网络请求与封装类 |
| routes     | 存放所有路由页面类 |
| states     | 保存APP中需要跨组件共享的状态类 |
| widgets    | APP内封装的一些Widget组件都在该目录下 |

| 第三方库 | 释义 |
| --- | --- |
| dio | 网络请求 |
| cookie_jar | 网络Cookie |
| dio_cookie_manager | 网络Cookie管理 |
| flutter_easyrefresh | 下拉刷新以及上拉加载 |
| event_bus | 事件总线 |
| shared_preferences | 本地配置文件存储 |
| webview_flutter | webview |
| provider | 跨组件数据共享 |
| url_launcher |唤醒第三方应用  |
| flutter_swiper | 轮播 |
| image_picker | 图像选择 |
| image_cropper| 图像裁剪 |

net下： Api 对应项目中业务开发时候的调用接口 Code定义了常见请求状态，例如网络错误、超时、成功等 DataHelper定义了数据加密工具代码
DioLogInterceptor页面Loading拦截器，用于网络数据返回加工预处理 HttpManager核心工具类，提供get和post请求入口 Loading网络请求等待页面处理
ResponseInterceptors拦截器，用于网络数据返回加工预处理 ResultData网络返回数据二次封装 UrlPath对业务URL统一管理