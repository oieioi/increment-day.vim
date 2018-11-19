#! /usr/bin/env ruby

class Youbi
  def initialize(day_s)
    @number, @lang = number_and_lang(day_s)
  end

  def to_s(lang_name = @lang)
    expressions[lang_name][@number]
  end

  def increment!
    @number += 1
    if to_s.nil?
      @number = 0
    end
    @number
  end

  private

  def number_and_lang(day_s)
    expressions.each { |lang_name, days|
      index = days.find_index(day_s)
      next if index.nil?
      return [index, lang_name]
    }
    raise "expressions not found: #{day_s}"
  end

  def expressions
    {
      ja: %w[日 月 火 水 木 金 土],
      ja_long: %w[日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日],
      hiragana: %w[にちようび かようび すいようび もくようび きんようび どようび],
      en_down: %w[sun mon tue wed thu fri sat],
      en_pascal: %w[Sun Mon Tue Wed Thu Fri Sat],
      en_full: %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday],
    }
  end
end

def increment_day(day)
  d = Youbi.new(day)
  d.increment!
  d.to_s
rescue StandardError
  nil
end

print increment_day(ARGV[0])

# test
#((%w[月 火 水 木 金 土 日 月] + [nil]) + %w[mon tue wed thu fri sat sun mon]).each_cons(2) do |a, b|
#  next if b.nil? || a.nil?
#  if increment_day(a) != b
#    raise "fail #{a} #{b}"
#  end
#end
