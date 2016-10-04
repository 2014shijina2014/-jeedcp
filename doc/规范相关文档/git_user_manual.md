# git入门手册

>作者：alexzhu

>撰写日期：2013/11/25

### Git的介绍

Git是一个开源的分布式版本控制系统，用以有效、高速的处理从很小到非常大的项目版本管理。

### Git的安装
#### git windows安装
+ 下载tortoisegit
+ go http://download.tortoisegit.org/tgit/
+ 下载msysgit
+ go http://git-for-windows.github.io
+ 首先安装TortoiseGit，接着安装msysGit，安装过程中的一些选项都可以默认！
+ go tortoisegit安装目录/bin,找到puttygen.exe,运行puttygen.exe,生成公钥并且拷贝将其设置到gitlab服务的profile，同时导出并且保存私钥private.ppk;
+ 设置tortoisegit
        + url: git@192.168.1.102:_code_doc/oft_doc.git 
        + 用户名密码
        + 设置私钥：即private.ppk文件

#### git unix安装

````sudo apt-get install git-core #linux````
> 迁移
``` 假设原来的GitLab 位于A服务器，现在在B服务上已经装好了Gitlab。

1. 通过scp命令将A的/home/git/repositories/目录下的所有内容复制到B上对应位置

这个时间比较长

2. 到B服务器上，进入/home/git/gitlab目录后，运行下面的命令：

sudo -u git -H bundle exec rake gitlab:import:repos RAILS_ENV=production

完成后，打开B服务器上的gitlab网站，代码有了，wiki有了。issue和用户没有。还要手动建。

别忘了用下面的命令检测：

sudo -u git -H bundle exec rake gitlab:check RAILS_ENV=production
```

### gitlab的初始化和配置
### 配置gitlab

#### 生成key

>````ssh-keygen -t dsa -C "zhu.gongping@xxx.com"````

>````cat ~/.ssh/id_rsa.pub```` 

>````拷贝cat输出结果粘贴至至gitlab.corp.tower.com```` 

+ 登录
+ 点击 Profile Setting->SSH Key->Add SSH Key
+ 粘贴拷贝内容至key框中
+ 点击Add key

#### 配置gitlab
>````git config --global user.name "zhu.gongping" #配置本地git账户的姓名````

>````git config --global user.email "zhu.gongping@xxx.com" #配置本地git账户的邮件````

### 初始仓库
>````git clone git@gitlab.corp.tower.com:site/yyy yyy #克隆远程库的代码到本地的yyy目录````

### 创建分支

取回远程库上的分支,并创建对应的本地分支(假设:远程分支号pmt16825)

>````git fetch origin #取回远程origin库上的分支和更新````

>````git checkout -b lpmt16825 origin/pmt16825 #取回远程origin库pmt16825分支的代码到本地,并生成本地lpmt16825分支````

>````git checkout lpmt16825 #切换本地工作的分支到lpmt16825````

### Coding
>````.... (假设:更改readme文件)````

### 提交代码到本地仓库和远程仓库
>````git add readme #添加修改到git的暂存区````

>````git commit -m "修改了readme文件" #添加修改到git的本地仓库````  

>````git push origin lpmt16825:pmt16825 #将本地lpmt16825的代码更新到远程origin仓库的pmt16825分支````

### 合并分支到主线(假设:当前分支是在lpmt16825)
>````git rebase origin/master #将主线上最新的代码更新到当前分支````

>注1: 这里进行了rebase,可以避免后面master分支中````merge lpmt16825````时产生冲突.

>注2: 如果当前分支和主线对同一个文件进行了修改时,就有可能产生冲突,要先用````git mergetool````解决冲突,然后再用````git rebase --continue````继续进行rebase

>注3: 这里也可以利用````git merge````获取主线的最新更新,但是这样会导致后面主线````merge````了当前分支之后,提交线会变得很难看,不便于以后的代码追踪

>````git push origin lpmt16825:pmt16825 -f #强制更新远程库````

