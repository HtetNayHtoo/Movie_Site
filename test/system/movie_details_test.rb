require "application_system_test_case"

class MovieDetailsTest < ApplicationSystemTestCase
  setup do
    @movie_detail = movie_details(:one)
  end

  test "visiting the index" do
    visit movie_details_url
    assert_selector "h1", text: "Movie Details"
  end

  test "creating a Movie detail" do
    visit movie_details_url
    click_on "New Movie Detail"

    fill_in "Cast", with: @movie_detail.cast
    fill_in "Director", with: @movie_detail.director
    fill_in "Imdb", with: @movie_detail.imdb
    fill_in "Release date", with: @movie_detail.release_date
    fill_in "Rotten tomatoe", with: @movie_detail.rotten_tomatoe
    fill_in "Trailer link", with: @movie_detail.trailer_link
    click_on "Create Movie detail"

    assert_text "Movie detail was successfully created"
    click_on "Back"
  end

  test "updating a Movie detail" do
    visit movie_details_url
    click_on "Edit", match: :first

    fill_in "Cast", with: @movie_detail.cast
    fill_in "Director", with: @movie_detail.director
    fill_in "Imdb", with: @movie_detail.imdb
    fill_in "Release date", with: @movie_detail.release_date
    fill_in "Rotten tomatoe", with: @movie_detail.rotten_tomatoe
    fill_in "Trailer link", with: @movie_detail.trailer_link
    click_on "Update Movie detail"

    assert_text "Movie detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Movie detail" do
    visit movie_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movie detail was successfully destroyed"
  end
end
