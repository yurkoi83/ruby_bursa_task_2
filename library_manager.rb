require 'active_support/all'
require 'pry'
#
require './author.rb'
require './book.rb'
require './published_book.rb'
require './reader.rb'
require './reader_with_book.rb'

class LibraryManager

  attr_accessor :reader_with_book, :issue_datetime

  def initialize reader_with_book, issue_datetime
    @reader_with_book = reader_with_book
    @issue_datetime = issue_datetime
  end

  def penalty
    seconds=DateTime.now.strftime('%s').to_i-@issue_datetime.strftime('%s').to_i
    if seconds<=0
        0
    else
      full_hours=(seconds/3600).floor
      @reader_with_book.penalty full_hours
    end

  end

  def could_meet_each_other? first_author, second_author
    first_oldest=first_author.year_of_birth<=second_author.year_of_birth ? true : false
    if first_oldest
      first_author.year_of_death>=second_author.year_of_birth ? true : false   
    else
      second_author.year_of_death>=first_author.year_of_birth ? true : false   
    end
  end

  def days_to_buy
      @reader_with_book.day_to_buy
  end

  def transliterate author
    author.transliterate
  end

  def penalty_to_finish
    need_hour=@reader_with_book.time_to_finish
    end_time=DateTime.now.to_time+need_hour*60*60
    seconds=end_time.strftime('%s').to_i-issue_datetime.strftime('%s').to_i
    if seconds<=0
        0
    else
      full_hours=(seconds/3600).floor
      @reader_with_book.penalty full_hours
    end
  
  end

  def hours_to_deadline
    seconds=@issue_datetime.strftime('%s').to_i-DateTime.now.strftime('%s').to_i
    seconds<=0 ? 0 : (seconds/3600).floor
  end



  def email_notification_params
      {
        penalty: @reader_with_book.penalty_per_hour,
        hours_to_deadline: hours_to_deadline,
        title: @reader_with_book.title,
        name: @reader_with_book.name,
        author_name: @reader_with_book.author_name
      }
  end

  def email_notification
"Hello, #{email_notification_params[:name]}!\n
You should return a book \"#{email_notification_params[:title]}\" authored by #{email_notification_params[:author_name]} in #{email_notification_params[:hours_to_deadline]} hours.\n
Otherwise you will be charged $#{email_notification_params[:penalty]} per hour. \n"
  end

end
