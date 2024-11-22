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
