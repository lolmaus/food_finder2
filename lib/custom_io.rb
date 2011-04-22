# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.


def pri(*args)
	args.each { |item| print item }
end

def put(*args)
	#args.each { |item| puts item }
	print args
end

def putn(*args)
	#args.each { |item| puts "\n#{item}\n" }
	args.map! {|item| "\n#{item}\n"}
	puts args
end

def get
	gets.chomp
end