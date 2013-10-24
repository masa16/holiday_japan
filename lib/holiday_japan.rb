# -*- coding: utf-8 -*-
require "date"

module HolidayJapan

  VERSION = "1.0.3"

  WEEK1 = 1..7
  WEEK2 = 8..14
  WEEK3 = 15..21
  WEEK4 = 22..28
  SUN,MON,TUE,WED,THU,FRU,SAT = (0..6).to_a
  INF = 1.0/0.0

  # 祝日データ: 1948年7月20日以降で有効
  DATA = [
    ["元日",        1949..INF ,  1,   1        ],
    ["成人の日",    1949..1999,  1,  15        ],
    ["成人の日",    2000..INF ,  1, WEEK2, MON ],
    ["建国記念の日",1967..INF ,  2,  11        ],
    ["天皇誕生日",  1949..1988,  4,  29        ],
    ["みどりの日",  1989..2006,  4,  29        ],
    ["昭和の日",    2007..INF ,  4,  29        ],
    ["憲法記念日",  1949..INF ,  5,   3        ],
    ["みどりの日",  2007..INF ,  5,   4        ],
    ["こどもの日",  1949..INF ,  5,   5        ],
    ["海の日",      1996..2002,  7,  20        ],
    ["海の日",      2003..INF ,  7, WEEK3, MON ],
    ["敬老の日",    1966..2002,  9,  15        ],
    ["敬老の日",    2003..INF ,  9, WEEK3, MON ],
    ["体育の日",    1966..1999, 10,  10        ],
    ["体育の日",    2000..INF , 10, WEEK2, MON ],
    ["文化の日",    1948..INF , 11,   3        ],
    ["勤労感謝の日",1948..INF , 11,  23        ],
    ["天皇誕生日",  1989..INF , 12,  23        ],
    ["春分の日",    1949..1979,  3,
      proc{|y|Integer(20.8357+0.242194*(y-1980))-Integer((y-1983)/4.0)} ],
    ["春分の日",    1980..2099,  3,
      proc{|y|Integer(20.8431+0.242194*(y-1980))-Integer((y-1980)/4.0)} ],
    ["秋分の日" ,   1948..1979,  9,
      proc{|y|Integer(23.2588+0.242194*(y-1980))-Integer((y-1983)/4.0)} ],
    ["秋分の日" ,   1980..2099,  9,
      proc{|y|Integer(23.2488+0.242194*(y-1980))-Integer((y-1980)/4.0)} ],
    ["皇太子明仁親王の結婚の儀", 1959..1959,  4, 10 ],
    ["昭和天皇の大喪の礼",       1989..1989,  2, 24 ],
    ["即位礼正殿の儀",           1990..1990, 11, 12 ],
    ["皇太子徳仁親王の結婚の儀", 1993..1993,  6,  9 ]
  ]
  DATA.each{|x| x[0].freeze; x.freeze }
  DATA.freeze
  TABLE = {}
  FURIKAE_START = Date.new(1973,4,12).freeze

  module_function

  def holiday_date(year,data)
    name,year_range,mon,day,wday = data
    if year_range === year
      case day
      when Fixnum
	Date.new( year, mon, day )
      when Range
	wday0 = Date.new(year,mon,day.first).wday
	Date.new( year, mon, day.first+(wday-wday0+7)%7 )
      when Proc
	Date.new( year, mon, day.call(year) )
      end
    end
  end

  def create_table(y)
    h={}
    a=[]
    # list holidays
    DATA.each do |x|
      if d = holiday_date(y,x)
        h[d] = x[0]
	a << d
      end
    end
    # compensating holiday
    if y >= 2007
      a.each do |d|
        if d.wday==SUN
	  d+=1 while h[d]
	  h[d] = "振替休日"
	end
      end
    elsif y >= 1973
      a.each do |d|
        if d.wday==SUN and d>=FURIKAE_START
	  h[d+1] = "振替休日"
	end
      end
    end
    # consecutive holiday
    if y >= 1986
      a.each do |d|
        if h[d+2] and !h[d+1] and d.wday!=SAT
          h[d+1] = "国民の休日"
        end
      end
    end
    h.freeze
  end

  def name(date)
    y = date.year
    (TABLE[y] ||= create_table(y))[date]
  end

  def check(date)
    !HolidayJapan.name(date).nil?
  end

  def list_year(year)
    year = Integer(year)
    TABLE[year] ||= create_table(year)
    TABLE[year].sort_by{|x| x[0]}
  end

  def print_year(year)
    puts "listing year #{year}..."
    list_year(year).each do |y|
      puts "#{y[0].strftime('%Y-%m-%d %a')} #{y[1]}"
    end
  end

end


# compatible with Funaba-san's holiday.rb
class Date
  def national_holiday?
    HolidayJapan.name(self) ? true : false
  end
end

# command line
if __FILE__ == $0
  # print holiday list of the year
  HolidayJapan.print_year(ARGV[0])
end
