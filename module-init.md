Module-init-tools 软件包分析
============================


1. 软件包基本信息
-----------------

### 1.1 软件包开发背景与目标
module-init-tools 软件包主要是为了能够在用户空间向Linux提供加载内核模块所需要使用的工具。
这个软件包主要是用于2.6系列的内核，最早是为了替换 modutils（例如 modprobe/insmod/modinfo 等）
modutils 在 2006年9月15号发布了 v2.4 之后就不再更新维护了。 

这里需要了解一些关于Linux内核设计的背景知识。

内核是操作系统设计中最基础的部分，通常一个操作系统都需要包含以下这些功能：

* 进程管理
* 进程间通讯
* 内存管理 (特别是虚拟内存)
* 设备驱动
* 文件系统
* 网络通讯

传统的Unix内核是宏内核（也称为单内核）设计(Macro-kernel)，所谓宏内核的意思是所有这些模块都在同一个内核空间上上运行。宏内核是通过提供系统调用(System-Call)来向上层的应用程序提供服务访问点，这些系统调用包含了进程创建，文件读写，设备驱动，内存的分配和释放等。

宏内核的问题在于因为所有模块都在同一个地址空间运行，所以如果内核代码中出现一个哪怕是很小的bug也会引起整个系统崩溃，这样带来了安全性上的问题。而微内核(Micro-kernel)的设计则有效的避免了这个问题，虽然可能会随之带来运行效率上的一些损失。

微内核的设计只将必要的功能模块放入到内核空间，例如进程间通信(IPC)，调度，基本的输入输出(I/O)和内存管理作为核心部件，而其他的文件系统，设备驱动和网络协议栈等，则在用户模式下作为系统服务进程来运行，因为每个服务都是在自己的地址空间运行，因此互相之间并不能破坏彼此，从而得到了保护。历史上的 Windows NT 就是采用微内核的设计。

两种内核设计模式，前者高效，后者稳定灵活。微内核设计中的系统服务可以动态加载插入，非常灵活，这个优点也被作为宏内核代表的Linux的设计者所认同和借鉴，因此从内核的 1.2 版本开始，Linux内核开始引入内核模块的机制。内核模块是Linux内核向外部提供的一个插口，其全称为动态可加载内核模块（Loadable Kernel Module，LKM）。这一机制是Linux内核最重要的创新之一。

内核模块是具有独立功能的程序，但通常被编译为后缀是.ko(在2.6版本之前内核模块的后缀为.o)的ELF格式的目标文件，这样的目标文件不能独立运行，需要通过加载工具将它链接到内核中作为内核的一个功能，运行在内核空间。内核模块是实现设备驱动和文件系统的一种常用技巧，通过加载内核模块和卸载内核模块，可以扩展内核的功能，增加系统服务的种类，支持更多的设备驱动。

正是由于Linux内核支持了内核模块这一特性，从而使得作为宏内核设计的Linux也具备了微内核可以动态加载系统服务的优点。但是因为加载后的内核模块仍然是运行在内核空间，因此如果加载的内核模块出现错误，也同样会引起整个系统崩溃，这一点和微内核设计让系统服务在用户空间运行，通过进程间通信来实现和内核的协同工作，仍然是不同的，这一不同仍然要注意区分。

我们讨论的 module-init-tools 软件包就是为了这一目的而实现的在用户空间运行的加载工具，通过这一工具可以实现我们前面说过的内核模块的加载和卸载功能，这里面也包含了一些其他的常用功能。值得说明的是，加载功能最重要的部分，其实并非是在这个软件包中实现，而是在内核中完成。软件包中的加载代码甚至并没有对需要加载的内核模块做符号解析(也就是向内核空间增添的函数名称和变量名称)，而是直接交给系统调用来完成这一最艰难的部分。
    
### 1.2 软件包维护者信息
该项目的项目主页在 https://modules.wiki.kernel.org
从软件包的 AUTHORS 文档中找到，最主要的维护者是 Jon Masters <jcm@jonmasters.org>
Jon Masters 是从 3.3 版本之后开始参与改软件包的，他的 github 主页在 https://github.com/jonmasters 。
其中比较积极的，对于软件包版本升级更新作出较多贡献的开发人员还有
Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Marco d'Itri <md@linux.it>
Andreas Robinson <andr345@gmail.com>

项目开发人员的邮件列表： linux-modules@vger.kernel.org

### 1.3 软件包所采用的版权协议
该软件包所采用的版权协议是GPLv2的协议，从下载git包中的COPYING文件中可以获知这一信息。

