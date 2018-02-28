Redmine::Plugin.register :redmine_issue_tree_tiny do
  name 'Redmine Issue Tree Tiny plugin'
  author 'jiangshan00000@gmail.com'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/Jiangshan00001/redmine_issue_tree_tiny'
  author_url 'https://github.com/Jiangshan00001/redmine_issue_tree_tiny'

  permission :issuetreetinyctl, { :issuetreetinyctl => [:index, :get_child, :getroot] }, :public => true
  menu :project_menu, :redmine_issue_tree_tiny_m, {:controller => 'issuetreetinyctl', :action => 'index'}, :caption=> :issue_tree_title,:after => :issues, :param => :project_id
  menu :application_menu, :redmine_issue_tree_tiny_m, {:controller => 'issuetreetinyctl', :action => 'index'}, :caption=> :issue_tree_title,:after => :issues
end
