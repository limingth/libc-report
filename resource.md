http://www.gnu.org/software/libc/libc.html

“ GNU ? 文库 （glibc的）
关于glibc的 文档 下载 发育 错误
概观

任何类Unix操作系统需要一个C库：这个库，它定义了``系统调用“及其他基本设施，如打开，malloc函数，输出，退出...

GNU C库作为 的 ? 文库 在 的 GNU 系统 和 最 系统 同 的 Linux的 核心。

项目目标

GNU C库的主要目的，是便携和高性能的C库。它遵循所有相关标准，包括ISO C11和POSIX.1-2008。国际化，它也有一个已知的最完整的国际化接口。

目前状态

“ 当前 稳定 版本 的 glibc的 是 2.16。 看 的 新闻 文件 在 的 glibc的 来源 为 更多 信息。

最新消息

2012-06-30 发布的glibc 2.16。

2012-03-21：发布glibc的2.15。

2012-01-03：后备箱开启 ??的2.16发展。

2011-12-26： 树干 标记 为 2.15 释放。

2011-06-07： 树干 打开 为 2.15 发育。

2011-06-07：发布glibc的2.14。

2011-05-31：主干标签为2.14版本。

2011-05-08：测试开始为2.14。

2011-02-04：发布glibc的2.13。

2011-01-17：中继标记的2.13版本。

2010-05-20：发布的glibc 2.11.2。

2010-05-13：主干标签为2.12版本。

历史

“ 历史 的 Unix的 和 各个 标准 确定 多 的 的 接口 的 的 ? 文库。 在 一般 的 GNU ? 文库 支持 的 ISO ? 和 POSIX 标准。 我们 还 尝试 对 支持 的 功能 的 流行 Unix的 变种 （包括 BSD 和 系统 V） 何时 那些 做 不 冲突 同 的 标准。 不同 兼容性 模式 （可选 何时 您 编 一个 应用） 让 的 和平 共存 的 兼容性 支持 为 不同 品种 的 Unix的。
人

GNU C库是目前维持一个社区的开发人员，其中有许多是上市的MAINTAINERS 项目wiki页面。

在glibc 提供者的记录，还有许多人在大量贡献。

感谢您向所有作出贡献的人，无论是在错误报告中，或通过回答问题，您的帮助表示赞赏。

最后修改于2012年8月13日


手册

glibc的手册可在网上。该手册包含了规范的API说明。

维基

的glibc的维基包含了很多重要的信息。请随时增加社会知识，功能心愿，功能设计，调试技巧，或开发人员注意事项。

常问问题

glibc的常见问题在这里是可以在wiki上的 常见问题。


下载源代码

发行版的源分支校验和FTP压缩包。例如，要下载的2.16版本，结账的libc的分支release/2.16/master，同样为包括港口在内的所有必要的组件。被折叠后的2.16版本中的贡献端口添加组件到主git的回购协议，而不再需要分别进行检查。

例如：

Git克隆的git :/ / sourceware.org / GIT / glibc.git的
CD的glibc
git的结帐 - 轨道-B local_glibc 2.16 origin/release/2.16/master
要列出当前设置的分支机构使用：

git的分支 - 
发布和预发布版可通过匿名FTP http://ftp.gnu.org/gnu/glibc/ 和它的镜像。

Git存储库

您可以访问使用Git的开发源码树。

Git克隆的git :/ / sourceware.org / GIT / glibc.git的[gitweb的]
  
另外要取的贡献端口添加（2.16及以上版本分支，也README.ports移动到libc中）：

Git克隆的git :/ / sourceware.org / GIT / glibc的ports.git [gitweb的]
  
如果您有任何的贡献端口添加上的问题，请发送电子邮件到libc的端口。请不要发送邮件到libc-α。

最后修改于2012年8月13日


GNU C库（glibc）
关于glibc的 文档 下载 发育 错误
贡献

今天，GNU C库几乎是完整的：几乎所有已知的和有用的功能，可从任何其他C库。但是，仍然有改进的余地。

如果你想在GNU C库中增加或改进的功能，请从最新的项目文件中的glibc源，并配合你的工作与libc-alpha@sourceware.org的维护者。

