class TimelineController < ApplicationController
    before_action :authenticate_user!, except: :index
    
    def index
        @blogs = Blog.all.reverse
    end
    
    def page
        @page = Blog.where(user_id: params[:id])
    end
    
    def write
        Blog.create(user_id: current_user.id, content: params[:naeyoung])
        redirect_to :root
    end
    
    def comment
        Comment.create(user_id: current_user.id, blog_id: params[:blog_id], msg: params[:comment
        ])
        redirect_to :root
    end
    
    def destroy
        bb = Blog.find(params[:id])
        bb.destroy
        redirect_to :root
    end
    
    def edit
        @blog = Blog.find(params[:id])
    end
    
    def update
        bb = Blog.find(params[:id])
        bb.content = params[:naeyoung]
        bb.save
        redirect_to :root
    end
    
    def comment_destroy
        cc = Comment.find(params[:id])
        cc.destroy
        redirect_to :root
    end
    
    def comment_edit
        @comment = Comment.find(params[:id])
    end
    
    def comment_update
        cc = Comment.find(params[:id])
        cc.msg = params[:comment]
        cc.save
        redirect_to :root
    end
    
end