### 1.4 软件包的演化历史
#### modutils
在2000年到2006年期间，内核普遍采用 modutils 作为管理内核模块的工具，
modutils 的下载地址 ftp://ftp.kernel.org/pub/linux/utils/kernel/modutils/

#### module-init-tools
该软件包的下载地址是 http://www.kernel.org/pub/linux/utils/kernel/module-init-tools/
从这个下载地址上能够看到，最早的版本记录是该软件包的3.0版本，时间是2007年9月5日推出的。
最后一个能够通过 ftp/http 下载到的版本是3.15版本，时间是2011年1月2日推出的。

之后的下载是通过 Git 命令来获得的。

	git://git.kernel.org/pub/scm/utils/kernel/module-init-tools/module-init-tools.git

从3.1到最新的3.15版本的更新时间，依次是
module-init-tools-3.4.tar.gz                     07-Oct-2007 22:09  276K  
module-init-tools-3.5.tar.gz                     13-Oct-2008 09:13  251K  
module-init-tools-3.7.tar.gz                     08-Apr-2009 22:08  828K  
module-init-tools-3.8.tar.gz                     30-Apr-2009 20:37  890K  
module-init-tools-3.9.tar.gz                     27-May-2009 18:43  229K  
module-init-tools-3.10.tar.gz                    16-Jul-2009 08:56  1.0M  
module-init-tools-3.11-rc1.tar.gz                02-Oct-2009 18:37  130K  
module-init-tools-3.11.1.tar.gz                  21-Oct-2009 04:10  235K  
module-init-tools-3.12.tar.gz                    07-Jun-2010 08:06  1.0M  
module-init-tools-3.13.tar.gz                    31-May-2011 04:56  1.0M  
module-init-tools-3.14.tar.gz                    02-Jun-2011 06:38  340K  
module-init-tools-3.15.tar.gz                    02-Jun-2011 17:43  340K 

从该软件的 ChangeLog 中能够看到的记录是从0.7a版本，以下对各个版本中比较重要的特性做一说明：
0.7a 版本中，增加了对 /etc/modprobe.conf 的支持；
0.8 版本中，增加了 insmod -p -s -f 参数的支持；
0.9.4 版本中，增加了 modprobe -l -t -a 参数支持；
0.9.14 版本中，支持通过 stdin 来插入模块，例如 zcat foo.ko.gz | insmod -

比较特别的是，在 ChangeLog 中，版本号从 0.9.14 直接变为 3.0 Version.
3.0 版本中，支持 -a mod1 mod2 同时加载2个模块；
3.2 版本中，modinfo 可以支持 2.6.11 内核；
3.4 版本中，modprobe 可以处理内核命令行 (kernel command line)；
3.6 版本中，开始使用 /sys/module 而不是 /proc/modules；
3.8 版本中，zlib 允许使用动态链接；
3.10 版本中，去掉了一些参数选项的处理；
3.12 版本中，修改了 Makefile 里面的一些问题；
3.14 版本及之后的修改，都是在文档 documentation 方面，代码中的修改已经很少了，说明该软件包也是日趋成熟；

#### kmod
在此之后，这个软件包将会被一个新工具所替代，这个新工具将会基于 libkmod。
详见 https://www.archlinux.org/news/kmod-replaces-module-init-tools/
在维护者 Jon Masters 的个人博客主页上，在2011年12月20日也给出了这一声明。
libkmod 是 kmod 项目的一个子目录，下载地址是 https://github.com/profusion/kmod

### 1.5 类似的可替代软件包简介overseen
libkmod 是 module-init-tools 的一个升级，在当前能够找到的唯一和 module-init-tools 有可比性的软件工具。
目前这个项目主要是由 ProFUSION embedded systems 公司负责维护的，公司主页在 http://profusion.mobi/
这个公司是一家在巴西的生产飞机上所用的娱乐设备（类似飞机座椅后背上的音视频游戏系统），也包括家用厨房里的智能设备。

libkmod 其实是封装了原来系统调用的接口，替换了一套类似用面向对象思想封装的 kmod 库接口，例如将原来的 
init_module 替换为 kmod_module_insert_module()，
delete_module 替换为 kmod_module_remove_module()

从 github 上的 commit 记录来看，该公司的 Lucas De Marchi 是最活跃的，他的 github 主页在 https://github.com/lucasdemarchi
另一个叫 Dave Reisner (falconindy) 也是经常提交代码的开发者，他的主页在 https://github.com/falconindy

不过这个项目代码的最近一次更新是2012年5月16日，近半年似乎不怎么活跃。

