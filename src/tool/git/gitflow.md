# git flow
## 安装

```bash
brew install git-flow-avh
```

## 使用

![命令](https://cdn.jsdelivr.net/gh/mikusugar/PictureBed@master/uPic/OZH3W0.jpg)

### 初始化

```bash
git flow init 
```

### 特性

#### 增加新特性

新特性的开发是基于 'develop' 分支的。

通过下面的命令开始开发新特性：

```bash
git flow feature start MYFEATURE
```

这个操作创建了一个基于'develop'的特性分支，并切换到这个分支之下。

#### 完成新特性

完成开发新特性。这个动作执行下面的操作.

- 合并 MYFEATURE 分支到 'develop'
- 删除这个新特性分支
- 切换回 'develop' 分支

```bash
git flow feature finish MYFEATURE
```

#### 发布新特性

发布新特性分支到远程服务器，所以，其它用户也可以使用这分支。

```bash
git flow feature publish MYFEATURE
```

#### 取得一个发布的新特性分支

取得其它用户发布的新特性分支，并签出远程的变更。

```bash
git flow feature pull origin MYFEATURE
```

使用下列命令追踪origin上的特性分支

```bash
git flow feature track MYFEATURE
```

### release

#### 准备release

它从 'develop' 分支开始创建一个 release 分支。

```bash
git flow release start RELEASE [BASE]
```

你可以选择提供一个 `[BASE]`参数，即提交记录的 sha-1 hash 值，来开启动 release 分支. 这个提交记录的 sha-1 hash 值必须是'develop' 分支下的。

#### 发布release

```bash
git flow release publish RELEASE
```

通过以下命令签出release版本的远程变更

```bash
git flow release track RELEASE
```

#### 完成release

完成 release 版本是一个大 git 分支操作。它执行下面几个动作：

- 归并 release 分支到 'master' 分支
- 用 release 分支名打 Tag
- 归并 release 分支到 'develop'
- 移除 release 分支

```bash
git flow release finish RELEASE
```

### 紧急修复

#### 开始紧急修复

```bash
git flow hotfix start VERSION [BASENAME]
```

VERSION 参数标记着修正版本。你可以从 [BASENAME]开始，`[BASENAME]`为finish release时填写的版本号

#### 完成紧急修复

当完成紧急修复分支，代码归并回 develop 和 master 分支。相应地，master 分支打上修正版本的 TAG。

```bash
git flow hotfix finish VERSION
```

## 参考

http://danielkummer.github.io/git-flow-cheatsheet/index.zh_CN.html