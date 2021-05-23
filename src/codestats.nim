# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

import os, strutils
import codestats/sendCS

proc outputParams() =
  ## コマンドライン引数をチェックするため。開発用
  ## stderr.writeLine("Error: ", 42)
  let params = paramCount()
  stderr.writeLine "Parameters count : ", params
  for i in countup(1, params):
    stderr.writeLine i, " : ", paramStr(i)

when isMainModule:
  outputParams()
  if paramCount() < 2:
    stderr.writeLine("Usage : codestats LANGUAGE XP")
    quit()

  sendCS(paramStr(1), parseInt(paramStr(2)))