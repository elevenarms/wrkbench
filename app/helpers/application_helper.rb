module ApplicationHelper
  
  # Sets the page title and outputs title if container is passed in.
  # eg. <%= title('Hello World', :h2) %> will return the following:
  # <h2>Hello World</h2> as well as setting the page title.
  def title(str, container = nil)
    @page_title = str
    content_tag(container, str) if container
  end
  
  # Outputs the corresponding flash message if any are set
  def flash_messages
    messages = []
    %w(notice warning error).each do |msg|
      messages << content_tag(:div, html_escape(flash[msg.to_sym]), :id => "flash-#{msg}") unless flash[msg.to_sym].blank?
    end
    messages
  end
  
  def render_context_menu(action)
    menu = ""
    case action
    #when action.nil?
      #menu="#{link_to "<span>< projects</span>", projects_path}"
    when action ="project_show"
      menu="#{link_to "<span>< Projects</span>", projects_path}"
      #unless logged_in? || ( logged_in? && current_user.relationship(@project) == "none" ) then
        #menu << link_to(  "<span>Follow *</span>",follow_project_path(@project))
      #end
      #if logged_in? && current_user.relationship(@project) == "follower" then
      #  menu << link_to("<span>Stop Following</span>", stop_following_project_path(@project))
      #elsif logged_in? && current_user.relationship(@project) == "collaborator" then
      #  menu << link_to("<span>Add Colaborator +</span>", add_collaborator_project_path(@project))
      #end
      menu << link_to( "<span>New Topic</span>")
      menu << link_to("<span>New Item</span>", new_bom_item_path(@bom) )
      #menu << link_to("<span>Discuss</span>", project_forum_path(@project, @forum))
      
    when action = "project_people"
      if logged_in? && current_user.relationship(@project) == "none"
        menu << link_to("<span>Follow</span>" , follow_project_path(@project) )
      end
      if logged_in? && current_user.relationship(@project) == "follower" then
        menu <<  link_to("<span>UnFollow</span>", stop_following_project_path(@project))
      elsif logged_in? && current_user.relationship(@project) == "collaborator" 
        menu << link_to("<span>End Collaboration</span>", stop_following_project_path(@project))
      elsif logged_in? and current_user.relationship(@project) == "owner"
        menu << link_to("<span>Add Collaborator</span>", add_collaborator_project_path(@project))
      end
    when action="project_materials"
      menu << link_to("<span>New Item</span>", new_bom_item_path(@bom) )
    end
    [menu]
end
end
