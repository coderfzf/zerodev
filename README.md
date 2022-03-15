# go_zero_dev
一个基于 `docker` 的 `go-zero` 本地开发运行环境。


## 使用
### 1. 按需修改 .env 配置
 ```bash
    cp .env.example  .env
 ```

### 2.启动服务
- 启动全部服务
```bash
docker-compose up -d
```
- 按需启动部分服务
```bash
docker-compose up -d etcd golang mysql redis
```

### 3.运行代码
将项目代码放置 `CODE_PATH_HOST` 指定的本机目录，进入 `golang` 容器，运行项目代码。
~~~bash
docker exec -it golang sh
~~~