# note-with-vscode-github-hugo
一个近乎纯粹的笔记系统。组合了开源工具链。深度分析和设计，让使用者仅仅关注与内容本身。回归到最简单的快乐。简单却又不简单。

## 效果
**简单**。本地用户操作简单，自由：vscode ，新建分类文件夹，新建md文件，快捷键插入日期，开始编写内容。保存。ok其他的一概不关心。

**安全纯粹**。笔记内容尽量格式纯粹，存储安全：
本地vscode文件夹，保留了最纯粹的md文件，以及文件夹结构。以及图片。云端github也会保留最纯粹的部分。坚果云也会存在一份备份。

**远离复杂**。将复杂交给机器，一劳永逸。在vscode编辑器上，编写纯粹内容，ctrl+s，自动触发插件note-sync（forkd）后台上传到github私有笔记仓库。在github私有仓库，触发工作流。在runner云端机器上下载最纯粹的数据，执行shell脚本，进行由纯粹变复杂的操作。丰富原始内容中的数据格式部分，图片路径重映射，满足hugo模板引擎和未来博客图片路径需要。引用hugo模板引擎进行渲染，产出博客网页静态文件。且将最后单纯的博客静态文件内容转发到另外一个github公开的page仓库。

## 组件
```mermaid
    graph LR

    s(原始 文本 & 图片)--->vscode[vscode]

    vscode[vscode] --->nc((note sync)) -.->github[github]

    github[github]--workflow-->build[处理草稿 && 图片压缩 build blog by hugo & push html css to public repo  ]-->pages[github pages]--->cdn[Cloudflare CDN 加速]

    s(原始 文本 & 图片)---> jpc((坚果云PC客户端)) -.-> jp[坚果云盘]

    m[markor]<---f((folder sync)) <-.- jp[坚果云盘]
   
    bk(公开笔记的博客)--->cdn[Cloudflare CDN 加速]
```

- pc编辑器：vscode编辑平台 ，foam（双链） ，note-sync-forked（自动同步），markdown all in one（快捷输入md语法），paste-image（图片处理），wordcount（字数统计），vscode-wordcount-cjk，todo-tree，vscode-todo-highlight，local-history，bookmarks，vim键位融合。
- 云存储和同步：坚果云服务，github private repo
- 云端构建：github workflow，shell脚本格式转换， hugo， base64 theme，github page，5元域名
- 安卓端：folder sync同步， markor（可嵌入语法阅读编辑器） 



## 需求和解决思路
1. 为了保障对操作理解和诉求。高度自定义和随意性以及自我可创造性。引用vscode编辑器，丰富的插件系统，以及高度的可自定义，工作空间特性。具备可以解决的所有自己的想法的基础条件。甩了市面上大部分md编辑器无数条街。
2. 为了保障对内容的理解和诉求。纯粹，随意性。维护了本地和博客，和github的内容边界。充分做到客户端用户无感知。自由自在。将凡是可以通过shell脚本实现的操作，全填入shell脚本。在构建服务器有序运行。
3. 为了保证简单之外的不简单。拥有云端存储，博客发布，数据备份。组合工具链条。note-sync插件。作为第一个自动化关键点。有了很好云端链接。是隐藏一切的基石。强有力的github action以及shell脚本的能力发挥。hugo高效构建。
4. 除此之外，大的架子之下，还有很多设计思想的注入。比如，服务于个人知识体系的打造，内容分类的设计，快速操作的设计。以及服务于不同于传统博客套路的结构设计。结构之美，在于思想。github内容存储，公私分离。私有数据，公开网页内容。
- 笔记结构设计：以 dailynote ，和 dailytodo ，为主线，分别，积累知识结构，和事务安排。等等。ci 和博客主题配置。
- vscode ，foam （双链） notesync （同步，触发 ci ）, 等。paste image （粘图）, markdown all in one(语法快速输入)
- git ，坚果云，以及手机端构建支持

**等等。此项目只是一个简单组合架子，自己在实际使用过程中已经逐渐丰富。如果有强烈的需要，欢迎交流**

## 参考

### 手机端的处理
坚果云：pc->云端

FolderSync：云端->手机端

markor：手机端阅读器。

1. https://help.jianguoyun.com/?p=2887

在同步的时候，文件夹的会直接同步目录内部文件。而不包含父文件夹。

2. 注意，图片路径的解决方式。通过注入页面js的方式实现：

https://github.com/gsantner/markor/issues/884

3. 本来想用坚果md.来实现手机端查阅。但是发现图片无法处理。坚果md给的图片是在是不太灵活。
