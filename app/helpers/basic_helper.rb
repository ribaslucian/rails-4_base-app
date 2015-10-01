module BasicHelper
  
  def form_message (entity, field)
    if !entity.errors.messages[field][0].nil?
      ("<div class='form_message small text b2'><i class='icon warning circle'></i>" + entity.errors.messages[field][0] + "</div>").html_safe
    end
  end

  def flash_messages
    #flash.each do |hashs|
    #  hashs.each do |key, value|
    #    puts key
    #  end
    #end

    if flash[:info]
      return render template: 'elements/flash/fixed/info', locals: {message: flash[:info].html_safe}
    end

    if flash[:success]
      return render template: 'elements/flash/fixed/success', locals: {message: flash[:success].html_safe}
    end

    if flash[:warning]
      return render template: 'elements/flash/fixed/warning', locals: {message: flash[:warning].html_safe}
    end

    if flash[:notice]
      return render template: 'elements/flash/fixed/notice', locals: {message: flash[:notice].html_safe}
    end

    if flash[:alert] 
      return render template: 'elements/flash/fixed/error', locals: {message: flash[:alert].html_safe}
    end

    if flash[:error] 
      return render template: 'elements/flash/fixed/error', locals: {message: flash[:error].html_safe}
    end
  end

end