module AuditHelper

  def contextual_class(message)
    html = ''
    if message.MessageLevel == 'Error'
      html = 'class=danger'
    end
  end

end
