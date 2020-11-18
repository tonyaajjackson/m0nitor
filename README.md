# m0nitor

Monitor whether a host is responding to ping and alert changes via Discord Webhook. Run with cron to create a simple watchdog for if your server goes down.

## Setup
1. Set up a Discord Webhook by following [Discord's "Making a Webhook" in tutorial.](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks)
1. In your desired directory, run

```
git clone https://github.com/tonyaajjackson/m0nitor.git; cd m0nitor; chmod +x install.sh; ./install.sh;
```

## Run
### Syntax
```
Arguments are required unless otherwise specified

-d/--debug (opt.)         Prints debug messages during run
--max-ping-fails (opt.)   Number of times ping can fail before an alert is sent
--host                    IP address or fully qualified domain name of host
--server-name             Name of server in alert
--webhook                 Discord webhook URL
-d/--debug (opt.)         Prints debug messages during run
--max-ping-fails (opt.)   Number of times ping can fail before an alert is sent
--host                    IP address or fully qualified domain name of host
--server-name             Name of server in alert
--webhook                 Discord webhook URL

```
### Example cron entry

```
* * * * * m0nitor --host 8.8.8.8 --server-name Google --debug --webhook <YOUR_WEBHOOK_URL_HERE> --max-ping-fails 3
```