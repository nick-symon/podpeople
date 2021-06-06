module StarRatingHelper
  def star_rating(rating)
    empty_star = inline_svg_tag("svg/star_outline.svg")
    half_star = inline_svg_tag("svg/star_half.svg")
    full_star = inline_svg_tag("svg/star")
    avg_rating = (rating * 2.0).round / 2.0
    rd_rating = avg_rating.round(half: :down)
    full_ct = rd_rating
    if rd_rating > avg_rating
      half_ct = 1
      empty_ct = 5 - (rd_rating + 1)
    else
      half_ct = 0
      empty_ct = 5 - rd_rating
    end
    star_rating = (full_star * full_ct) + (half_star * half_ct) + (empty_star * empty_ct)  
  end
end