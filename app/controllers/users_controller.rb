class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Evgeniy',
        username: 'quicksilver'
      ),
      User.new(
        id: 2,
        name: 'Vasya',
        username: 'vasya'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Evgeniy',
      username: 'quicksilver'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('19.03.2019')),
      Question.new(text: 'Что делаешь?', created_at: Date.parse('19.03.2019'))
    ]

    @new_question = Question.new
  end
end
