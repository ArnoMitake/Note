# my note

## 記錄用過的工具
|type|tool|
|---|---|
|ide|eclipse、intellij、visual studio、visual studio code|
|db|mssql、mysql、dbeaver|
|api|postman、jmeter|
|git|sourcetree、intellij-git|
|jdk parsetools|visualvm |
|note|notepad++、intellij|
|ftp|filezilla|
|filetool|winmerge|
|Server|nuget、apache、jboss、jetty(java)|
|packet|Wireshark|

## 密技
> 煩人的 CSDN 博客文章 (關注解鎖)
> 
> [參考連結](https://blog.csdn.net/weixin_45589116/article/details/133363921)
> 
> 按下 F12 開啟主控台，將下面代碼上貼即可解鎖
>
> ```
> var article_content=document.getElementById("article_content");
> article_content.removeAttribute("style");
> 
> var follow_text=document.getElementsByClassName('follow-text')[0];
> follow_text.parentElement.parentElement.removeChild(follow_text.parentElement);
> 
> var hide_article_box=document.getElementsByClassName(' hide-article-box')[0];
> hide_article_box.parentElement.removeChild(hide_article_box);
> ```

## intellij 重製時間 (連同最新版intellij也適用)
* intellij plugins Marketplace find 'IDE Eval Reset' (此工具只支援到 2021.2.3 不在更新)
* https://www.jetbrains.com/idea/download/other.html
1. 先去安裝 intellij v2021.2.2 版
2. 去 plugins 下載 IDE Eval Reset
3. 安裝完後去 help 裡面看 Eval Reset 的時間有沒有刷新
4. 舊版時間有刷新，即可安裝新版 intellij，只要有重製時間新版就會跳出免費30天試用，選試用後去 help -> Register 看到期時間
* 目前測試這招需要舊版的intellij重製時間成功後，再重開新版的才有效果

## intellij 目前使用的 plugins
* [Atom Material Icons](https://plugins.jetbrains.com/plugin/10044-atom-material-icons)
* [CodeGlance Pro](https://plugins.jetbrains.com/plugin/18824-codeglance-pro)
* GitLink
* GitToolBox
* Grep Console
* IDEA Mina Map (好像用不太到)
* key promoter X
* maven helper
* nyan progress bar
* rainbow brackets
* translation