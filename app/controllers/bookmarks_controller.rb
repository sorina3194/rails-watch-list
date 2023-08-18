class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save!
    redirect_to list_path(@list.id)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end

#def new
# @list = List.find(params[:list_id])
#end


#then create a view new file in bookmarks and a form in it
#simple_form_for [@list, @bookmarks]...
#f.association :movie????