>````git checkout master #切换到master分支````

>````git merge lpmt16825 #合并lpmt16825到master分支````

>````git push origin master #把本地master推送到远程仓库````

### Git的一些基本命令
>````git remote [-v] #显示所有的远程仓库````

>````git remote add <name> <url> #添加远程仓库````

>````git remote rm <name> #删除相应的远程仓库````

>````git branch [-v] #显示所有的本地分支````

>````git branch [-r] #显示所有的远程分支````

>````git branch <branchname> #创建相应的本地分支````

>````git branch [-d|D] <branchname> #删除相应的本地分支````
        
>````git checkout <branchname> #切换到相应分支````

>````git chechout [-b] <branchname> <repository>/<branchname> #创建对应的本地分支,并获取对应远程分支的代码````

>````git add [filename | .] #添加相应文件到暂存区````

>````git commit [-m] <comment> #将暂存区的更改添加到本地仓库````

>````git log #列出当前分支的提交记录````

>````git push <repository> <local branchname>:<branchname> #将本地分支的内容推送到对应的远程分支,如果远程分支不存在则创建对应的远程分支````

>````git push <repository> :<branchname> # 删除远程仓库分支````

>````git merge <branchname> #合并对应分支到当前分支````

>````git rebase <branchname> #将对应分支的变更衍生到当前分支````

### git的一些工具

>gitg 一款图形化的git工具

>tig 一款命令行的git工具


### rebase和merge的区别
>#### 对分支线的影响
>假设一个git本地库的分支如下:

