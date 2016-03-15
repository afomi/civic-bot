# Dot, the (Civic) Bot

![logo](/images/civic-bot-logo.png)

Dot is a Slack bot.

The bot currently supports the following commands connected to the [http://codeforamerica.org/api/](Code for America API).

```
dot
dot cfa
dot cfa:organizations
dot cfa:projects
dot cfa:events
dot cfa:stories
dot cfa:issues
```

### Configuration

Visit https://your_slack_instance_name.slack.com/services/new/bot to
create a new Slack Bot and
get a `SLACK_API_TOKEN`.

I like to call my bot, "Dot".

### Deployment

##### on [Heroku](https://www.heroku.com)

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/afomi/civic-bot)

##### on [Pivotal Web Services](https://run.pivotal.io)

* Copy manifest.sample.yml to `manifest.yml`
 * Update the app name
* `cf push`
* `cf set-health-check app-name none` to turn off the health check on port 80
