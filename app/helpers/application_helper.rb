module ApplicationHelper

  def source_application
    request.params[:SourceApplication]
  end

  def message_type
    request.params[:MessageType]
  end

end
