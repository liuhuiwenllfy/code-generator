# 指定基础镜像，用于后续的指令构建。
FROM adoptopenjdk/openjdk8-openj9:alpine-slim
# 添加镜像的元数据，使用键值对的形式。
LABEL authors=刘凌枫羽工作室
# 声明容器运行时监听的特定网络端口。
EXPOSE 8051
# 设置后续指令的工作目录。
WORKDIR /app
# 将文件或目录复制到镜像中。
ADD code-generator.jar /app/app.jar
# 在构建过程中在镜像中执行命令。
# 它将echo命令的输出写入到/etc/apk/repositories文件中
# 它将echo命令的输出追加到/etc/apk/repositories文件的末尾
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo 'https://mirrors.aliyun.com/alpine/v3.6/main' > /etc/apk/repositories \
&& echo 'https://mirrors.aliyun.com/alpine/v3.6/community' >> /etc/apk/repositories \
&& apk update \
&& apk upgrade \
&& apk --no-cache add ttf-dejavu fontconfig \
&& rm -rf /var/cache/apk/* # 清理 APK 缓存
# 指定容器创建时的默认命令。（可以被覆盖）
CMD ["java", "-jar", "app.jar"]