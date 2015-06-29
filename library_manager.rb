class LibraryManager

  attr_accessor :reader_with_book, :issue_datetime

  def initialize reader_with_book, issue_datetime
    @reader_with_book = reader_with_book
    @issue_datetime = issue_datetime
  end

  def penalty

  end

  def could_meet_each_other? first_author, second_author

  end

  def days_to_buy

  end

  def transliterate author

  end

  def penalty_to_finish

  end

  # this is a placeholder. Just ignore it for the moment.
  def email_notification_params

  end

end
