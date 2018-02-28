# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'issuetreetinyctl', :to => 'issuetreetinyctl#index'
get 'issuetreetinyctl/index', :to => 'issuetreetinyctl#index'
get 'issuetreetinyctl/getchild', :to => 'issuetreetinyctl#getchild'
get 'issuetreetinyctl/getroot', :to => 'issuetreetinyctl#getroot'
