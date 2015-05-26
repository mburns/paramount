#
# Cookbook Name:: sovereign
# Attributes:: sysctl
#
# Copyright 2015, Michael Burns
# License:: Apache License, Version 2.0
#

default['sysctl']['params'] = {}

# net.ipv4.conf.default.rp_filter = 1
# net.ipv4.conf.default.accept_source_route = 0
# kernel.sysrq = 0
# kernel.core_uses_pid = 1
# net.ipv4.tcp_synack_retries = 2
# net.ipv4.icmp_echo_ignore_broadcasts = 1
# net.ipv4.tcp_syncookies = 1
# net.ipv4.conf.all.rp_filter = 1
# net.ipv4.conf.default.rp_filter = 1
# net.ipv4.tcp_rfc1337 = 1
# net.ipv6.conf.default.router_solicitations = 0
# net.ipv6.conf.default.autoconf = 0
# net.ipv6.conf.default.dad_transmits = 0
# net.ipv6.conf.default.max_addresses = 1
# kernel.exec-shield = 1
# kernel.randomize_va_space = 1
# kernel.pid_max = 65536
