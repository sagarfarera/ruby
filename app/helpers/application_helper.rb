module ApplicationHelper
  #user define helpers
  def render_if(condition , record)
    if condition
       render record
    end
  end
end
