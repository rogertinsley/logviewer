class AuditController < ApplicationController

  before_action :set_cache

  def index
    @sources = Message.distinct.pluck(:SourceApplication)
  end

  def show
    @messages = Message
                  .where(SourceApplication: params[:SourceApplication])
                  .paginate(:page => params[:page])
                  .order(MessageOrder: :desc)
  end

  def parameters
    case request.params[:MessageType]
      when "AuditMessage"
        show_audit_message
      when "TransactionMessage"
        show_transaction_message
      when "HttpContextExceptionMessage"
        show_http_context_exception_message
    	when "ExceptionMessage"
        show_exception_message
    	when "StringMessage"
        show_string_message
  	end
  end

  private

  def show_audit_message
   @parameters = Parameter.where(MessageID: params[:MessageID])
   render 'auditmessage'
  end

  def show_transaction_message
    @message = Message.find_by(MessageID: params[:MessageID])
    render 'transactionmessage'
  end

  def show_http_context_exception_message
    @message = Message.find_by(MessageID: params[:MessageID])
    render "httpcontextexceptionmessage"
  end

  def show_exception_message
    @message = Message.find_by(MessageID: params[:MessageID])
    render "exceptionmessage"
  end

  def show_string_message
    @message = Message.find_by(MessageID: params[:MessageID])
    render "stringmessage"
  end

  def set_cache
    expires_in 1.minutes, :public => true
  end

end
