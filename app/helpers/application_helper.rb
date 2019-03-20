module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def questions_count(question)
    if question.present?
      question.count
    else
      0
    end
  end

  def sklonenie(questions_count, krokodil, krokodila, krokodilov)

    if questions_count == nil || !questions_count.is_a?(Numeric)
      questions_count = 0
    end

    ostatok = questions_count % 100
    if ostatok >= 11 && ostatok <= 14
      return krokodilov
    end

    ostatok = questions_count % 10
    if ostatok == 1
      return krokodil
    elsif ostatok >= 2 && ostatok <= 4
      return krokodila
    elsif (ostatok >= 5 && ostatok <= 9) || ostatok == 0
      return krokodilov
    end
  end
end
