FROM gcr.io/k8s-staging-scheduler-plugins/kube-scheduler:v20210406-v0.19.8-15-g896444c-amd64

RUN echo "http://mirrors.aliyun.com/alpine/v3.11/main" > /etc/apk/repositories \
&& apk add --no-cache curl tzdata bash\
&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Asia/Shanghai" > /etc/timezone \
&& apk del tzdata \
&& rm -rf /var/cache/apk/* \
&& rm -rf /root/.cache \
&& rm -rf /tmp/*
