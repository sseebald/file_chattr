module Puppet::Parser::Functions
	newfunction(:parse,:type => :rvalue) do |args|
		var = args[0]
		parse = `echo "#{var}" | grep -o . | sort -n | tr -d "\n"`
	end
end