### 1.6 软件包与可替代软件包对比分析

  对比                应用领域                   采用协议      特点
  ----------------- ------------------------- ----------  ---------------------------
  module-init-tools  2.6内核                    GPLv2       简单，直接系统调用，无库接口
  kmod               3.0内核                    GPLv2       采用 libkmod 接口实现          
  libkmod            二次开发软件包               LGPLv2.1    libkmod 是 kmod 项目的一部分      

2. 软件包与发行版的关系
-----------------------

本小节需要介绍和阐述软件包在不同发行版中的名称、功能、运行环境的异同，除了正文描述以外，最好填下表以便更清晰，建议不超过1页。

  -----------------------------------------------------------------------------------------------------------------
  发行版名称及版本号        软件包在该发行版中的名称    该软件包的版本      该软件包的安装
  -------------------- ----------------------- ---------------- ------------------------------------------------
  Ubuntu 10.04         module-init-tools          3.11.1           sudo apt-get install module-init-tools

  Fedora 17            module-init-tools          3.16-5.fc17      yum install module-init-tools

  OpenSUSE 12.2        module-init-tools          3.15             rpm -ivh module-init-tools-3.15-3.6.1.x86_64.rpm
                                                                   zypper install module-init-tools
  -----------------------------------------------------------------------------------------------------------------

3. 软件包的功能、设计架构和接口使用说明
---------------------------------------

### 3.1 软件包的功能说明

该软件包中主要包含的程序主要可以分为2个功能部分，包括： 
- insmod/rmmod/lsmod 
	常用的插入内核模块，卸载内核模块，列出已加载模块
	
- modinfo/depmod/modprobe 
	列出模块信息，创建模块依赖关系文件，自动加载相关的模块

使用和编译该软件包的主要步骤是

	tar -zxvf module-init-tools-3.15.tar.gz
	./configure
	make 
	make install
	./generate-modprobe.conf /etc/modprobe.conf

### 3.2 软件包的设计架构

    此小节建议通过框图和文字说明软件包的内部设计结构，最多1页即可。

该软件包的程序设计架构非常清晰，围绕向上提供的6个命令，共包含6个主要的模块：

* insmod.[c]
	- 依赖于 util 模块

* rmmod.[c]
	- 依赖于 util, logging 模块

* lsmod.[c]
	- 依赖于 /proc/modules 文件

* modinfo.[c]
	- 依赖于 util, logging, elfops, zlibsupport 模块

* depmod.[ch]
	- 依赖于 util, zlibsupport, logging, index, elfops, tables, config_filter 模块

* modprobe.[c]
	- 依赖于 util, zlibsupport, logging, index, elfops, list, config_filter 模块
	
* elfops.[ch]
	- 依赖于 depmod, util, zlibsupport, logging, tables 模块
	
* tables.[ch]
	- 依赖于 struct module (depmod.h), util 模块	

* index.[ch]
	- 依赖于 util, logging 模块
	
* config_filter.[ch]
	- 依赖于 util 模块

* zlibsupport.[ch]
	- 依赖于 logging 模块
	
* util.[ch]
	- 依赖于 logging 模块
	
* logging.[ch]
	- 依赖关系 无

### 3.3 软件包的接口说明

    建议这部分最多写3页，如果接口很多，挑最重要的接口写2-3页即可，否则工作量将会非常大，不能在本任务的经费支持范围之内。
    
从底层模块的接口分析：

#### 模块接口说明

* logging 模块接口
	- 提供 NOFAIL 宏
	- 提供打印不同级别信息的接口 info()/warn()/error()/fatal()
	
