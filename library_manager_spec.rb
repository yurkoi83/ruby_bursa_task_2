# encoding: utf-8
require './library_manager.rb'

describe LibraryManager do

  let(:platon) { Author.new(-428, -360, 'Platon' ) }
  let(:julius_caeser) { Author.new(-100, -44, 'Julius Cesar' ) }
  let(:leo_tolstoy) { Author.new(1828, 1910, 'Leo Tolstoy' ) }
  let(:oscar_wilde) { Author.new(1854, 1900, 'Oscar Wilde') }
  let(:war_and_peace) { PublishedBook.new(leo_tolstoy, 'War and Peace', 1400, 3280, 1996) }
  let(:ivan_testenko) { ReaderWithBook.new('Ivan Testenko', 16, war_and_peace, 328) }
  let(:manager) { LibraryManager.new(ivan_testenko, (DateTime.now.new_offset(0) - 2.days)) }
  let(:manager2) { LibraryManager.new(ivan_testenko, (DateTime.now.new_offset(0) + 12.hours)) }

  it 'should count penalty' do
    expect(manager.penalty).to eq 780
  end

  context '#could_meet_each_other?' do 
    it 'should know if author can meet another author' do
      expect(manager.could_meet_each_other?(leo_tolstoy, oscar_wilde)).to be true
    end   

    it 'should return false know if author can not meet another author' do
     expect(manager.could_meet_each_other?(leo_tolstoy, platon)).to be false
    end  
  
    it 'should return false know if author can not meet another author B.C.' do
      expect(manager.could_meet_each_other?(platon, julius_caeser)).to be false
    end  
  end

  it 'should count days to buy' do
    expect(manager.days_to_buy).to eq 4
  end


  context '#should transliterate ukrainian name' do

    it 'return name in transliteration' do
      ukrainan_author = Author.new(1856, 1916, 'Іван Франко')
      expect(manager.transliterate(ukrainan_author)).to eq 'Ivan Franko'
    end
 
    it 'return name in transliteration' do
      ukrainan_author = Author.new(1877, 1938, "Гнат Хоткевич")
      expect(manager.transliterate(ukrainan_author)).to eq 'Hnat Khotkevych' 
    end

    it 'return name in transliteration' do
      ukrainan_author = Author.new(1976, 2010, "Ґлеб Щуров")
      expect(manager.transliterate(ukrainan_author)).to eq 'Gleb Shchurov'
    end

    it 'return name in transliteration' do
      ukrainan_author = Author.new(1778, 1843, "Григорій Квітка-Основ'яненко")
      expect(manager.transliterate(ukrainan_author)).to eq "Hryhorii Kvitka-Osnov'ianenko"
    end

  end

  it 'should count penalty to finish' do
    expect(manager.penalty_to_finish).to eq 3768
  end

 it 'should compose email notifications' do
    expect(manager2.email_notification). to eq <<-TEXT
Hello, Ivan Testenko!

You should return a book "War and Peace" authored by Leo Tolstoy in 12 hours.

Otherwise you will be charged $0.16 per hour. 
TEXT
  end

  
end
