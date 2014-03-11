define file_chattr ($file=$title,$add_attrib='undef',$remove_attrib='undef') {

  if $add_attrib != 'undef' { 

    $add_attrib_vars = parse($add_attrib)
  
    exec {"add chattr attribs":
      command => "chattr +${add_attrib_vars} ${file}",
      path    => ['/bin','/usr/bin'],
      #unless  => "lsattr ${file} | cut -c1-15 | grep -o ${add_attrib_vars} | sort | tr -d '/\n' | sed s/-//g 2>/dev/null",
      unless  => "grep ${add_attrib_vars} $(lsattr ${file} | grep -o ${add_attrib_vars} | cut -c1-15 | sort | tr -d '/\n' | sed s/-//g 2>/dev/null)",
    }
  } 
  if $remove_attrib != 'undef' {
    
    $remove_attrib_vars = parse($remove_attrib)
    
    exec {"rm chattr attribs":
      command => "chattr -${remove_attrib_vars} ${file}",
      path    => ['/bin','/usr/bin'],
      onlyif  => "lsattr ${file} | cut -c1-15 | grep -o ${remove_attrib_vars} | sort | tr -d '/\n' | sed s/-//g",
    }
  }

}
