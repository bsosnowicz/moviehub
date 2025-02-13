# Actors
actors = [
  { name: "Leonardo", surname: "DiCaprio", date_of_birth: "1974-11-11", place_of_birth: "Los Angeles, USA", height: 183, rating: 9.5, image_url: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/ts9l18VkDSooRGDWIeQegNVHciC.jpg" },
  { name: "Scarlett", surname: "Johansson", date_of_birth: "1984-11-22", place_of_birth: "New York, USA", height: 160, rating: 9.2, image_url: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/6NsMbJXRlDZuDzatN2akFdGuTvx.jpg" },
  { name: "Brad", surname: "Pitt", date_of_birth: "1963-12-18", place_of_birth: "Shawnee, USA", height: 180, rating: 9.0, image_url: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/4rjnRCQ6bGFYdBb4UooOjsQy12c.jpg" },
  { name: "Angelina", surname: "Jolie", date_of_birth: "1975-06-04", place_of_birth: "Los Angeles, USA", height: 169, rating: 8.9, image_url: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/bXNxIKcJ5cNNW8QFrBPWcfTSu9x.jpg" },
  { name: "Tom", surname: "Hanks", date_of_birth: "1956-07-09", place_of_birth: "Concord, USA", height: 182, rating: 9.3, image_url: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/eKF1sGJRrZJbfBG1KirPt1cfNd3.jpg" },
  { name: "Morgan", surname: "Freeman", date_of_birth: "1937-06-01", place_of_birth: "Memphis, USA", height: 188, rating: 9.7, image_url: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/jPsLqiYGSofU4s6BjrxnefMfabb.jpg" },
  { name: "Robert", surname: "Downey Jr.", date_of_birth: "1965-04-04", place_of_birth: "New York, USA", height: 174, rating: 9.4, image_url: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/5qHNjhtjMD4YWH3UP0rm4tKwxCL.jpg" },
  { name: "Chris", surname: "Hemsworth", date_of_birth: "1983-08-11", place_of_birth: "Melbourne, Australia", height: 190, rating: 9.1, image_url: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/piQGdoIQOF3C1EI5cbYZLAW1gfj.jpg" },
  { name: "Emma", surname: "Watson", date_of_birth: "1990-04-15", place_of_birth: "Paris, France", height: 165, rating: 8.8, image_url: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/A14lLCZYDhfYdBa0fFRpwMDiwRN.jpg" },
  { name: "Denzel", surname: "Washington", date_of_birth: "1954-12-28", place_of_birth: "Mount Vernon, USA", height: 185, rating: 9.6, image_url: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/jj2Gcobpopokal0YstuCQW0ldJ4.jpg" },
  {name: "Bryan", surname: "Cranston", date_of_birth: "1956-03-07", place_of_birth: "Hollywood, California, USA", height: 178, rating: 9.5, image_url: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/aGSvZg7uITJveQtGHDcPNI6map1.jpg"}
]

actors.each { |actor| Actor.find_or_create_by(actor) }

# Movies
movies = [
  { title: "Inception", description: "A thief who enters the dreams of others to steal secrets.", rating: 9.0, release_date: "2010-07-16", length: 148, category: "Sci-Fi", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/efvcvRgOAZgFC2hrPUa6YqrE1KG.jpg" },
  { title: "The Shawshank Redemption", description: "Two imprisoned men bond over years in prison.", rating: 9.3, release_date: "1994-09-23", length: 142, category: "Drama", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/sBnhJ4f5KAzg6C3FwnEb8QFj8SB.jpg" },
  { title: "The Dark Knight", description: "Batman faces his greatest enemy, the Joker.", rating: 9.1, release_date: "2008-07-18", length: 152, category: "Action", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/gKMDmGde8aAD8M6dvm6j7wciSbJ.jpg" },
  { title: "Forrest Gump", description: "The story of a slow-witted but kind-hearted man.", rating: 8.8, release_date: "1994-07-06", length: 142, category: "Drama", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/iixrNXX79OR7knBx1i9S51PfVlz.jpg" },
  { title: "Fight Club", description: "An insomniac office worker forms an underground fight club.", rating: 8.9, release_date: "1999-10-15", length: 139, category: "Thriller", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/efBb4gjjKneUoBVgfFOUu2OwihS.jpg" },
  { title: "Pulp Fiction", description: "A series of interconnected crime stories.", rating: 9.0, release_date: "1994-10-14", length: 154, category: "Crime", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/5Whi9po8MTPyUTxAioXfyXGHNQE.jpg" },
  { title: "The Matrix", description: "A computer hacker discovers the reality of his world.", rating: 8.7, release_date: "1999-03-31", length: 136, category: "Sci-Fi", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/xiCMLkZOVlxFbvWJMHuf4FJvnuX.jpg" },
  { title: "Interstellar", description: "A team of explorers travels through a wormhole in space.", rating: 8.9, release_date: "2014-11-07", length: 169, category: "Sci-Fi", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/q4emCJmjNomEE2pVGgqr3nDEIzI.jpg" },
  { title: "Gladiator", description: "A former Roman General seeks revenge.", rating: 8.5, release_date: "2000-05-05", length: 155, category: "Historical", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/1f0U34P6OFPXvfQta556VfXZqiC.jpg" },
  { title: "Titanic", description: "A love story aboard the doomed Titanic.", rating: 8.6, release_date: "1997-12-19", length: 195, category: "Romance", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg" },
  { title: "Silent Code", description: "A psychological horror where a coder accidentally creates an AI that manipulates reality.", rating: 0, release_date: "2025-10-01", length: 118, category: "Horror", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/t4Y4Pwr2jsSRP6HbpyiixtbMM0c.jpg" },
  { title: "Titanium Valkyrie", description: "A military sci-fi adventure following an elite squadron of mecha pilots in deep space.", rating: 0, release_date: "2025-11-20", length: 135, category: "Sci-Fi", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/dbudzMOPBOG7yZpZW0YckNMdRN4.jpg" },
  { title: "Neon Horizon", description: "A group of astronauts explore a distant planet, only to uncover a dangerous secret.", rating: 0, release_date: "2025-12-15", length: 120, category: "Sci-Fi", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/uSVEIENuljEsbLogs5w8C9EVEvm.jpg" },
  { title: "The Silent War", description: "A thriller about a covert government operation to stop a global cyber attack.", rating: 0, release_date: "2025-12-20", length: 132, category: "Action", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/tbc2Mi3ChuO7U2NqhvRBuIdHKxL.jpg" },
  { title: "Eclipse", description: "A post-apocalyptic drama where survivors struggle to rebuild civilization after a global blackout.", rating: 0, release_date: "2025-11-30", length: 110, category: "Drama", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/beTtkq3BSer0Yod8KYsGB38rsXe.jpg" },
  { title: "The Fallen Empire", description: "An epic tale of a king’s downfall and the rise of a new empire.", rating: 0, release_date: "2025-10-15", length: 145, category: "Historical", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/xZLTaC1KDaynW2npx1EnrrG1ryd.jpg" },
  { title: "Quantum Fury", description: "A scientist accidentally opens a rift in time, leading to a collision of different timelines.", rating: 0, release_date: "2025-09-25", length: 140, category: "Action", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/rBCMU5hk4B5OFUWZfe6hQKcprYS.jpg" }
]

movies.each { |movie| Movie.find_or_create_by(movie) }

# Series
series = [
  { title: "Breaking Bad", description: "A high school chemistry teacher turns to meth production.", rating: 9.5, release_date: "2008-01-20", no_of_seasons: 5, category: "Crime", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg" },
  { title: "Game of Thrones", description: "Nine noble families fight for control of Westeros.", rating: 9.3, release_date: "2011-04-17", no_of_seasons: 8, category: "Fantasy", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/rz4fSqurRILu7IcAKCIgUCYJouV.jpg" },
  { title: "Stranger Things", description: "A group of kids uncover a supernatural mystery.", rating: 8.7, release_date: "2016-07-15", no_of_seasons: 4, category: "Sci-Fi", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/uOOtwVbSr4QDjAGIifLDwpb2Pdl.jpg" },
  { title: "The Office", description: "A mockumentary on a group of office workers.", rating: 8.9, release_date: "2005-03-24", no_of_seasons: 9, category: "Comedy", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/2kND8XyGerHlxwZFH1NRGc6HJCy.jpg" },
  { title: "Friends", description: "A sitcom about six friends living in NYC.", rating: 8.8, release_date: "1994-09-22", no_of_seasons: 10, category: "Comedy", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/zt4JpqUFn0c0LigvfGLjt02IYEQ.jpg" },
  { title: "The Mandalorian", description: "A lone bounty hunter navigates the galaxy.", rating: 8.7, release_date: "2019-11-12", no_of_seasons: 3, category: "Sci-Fi", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/tzf7wHWGedryBMJVXKm6Bgae096.jpg" },
  { title: "The Boys", description: "A group of vigilantes fights corrupt superheroes.", rating: 8.9, release_date: "2019-07-26", no_of_seasons: 4, category: "Action", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/2zmTngn1tYC1AvfnrFLhxeD82hz.jpg" },
  { title: "Better Call Saul", description: "The prequel to Breaking Bad.", rating: 8.7, release_date: "2015-02-08", no_of_seasons: 6, category: "Crime", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/gJGdWuCNGszNJJzGo6tfYxLTW5v.jpg" },
  { title: "The Witcher", description: "A monster hunter struggles to find his place.", rating: 8.5, release_date: "2019-12-20", no_of_seasons: 3, category: "Fantasy", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/5Su6Cq1icggn2ObdsYgZyjABizA.jpg" },
  { title: "Echoes of Time", description: "A time-travel drama where a historian discovers she can alter key historical events.", rating: 0, release_date: "2025-08-05", no_of_seasons: 1, category: "Sci-Fi", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/svKa5Vqi1A6EAM5W4BhgFZFyoAJ.jpg" },
  { title: "Dark Skies", description: "A mystery thriller about a small town plagued by strange disappearances and government conspiracies.", rating: 0, release_date: "2025-09-18", no_of_seasons: 2, category: "Mystery", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/tUeeWfVWtIDFeElvnjLo3zWGHUe.jpg" },
  { title: "Cybernetica", description: "A dystopian sci-fi series exploring the rise of AI overlords and human resistance.", rating: 0, release_date: "2025-10-12", no_of_seasons: 1, category: "Sci-Fi", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/sCeEQaDi3aJ452wGI4BAOva51AL.jpg" },
  { title: "Legends of Avalon", description: "A reimagining of Arthurian legends, mixing magic, politics, and war.", rating: 0, release_date: "2025-11-05", no_of_seasons: 3, category: "Fantasy", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/9c62bG3rt1UoFl04AnaLYCh26ZR.jpg" },
  { title: "Zero Point", description: "An espionage thriller about a rogue physicist trying to stop a black hole experiment from destroying Earth.", rating: 0, release_date: "2025-12-01", no_of_seasons: 1, category: "Thriller", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/pMmedMqnkFSpkx5it49TWvg4OcE.jpg" },
  { title: "Galactic War", description: "In a future where multiple factions fight for control of space, one crew must navigate treacherous alliances.", rating: 0, release_date: "2025-12-10", no_of_seasons: 2, category: "Sci-Fi", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/idPi7ekFM7jPQDDc2ZYOxqVBXSo.jpg" },
  { title: "The Ghost Files", description: "A team of paranormal investigators explore haunted locations, uncovering shocking secrets.", rating: 0, release_date: "2025-11-18", no_of_seasons: 1, category: "Horror", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/yHQN6OCZ6Gd2Xy5HElXr9hqw0q1.jpg" },
  { title: "The Last Stand", description: "A small town is the last line of defense against a world-ending disaster.", rating: 0, release_date: "2025-10-22", no_of_seasons: 1, category: "Drama", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/w6LQ0BCkBHGQnatNng1oSgMI6oF.jpg" },
  { title: "Future Shock", description: "Set in a dystopian future, a group of rebels fights back against a totalitarian regime.", rating: 0, release_date: "2025-09-30", no_of_seasons: 1, category: "Sci-Fi", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/vA1BwFOWLHZYhwCUVyQ67GESpAY.jpg" },
  { title: "Eternal Night", description: "A fantasy series where dark forces rise to challenge the last bastion of light.", rating: 0, release_date: "2025-12-01", no_of_seasons: 1, category: "Fantasy", image_url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/d1Obb8oxgDxEYMtEqhRICca4qcB.jpg" }
]

series.each { |serie| Series.find_or_create_by(serie) }

# Actor - movies
actor_movies = [
  { actor_id: Actor.find_by(name: "Leonardo", surname: "DiCaprio")&.id, movie_id: Movie.find_by(title: "Inception")&.id },
  { actor_id: Actor.find_by(name: "Brad", surname: "Pitt")&.id, movie_id: Movie.find_by(title: "Fight Club")&.id },
  { actor_id: Actor.find_by(name: "Tom", surname: "Hanks")&.id, movie_id: Movie.find_by(title: "Forrest Gump")&.id },
]

actor_movies.each do |actor_movie|
  actor = Actor.find_by(id: actor_movie[:actor_id])
  movie = Movie.find_by(id: actor_movie[:movie_id])
  
  actor.movies << movie unless actor.movies.include?(movie)
end

# Actor - series
actor_series = [
  { actor_id: Actor.find_by(name: "Bryan", surname: "Cranston")&.id, series_id: Series.find_by(title: "Breaking Bad")&.id },
]

actor_series.each do |actor_serie|
  actor = Actor.find_by(id: actor_serie[:actor_id])
  series = Series.find_by(id: actor_serie[:series_id])
  
  actor.series << series unless actor.series.include?(series)
end
