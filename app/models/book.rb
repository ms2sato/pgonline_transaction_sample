class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  def self.sample(user)
    transaction do
      time = Time.zone.now
      book = Book.new(title: "坊ちゃん#{time}", user: user)
      book.save!

      user.book_count += 1
      user.save!

      puts "###################################"
      puts "[結果]"
      # Userテーブルのbook_countの値
      puts "user.book_count: #{user.book_count}" 
      # Book.where(user_id: user.id).count
      puts "user.books.count: #{user.books.count}"
    end
  end    
end
