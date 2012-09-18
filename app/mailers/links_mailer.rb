class LinksMailer < ActionMailer::Base
  default from: "only_the_best@links.com"

  def top_links(address)
    raise ArgumentError.new("You must provide an email address.") if address.blank?
    raise ArgumentError.new("You must provide a valid email address.") unless EmailVeracity::Address.new(address).valid?
    @title = "Top HackerNews links for #{Date.today}"
    @scores = NewsItem.pluck(:score)
    @median = Calculator.new.median(@scores)
    @mode = Calculator.new.mode(@scores)
    @mean = Calculator.new.mean(@scores)
    @top_links = NewsItem.where("score > ?", @median)

    mail to: address
  end
end
