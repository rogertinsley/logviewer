class GithubWebhooksController < ActionController::Base
  include GithubWebhook::Processor

  def github_issue_comment(payload)
    # TODO: handle push webhook
    # payload.comment.body
  end

  def webhook_secret(payload)
    ENV['GITHUB_WEBHOOK_SECRET']
  end
end
