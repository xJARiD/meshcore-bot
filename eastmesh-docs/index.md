# EastMesh MeshCore Bot

This page lists the end-user command plugins currently enabled by the live `config.ini` in this checkout. Admin-only commands are intentionally omitted.

## Current Limits

| Limit                          | Current setting                             |
| ------------------------------ | ------------------------------------------- |
| Per-message bot reply cooldown | 5 seconds between bot replies               |
| Per-user bot reply cooldown    | 20 seconds between replies to the same user |

## Enabled Commands

| Command                                      | What it does                                                                                                                           | Example response                                                         |
| -------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `advert`                                     | Sends the bot's configured flood advert. DM-only, with a one-hour cooldown.                                                            | `Advertisement sent to configured channel.`                              |
| `aqi` / `air` / `airquality` / `air_quality` | Gets air quality for a city, neighbourhood, or coordinates. Try `aqi Melbourne` or `aqi Victoria, Australia`.                          | `Melbourne AQI: 42 Good. PM2.5 7 ug/m3, O3 31 ppb.`                      |
| `aurora` / `kp`                              | Gets aurora forecast and KP probability for the configured location or a supplied location.                                            | `Aurora: KP 5.0, possible visibility from Victoria, Australia.`          |
| `channels` / `channel`                       | Lists hashtag channels, categories, or details for one channel. Try `channels list` or `channels #general`.                            | `Channels: #general, #help, #weather. Use channels list for categories.` |
| `cmd` / `commands`                           | Lists available command triggers in compact form.                                                                                      | `Commands: test, ping, help, wx, path, stats, ...`                       |
| `gwx` / `globalweather` / `gwxa`             | Gets global weather from Open-Meteo. Try `gwx Melbourne` or `gwx Victoria, Australia`.                                                 | `Melbourne: 22 C, partly cloudy, wind 9 km/h. Tomorrow: 24/17 C.`        |
| `hello` / `hi` / `hey` / `gday`              | Responds to greetings with a short bot greeting.                                                                                       | `Hello! MeshCore bot online.`                                            |
| `help`                                       | Shows general help or help for one command. Try `help wx`.                                                                             | `Bot Help: ping, wx, path, stats \| More: 'help <command>'`              |
| `hfcond`                                     | Shows current HF radio band conditions for ham radio.                                                                                  | `HF: 80m fair, 40m good, 20m good, 10m poor.`                            |
| `moon`                                       | Shows moon phase and moonrise/moonset information.                                                                                     | `Moon: Waxing Crescent, illumination 31%, rises 10:42, sets 22:15.`      |
| `multitest` / `mt`                           | Listens briefly and reports unique paths seen from incoming messages.                                                                  | `Paths heard: 2 unique. Best: 01,7a,55 via 2 hops.`                      |
| `path` / `decode` / `route` / `p`            | Decodes MeshCore path data or the last message path to identify repeaters.                                                             | `Path: VK3MEL -> RPT-MEL -> RPT-VIC -> bot (3 hops).`                    |
| `ping`                                       | Checks whether the bot is responsive.                                                                                                  | `Pong!`                                                                  |
| `prefix` / `lookup`                          | Looks up repeater prefixes and free prefix space. Try `prefix 1A` or `prefix free`.                                                    | `1A matches: RPT-MEL (Melbourne), RPT-GEE (Geelong).`                    |
| `satpass`                                    | Shows satellite pass predictions for the configured location. Try `satpass iss` or `satpass 25544 visual`.                             | `ISS next pass over Melbourne: 20:14, max 47 deg, visible 5 min.`        |
| `schedule`                                   | Shows configured scheduled messages and advert interval. DM-only by default.                                                           | `No scheduled messages configured. Advert interval: every 6h.`           |
| `solar`                                      | Shows current solar conditions and HF radio indicators.                                                                                | `Solar: SFI 165, A 8, K 2. HF conditions mostly fair.`                   |
| `solarforecast` / `sf`                       | Forecasts solar panel production for a location and panel size. Try `sf Melbourne` or `sf Victoria, Australia 200`.                    | `Melbourne solar forecast: 200 W panel may produce 0.8 kWh today.`       |
| `stats`                                      | Shows bot usage statistics for the past 24 hours. Try `stats channels` or `stats paths`.                                               | `24h stats: 128 messages, 23 commands, 9 users, longest path 4 hops.`    |
| `sun`                                        | Shows sunrise and sunset times for the configured location.                                                                            | `Sun: sunrise 06:18, sunset 20:04, daylight 13h 46m.`                    |
| `test` / `t`                                 | Returns connection and path information, optionally echoing a phrase.                                                                  | `Test OK from VK3MEL via 2 hops, SNR 7.5 dB.`                            |
| `trace` / `tracer`                           | Runs a manual or reciprocal link trace. Try `trace 01,7a,55` or `tracer`.                                                              | `Trace queued for 01,7a,55. Watch for route response.`                   |
| `version` / `ver`                            | Shows the running bot version.                                                                                                         | `Bot version: 1.2.3`                                                     |
| `wx` / `weather` / `wxa` / `wxalert`         | Gets weather for a location using the configured weather provider. Try `wx Melbourne`, `wx Victoria, Australia`, or `wx Melbourne 7d`. | `Melbourne: 12 C, light rain, wind S 13 km/h. Tonight: showers likely.`  |

