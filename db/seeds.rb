# Actors
actors = [
  { name: "Leonardo", surname: "DiCaprio", date_of_birth: "1974-11-11", place_of_birth: "Los Angeles, USA", height: 183, rating: 9.5 },
  { name: "Scarlett", surname: "Johansson", date_of_birth: "1984-11-22", place_of_birth: "New York, USA", height: 160, rating: 9.2 },
  { name: "Brad", surname: "Pitt", date_of_birth: "1963-12-18", place_of_birth: "Shawnee, USA", height: 180, rating: 9.0 },
  { name: "Angelina", surname: "Jolie", date_of_birth: "1975-06-04", place_of_birth: "Los Angeles, USA", height: 169, rating: 8.9 },
  { name: "Tom", surname: "Hanks", date_of_birth: "1956-07-09", place_of_birth: "Concord, USA", height: 182, rating: 9.3 },
  { name: "Morgan", surname: "Freeman", date_of_birth: "1937-06-01", place_of_birth: "Memphis, USA", height: 188, rating: 9.7 },
  { name: "Robert", surname: "Downey Jr.", date_of_birth: "1965-04-04", place_of_birth: "New York, USA", height: 174, rating: 9.4 },
  { name: "Chris", surname: "Hemsworth", date_of_birth: "1983-08-11", place_of_birth: "Melbourne, Australia", height: 190, rating: 9.1 },
  { name: "Emma", surname: "Watson", date_of_birth: "1990-04-15", place_of_birth: "Paris, France", height: 165, rating: 8.8 },
  { name: "Denzel", surname: "Washington", date_of_birth: "1954-12-28", place_of_birth: "Mount Vernon, USA", height: 185, rating: 9.6 }
]

actors.each { |actor| Actor.find_or_create_by(actor) }

# Movies
movies = [
  { title: "Inception", description: "A thief who enters the dreams of others to steal secrets.", rating: 9.0, release_date: "2010-07-16", length: 148 },
  { title: "The Shawshank Redemption", description: "Two imprisoned men bond over years in prison.", rating: 9.3, release_date: "1994-09-23", length: 142 },
  { title: "The Dark Knight", description: "Batman faces his greatest enemy, the Joker.", rating: 9.1, release_date: "2008-07-18", length: 152 },
  { title: "Forrest Gump", description: "The story of a slow-witted but kind-hearted man.", rating: 8.8, release_date: "1994-07-06", length: 142 },
  { title: "Fight Club", description: "An insomniac office worker forms an underground fight club.", rating: 8.9, release_date: "1999-10-15", length: 139 },
  { title: "Pulp Fiction", description: "A series of interconnected crime stories.", rating: 9.0, release_date: "1994-10-14", length: 154 },
  { title: "The Matrix", description: "A computer hacker discovers the reality of his world.", rating: 8.7, release_date: "1999-03-31", length: 136 },
  { title: "Interstellar", description: "A team of explorers travels through a wormhole in space.", rating: 8.9, release_date: "2014-11-07", length: 169 },
  { title: "Gladiator", description: "A former Roman General seeks revenge.", rating: 8.5, release_date: "2000-05-05", length: 155 },
  { title: "Titanic", description: "A love story aboard the doomed Titanic.", rating: 8.6, release_date: "1997-12-19", length: 195 }
]

movies.each { |movie| Movie.find_or_create_by(movie) }

# Series
series = [
  { title: "Breaking Bad", description: "A high school chemistry teacher turns to meth production.", rating: 9.5, release_date: "2008-01-20", no_of_seasons: 5 },
  { title: "Game of Thrones", description: "Nine noble families fight for control of Westeros.", rating: 9.3, release_date: "2011-04-17", no_of_seasons: 8 },
  { title: "Stranger Things", description: "A group of kids uncover a supernatural mystery.", rating: 8.7, release_date: "2016-07-15", no_of_seasons: 4 },
  { title: "The Office", description: "A mockumentary on a group of office workers.", rating: 8.9, release_date: "2005-03-24", no_of_seasons: 9 },
  { title: "Friends", description: "A sitcom about six friends living in NYC.", rating: 8.8, release_date: "1994-09-22", no_of_seasons: 10 },
  { title: "The Mandalorian", description: "A lone bounty hunter navigates the galaxy.", rating: 8.7, release_date: "2019-11-12", no_of_seasons: 3 },
  { title: "The Boys", description: "A group of vigilantes fights corrupt superheroes.", rating: 8.9, release_date: "2019-07-26", no_of_seasons: 4 },
  { title: "House of Cards", description: "A ruthless politician rises to power.", rating: 8.6, release_date: "2013-02-01", no_of_seasons: 6 },
  { title: "Better Call Saul", description: "The prequel to Breaking Bad.", rating: 8.7, release_date: "2015-02-08", no_of_seasons: 6 },
  { title: "The Witcher", description: "A monster hunter struggles to find his place.", rating: 8.5, release_date: "2019-12-20", no_of_seasons: 3 }
]

series.each { |s| Series.find_or_create_by(s) }
