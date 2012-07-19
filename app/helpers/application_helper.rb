module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "TinyPulse"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  def active_menu(num)
    @acitve_dashboard = ""
    @acitve_edit_user = ""
    @acitve_submit_question = ""
    @acitve_infulcen_board = ""
    @active_buttom = ""
    case num
      when 1
        @acitve_dashboard = "activeHeader"
      when 2
        @acitve_edit_user = "activeContent"
      when 3
        @acitve_submit_question = "activeContent"
      when 4
        @acitve_infulcen_board = "activeContent"
      else
        @active_buttom = "activeBottom"
    end
  end
end


