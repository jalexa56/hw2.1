module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

def helper_class(field)
    if(params[:sort].to_s == field)
      return 'hilite'
    else
       return nil
    end
  end


def helper_sort(movie)
   if(params[:sort].to_s == 'title')
    return movie.titleratings_submit
   elsif(params[:sort].to_s == 'release')
    return movie.release_date.to_s
   end 
  end


def helper_select(movie)
    if(params[:ratings] == nil)
      return true
   else
     return params[:ratings].has_key?(movie.rating)
   end
  end


  
def helper_check(rating)
     if(params[:ratings] == nil)
      return true
     end
    return params[:ratings].has_key?(rating)
  end


end
