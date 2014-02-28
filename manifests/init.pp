define file_chattr ($file=$title,$add_attrib='undef',$remove_attrib='undef') {

  if $add_attrib != 'undef' {
    exec {"add chattr attribs":
      command => "chattr +${add_attrib} ${file}",
      path    => ['/bin','/usr/bin'],
      unless  => "lsattr ${file} | grep ${add_attrib} 2>/dev/null",
    }
  }
  if $remove_attrib != 'undef' {
    exec {"rm chattr attribs":
      command => "chattr -${remove_attrib} ${file}",
      path    => ['/bin','/usr/bin'],
      onlyif  => "lsattr ${file} | grep ${remove_attrib} 2>/dev/null",
    }
  }

}
