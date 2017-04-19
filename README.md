# toolbox
基于npm 构建的工具箱(toolbox)

* 将SCSS编译为CSS
```
npm install --save-dev node-sass

node-sass --output-style compressed -o dist/css src/scss

"scripts": {
  "scss": "node-sass --output-style compressed -o dist/css src/scss"
}
```

* 使用PostCSS Autoprefix 自动给 CSS 加前缀
```
npm install --save-dev postcss-cli autoprefixer

postcss -u autoprefixer -r dist/css/*

{
    "autoprefixer": "postcss -u autoprefixer --autoprefixer.browsers '> 5%, ie 9' -r dist/css/*"
}
```

* JavaScript 代码检查
```
npm i -D eslint
这行代码等效于：
npm install --save-dev eslint

使用 eslint 来设置一些运行代码的基本规则:
eslint --init

{
    "lint": "eslint src/js"
}
```


* 混淆压缩 JavaScript 文件
```
npm i -D uglify-js

uglifyjs src/js/*.js -m -o dist/js/app.js

{
      "uglify": "mkdir -p dist/js && uglifyjs src/js/*.js -m -o dist/js/app.js && uglifyjs src/js/*.js -m -c -o dist/js/app.min.js"
}
```

* 压缩图片
```
npm i -D imagemin-cli

"scripts": {
  ...
  "imagemin": "imagemin src/images dist/images -p",
}
```


* SVG精灵（Sprites）
```
npm i -D svgo svg-sprite-generator

"scripts": {
  ...
  "icons": "svgo -f src/images/icons && mkdir -p dist/images && svg-sprite-generate -d src/images/icons -o dist/images/icons.svg"
}

```

* 通过BrowserSync提供服务并且自动注入变更
```
npm i -D browser-sync


"scripts": {
  ...
  "serve": "browser-sync start --server --files 'dist/css/*.css, dist/js/*.js'"
}

```

### 任务分组

    . 将SCSS编译为CSS并自动添加浏览器前缀

    . 检查 和 混淆压缩 JavaScript

    . 压缩图片

    . 将SVG的文件夹转换为单个SVG文件

    . 启动本地服务并自动将更改注入连接到服务器的任何浏览器


* 合并 CSS 任务(预处理 Sass 和运行 Autoprefixer)
```
"scripts": {
  ...
  "build:css": "npm run scss && npm run autoprefixer"
}
```


* 合并 JavaScript 任务
```
"scripts": {
  ...
  "build:js": "npm run lint && npm run uglify"
}
```


* 合并剩余任务

```
"scripts": {
  ...
  "build:images": "npm run imagemin && npm run icons",
  "build:all": "npm run build:css && npm run build:js && npm run build:images",
}

```


### 监听变更

```
npm i -D onchange

"scripts": {
  ...
  "watch:css": "onchange 'src/scss/*.scss' -- npm run build:css",
  "watch:js": "onchange 'src/js/*.js' -- npm run build:js",
}

```


### 再添加一个监听(watch)命令来完成我们的npm scripts构建过程

```
npm i -D parallelshell

"scripts": {
  ...
  "watch:all": "parallelshell 'npm run serve' 'npm run watch:css' 'npm run watch:js'"
}


"scripts": {
  ...
  "postinstall": "npm run watch:all"
}


"scripts": {
  ...
  "serve": "browser-sync start --server --files 'dist/css/*.css, dist/js/*.js'",
  "watch:css": "onchange 'src/scss/*.scss' -- npm run build:css",
  "watch:js": "onchange 'src/js/*.js' -- npm run build:js",
  "watch": "npm-run-all --parallel serve watch:*"
}


"scripts" {
  ...
  "build:css": "npm run scss && npm run autoprefixer",
  "build:images": "npm run imagemin && npm run icons",
  "build:js": "npm run lint && npm run uglify",
  "build": “npm-run-all build:*"
}
```