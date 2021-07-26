FROM golang:1.5-alpine 
WORKDIR /go/src/github.com/kubernetes-sigs/scheduler-plugins
COPY . .
ENV GOARCH amd64 
ENV GOOS linux 
RUN go build -o kube-scheduler main.go

FROM golang:1.5-alpine 
COPY --from=0 /go/src/github.com/kubernetes-sigs/scheduler-plugins/kube-scheduler /usr/local/bin/kube-scheduler
