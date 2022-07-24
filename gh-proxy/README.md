# [原项目gh-proxy](https://github.com/hunshcn/gh-proxy)

## 简介



***大量使用请自行部署，以上域名仅为演示使用。***

以下都是合法输入（仅示例，文件不存在）：

- 分支源码：https://github.com/hunshcn/project/archive/master.zip

- release源码：https://github.com/hunshcn/project/archive/v0.1.0.tar.gz

- release文件：https://github.com/hunshcn/project/releases/download/v0.1.0/example.zip

- 分支文件：https://github.com/hunshcn/project/blob/master/filename

- commit文件：https://github.com/hunshcn/project/blob/1111111111111111111111111111/filename

- gist：https://gist.githubusercontent.com/cielpy/351557e6e465c12986419ac5a4dd2568/raw/cmd.py



### Docker部署

```
docker run -d --name="gh-proxy-py" \
  -p 0.0.0.0:3651:80 \
  --restart=always \
  gindex/gh-proxy:latest
```





