require 'multa'

arr = DATA.cut
arr[0].map { |e| e }.join == "foo\nbar\n\n" or raise "Wrong value"
arr[1].map { |e| e }.join == "baz" or raise "Wrong value"


__END__

@@ t1
foo
bar

@@ t2
baz