请注意，大多数大型的代码库会要求作者提交版权文件与自由软件基金会（FSF）。有任何疑问，请联系维护。欲了解更多信息，请参阅在wiki上的贡献清单。

标准的一致性

glibc的分发文件的来源报告的项目遵守各种标准的一致性。此列表还显示GNU libc中需要改进的地方。

手册

GNU C库手册是不完整的。这将是非常有益的，如果你可以花多一点的时间在写作缺少的部分。请配合您的工作与维护libc-alpha@sourceware.org。

移植

在移植的过程中，欲了解更多信息，请参阅 移植的C库 glibc的手册。目前的状态的港口和维护的维护的wiki 页面的记录 。如果你有兴趣在GNU libc的移植到其他系统类型，请联系维护libc-ports@sourceware.org，开始之前你的端口。

IRC

＃glibc的频道注册在oftc.net和irc.freenode.net。

邮件列表

公告！

通过电子邮件让你的glibc的公告：

  

关于so??urceware.org托管在glibc的有8个邮件列表：

的libc中宣布：libc的站长列表，用于通知的即将发布和anouncements的用户和开发人员。

的libc-α的libc-α列表是glibc的发展的讨论。请不要问这个名单的构建帮助。

libc的帮助：glibc所有问题，包括构建问题，C库的使用，多用于libc的帮助列表。在此列表中，从来没有关于glibc的问题是错误的。

libc中的黑客：请注意libc的黑客是一个封闭的名单。你可以看一下这个列表的档案，但是不公开的订阅和发布。

libc中的语言环境：使用的libc-当地人邮件列表讨论特定于语言环境的变化和补丁到glibc。

libc的端口：libc的端口所使用的附加 ??端口维护邮件列表。修补程序和附加的端口上的发展的讨论应该被发送到该列表中。

glibc的-CVS和 glibc的错误：CVS和glibc的glibc的错误列表的存在，是专git和从Bugzilla，分别收到自动邮件。请不要发布这些列表。

管理邮件列表订阅

动作：	
您的E-mail地址：	
邮件列表：	
消化？	

邮件也可以通过匿名的ftp 的mbox格式的文件档案 。

最后修改于2012年8月13日

GNU C库（glibc）
关于glibc的 文档 下载 发育 错误
报告错误

一个错误报告的主要目的是为了让我们以修复该错误。最重要的前提条件是，该报告必须是完整的，自包含的，我们详细解释。

如果可能以任何方式，然后再报告错误，尝试在当前的glibc的源码。

提交bug的一般信息

，应当报什么错误？

大多数用户并不编译GNU C库，从源头上发布的GNU开发。大多数人都使用glibc提供了一个完整的操作系统分发的二进制文件。发行版可能包括他们自己的修改你的操作系统的二进制文件和源到glibc。如果您使用的是自带的glibc，你应该从一个完整的操作系统分发报告错误，配电工程。分配自己的文档和网页应该是指你自己的错误报告系统。你的发行版的维护者，将决定是否修改或该特定系统的其他细节问题是特定的。如果问题确实存在标准GNU C库代码，他们将报告GNU的维护者，或指示你如何做到这一点。

所以，你仍然要提交一个bug？

如果你已经确定你的错误，应直接到GNU开发，而不是你的发行版的维护者，你的下一个步骤应该是检查的最新源代码。glibc的源代码库上的信息可以找到在glibc的下载页面。

作为一项规则，一般应提交bug报告，对当前的源代码版本的时候，你的文件的错误。glibc的发展可以迅速采取行动的时间和您可能会发现您的特定的错误已经被修正。

在哪里提交一个bug？

glibc的一个bug数据库。产品名称glibc的文件的bug 和您所报告的问题对选择相应的版本。

错误报告的说明

步骤1。检查你的错误，对目前的glibc的源码

你可能会节省自己大量的努力，通过简单的检查与当前开发分支问题仍然存在。建筑的glibc是一个棘手的业务，和glibc的维护者通常不会提供慷慨的支持，有问题的人建立的图书馆。但是，你总是可以问任何问题，帮助邮件列表。

步骤2。搜索现有的错误

你的错误可能已经被报道。首先，使用一般的网页搜索引擎，如谷歌调查的问题。搜索引擎应该索引许多不同的邮件列表，其他人可能已经探索了同样的问题。

