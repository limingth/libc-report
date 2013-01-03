Module-init-tools 软件包分析
============================


1. 软件包基本信息
-----------------

### 1.1 软件包开发背景与目标
module-init-tools 软件包主要是为了能够在用户空间向Linux提供加载内核模块所需要使用的工具。
这个软件包主要是用于2.6系列的内核，最早是为了替换 modutils（例如 modprobe/insmod/modinfo 等）

该软件包中主要包含的程序主要可以分为2个功能部分，包括： 
- insmod/rmmod/lsmod 
	常用的插入和卸载内核模块，列出已加载模块
	
- modinfo/depmod/modprobe 
	列出模块信息，创建模块依赖关系文件/自动加载相关的模块

使用和编译该软件包的主要步骤是

	tar -zxvf module-init-tools-3.15.tar.gz
	./configure
	make 
	make install
	./generate-modprobe.conf /etc/modprobe.conf
    
### 1.2 软件包维护者信息
该项目的项目主页在 https://modules.wiki.kernel.org
从软件包的 AUTHORS 文档中找到，最主要的维护者是 Jon Masters <jcm@jonmasters.org>
Jon Masters 是从 3.3 版本之后开始参与改软件包的。
其中比较积极的，对于软件包版本升级更新作出较多贡献的开发人员还有
Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Marco d'Itri <md@linux.it>
Andreas Robinson <andr345@gmail.com>

项目开发人员的邮件列表： linux-modules@vger.kernel.org

### 1.3 软件包所采用的版权协议
该软件包所采用的版权协议是GPL协议。

### 1.4 软件包的演化历史
该软件包的下载地址是 http://www.kernel.org/pub/linux/utils/kernel/module-init-tools/
从这个下载地址上能够看到，最早的版本记录是该软件包的3.0版本，时间是2007年9月5日推出的。
最后一个能够下载到的版本是3.15版本，时间是2011年1月2日推出的。

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

在此之后，这个软件包将会被一个新工具所替代，这个新工具将会基于 libkmod。

### 1.5 类似的可替代软件包简介overseen

### 1.6 软件包与可替代软件包对比分析

  对比          应用领域                         采用协议   特点
  ------------- -------------------------------- ---------- ---------------------------
  glibc         桌面领域，GNU/Linux操作系统       LGPL       功能全面
  uClibc        嵌入式领域，uCLinux操作系统       LGPL       主要用在uCLinux系统中
  Newlib        桌面领域，Cygwin系统              LGPL       具有独特的设计，可移植性强
  BSD libc      桌面领域，FreeBSD操作系统         BSD        主要用在BSD系统中
  Bionic libc   手机嵌入式领域，Android操作系统   BSD        主要用在Android系统中
  dietlibc      各种对体积尺寸要求严格的领域     GPL2       设计非常精巧，适合学习
  EGLIBC        桌面领域，Ubuntu操作系统          LGPL       主要用在Ubuntu系统中

2. 软件包与发行版的关系
-----------------------

本小节需要介绍和阐述软件包在不同发行版中的名称、功能、运行环境的异同，除了正文描述以外，最好填下表以便更清晰，建议不超过1页。

  -----------------------------------------------------------------------------------------------------------------
  发行版名称及版本号   软件包在该发行版中的名称   该软件包的版本   该软件包的安装
  -------------------- -------------------------- ---------------- ------------------------------------------------
  Ubuntu 10.04         EGLIBC                     2.11.1           sudo apt-get install libc6-dev \
                                                                   sudo apt-get install glibc-doc

  Redhat9              glibc                      2.3.2            rpm -Uvh glibc-kernheaders-2.4-8.34.i386.rpm \
                                                                   rpm -Uvh glibc-headers-2.3.2-95.3.i386.rpm \
                                                                   rpm -Uvh glibc-derel-2.3.2-95.3.i386.rpm

  Fedora               glibc                      2.15-23.fc17     yum install glibc-devel.i686 glibc.i686

  OpenSUSE             glibc                      2.3.3            rpm -ivh glibc-devel-2.3.3-98.28.i586.rpm
  -----------------------------------------------------------------------------------------------------------------

3. 软件包的功能、设计架构和接口使用说明
---------------------------------------

### 3.1 软件包的功能说明

glibc 是Linux系统中最底层的库函数接口，其他的运行库都会依赖于这个库。
它除了封装了Linux系统调用，同时也提供了一些其他必要功能，主要包括：

-   字符串处理 string
-   信号处理 signal
-   本地化 locale
-   数学库 math
-   线程库 linuxthreads
-   动态内存管理 malloc
-   动态加载器 elf
-   C 标准库 libc

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

* tables 模块接口

* elfops 模块接口
	- 通过对 ELF 特定格式文件的 grab 接口
	- 提供对于32位和64位机器上 ELF 文件的兼容处理
		
关键代码

	struct elf_file *grab_elf_file(const char *pathname);
	void release_elf_file(struct elf_file *file);

* index 模块接口



* insmod 模块
	init_module

* rmmod 模块
	delete_module	

4. 软件包漏洞分析
-----------------

这部分任务书的要求是“针对子任务“Linux、Android操作系统安全漏洞检测”中发现的通用基础软件包安全漏洞的确认分析，包括漏洞产生的原因、漏洞可重现条件及相应的测试用例,
并可进行复现和验证；”，但是此部分待定，暂时不要去写，将根据后续情况经过大家的讨论之后再写。因为漏洞的检测有赖另外一个项目（“Linux、Android操作系统安全漏洞检测”）给出，如果漏洞非常多，我们可能需要分出重要性，分类进行处理。

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

GNU libc 项目主页： <http://www.gnu.org/software/libc/>

GNU libc 参考手册： <http://www.gnu.org/software/libc/manual/>
<http://www.gnu.org/software/libc/manual/pdf/libc.pdf>
