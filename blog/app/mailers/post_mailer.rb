class PostMailer < ApplicationMailer


  # default from: 'ameersohailms@gmail.com'

  def welcome_email(post, user)
    @post = post
    @user = user
    puts "fdfffffffff"
    mail(to: user, subject: 'Welcome to My Awesome Site')
    puts "dddddddddddddddddddddd"
  end
end