## Disabled In The Current Config

These end-user command plugins exist in the repo but are disabled in the current `config.ini`: `airplanes`, `alert`, `announcements`, `catfact`, `dadjoke`, `dice`, `greeter`, `hacker`, `joke`, `magic8`, `roll`, and `sports`.

## Channels

These channels come from the current `[Channels_List]` configuration. Use `channels list` to see the categories from the bot, `channels <category>` to list one group, or `channels #channel` to look up one channel.

### Emergency

| Channel      | Description                         |
| ------------ | ----------------------------------- |
| `#emergency` | Emergency communications and alerts |

### Gaming

| Channel        | Description                |
| -------------- | -------------------------- |
| `#gaming`      | General gaming discussions |
| `#payphonetag` | Payphone Tag game channel  |

### Help

| Channel    | Description          |
| ---------- | -------------------- |
| `#meshbot` | This bot channel     |
| `#ping`    | Ping command channel |
| `#test`    | Test command channel |

### Hobbies

| Channel       | Description                     |
| ------------- | ------------------------------- |
| `#gardening`  | Gardening discussions           |
| `#gunzel`     | Gunzel discussions              |
| `#hamradio`   | Amateur radio discussions       |
| `#motorbikes` | Motorcycle discussions          |
| `#politics`   | Politics discussions            |
| `#space`      | Space and astronomy discussions |

### Local

| Channel      | Description                  |
| ------------ | ---------------------------- |
| `#ballarat`  | Ballarat neighbourhood       |
| `#bendigo`   | Bendigo neighbourhood        |
| `#breast`    | Brunswick East neighbourhood |
| `#casey`     | Casey neighbourhood          |
| `#geelong`   | Geelong neighbourhood        |
| `#gippsland` | Gippsland neighbourhood      |
| `#hume`      | Hume neighbourhood           |
| `#melbourne` | Melbourne neighbourhood      |
| `#ptfairy`   | Port Fairy neighbourhood     |
| `#wbool`     | Warrnambool neighbourhood    |

### Misc

| Channel   | Description                           |
| --------- | ------------------------------------- |
| `#jokes`  | Jokes and humor                       |
| `#random` | Random chat and off-topic discussions |

### Sports

| Channel | Description                            |
| ------- | -------------------------------------- |
| `#afl`  | Australian Football League discussions |
| `#f1`   | Formula 1 discussions                  |
| `#nrl`  | National Rugby League discussions      |
| `#ufc`  | UFC and MMA discussions                |

### Tech

| Channel        | Description                                |
| -------------- | ------------------------------------------ |
| `#electronics` | Electronics and hardware discussions       |
| `#hamradio`    | Amateur radio discussions                  |
| `#homelab`     | Home lab and server discussions            |
| `#linux`       | Linux and open-source software discussions |

### Test

| Channel       | Description               |
| ------------- | ------------------------- |
| `#mid`        | Mid radio channel         |
| `#midtesting` | Mid radio testing channel |
| `#ping`       | Ping command channel      |
| `#test`       | Test command channel      |
