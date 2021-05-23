# Copyright (c) 2021 Seiichi Ariga <seiichi.ariga@gmail.com>
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

import ../private/config

const
  API_PULSE_HOST  = "https://codestats.net"
  API_PULSE_ROUTE = "/api/my/pulses"

type
  ## http resuestのヘッダ
  request = object
    header:  string
    apiKey:  string
    userAgent:  string
    ##  #payload:  string
    request: string
    url: string
    body: string

  ## Pulseの内容
  pulse = object
    codedAt: string
    lang: string
    xp: int

func prepareHeader():request =
  discard

proc preparePulse(lang: string, xp: int):request =
  var req = prepareHeader()
  return req

proc sendPulse() = discard

proc sendCS*(lang: string, xp: int) =
  ## Code::statsにxpを送る

  if xp < 1:
    ## 送るXPが0のときは何もしない
    return

  let req = preparePulse(lang, xp)