其次，尝试搜索，通过搜索功能，提供的glibc的邮件列表。这些是主要的GNU开发人员讨论列表中glibc的问题。

最后，使用现有的查询bug报告，最常见的错误形式，试图找出你的错误在Bugzilla。

如果你发现你的错误可能一些相关的操作（??有用递增的顺序）

将自己添加到CC的bug列表，保持发展的了解。
确认在不同的环境或建筑的bug。
如何触发错误的更多信息。
自载试验复制错误的情况下，如果不存在。
一个修补程序来纠正的错误。
第3步。文件的一个新的bug

如果您的bug似乎并不存在，您可以提交新的bug形式的一个新的bug 。Bugzilla的 解释界面，包含了一般的错误写作指导。

请大家考虑以下准则：

重复错误

即使你认为一个错误是新的，专家glibc的错误猎人可能会认识到它存在的问题的一种症状，将其标记为复制。

支持分类

支持大致划分成组件，有关部门在libc的源代码。请仔细阅读成分说明，并适当地提交你的错误。

在一份新的报告把什么

您使用的是glibc的版本，无论是从官方发布的日期和时间已经签出了源。
的主机/建设/目标三胞胎。
如果您是交叉编译，你应该已经知道这些。
如果你，否则不知道使用脚本/的config.guess的输出。
给出的选项的。/ configure命令
你在每个主机上运行的内核，构建和目标（获得uname-a的输出）
该版本的gcc工具您使用的是编译Glibc（GCC-V和LD-V获得输出）
问题的描述和一些复制的问题。只有这样，才能保证任何人都看你的错误报告是提供一个自包含的测试案例，说明了这个问题，它是太费时开发人员跟踪了其他民族的代码中存在的问题。如果开发商不能复制的问题，很少有希望得到它固定。
任何分析的问题，你已经完成。
如果您的bug涉及的标准化的接口，链接到相应的部分标准的不正确的行为。
不要把在一份新的报告

补充先前的，不完整的错误报告的电子邮件消息。发表一个新的，自包含的，完整的错误报告，如果可能的话作为后续原来的错误报告
重复的错误报告，或已固定在开发树，尤其是那些已经被报告为固定上周的错误的报告。
海湾合作委员会，连接器/汇编器或您的应用程序中的错误。这些都是独立的项目，有独立的邮件列表和不同的错误报告程序
的glibc的版本或快照中的错误不是由GNU项目。报告给谁提供你的发行版（通常是分布）。
问题的正确性或预期的行为规范的系统调用。这些可能更恰当要求在其他论坛。
支持论坛

有一些相关的邮件列表glibc的发展。请检查开发页面 的完整列表。

最后修改于2012年8月13日


GNU C库（glibc）
关于glibc的 文档 下载 发育 错误
贡献

今天，GNU C库几乎是完整的：几乎所有已知的和有用的功能，可从任何其他C库。但是，仍然有改进的余地。

如果你想在GNU C库中增加或改进的功能，请从最新的项目文件中的glibc源，并配合你的工作与libc-alpha@sourceware.org的维护者。

请注意，大多数大型的代码库会要求作者提交版权文件与自由软件基金会（FSF）。有任何疑问，请联系维护。欲了解更多信息，请参阅贡献核对表 在wiki上。

标准的一致性

glibc的 分配 一 CONFORMANCE 文件 在 的 来源 哪 报告 的 项目 附着 对 各个 标准。 这 表 还 显示 哪里 GNU libc中 需求 对 是 改善。

手册

GNU C库手册是不完整的。这将是非常有益的，如果你可以花多一点的时间在写作缺少的部分。请配合您的工作与维护。 的libc-α@sourceware。组织结构

移植

在移植的过程中，欲了解更多信息，请参阅 移植的C库 glibc的手册。目前的状态的港口和维护的维护的wiki 页面的记录 。如果你有兴趣在GNU libc的移植到其他系统类型，请联系维护libc-ports@sourceware.org，开始之前你的端口。

IRC

＃glibc的频道注册在oftc.net和irc.freenode.net。

邮件列表

公告！

通过电子邮件让你的glibc的公告：

  

