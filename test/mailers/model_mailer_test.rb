require 'test_helper'

class ModelMailerTest < ActionMailer::TestCase
  test "videogame_install_notification" do
    mail = ModelMailer.videogame_install_notification
    assert_equal "Videogame install notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
