# class StarRatingHelperTest < ActionView::TestCase
#   test 'star rating round up works' do
#     three_two_rating ="<!-- Generated by IcoMoon.io --><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n<title>star</title>\n<path d=\"M12 17.25l-6.188 3.75 1.641-7.031-5.438-4.734 7.172-0.609 2.813-6.609 2.813 6.609 7.172 0.609-5.438 4.734 1.641 7.031z\"></path>\n</svg>\n<!-- Generated by IcoMoon.io --><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n<title>star</title>\n<path d=\"M12 17.25l-6.188 3.75 1.641-7.031-5.438-4.734 7.172-0.609 2.813-6.609 2.813 6.609 7.172 0.609-5.438 4.734 1.641 7.031z\"></path>\n</svg>\n<!-- Generated by IcoMoon.io --><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n<title>star</title>\n<path d=\"M12 17.25l-6.188 3.75 1.641-7.031-5.438-4.734 7.172-0.609 2.813-6.609 2.813 6.609 7.172 0.609-5.438 4.734 1.641 7.031z\"></path>\n</svg>\n<!-- Generated by IcoMoon.io --><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n<title>star_outline</title>\n<path d=\"M12 15.422l3.75 2.25-0.984-4.266 3.328-2.906-4.406-0.375-1.688-4.031-1.688 4.031-4.406 0.375 3.328 2.906-0.984 4.266zM21.984 9.234l-5.438 4.734 1.641 7.031-6.188-3.75-6.188 3.75 1.641-7.031-5.438-4.734 7.172-0.609 2.813-6.609 2.813 6.609z\"></path>\n</svg>\n<!-- Generated by IcoMoon.io --><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\">\n<title>star_outline</title>\n<path d=\"M12 15.422l3.75 2.25-0.984-4.266 3.328-2.906-4.406-0.375-1.688-4.031-1.688 4.031-4.406 0.375 3.328 2.906-0.984 4.266zM21.984 9.234l-5.438 4.734 1.641 7.031-6.188-3.75-6.188 3.75 1.641-7.031-5.438-4.734 7.172-0.609 2.813-6.609 2.813 6.609z\"></path>\n</svg>\n" 
#     assert_equal three_two_rating, star_rating_helper(3.2)
#   end

  # test 'star rating round up works' do
  #   star_rating_helper(3.7)
  # end
# end