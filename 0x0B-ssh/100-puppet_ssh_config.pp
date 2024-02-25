# using puppet to make changes to the default ssh config file
# so that one can connect to a server without typing a password.

include stdlib

file_line { 'SSH Private Key':
  path               => '~/alx-system_engineering-devops/0x0B-ssh/2-ssh_config',
  line               => '    IdentityFile ~/alx-system_engineering-devops/0x0B-ssh/school',
  match              => '^[#]+[\s]*(?i)IdentityFile[\s]+~/alx-system_engineering-devops/0x0B-ssh/id_rsa$',
  replace            => true,
  append_on_no_match => true
}

# Regex match explanation
#
# ^       beginning of the line
# [#]*  atleast one hash character
# [\s]*  zero or more white space characters
# (?i)IdentityFile case insensitive "IdentityFile"
# [\s]+ at least one whitespace character
# ~/.ssh/id_rsa The ssh private key file path we want to replace
# $      end of the line

file_line { 'Deny Password Auth':
  path               => '~/alx-system_engineering-devops/0x0B-ssh/2-ssh_config',
  line               => '    PasswordAuthentication no',
  match              => '^[#]+[\s]*(?i)PasswordAuthentication[\s]+(yes|no)$',
  replace            => true,
  append_on_no_match => true
}

# Regex match explanation
#
# ^       beginning of the line
# [#]*  atleast one hash character
# [\s]*  zero or more white space characters
# (?i)PasswordAuthentication case insensitive "PasswordAuthentication"
# [\s]+ at least one whitespace character
# (yes|no) with the value "yes" or the value "no"
# $      end of the line
