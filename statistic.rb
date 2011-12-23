# -*- coding: utf-8 -*-

DEBUG = false

all_sum = 0

STDIN.each do |url|
  system("./download.sh \"#{url}\"")

  price = String.new
  number = String.new

  price = nil
  number = nil
  total_sum = 0

  File.open("res") do |f|
    f.each do |line|
      m = line.match(/^\s+\+\s([0-9\.]+\s)/)
      if m and m[1]
        price = m[1]
        puts "p = #{price}" if DEBUG
      end

      m = line.match(/最近成交(\d+)笔/)
      if m and m[1]
        number = m[1]
        puts "n = #{number}" if DEBUG
      end

      if price and number
        p = price.to_f
        n = number.to_i
        s = p * n

        total_sum = total_sum + s

        puts "#{price}, #{number}, #{s}" if DEBUG

        price = nil
        number = nil
      end
    end

    all_sum = all_sum + total_sum
    puts "total = #{total_sum.round(6)}"

  end
end

puts "all_total = #{all_sum.round(6)}"
