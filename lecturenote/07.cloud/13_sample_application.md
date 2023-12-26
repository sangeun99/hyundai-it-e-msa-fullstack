## Chapter 13. 샘플 애플리케이션 작동하기

![image](https://github.com/sangeun99/hyundai-it-e-java-fullstack/assets/63828057/665a3c55-74c9-4080-98ea-78ff1d4046c3)


### OS 설정과 미들웨어 설치

- `ssh web01` , `ssh web02` 접속
- 미들웨어 설치
    
    ```bash
    sudo yum install git gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel libffi-devel libxml2 libxslt libxml2-devel libxslt-devel sqlite-devel libcurl-devel mysql mysql-devel ImageMagick
    ```
    
    ```bash
    sudo amazon-linux-extras install nginx1
    ```
    
- 엔진엑스 설정
    - 샘플 애플리케이션을 실행하는 루비 온 레일즈와 연동되도록 설정
        
        ```bash
        sudo vi /etc/nginx/conf.d/rails.conf
        ```
        
        ```
        upstream puma {
                server unix:///var/www/aws-intro-sample/tmp/sockets/puma.sock;
        }
        
        server {
                listen 3000 default_server;
                listen [::]:300 default_server;
                server-name puma;
        
                location ~^/assets/ {
                        root /var/www/aws-intro-sample/public;
                }
        
                location / {
                        proxy_read_timeout 300;
                        proxy_connect_timeout 300;
                        proxy_redirect off;
                        proxy_set_header Host $host;
                        proxy_set_header X-Forwarded-Proto $http_x_forwarded_proto;
                        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                        proxy_pass http://puma;
                }
        }
        ```
        
- deploy 사용자 생성
    
    ```bash
    sudo adduser deploy
    ```
    
- 애플리케이션을 작동시킬 디렉터리
    
    ```bash
    sudo mkdir -p /var/www
    sudo shown deploy:deploy /var/www
    ```
    

### 샘플 애플리케이션 설치

- 루비 온 레인즈 환경 설정 이슈로 샘플 애플리케이션은 그냥 넘어가기로 함