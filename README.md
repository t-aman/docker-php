# 概要

#### Dockerイメージ（apache 2.4 - php 7.3）

    PHP7.3が動作するDockerfileです。

#### 動作環境

    Docker環境で実行します。

# 利用方法

#### Dockerfile から起動する場合
    - 1.ビルド
        $ docker build -t php 【Dockerfileのパス】
        
        例）
        $ docker build -t php d:/work/docker-php/
    
    - 2.コンテナ起動
        $ docker run -d -p 80:80 --name www php

        補足）ホスト側ファイルを利用する場合　※≪その他≫参照
        $ docker run -d -p 80:80 -v //d/docker-php:/var/www/html/ --name www php

    - 3.動作確認
        ブラウザから接続　http://192.168.99.100/
        
        補足）サーバのIPアドレスはDockerで確認
        $ docker-machine ip

    - 4.コンテナ停止
        $ docker rm -f www

#### 公開イメージから起動する場合
    - 1.コンテナ起動
        $ docker run -d -p 80:80 --name www nasca/php

        補足）ホスト側ファイルを利用する場合　※≪その他≫参照
        $ docker run -d -p 80:80 -v //d/docker-php:/var/www/html/ --name www nasca/php

    - 2.動作確認
        ブラウザから接続　http://192.168.99.100/
        
        補足）サーバのIPアドレスはDockerで確認
        $ docker-machine ip

    - 3.コンテナ停止
        $ docker rm -f www


# その他

#### 共有フォルダをコンテナから利用する場合

    $ docker run -d -p 80:80 -v 【ホスト共有フォルダ】:/var/www/html/ --name www php

    例）
    $ docker run -d -p 80:80 -v //d/docker-php:/var/www/html/ --name www php

#### 共有フォルダの作成方法

    仮想マシンの設定で共有フォルダの設定
    | ホストOS | ゲストOS定義 | 
    | D:\WORK | D_DRIVE |

    Dockerで設定
    $ docker-machine ssh default 'sudo mkdir -p /d'
    $ docker-machine ssh default 'sudo mount -t vboxsf -o uid=0,gid=0 D_DRIVE /d'

    「D:\WORK\docker-php」が利用可能になる
