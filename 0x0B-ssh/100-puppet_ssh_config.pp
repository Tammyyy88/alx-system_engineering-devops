#!/usr/bin/env bash
# Using puppet to connect without password
#
file { '~/alx-system_engineering-devops/0x0B-ssh/2-ssh_config':
	ensure => present,
}

file line { 'Turn off passwd auth':
	path => '~/alx-system_engineering-devops/0x0B-ssh/2-ssh_config',
	line => 'PasswordAuthentication no',
	match => '^#PasswordAuthentication',
}

file line { 'Declare identity file':
	path => '~/alx-system_engineering-devops/0x0B-ssh/2-ssh_config',
        line => 'IdentityFile ~/alx-system_engineering-devops/0x0B-ssh/school',
        match => '^#IdentityFile',
}
