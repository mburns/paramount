[![Cookbook Version](https://img.shields.io/cookbook/v/paramount.svg)](https://community.opscode.com/cookbooks/paramount)
[![Build Status](https://travis-ci.org/mburns/paramount.svg?branch=master)](https://travis-ci.org/mburns/paramount)
[![Coverage Status](https://coveralls.io/repos/github/mburns/paramount/badge.svg?branch=master)](https://coveralls.io/github/mburns/paramount?branch=master)
[![Code Climate](https://codeclimate.com/github/mburns/paramount/badges/gpa.svg)](https://codeclimate.com/github/mburns/paramount)
[![Issue Count](https://codeclimate.com/github/mburns/paramount/badges/issue_count.svg)](https://codeclimate.com/github/mburns/paramount)
[![Inline docs](http://inch-ci.org/github/mburns/paramount.svg?branch=master)](http://inch-ci.org/github/mburns/paramount)
[![Dependency Status](https://gemnasium.com/mburns/paramount.svg)](https://gemnasium.com/mburns/paramount)
[![Gitter Chat](https://badges.gitter.im/mburns/paramount.svg)](https://gitter.im/mburns/paramount?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)


# Paramount Cookbook

A Chef cookbook for running a personal computer stack.

Inspired by https://github.com/al3x/sovereign

## Supported Platforms

 * Ubuntu 14.04 LTS

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['paramount']['domain']</tt></td>
    <td>String</td>
    <td>FQDN</td>
    <td><tt>example.com</tt></td>
  </tr>
  <tr>
    <td><tt>['paramount']['user']</tt></td>
    <td>String</td>
    <td>Username</td>
    <td><tt>admin</tt></td>
  </tr>
  <tr>
    <td><tt>['paramount']['contact']</tt></td>
    <td>String</td>
    <td>E-Mail address</td>
    <td><tt>*computed*</tt></td>
  </tr>
</table>

## Usage

### paramount::default

Include `paramount` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[paramount::default]"
  ]
}
```

## License and Authors

Author:: Michael Burns (michael@mirwin.net)

[![Support via Gratipay](https://cdn.rawgit.com/gratipay/gratipay-badge/2.3.0/dist/gratipay.svg)](https://gratipay.com/mburns/)