>![branch_list](http://git.corp.anjuke.com/_code_java/soafw/raw/master/git/images/branch_list.jpg)

>上面数字的顺序代表着提交的时间顺序


>做如下操作

>>````git checkout branch1````

>>````git rebase master````

>branch1中的提交记录为

>>![branch_rebase](http://git.corp.anjuke.com/_code_java/soafw/raw/master/git/images/branch_rebase.jpg)

>做如下操作

>>````git checkout branch2````

>>````git merge master````

>branch1中的提交记录为

>>![branch_merge](http://git.corp.anjuke.com/_code_java/soafw/raw/master/git/images/branch_merge.jpg)

>由上面的结果可以得知
>>git rebase是按照分支内部的提交顺序来重新组织提交顺序

>>git merge是按照提交的时间顺序来重新组织提交顺序

>>git merge会新增一个提交记录这次合并

>所以在平时的开发中,需要获取主线的最新代码时,请使用rebase而不是merge,这样使得代码回滚变得很轻松

### Git命令参考手册(文本版)

git init                                                  # 初始化本地git仓库（创建新仓库）

git config --global user.name "xxx"                       # 配置用户名

git config --global user.email "xxx@xxx.com"              # 配置邮件

git config --global color.ui true                         # git status等命令自动着色

git config --global color.status auto

git config --global color.diff auto

git config --global color.branch auto

git config --global color.interactive auto

git clone git+ssh://git@192.168.53.168/VT.git             # clone远程仓库

git status                                                # 查看当前版本状态（是否修改）

git add xyz                                               # 添加xyz文件至index

git add .                                                 # 增加当前子目录下所有更改过的文件至index

git commit -m 'xxx'                                       # 提交

git commit --amend -m 'xxx'                               # 合并上一次提交（用于反复修改）

git commit -am 'xxx'                                      # 将add和commit合为一步

git rm xxx                                                # 删除index中的文件

git rm -r *                                               # 递归删除

git log                                                   # 显示提交日志

git log -1                                                # 显示1行日志 -n为n行

git log -5

git log --stat                                            # 显示提交日志及相关变动文件

git log -p -m

git show dfb02e6e4f2f7b573337763e5c0013802e392818         # 显示某个提交的详细内容

git show dfb02                                            # 可只用commitid的前几位

git show HEAD                                             # 显示HEAD提交日志

git show HEAD^                                            # 显示HEAD的父（上一个版本）的提交日志 ^^为上两个版本 ^5为上5个版本

git tag                                                   # 显示已存在的tag

git tag -a v2.0 -m 'xxx'                                  # 增加v2.0的tag

git show v2.0                                             # 显示v2.0的日志及详细内容

git log v2.0                                              # 显示v2.0的日志

git diff                                                  # 显示所有未添加至index的变更

git diff --cached                                         # 显示所有已添加index但还未commit的变更

git diff HEAD^                                            # 比较与上一个版本的差异

git diff HEAD -- ./lib                                    # 比较与HEAD版本lib目录的差异

git diff origin/master..master                            # 比较远程分支master上有本地分支master上没有的

git diff origin/master..master --stat                     # 只显示差异的文件，不显示具体内容

git remote add origin git+ssh://git@192.168.53.168/VT.git # 增加远程定义（用于push/pull/fetch）

git branch                                                # 显示本地分支

git branch --contains 50089                               # 显示包含提交50089的分支

git branch -a                                             # 显示所有分支

git branch -r                                             # 显示所有原创分支

git branch --merged                                       # 显示所有已合并到当前分支的分支

git branch --no-merged                                    # 显示所有未合并到当前分支的分支

git branch -m master master_copy                          # 本地分支改名

git checkout -b master_copy                               # 从当前分支创建新分支master_copy并检出

git checkout -b master master_copy                        # 上面的完整版

git checkout features/performance                         # 检出已存在的features/performance分支

git checkout --track hotfixes/BJVEP933                    # 检出远程分支hotfixes/BJVEP933并创建本地跟踪分支

git checkout v2.0                                         # 检出版本v2.0

git checkout -b devel origin/develop                      # 从远程分支develop创建新本地分支devel并检出

git checkout -- README                                    # 检出head版本的README文件（可用于修改错误回退）

git merge origin/master                                   # 合并远程master分支至当前分支

git cherry-pick ff44785404a8e                             # 合并提交ff44785404a8e的修改

git push origin master                                    # 将当前分支push到远程master分支

git push origin :hotfixes/BJVEP933                        # 删除远程仓库的hotfixes/BJVEP933分支

git push --tags                                           # 把所有tag推送到远程仓库

git fetch                                                 # 获取所有远程分支（不更新本地分支，另需merge）

git fetch --prune                                         # 获取所有原创分支并清除服务器上已删掉的分支

git pull origin master                                    # 获取远程分支master并merge到当前分支

git mv README README2                                     # 重命名文件README为README2

git reset --hard HEAD                                     # 将当前版本重置为HEAD（通常用于merge失败回退）

git rebase

git branch -d hotfixes/BJVEP933                           # 删除分支hotfixes/BJVEP933（本分支修改已合并到其他分支）

git branch -D hotfixes/BJVEP933                           # 强制删除分支hotfixes/BJVEP933

git ls-files                                              # 列出git index包含的文件

git show-branch                                           # 图示当前分支历史

git show-branch --all                                     # 图示所有分支历史

git whatchanged                                           # 显示提交历史对应的文件修改

git revert dfb02e6e4f2f7b573337763e5c0013802e392818       # 撤销提交dfb02e6e4f2f7b573337763e5c0013802e392818

git ls-tree HEAD                                          # 内部命令：显示某个git对象

git rev-parse v2.0                                        # 内部命令：显示某个ref对于的SHA1 HASH

git reflog                                                # 显示所有提交，包括孤立节点

git show HEAD@{5}

git show master@{yesterday}                               # 显示master分支昨天的状态

git log --pretty=format:'%h %s' --graph                   # 图示提交日志

git show HEAD~3

git show -s --pretty=raw 2be7fcb476

git stash                                                 # 暂存当前修改，将所有至为HEAD状态

git stash list                                            # 查看所有暂存

git stash show -p stash@{0}                               # 参考第一次暂存

git stash apply stash@{0}                                 # 应用第一次暂存

git grep "delete from"                                    # 文件中搜索文本“delete from”

git grep -e '#define' --and -e SORT_DIRENT

git gc

git fsck
