// Copyright (c) 2021 Seiichi Ariga <seiichi.ariga@gmail.com>
// 
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

# Code::Stats client written in nim

## インターフェース

```bash
$ codestats LANGUAGE XP
```

Example
```bash
$ codestats "Fish(Terminal)" 10
```

TODO
```bash
$ codestats "Fish(Terminal)" 20 API_KEY
```

## SSLについて

httpsを使うため、httpclientに"https://codestats.net/"を渡す。
Windowsの場合、cacert.pemがないとエラーになるので、curlで配布されているpemを利用している。
>## SSL
>In order to use the SSL procedures defined in this module, you will need to compile your application with the -d:ssl flag. See the newContext procedure for additional details.

>## SSL on Windows
>On Windows the SSL library checks for valid certificates. It uses the cacert.pem file for this purpose which was extracted from https://curl.se/ca/cacert.pem. Besides the OpenSSL DLLs (e.g. libssl-1_1-x64.dll, libcrypto-1_1-x64.dll) you also need to ship cacert.pem with your .exe file.

