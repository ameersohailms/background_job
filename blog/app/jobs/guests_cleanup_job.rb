class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(post, users)
    puts @post =  post
    users.each do |u|
      PostMailer.welcome_email(@post, u ).deliver_now
    end
    puts "fffffffffffffffffffffffffffffffffffffffffffffffffffff"
    # Do something later
  end
end
