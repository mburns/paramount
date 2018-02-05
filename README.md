[![Cookbook Version](https://img.shields.io/cookbook/v/paramount.svg)](https://community.opscode.com/cookbooks/paramount)
[![Build Status](https://travis-ci.org/mburns/paramount.svg?branch=master)](https://travis-ci.org/mburns/paramount)
[![Coverage Status](https://coveralls.io/repos/github/mburns/paramount/badge.svg?branch=master)](https://coveralls.io/github/mburns/paramount?branch=master)
[![Code Climate](https://codeclimate.com/github/mburns/paramount/badges/gpa.svg)](https://codeclimate.com/github/mburns/paramount)
[![Issue Count](https://codeclimate.com/github/mburns/paramount/badges/issue_count.svg)](https://codeclimate.com/github/mburns/paramount)
[![Coverage](https://img.shields.io/codecov/c/github/mburns/paramount.svg)](https://codecov.io/github/mburns/paramount)
[![Inline docs](http://inch-ci.org/github/mburns/paramount.svg?branch=master)](http://inch-ci.org/github/mburns/paramount)
[![Dependency Status](https://gemnasium.com/mburns/paramount.svg)](https://gemnasium.com/mburns/paramount)
[![Gitter Chat](https://badges.gitter.im/mburns/paramount.svg)](https://gitter.im/mburns/paramount?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# Paramount Cookbook

A Chef cookbook for running your own self-hosted computing stack.

Inspired by https://github.com/al3x/sovereign

Tools are chosen from https://github.com/Kickball/awesome-selfhosted

## Supported Platforms

 * Ubuntu 16.04

## Attributes

| Key | Type | Description | Default |
| --- | ---- | ----------- | ------- |
| `['paramount']['domain']` | String | FQDN | `example.com` |
| `['paramount']['user']` | String | Username | `admin` |
| `['paramount']['contact']` | String | E-Mail address | `*computed*` |

## Components 


### paramount::email

Email is a full email stack (IMAP, SMTP, anti-spam)

* Dovecot, Postfix, dspam, spamassasin
* Roundcube, postgresql

### paramount::web

### paramount::cloud

### paramount::multimedia

* Plex, sickbeard, etc

## Usage

Include the specific component(s) you want in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[paramount::email]"
  ]
}
```

## License and Authors

Author:: Michael Burns (@mburns)

Contributor:: Alexander Adam (@alexanderadam)

