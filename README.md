# Code::Stats client written in nim
Nimで作った、Code::StatsにPulseを送るコマンド。
チートになるので、ご利用は計画的に。

Pulseの送信に1~2秒程度かかるので、別プロセスなどで呼ばないと、多分しんどい。

## インターフェース

```bash
$ codestats LANGUAGE XP
```

Example
```bash
$ codestats "Fish(Terminal)" 10
```

## Compile
OpenSSLを使うため、
```
$ nimble build -d:ssl
```
のはずだけど、Windowsだと
```
$ nimble build -d=ssl
```

## TODO
```bash
$ codestats "Fish(Terminal)" 20 API_KEY
```
API_KEYがハードコードされているのは問題なので、コマンドライン引数か環境変数にする

呼び出し間隔を開けて、Code::Stats側に負荷がかかりすぎないようにする。呼び出しごとにプロセスは終了するので、ファイルか何かに状態を書き出さないと無理。あるいはこれも、環境変数を使って解決するほうが良いか？

## SSLについて

httpsを使うため、httpclientに" https://codestats.net/ "を渡す。
Windowsの場合、cacert.pemがないとエラーになるので、curlで配布されているpemを利用している。

>## SSL
>In order to use the SSL procedures defined in this module, you will need to compile your application with the -d:ssl flag. See the newContext procedure for additional details.

>## SSL on Windows
>On Windows the SSL library checks for valid certificates. It uses the cacert.pem file for this purpose which was extracted from https://curl.se/ca/cacert.pem. Besides the OpenSSL DLLs (e.g. libssl-1_1-x64.dll, libcrypto-1_1-x64.dll) you also need to ship cacert.pem with your .exe file.
https://nim-lang.org/docs/net.html
