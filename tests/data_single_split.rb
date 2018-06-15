require 'multa'

DATA.split.map { |e| e }.join == "foo\nbar\nbaz" or raise "Wrong value"

__END__
foo
bar
baz