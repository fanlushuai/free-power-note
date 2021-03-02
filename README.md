# note-with-vscode-github-hugo
本项目是一个写笔记的模板项目。主要分享一下，自己如何构建自己的笔记+博客系统。提供了一些模板。

博客系统使用hugo。
ci基于github。
本地编辑器vscode。

而，值得一说的就是，本人精心设计的小细节。
1. github上面，经常有些笔记和博客混在一起的。这种就会造成，写上去的东西，都会public。并且，情怀小哥直接反手一个fork。血亏呀。
针对这样的问题。设计了两个仓库。文档在私有仓库，ci会自动将静态文件build之后，push到公开仓库。这样文档和博客就独立存储和权限独立了。

2. 本地编辑器。vscode非常适合写笔记。因为高度可定制的插件环境，以及大量的插件库。可以干掉任何一个md编辑器。
除了，选择，优化，和细节调整直接决定了。vscode到底是否发挥了最大价值。
首选，是否通过调整让vscode具备，和普通的云笔记一模一样的能力。
基于这种想法。一堆功能需求和插件以及配置，被找出来。
目前，以及达到了。只需要关心写和保存笔记。其他的一概不用关系。
包括，舒服的文件结构。不局限于博客系统的要求。ci中会执行一些脚本，进行文件结构和文本内容的适配转化
包括，vim支持。
包括，配置工作区化，随便迁移。
包括，本地预览。
等等，我已经摸索了大多数的。参考.vscode工作区配置。里面有用到的插件。

3. 博客文件结构其实有的一说。基于闭环开发的原则。我们只需要操作vscode里面的东西。之后任何一个步骤都可以调整。
ci文件夹，
themes文件夹，
hugo配置，
博客github仓库控制，（比如cname）
。最原始的想法是，我出来博客原始数据，其他的数据我一概不保留。但是基于空间复杂度的理解。以及操作方便性的理解。对于一些必要且不会特别重的东西。
统一管理也是非常不错的。
