# 日本の祝日判定Rubyプログラム

## 特徴
(date2 の holiday.rb と比較して)
* 祝日をキャッシュすることにより、大量の日付について祝日判定する場合でも高速に動作
* 祝日名を返すことが可能
* 祝日のルールをテーブルで持つことにより、法改正による祝日変更への対応が容易

## Rubyスクリプトでの使い方

* 準備

 * RubyGems によるインストール

        gem install holiday_japan

 * または、[holiday_japan.rb](https://github.com/masa16/holiday_japan/blob/master/lib/holiday_japan.rb) 
   のファイルを ruby のライブラリパスに置く
 * 自分のスクリプトの初めに次のように書いて、 holiday_japan.rb をロードする

            require 'holiday_japan'

* Dateクラスのオブジェクトによる祝日判定

        if HolidayJapan.check(Date.today)
          ...

  または

        if Date.today.national_holiday?
          ...

* 日付が祝日の場合は祝日名を返し、祝日でなければ nil を返す。

        name = HolidayJapan.name(Date.new(2007,3,22))

* ある年について、 [日付, 祝日名] の配列を返す

        list = HolidayJapan.list_year(2007)

* ある年の祝日一覧をプリント

        HolidayJapan.print_year(2007)

## コマンドラインから祝日一覧を表示

	$ ruby holiday_japan.rb 2013
	listing year 2013...
	2013-01-01 Tue 元日
	2013-01-14 Mon 成人の日
	2013-02-11 Mon 建国記念の日
	2013-03-20 Wed 春分の日
	2013-04-29 Mon 昭和の日
	2013-05-03 Fri 憲法記念日
	2013-05-04 Sat みどりの日
	2013-05-05 Sun こどもの日
	2013-05-06 Mon 振替休日
	2013-07-15 Mon 海の日
	2013-09-16 Mon 敬老の日
	2013-09-23 Mon 秋分の日
	2013-10-14 Mon 体育の日
	2013-11-03 Sun 文化の日
	2013-11-04 Mon 振替休日
	2013-11-23 Sat 勤労感謝の日
	2013-12-23 Mon 天皇誕生日

##  祝日データ

* 1948年7月20日(祝日法発令) 以降の祝日に対応
* 2014年の暦要項まで確認（法改正がない限り以降も有効）

## Author:
    Masahiro TANAKA

## Copyright:
    (C) Copyright 2003-2013 by Masahiro TANAKA
    This program is free software under MIT license.
    See LICENSE.txt.
    NO WARRANTY.

## Version:
    2012-12-23  ver 1.0  モジュール名を Holiday から HolidayJapan に変更
    2007-08-02  ver 0.9  リファクタリング
    2007-03-08  ver 0.8  祝日データクラスを統一、データを配列で記述
    2006-02-06  ver 0.7  平成19年(西暦2007年)の暦要項 反映(祝日法改正)
                         Holiday.create_table 修正
                         Holiday.list_year 追加
    2003-10-02  ver 0.6  祝日データ追加
    2003-09-29  ver 0.5
    2003-09-22  ver 0.4
    2003-09-20  ver 0.3
    2003-09-16  ver 0.2
    2003-09-15  ver 0.1
