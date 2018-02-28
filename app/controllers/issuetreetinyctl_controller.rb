class IssuetreetinyctlController < ApplicationController
  unloadable

  #require QueriesHelper
  include TinyIssueQuery

  def index
    @query = CustomIssueQuery1.new(name: '_')


    if not  params[:project_id].nil?
      @project = Project.find(params[:project_id])
      @project_id=@project.id
      @query.project = @project
    else
      @project_id=nil
    end
    @query.build_from_params(params)

    @issues = @query.entities(order: "#{Issue.table_name}.id")
    @limit = params[:limit] ||  10
    @limit=@limit.to_i
    @page_count=@issues.count/@limit+1
    @page = params[:page] ||  1
    @page=@page.to_i
    @issues_count=@issues.count

  end

  def getroot
    @query = CustomIssueQuery1.new(name: '_')


    if not  params[:project_id].nil?
      @project = Project.find(params[:project_id])
      @project_id=@project.id
      @query.project = @project
    else
      @project_id=nil
    end
    @query.build_from_params(params)

    #puts @query

    @issues = @query.entities(order: "#{Issue.table_name}.id")
    #@issue_ids = @issues.map(&:id)
    # All ancestors conditions
    #tree_conditions = []
    #@issues.each do |issue|
    #  tree_conditions << "(root_id = #{issue.root_id} AND lft < #{issue.lft} AND rgt > #{issue.rgt})"
    #end
    #tree_conditions = tree_conditions.join(' OR ')
    #@missing_parent_issues = Issue.where(tree_conditions).where.not(id: @issue_ids)

    @limit = params[:limit] ||  10
    @limit=@limit.to_i
    @app_notifications_pages = Paginator.new @issues.count, @limit, params['page']
    @offset = params[:offset] ||  @app_notifications_pages.offset
    @offset=@offset.to_i
    @issues_page1 = @issues.limit(@limit).offset(@offset)

    @issues=@issues_page1

      render text: @issues.to_json
  end

  def getchild
    parent_id=params[:parent_id]

    @issues=Issue.where(["parent_id=:p1",  {:p1=> parent_id}])
    render text: @issues.to_json

  end
end
