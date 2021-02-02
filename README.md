# note-with-vscode-github-hugo
本项目是一个写笔记的模板项目。主要分享一下，自己如何构建自己的笔记+博客系统。提供了一些关键的和主要的方式。基于vscode+github+hugo。如果你想要替换任意一个，就请绕道。

## 使用
clone下来，直接使用vscode，搞起来。
如果自己可以搞的话，具有一定参考价值。
如果，自己觉得需要学习的太多，可以快速的简单修改，直接使用。修改的内容主要是添加自己的关键数据的配置。（关键数据的配置，本来想着抽出来，方便他人，但是，还是算了。太舒服估计真的是太舒服了。没意思了。）

只需要修改如下内容，这套东西就属于你了：

1. [hugo站点的配置](https://github.com/fanlushuai/note-with-vscode-github-hugo/blob/3ebef73be42e3c0bcb3f60460418a8fb67ecb560/.github/resources/hugo/hugo-config.yaml#L1)

2. [hugo笔记的section个人配置](https://github.com/fanlushuai/note-with-vscode-github-hugo/blob/3ebef73be42e3c0bcb3f60460418a8fb67ecb560/.github/resources/hugo/hugo-config.yaml#L49)

3. [hugo站点的google分析配置](https://github.com/fanlushuai/note-with-vscode-github-hugo/blob/3ebef73be42e3c0bcb3f60460418a8fb67ecb560/.github/resources/hugo/hugo-config.yaml#L20)

4. [hugo的gittalk个人配置](https://github.com/fanlushuai/note-with-vscode-github-hugo/blob/3ebef73be42e3c0bcb3f60460418a8fb67ecb560/.github/resources/hugo/hugo-config.yaml#L61
)

5. [github page仓库的CName配置](https://github.com/fanlushuai/note-with-vscode-github-hugo/blob/3ebef73be42e3c0bcb3f60460418a8fb67ecb560/.github/resources/publicRepo/CNAME#L1)

6. [向自己的github page仓库，发送静态文件的配置](https://github.com/fanlushuai/note-with-vscode-github-hugo/blob/3ebef73be42e3c0bcb3f60460418a8fb67ecb560/.github/workflows/hugo-deploy-gh-pages.yml#L67
) 

## 起源
自己一直用leanote写笔记。也不是很喜欢写博客。

leanote笔记给我的感觉非常好。但是最不能忍的就是，项目不稳定。付费服务还不稳定，时不时的5xx，给人一种想要跑路的感觉。搞得很没有安全感。所以，我决定要撤了。虽然很欣赏leanote，但是好的产品开发出来，没有后期的运维保证，真的是很可惜。

## 构建过程

### 对笔记软件的方向性要求：
1. 丰富的快捷键支持，以及编辑器的vim。我是一个键盘控。
2. markdown的完美支持，以及本地编写和预览。
3. 最好是能够快速的发布博客
4. 使用github备份数据，作为云存储，备份，最原始的数据，即md文件和引用的图片。
5. 等等

### 工具组合

## 1. 编辑器选择vscode：
选择了很多md本地编辑编辑器，发现都不能满足我的要求。最后无意间看到vscode，发现，也许vscode是一个非常好的平台，因为大量的插件支持，就算是表面上不支持的功能，通过丰富的插件组合，一定能够构建出我完美的写笔记体验，要的就是这种高度可玩的空间。
（实际上我以前用过一段时间vscode，启动速度慢和copy字符，粘贴有时候存在乱码问题，导致我直接卸载了。还是坚守自己的sublime。）

自己尝试搞了一些之后，发现，vscode真的是完美。自己一直使用windows，并且是windows的忠实粉丝，（坚决不会换mac，因为我太爱windows），此时感觉，微软现在的变化，真的是让我非常的欣喜。加上前端时间wsl2的体验，以及windows自带的terminal的舒适体验。windows没有让我失望。

自己根据自己的要求，安排了一系列插件。可以在本项目的.vscode/extensions.json中看到。克隆本项目，到本地直接用的时候，vscode会提示，工作区推荐插件。可以直接全部安装。

还有一些vscode的自定义配置，就不分享了。这个东西，不是太好分享。自己探索吧。哈哈

## 2. github存储，以及github workflow 来自动化所有本地没必要手动的操作。
1. 存储安全性。github存储一定是安全的。如果再不安全，我感觉，这个软件世界可能要引起轩然大波，不亚于世界大战。
   
2. 自动化。github提供的免费workflow支持，舒适至极。
github action对逻辑片段的支持，以及action的多语言多逻辑的抽象真的是堪称完美。
有人可能会直接搞个dockerfile，直接一步到位。
我只想说，如果dockerfile就能搞定，github也不至于那么傻吊，非得自己搞一下。
这就相当于面向对象思想。dockerfile还是单纯，并不能有太多的复用。自己还是需要编码太多的内容。github action的概念，直接抽象了一些逻辑过程。而这些逻辑过程的实现，可以随便使用各种语言各种环境。docker，python，js，随便其他。

3. 静态站点托管。 github pages直接让你免费用。就是国内很尴尬，不过无所谓，不会翻墙，没资格看你的博客。哈哈哈。

## 3. hugo静态博客生成器
前段时间接触了一些go语言，真心感觉go的协程概念真的是秒杀其他语言。对go语法设计的独特之处，甚是欣赏。所以，我果断直接的跳过js版本和python类型的静态博客生成器。我相信go不会让我失望。

选个好点的主题。
另外，hugo的文档写的还是可以的，问答社区也非常的不错，响应及时。

## 建立笔记本地文件结构
```
1. 自己笔记原始数据的结构要求：
├── docs  // 笔记的根目录
│   ├── coder  //例子，可以随便自己分类自己的笔记目录
│   │   └── 一篇代码相关的文章.md
│   ├── lifelog
│   │   └── 一篇日志.md
│   └── work
│       └── 一篇工作记录.md
└── img   // 图片目录，所有图片一个目录。笔记的移动也不需要关联移动图片
    ├── AuhBlogImg_2021-01-31-16-03-32.png
    └── no-ref
2. 自动化build的结构要求,博客主题，以及笔记博客分离的要求：
├── .github
│   ├── resources
│   │   ├── hugo    // hugo的配置目录，包括主题，和hugo的配置
│   │   │   └── themes  
│   │   ├── publicRepo // 自己的博客，采用原始数据和静态站点文件分离的设计
│   │   └── scripts  //工作流里面调用的一些sh脚本，用于定制一些自己处理工作
│   └── workflows   //用来build 和deploy博客的 自动化工作流
├── .vscode   //用来管理vscode的工作区插件，以及配置
├── docs      // 写笔记的位置
│   ├── coder
│   ├── lifelog
│   └── work
└── img       // 图片的位置，借助插件，本地截图，复制到md会直接传到这个位置。
    └── no-ref  // 这个文件夹，充当一个无用图片的垃圾站

```

## ok，文件结构，设计好，插件设计好，一切调试通就可以完美享受了。
未来还有很多，优化空间，只要你敢想，这套工具都能满足你。
vscode插件库，可以自己写插件。满足自己的编辑器操作需求
github自动化，随便写脚本，满足你的各种自动化转化操作。
hugo博客系统，你前端牛逼的话，一套靓丽而独有的博客主题，也是信手拈来。


## 最终的效果
1. 自己根据自己习惯的目录结构，编写自己的笔记。并且可以方便的添加图片。
2. ctrl+s保存之后，自动化上传github
3. github触发工作流，自动化构建。构建内容，包括：
   - 文件结构，笔记内容自动适配hugo系统。如，移动目录位置，添加一些frontmatter。
   - 处理垃圾图片，减少后续压缩过程的无效处理以及垃圾的向下传递。
   - 压缩图片，（压缩算法这个东西以后再找更好的吧）
   - 构建静态站点
   - 仅仅将静态资源发布到另外一个自己的公开仓库。保证原始数据私有化，和隐私笔记和博客隔离。
4. github pages仓库，直接绑定域名，快乐的显示博客就好了
5. 静态站点的统计流量，和留言系统。googleAnalytics和gittalk引入。

