class AuditController < ApplicationController

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
    end
  end

  def show_audit_message
   @parameters = Parameter.where(MessageID: params[:MessageID])
   render 'auditmessage'
  end

  def show_transaction_message
  end

  def show_http_context_exception_message
  end

  def show_exception_message
  end

end
