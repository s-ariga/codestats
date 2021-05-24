# Seiichi Ariga <seiichi.ariga@gmail.com>

## Fish shellの設定
## ~/.config/fish/config.fish
## に追加するfunction

function cs_pulse_preexec --on-event fish_preexec

## 入力したコマンドの長さ(newlineまで含む)
  set xp (echo $argv | wc -m)

## exitを送信するとfishが終わらなくなる(?)
## TODO もっと良い方法
  if echo $argv | grep -q exit
    echo "Exiting Fish"
  else
    ~/bin/codestats "Terminal(Fish)" $xp 2>/dev/null &
  end
end