关键代码

	#define NOFAIL(ptr)  do_nofail((ptr), __FILE__, __LINE__, #ptr)
	
	#define nofail_asprintf(ptr, ...)				\
		do { if (asprintf((ptr), __VA_ARGS__) < 0) 		\
			do_nofail(NULL, __FILE__, __LINE__, #ptr);	\
		} while(0)
	
	static inline void *do_nofail(void *ptr, const char *file, int line, const char *expr)
	{
		if (!ptr) {
			fatal("Memory allocation failure %s line %d: %s.\n",
			      file, line, expr);
		}
		return ptr;
	}
	
	
* utils 模块接口
	- 提供常用的一些函数接口和宏定义，例如 my_basename(), streq(), strstarts()

关键代码
	
	char *my_basename(const char *path);	
	void filename2modname(char *modname, const char *filename);

	#define streq(a,b) (strcmp((a),(b)) == 0)
	#define strstarts(a,start) (strncmp((a),(start), strlen(start)) == 0)

	
* zlibsupport 模块接口
	- 提供 grab 文件接口，将文件内容（可能是压缩后的）映射到内存缓冲区 buffer
	- 需要用到 zlib 库的支持
	
关键代码
	
	/* Grab file.  Decompresses if that is supported.  Returns NULL on error. */
	extern void *grab_file(const char *filename, unsigned long *size);
	extern void *grab_fd(int fd, unsigned long *size);
	
	/* Free it up. */
	extern void release_file(void *data, unsigned long size);
	

* config_filter 模块接口
	
关键代码
		
	/* returns 0 if the name matches a well-known backup pattern */
	int config_filter(const char *name);

* elfops 模块接口
	- 通过对 ELF 特定格式文件的 grab 接口
	- 提供对于32位和64位机器上 ELF 文件的兼容处理
		
关键代码
  
	struct elf_file *grab_elf_file(const char *pathname);
	void release_elf_file(struct elf_file *file);

* tables 模块接口

* index 模块接口

#### 命令说明

* insmod 命令
	- 通过系统调用 init_module，完成内核模块的插入
	- 系统调用之后，会依次调用 sys_init_module -> load_module 来完成核心的加载功能
	
* rmmod 命令
	- 通过系统调用 delete_module，完成内核模块的卸载
	- 系统调用之后，会依次调用 sys_delete_module -> free_module 来完成核心的卸载功能

* lsmod 命令
	- 通过分析 /proc/modules 文件，列出已经加载的模块名称
	- 主要是使用 strtok 函数，对 /proc/modules 文件的输出信息进行解析

* modinfo 命令
	- 通过分析内核模块文件的 ELF 格式，得出该内核模块的相关信息，例如作者，版本，协议等
	- 核心函数 grab_module -> grab_elf_file & grab_file -> 调用 elfops 模块接口

* depmod 命令
	- 创建一个模块的依赖关系列表，写入到同一个路径下的modules.dep文件。

* modprobe 命令
	- 根据depmod所产生的依赖关系，决定要载入哪些模块。若在载入过程中发生错误，在modprobe会卸载整组的模块。
	

4. 软件包漏洞分析
-----------------
这部分任务书的要求是“针对子任务“Linux、Android操作系统安全漏洞检测”中发现的通用基础软件包安全漏洞的确认分析，包括漏洞产生的原因、漏洞可重现条件及相应的测试用例, 并可进行复现和验证；”，但是此部分待定，暂时不要去写，将根据后续情况经过大家的讨论之后再写。因为漏洞的检测有赖另外一个项目（“Linux、Android操作系统安全漏洞检测”）给出，如果漏洞非常多，我们可能需要分出重要性，分类进行处理。

-  待定

5. 软件包的依赖关系
-------------------
这部分请用文字和图说明该软件包的运行还需依赖哪些其他的软件包，其依赖关系不仅要通过阅读文档、代码来获得，更要通过实际的运行验证来获得依赖关系的证据，这一点请慎重处理。

安装依赖于 
-  Bash, Binutils, Bison, Coreutils, Diffutils, Flex, GCC, Glibc, Grep, M4, Make, Sed


6. 软件包安全性及特别需要说明的问题
-----------------------------------
本部分请撰写不能包括在上述章节中的其他重要分析成果，特别是和系统安全有关的内容，如果没有请填写“无”。

-   无

7. 软件包分析成果验证方法
-------------------------
根据任务书，“分析成果进行验证，包括但不限于制作安装包安装测试验证依赖关系、软件包接口测试脚本、可替代软件包兼容性测试验证等。”，具体如何验证后续还有待通过研讨会大家现成讨论确定，但需要在此小节给出进行验证的具体方法和流程的描述，此部分后续在写，暂时空着即可。

-   待定

8. 参考资料
-----------

Linux 可加载内核模块剖析：
<https://www.ibm.com/developerworks/cn/linux/l-lkm/>

各版本 module-init-tools 软件包下载地址：
<http://rpmfind.net/linux/rpm2html/search.php?query=module-init-tools>

维护者博客上关于 libkmod 替换 module-init-tools 声明：
<http://www.jonmasters.org/blog/2011/12/20/libkmod-replaces-module-init-tools/>

kmod 的官方说明：
<http://www.politreco.com/2011/12/announce-kmod-1/>

关于 modutiles 的资料:
<ftp://ftp.kernel.org/pub/linux/utils/kernel/modutils/>
<http://man.chinaunix.net/linux/lfs/htmlbook/appendixa/modutils.html>
<http://download.gna.org/pdbv/demo_html/demo_2.0.10/package/modutils_2.4.26-1.2.html>

The Linux Kernel Module Programming Guide 内核模块编程指南
<http://tldp.org/LDP/lkmpg/2.6/html/lkmpg.html>

