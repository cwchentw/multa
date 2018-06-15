require 'multa'

hash = DATA.split
hash[:t1].map { |e| e }.join == "foo\nbar\n\n" or raise "Wrong value"
hash[:t2].map { |e| e }.join == "baz" or raise "Wrong value"

__END__

@@ t1
foo
bar

@@ t2
baz