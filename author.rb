class Author
  attr_accessor :year_of_birth, :year_of_death, :name
  
  
  def initialize year_of_birth, year_of_death, name
    @year_of_birth = year_of_birth
    @year_of_death = year_of_death
    @name = name
  end

  def transliterate
    down_case = {
        "а"=>"a", "б"=>"b", "в"=>"v", "г"=>"h", "ґ"=>"g",
        "д"=>"d", "е"=>"e", "є"=>"ie", "ж"=>"zh", "з"=>"z",
        "и"=>"y", "і"=>"i", "ї"=>"i", "й"=>"i", "к"=>"k",
        "л"=>"l", "м"=>"m", "н"=>"n", "о"=>"o", "п"=>"p",
        "р"=>"r", "с"=>"s", "т"=>"t", "у"=>"u", "ф"=>"f",
        "х"=>"kh", "ц"=>"ts", "ч"=>"ch", "ш"=>"sh", "щ"=>"shch",
        "ю"=>"iu", "я"=>"ia"
    }
    up_case = {
        "А"=>"A", "Б"=>"B", "В"=>"V", "Г"=>"H", "Ґ"=>"G",
        "Д"=>"D", "Е"=>"E", "Є"=>"Ye", "Ж"=>"Zh", "З"=>"Z",
        "И"=>"Y", "І"=>"I", "Ї"=>"Yi", "Й"=>"Y", "К"=>"K",
        "Л"=>"L", "М"=>"M", "Н"=>"N", "О"=>"O", "П"=>"P",
        "Р"=>"R", "С"=>"C", "Т"=>"T", "У"=>"U", "Ф"=>"F",
        "Х"=>"Kh", "Ц"=>"Ts", "Ч"=>"Ch", "Ш"=>"Sh", "Щ"=>"Shch",
        "Ю"=>"Yu", "Я"=>"Ya"
    }
    symbols = down_case.merge(up_case)

    name.chars.map{|char| symbols.has_key?(char) ? symbols.fetch(char):char}.join
  end

  def can_meet? other_author

  end
end
