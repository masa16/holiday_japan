# 日本の祝日判定Rubyプログラム

## 特徴
(date2 の holiday.rb と比較して)
* 祝日をキャッシュすることにより、大量の日付について祝日判定する場合でも高速に動作
* 祝日名を返すことが可能
* 祝日のルールをテーブルで持つことにより、法改正による祝日変更への対応が容易

## インストール

 * RubyGems によるインストール

            gem install holiday_japan

 * または、[holiday_japan.rb](https://github.com/masa16/holiday_japan/blob/master/lib/holiday_japan.rb)
   のスクリプトファイルを ruby のライブラリパスに置く

## プログラムの読み込み
 * 自分のスクリプトの先頭に次のように書いて、 holiday_japan.rb をロードする

            require 'holiday_japan'

## module HolidayJapan
#### モジュール関数

* `check(date)` ― Dateクラスのオブジェクトによる祝日判定

        if HolidayJapan.check(Date.today)
          ...

* `name(date)` ― 日付が祝日の場合は祝日名を返し、祝日でなければ nil を返す。

        name = HolidayJapan.name(Date.new(2007,3,22))

* `list_year(year)` ― ある年について、 [日付, 祝日名] のArrayを返す

        list = HolidayJapan.list_year(2007)

* `hash_year(year)` ― ある年について、 {日付=>祝日名} のHashを返す

        list = HolidayJapan.hash_year(2007)

* `between(from_date,to_date)` ― from_date から to_date までの祝日について、
{日付=>祝日名}のHashを返す

        hash = HolidayJapan.hash_between(Date.new(2014,7,1),Date.new(2015,6,30))

* `print_year(year)` ― ある年の祝日一覧をプリント

        HolidayJapan.print_year(2007)

## コマンドラインから祝日一覧を表示

    $ ruby -r holiday_japan -e 'HolidayJapan.print_year 2016'
    listing year 2016...
    2016-01-01 Fri 元日
    2016-01-11 Mon 成人の日
    2016-02-11 Thu 建国記念の日
    2016-03-20 Sun 春分の日
    2016-03-21 Mon 振替休日
    2016-04-29 Fri 昭和の日
    2016-05-03 Tue 憲法記念日
    2016-05-04 Wed みどりの日
    2016-05-05 Thu こどもの日
    2016-07-18 Mon 海の日
    2016-08-11 Thu 山の日
    2016-09-19 Mon 敬老の日
    2016-09-22 Thu 秋分の日
    2016-10-10 Mon 体育の日
    2016-11-03 Thu 文化の日
    2016-11-23 Wed 勤労感謝の日
    2016-12-23 Fri 天皇誕生日

##  祝日データ

* 1948年7月20日(祝日法発令) 以降の祝日に対応
* 2016年の[暦要項](http://eco.mtk.nao.ac.jp/koyomi/yoko/)まで確認（法改正がない限り以降も有効）

## Author:
    Masahiro TANAKA

## Copyright:
    (C) Copyright 2003-2015 by Masahiro TANAKA
    This program is free software under MIT license.
    See LICENSE.txt.
    NO WARRANTY.

## Version:
    2015-04-11  ver 1.2  hash_year, between 関数追加
    2014-05-23  ver 1.1  「山の日」追加
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
