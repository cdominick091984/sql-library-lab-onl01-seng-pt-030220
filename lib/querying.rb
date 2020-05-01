def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year FROM books where series_id = #{1}"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto FROM characters 
    ORDER BY characters.motto LIMIT #{1}"
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(*) FROM characters 
    WHERE characters.species = 'human'"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM authors 
    JOIN subgenres ON authors.id = subgenres.id"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series 
    JOIN books ON series.id = books.series_id 
    JOIN character_books ON books.id = character_books.book_id 
    JOIN characters ON character_books.character_id = characters.id 
    WHERE characters.species = 'human' 
    GROUP BY series.title limit 1"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name AS char_name, COUNT(name) AS book_count
    FROM character_books
    INNER JOIN characters
    ON characters.id = character_books.character_id
    GROUP BY char_name
    ORDER BY book_count DESC, char_name"
end
