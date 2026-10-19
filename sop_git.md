# 配置git
1、打开git bash
    git config --global user.name "用户名"
    git config --global user.email "email地址"
    git config --global --list #验证设置

# git配置github ssh
1、ssh-keygen -t rsa -C "email地址" #生成ssh密钥（按回车键完成）
    生成私钥id_rsa和公钥id_rsa.pud，将公钥内容复制并粘贴至github设置add ssh key内
2、ssh -T git@github.com 验证连接

# 创建仓库并上传github
1、github网站中新建仓库
2、打开git bash
    初始化本地仓库：git init -b main
3、添加并提交
    git add .
    git commit -m "备注修改内容"
4、关联远程仓库
    git remote add origin 新建仓库地址，如"git@github.com:wenji-cn/notes.git"
5、推送到github
    git push -u origin main
    注：-u参数会将本地main分支与远程main分支关联，之后只需要输入git push即可

# 修改并提交
1、查看修改哪些文件
    git status
    git diff
2、把修改加入暂存区
    git add . #添加所有修改
    git add src/main.py #添加指定文件
3、提交到本地仓库
    git commit -m "备注修改内容"
4、推送到github
    git push #创建提交时已经通过git push -u origin main关联远程仓库，所以直接git push即可
注：多人协作请先git pull拉取代码

# 修改撤销
1、没推送到远程仓库（只在本地）
    git reset
2、已推送到远程仓库
    git revert
