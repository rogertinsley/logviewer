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
    @message    = Message.find_by(MessageID: params[:MessageID])
    @parameters = Parameter.where(MessageID: params[:MessageID])

    case request.params[:MessageType]
      when "AuditMessage"
        render "auditmessage"
      when "TransactionMessage"
        render "transactionmessage"
      when "HttpContextExceptionMessage"
        render "httpcontextexceptionmessage"
	    when "ExceptionMessage"
        render "exceptionmessage"
      when "StringMessage"
        render "stringmessage"
  	end

  end

  private

  def set_cache
    expires_in 1.minutes, :public => true
  end

end
