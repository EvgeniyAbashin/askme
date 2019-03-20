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
      Question.new(text: '1 вопрос', created_at: Date.parse('19.03.2019')),
      Question.new(text: '2 вопрос', created_at: Date.parse('19.03.2019')),
      Question.new(text: '3 вопрос', created_at: Date.parse('19.03.2019')),
      Question.new(text: '4 вопрос', created_at: Date.parse('19.03.2019')),
      Question.new(text: '5 вопрос', created_at: Date.parse('19.03.2019')),
      Question.new(text: '6 вопрос', created_at: Date.parse('19.03.2019')),
      Question.new(text: '7 вопрос', created_at: Date.parse('19.03.2019')),
      Question.new(text: '8 вопрос', created_at: Date.parse('19.03.2019')),
      Question.new(text: '9 вопрос', created_at: Date.parse('19.03.2019')),
      Question.new(text: '10 вопрос', created_at: Date.parse('19.03.2019')),
      Question.new(text: '11 вопрос', created_at: Date.parse('19.03.2019')),
    ]

    @new_question = Question.new
  end
end
