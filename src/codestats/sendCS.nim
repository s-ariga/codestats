# Copyright (c) 2021 Seiichi Ariga <seiichi.ariga@gmail.com>
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

import times, httpclient, json
import ../private/config

const
  API_PULSE_HOST  = "https://codestats.net"
  API_PULSE_ROUTE = "/api/my/pulses"

type
  ## http resuestのヘッダ
  Head = object
    contentType:  string
    apiKey:  string
    userAgent:  string
    ##  #payload:  string
    request: string
    url: string
    body: string

  ## Pulseの内容
  Pulse = object
    codedAt: string
    lang: string
    xp: int

func initHeader(): Head =
  var head = Head()
  head.contentType = "application/json"
  head.apiKey = CODE_STATS_API_KEY
  head.userAgent = "code-stats-nim/0.1.0"
  # head.request = "POST"
  return head

proc initPulse(lang: string, xp: int): Pulse =
  var pulse = Pulse(lang: lang, xp: xp)

  ## 引数をそのままコピー
  ## TODO チェック
  pulse.lang = lang
  pulse.xp = xp

  ## 時間をいれる
  #[ https://codestats.net/api-docs
    Note: The coded_at timestamp MUST be in the user's local time with their local UTC offset. Do not convert the time to UTC before sending it to the API.

    Note: The coded_at timestamp must be no older than a week. Any older timestamps will result in an error. Timestamps in the future will be ignored, their coded_at will be set to the current moment.
  ]#
  let now = now()
  pulse.codedAt = $now

  return pulse

proc sendPulse(head: Head, pulse: Pulse) =
  let client = newHttpClient()
  client.headers = newHttpHeaders({
    "Content-Type": head.contentType,
    "User-Agent": head.userAgent,
    "X-API-Token": head.apiKey,
    })
  let body = %*
    {
      "coded_at": pulse.codedAt,
      "xps": [{"language": pulse.lang, "xp": pulse.xp}]
    }
  let response = client.request(API_PULSE_HOST & API_PULSE_ROUTE, httpMethod = HttpPost, body = $body)
  echo response.status

proc sendCS*(lang: string, xp: int) =
  ## Code::statsにxpを送る

  if xp == 1:
    ## 送るXPが0のときは何もしない
    return

  let head = initHeader()
  echo head
  let pulse = initPulse(lang, xp)
  echo pulse

  sendPulse(head, pulse)




