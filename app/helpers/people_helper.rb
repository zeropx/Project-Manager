module PeopleHelper
  
  def project_title_links(project)

    content_tag :h1 do
      [ project.title,
        link_to_icon("page_go", project, :class => "project-link"),
        link_to_icon("page_edit",edit_project_path(project), :class => "project-link"),
        link_to_icon("page_delete", project, {
          :confirm => "Are you sure?", 
          :method  => :delete
        })
      ].join(' ').html_safe
    end
    
  end
  
end
