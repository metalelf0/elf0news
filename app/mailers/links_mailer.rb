class LinksMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.links_mailer.top_links.subject
  #
  def top_links(address)
    @title = "Top HackerNews links for #{Date.today}"
    @scores = NewsItem.pluck(:score)
    current_median = Calculator.new.median(@scores)
    @top_links = NewsItem.where("score > ?", current_median)

    mail to: address
  end
end
