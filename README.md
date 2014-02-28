file_chattr
===========

Puppet module with a defined type to add or remove extended linux file permissions.

Usage:

class file_test {

  file_chattr {'/tmp/foo':
      add_attrib => "dj",
      remove_attrib => "i",
    }

}
