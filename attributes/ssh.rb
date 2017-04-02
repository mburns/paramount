#
# Cookbook Name:: paramount
# Attributes:: ssh
#
# Copyright 2015, Michael Burns
# Copyright 2012, Dominik Richter
# License:: Apache License, Version 2.0
#

# https://github.com/hardening-io/chef-ssh-hardening/

default['openssh']['client']['ForwardX11'] = 'no'
default['openssh']['client']['protocol'] = '2'
default['openssh']['client']['batchmode'] = 'no'
default['openssh']['client']['CheckHostIP'] = 'yes'
default['openssh']['client']['HostbasedAuthentication'] = 'no'
default['openssh']['client']['RhostsRSAAuthentication'] = 'no'
default['openssh']['client']['compression'] = 'yes'

default['openssh']['server']['PermitRootLogin'] = 'no'
default['openssh']['server']['protocol'] = '2'
default['openssh']['server']['StrictModes'] = 'yes'
default['openssh']['server']['PermitEmptyPasswords'] = 'no'
default['openssh']['server']['TCPKeepAlive'] = 'no'
default['openssh']['server']['X11Forwarding'] = 'no'

# default['openssh']['server']['cbc_required']  = false   # sshd
# default['openssh']['server']['weak_hmac']     = false   # sshd
# default['openssh']['server']['weak_kex']      = false   # sshd
# default['openssh']['ports']                   = [22]  # sshd + ssh
# default['openssh']['listen_to']               = ['0.0.0.0']     # sshd
# default['openssh']['host_key_files']          = %w(/etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_ecdsa_key) # sshd
# default['openssh']['client_alive_interval']   = 600     # sshd, 10min
# default['openssh']['client_alive_count']      = 3       # sshd, ~> 3 x interval
# default['openssh']['remote_hosts']            = []     # ssh
# default['openssh']['allow_root_with_key']     = false   # sshd
# default['openssh']['allow_tcp_forwarding']    = false   # sshd
# default['openssh']['allow_agent_forwarding']  = false   # sshd
# default['openssh']['use_pam']                 = false   # sshd
# default['openssh']['deny_users']              = []      # sshd
# default['openssh']['allow_users']             = []      # sshd
# default['openssh']['deny_groups']             = []      # sshd
# default['openssh']['allow_groups']            = []      # sshd
# default['openssh']['print_motd']              = false   # sshd
# default['openssh']['print_last_log']          = false   # sshd

# set this to nil to let us detect the attribute based on the node platform
# default['openssh']['use_privilege_separation'] = nil