关于so??urceware.org托管在glibc的有8个邮件列表：

的libc中宣布：libc的站长列表，用于通知的即将发布和anouncements的用户和开发人员。

的libc-α的libc-α列表是glibc的发展的讨论。请不要问这个名单的构建帮助。

libc的帮助：glibc所有问题，包括构建问题，C库的使用，多用于libc的帮助列表。在此列表中，从来没有关于glibc的问题是错误的。

libc中的黑客：请注意libc的黑客是一个封闭的名单。你可以看一下这个列表的档案，但是不公开的订阅和发布。

libc中的语言环境：使用的libc-当地人邮件列表讨论特定于语言环境的变化和补丁到glibc。

libc的端口：libc的端口所使用的附加 ??端口维护邮件列表。修补程序和附加的端口上的发展的讨论应该被发送到该列表中。

glibc的-CVS和 glibc的错误：CVS和glibc的glibc的错误列表的存在，是专git和从Bugzilla，分别收到自动邮件。请不要发布这些列表。

管理邮件列表订阅

动作：	
您的E-mail地址：	
邮件列表：	
消化？	

邮件也可以通过匿名的ftp 的mbox格式的文件档案 。

最后修改于2012年8月13日


glibc的维基
   
登录
自 MAINTAINERS
主页最新改动改动查找帮助目录MAINTAINERS
只读网页信息附件  
MAINTAINERS

如果你想添加或删除你的名字从这个名单，请这样做你自己。

目录
MAINTAINERS
成为一个维护者
为的libc和港口附加维护
发行版的维护者
维护的网站
维护为Bugzilla
维护LinuxThreads的附加
账户上Sourceware.org
源代码控制的ACL
联系维护者
LinkedIn集团
Ohloh集团
 
成为一个维护者

如果有人（包括通过版权转让）做好工作，建立了开发人员可能会批准他们提交访问（通过邮件overseers@sourceware.org的人与现有的sourceware帐户，现有帐户或网上帐户申请过程的人没有） 。

维护 为 libc中 和 端口 附加

写后，共识和/或批准从一台机器的维护者（按姓氏字母顺序排列）：

瑞安S.阿诺德（RSA，ryanarn）
杰夫贝利（jbailey）
彼得·博迪（pasky）
菲利普·布伦德尔（以pb计）
托马斯·布什内尔（TB）
：乌尔里希Drepper（drepper）
保罗·艾格特（埃盖特）
麦克Frysinger（vapier）
理查德·亨德森（RTH）
：丹尼尔Jacobowitz（卓尔）
安德烈亚斯积家（AJ）
Aurelien雅诺（aurel32）
JAKUB耶利内克（JAKUB）
杰弗里·基廷（geoffk）
：马克Kettenis（kettenis）
卡兹小岛（kkojima）
：马克西姆Kuvyrkov（maximk，mkuvyrkov）
杰夫·法“（法律）
梅德V.莱文（LDV）
：HJ陆（HJL）
：格雷格McGary（GKM）
罗兰·麦格拉思（罗兰）
艾伦·麦克雷（阿伦）
路易斯·马查多（luisgpm）
克里斯·梅特卡夫（cmetcalf）
：吉姆Meyering（meyering）
大卫·S·米勒（davem）
：史蒂芬芒罗（sjmunroe）
约瑟夫·迈尔斯（jsm28）
乔纳森的Nieder（jrnieder）
：卡洛斯O'Donell（卡洛斯）
亚历山大·奥利瓦（aoliva）
：保罗普卢日尼科夫（ppluzhnikov）
马立克Polacek（mpolacek）
Siddhesh Poyarekar（siddhesh）
安德烈亚斯·施瓦布（施瓦布）
托马斯·施温格（tschwinge）
卡洛斯·爱德华多·SEO（CSEO）
：马库斯Shawcroft（mshawcroft）
：弗朗茨Sirl（sirl）
阿尔弗雷德·Szmidt（amszmidt）
Adhemerval Zanella（azanella）
操作系统端口的维护者

GNU赫德
罗兰·麦格拉思（罗兰）
Linux的
各机维护
机械维护

