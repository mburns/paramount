# Sovereign

A Chef cookbook for running a personal computer stack.

Inspired by https://github.com/al3x/paramount

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['paramount']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
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
