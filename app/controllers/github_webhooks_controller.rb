class GithubWebhooksController < ActionController::Base
  include GithubWebhook::Processor

  def github_issue_comment(payload)
    body = payload['comment']['body']
    p body
    if body.include? "!exploratory_test"

      # Retrieve Pull Request number
      pr_number = payload['issue']['number']

      # Fetch Pull Request
      pull_request = client.pull_request "nidirect/lams", pr_number
      sha = pull_request['head']['sha']
      
      get_stats_and_comment(sha, pr_number)
    end
  end

  def github_pull_request(payload)
    if payload['action'].eql? "labeled"
      if payload['label']['name'].include? "Ready to merge"
        pr_number = payload['pull_request']['number']
        sha = payload['pull_request']['head']['sha']

        # Get stats and add comments
        get_stats_and_comment(sha, pr_number)
      end
    elsif payload['action'].eql? "synchronize"
      # Set label to '1 - Work in progress'
      # Create GitHub Client
      client = Octokit::Client.new(:access_token => "#{ENV['GH_TOKEN']}")
      pr_number = payload['pull_request']['number']
      client.update_issue "nidirect/lams", pr_number, { :labels => ["1 - Work in progress"] } 
    end
  end

  def webhook_secret(payload)
    "secret"
  end

  private 

  def get_stats_and_comment(sha, pr_number)
      
    # Create GitHub Client
    client = Octokit::Client.new(:access_token => "#{ENV['GH_TOKEN']}")

    # Get stats
    customer_source_application = "LamsCustomer-LAMS-#{pr_number}"
    employee_source_application = "LamsEmployee-LAMS-#{pr_number}"

    employee_messages_count = Message.where(SourceApplication: employee_source_application).count
    customer_messages_count = Message.where(SourceApplication: customer_source_application).count

    if (employee_messages_count > 0 && customer_messages_count > 0)
        # Set Status
      client.create_status "nidirect/lams", sha, 'success', { :target_url => "http://192.168.39.182:8081/", :context => "Exploratory Test", :description => "Exploratory Testing Success" }

      # Reply with comment
      body = "### Exploratory Test Statistics\r\n\r\n * Customer portal: #{customer_messages_count} log entries\r\n * Employee portal: #{employee_messages_count} log entries\r\n\r\n :heavy_check_mark: **Setting status to success**"
      client.add_comment "nidirect/lams", pr_number, body
    elsif
       # Set Status
      client.create_status "nidirect/lams", sha, 'failure', { :target_url => "http://192.168.39.182:8081/", :context => "Exploratory Test", :description => "Exploratory Testing Failure" }

      # Add label
      client.update_issue "nidirect/lams", pr_number, { :labels => ["1 - Work in progress"] } 
      
      # Reply with comment
      body = "### Exploratory Test Statistics :crying_cat_face:\r\n\r\n * Customer portal: #{customer_messages_count} log entries\r\n * Employee portal: #{employee_messages_count} log entries\r\n\r\n :heavy_multiplication_x: **Setting status to failure due to insufficent testing**"
      client.add_comment "nidirect/lams", pr_number, body
    end
  end
  
end
