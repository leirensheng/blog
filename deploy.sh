# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
# npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME

# git init
# git add -A
# git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# 如果发布到 https://<USERNAME>.github.io/<REPO>
echo 'b.xugaoyi.com' > CNAME
if [ -z "$GITHUB_TOKEN" ]; then
  msg='deploy'
  githubUrl=git@github.com:leirensheng/blog.git
else
  msg='来自github actions的自动部署'
  githubUrl=https://xugaoyi:${GITHUB_TOKEN}@github.com/leirensheng/blog.git
  git config --global user.name "leirensheng"
  git config --global user.email "leirensheng@163com"
fi
# git init
# git add -A
# git commit -m "${msg}"
git push -f $githubUrl master:gh-pages # 推送到github

# git push -f git@github.com:leirensheng/blog.git master:gh-pages

cd -