aarch64（端口）
：马库斯Shawcroft（mshawcroft）
手臂（端口）
菲利普·布伦德尔（以pb计）
约瑟夫·迈尔斯（jsm28）
阿尔法（端口）
理查德·亨德森（RTH）
HPPA（端口）
：卡洛斯O'Donell（卡洛斯）
杰夫贝利（jbailey）
I386（libc）的
IA64（端口）
麦克Frysinger（vapier）
M68K（端口）
安德烈亚斯·施瓦布（施瓦布）
Linux的通用（端口）
克里斯·梅特卡夫（cmetcalf）
MIPS（端口）
约瑟夫·迈尔斯（jsm28）
POWERPC（libc）的
瑞安S.阿诺德（RSA，ryanarn）
：史蒂芬芒罗（sjmunroe）
PowerPC的（端口）
瑞安S.阿诺德（RSA，ryanarn）
S390（libc）的
：安德烈亚斯Krebbel（zommi）
：马丁Schwidefsky（schwidefsky）
SH（libc）的
卡兹小岛（kkojima）
托马斯·施温格（tschwinge）
SPARC（libc）的
大卫·S·米勒（davem）
瓷砖（端口）
克里斯·梅特卡夫（cmetcalf）
x86_64的（libc中）
发行版的维护者

在分销层面，也有开发商负责在其特定的分布glibc的。这些开发人员是一个很好的接触点，当我们有分布相关的问题或问题，他们应咨询问题上的分布产生深远的影响。

按字母顺序分配：

ALT Linux的
梅德V.莱“< ldv@altlinux.org“ >“
Arch Linux的
艾伦·麦克雷“< allan@archlinux.org“ >“
Debian的
Debian的glibc队的< debian-glibc@lists.debian.org >
Aurelien雅诺< aurel32@debian.org >
Gentoo的
和迈克Frysinger < vapier@gentoo.org >
OpenEmbedded的/ Yocto
Khem拉吉raj.khem @ gmail.com >
openSUSE的
安德烈亚斯积家< aj@suse.de >
红帽
杰夫·法law@redhat.com >，
SUSE
迈克尔·马茨matz@suse.de >
Ubuntu的（典型）
亚当康拉德< adconrad@ubuntu.com >
维护的网站

一揽子承诺的理解，咨询和自由裁量权。我们维持两个网站，自由软件基金会（FSF）的官方网站和其他网站sourceware.org转发到FSF 1。请参阅网站维护。

：卡洛斯O'Donell（卡洛斯）
维护为Bugzilla

整个社会应该讨论到Bugzilla。

：卡洛斯O'Donell（卡洛斯）
罗兰·麦格拉思（罗兰）
维护LinuxThreads的附加

的LinuxThreads不再积极维护。最后一次正式的维护者是：丹尼尔Jacobowitz（奇幻）。
账户上Sourceware.org

殷勤地主办的红帽sourceware.org的glibc的源。您将需要一个上sourceware.org的帐户，然后才可以成为开发商。使用这个方便的花花公子的形式，要求：HTTP:/ /sourceware。组织结构/cgi-bin目录/PDW/ ps_form。CGI

源代码控制的ACL

开发人员与毯提交的负责授权访问（通过overseers@sourceware.org），glibc和glibc的端口库的glibc组。一旦你在glibc组，你将不得不对版本库的写访问权限。

联系 维护

是通过正常的方式来联系有关错误的维护者 Bugzilla的程序。 重要 安全相关 错误， 哪里 公众 通知 可能 导致 伤害 对 用户， 可以 是 报道 私自 对 的 维护 通过 的 上述 电子邮件 地址。 人 是 还 欢迎 对 报告 错误 通过 更正规 方法， ?。克。， 的 美国计算机应急准备小组（US-CERT）。US-CERT和GNU C库的开发者之间有一个正式的渠道。

建议常识是决定一个安全相关的错误是多么的重要。分诊工具。

LinkedIn 组

我们有一个 LinkedIn本集团GLIBC开发。组由卡洛斯O'Donell主持。

Ohloh集团

我们的Ohloh项目跟踪glibc的。该项目由卡洛斯O'Donell主持。

无：MAINTAINERS（2012年11月23日21点40分19秒的由CarlosODonell编辑）
只读网页信息附件  
MoinMoin的动力Python的动力GPL许可有效的HTML 4.01