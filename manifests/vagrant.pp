node default {
  class { 'stdlib': }
  class { 'motd': stage => 'setup' }
}
