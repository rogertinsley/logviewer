class GithubWebhooksController < ActionController::Base
  include GithubWebhook::Processor

  def github_issue_comment(payload)
    body = payload['comment']['body']
    p body
    if body.include? "!exploratory_test"

      # Retrieve Pull Request number
      pr_number = payload['issue']['number']
      p "Set Exploratory Test status on PR: #{pr_number}"
      client = Octokit::Client.new(:access_token => "#{ENV['GH_TOKEN']}")

      # Fetch Pull Request
      pull_request = client.pull_request "nidirect/lams", pr_number
      sha = pull_request['head']['sha']
      
      # Set Status
      client.create_status "nidirect/lams", sha, 'success', { :target_url => "http://192.168.39.182:8081/", :context => "Exploratory Test", :description => "Exploratory Testing Completed" }

      # Get stats
      customer_source_application = "LamsCustomer-LAMS-#{pr_number}"
      employee_source_application = "LamsEmployee-LAMS-#{pr_number}"

      employee_messages_count = Message.where(SourceApplication: employee_source_application).count
      customer_messages_count = Message.where(SourceApplication: customer_source_application).count
      
      # Reply with comment
      body = "### Exploratory Test Statistics\r\n\r\n * Customer portal: #{customer_messages_count} log entries\r\n * Employee portal: #{employee_messages_count} log entries"
      client.add_comment "nidirect/lams", pr_number, body

    end
  end

  def webhook_secret(payload)
    "secret"
  end
  
end
