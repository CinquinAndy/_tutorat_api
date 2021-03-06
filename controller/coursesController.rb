# frozen_string_literal: true
load 'requests/courses.rb'

post '/api/experiencePeople' do
  postExperiencePeople(params[:idPeople], params[:experience])
end

# ROUTE : {GET}/api/listPeopleCourseById
# RETURN : JSON of people about a course
post '/api/listPeopleCourseById' do
  getListPeopleCourseById(params[:idCourse])
end

# ROUTE : {GET}/api/peopleCourseById
# RETURN : JSON of all courses for specific people
get '/api/peopleCourseById' do
  getPeopleCourseById(params[:idPeople])
end

# ROUTE : {GET}/api/peopleCourseById
# RETURN : JSON of all courses for specific people (tutor)
post '/api/peopleTutorCourseById' do
  getPeopleTutorCourseById(params[:idPeople])
end

# Insertion dans personne cours du couple id_cours & id_personne, pour un élève , si il n'existe pas déjà
# ROUTE : {POST}/api/registrationCourse
# PARAM : STRING -> idPeople(id personne qui s'inscrit) ~/~ STRING -> idCourse(id du cours où la personne s'inscrit)
post '/api/registrationCourse' do
  postRegistrationCourse(params[:idPeople], params[:idCourse])
end

# Insertion d'un nouveau cours si il n'existe pas déjà, et suppression des propositions associés au niveau et au cours
# ROUTE : {POST}/api/postCourse
# PARAM : String : id_personne (uuid) // String : id_matiere (uuid) // String : id_promo (uuid) // String : intitule // timestamp : date // String : commentaires
post '/api/postCourse' do
  postCourse(params[:id_personne], params[:id_matiere], params[:id_promo], params[:intitule], params[:date], params[:commentaires])
end

# modification complète du cours
# ROUTE : {POST}/api/postModifCourse
# PARAM : tous les paramètres correspondant aux cours
post '/api/postModifCourse' do
  postModifCourse(params[:id_cours], params[:id_matiere], params[:id_promo], params[:intitule], params[:date], params[:commentaires],
                  params[:nb_participants], params[:duree], params[:salle])
end

# modification complète du cours & cloture
# ROUTE : {POST}/api/postCloseCourse
# PARAM : tous les paramètres correspondant aux cours
post '/api/postCloseCourse' do
  postCloseCourse(params[:id_cours], params[:id_matiere], params[:id_promo], params[:intitule], params[:date], params[:commentaires],
                  params[:nb_participants], params[:duree], params[:salle])
end

# ROUTE : {GET}/bot/unclosedCourses
# RETURN : JSON of Tuteur, matière, unclosed courses
get '/api/unclosedCourses' do
  getUnclosedCourses
end

# ROUTE : {GET}/bot/unclosedCourses
# RETURN : JSON of Tuteur, matière, unclosed courses
get '/bot/unclosedCourses' do
  getUnclosedCourses
end

# ROUTE : {POST}/bot/peopleCourse
# PARAM : STRING -> lastname(nom) ~/~ STRING -> firstname(prénom)
# RETURN : JSON of courses for a specified people
# EXAMPLE : /bot/peopleCourse?lastname=Menanteau&firstname=Cédric
post '/bot/peopleCourse' do
  getCoursesOfASpecificUser(params[:lastname], params[:firstname])
end

# ROUTE : {POST}/bot/unclosedCoursesPromo
# PARAM : STRING -> name_promo(intitule promo)
# RETURN : JSON of courses for a specified promo
# EXAMPLE : /bot/unclosedCoursesPromo/B1
post '/bot/unclosedCoursesPromo/:name_promo' do |name_promo|
  getUnclosedCoursesByIntitule(name_promo)
end

# ROUTE : {GET}/bot/courseOfTheDay
# RETURN : JSON of intitule, heure, date, salle , matière, promo
get '/bot/getCourseOfTheDay' do
  getCourseOfTheDay
end

# ROUTE : {POST}/api/getOwnCourses
# PARAM : STRING -> ID personne
# RETURN : JSON of courses for a specified person when he's tutor of them
post '/api/getOwnCourses' do
  getOwnCourses(params[:idPersonne])
end

# ROUTE : {POST}/api/getRegisteredCourses
# PARAM : STRING -> ID personne
# RETURN : JSON of courses for a specified person when he's registered on them
post '/api/getRegisteredCourses' do
  getRegisteredCourses(params[:idPersonne])
end

# ROUTE : {POST}/api/postDeregisterFromCourse
# PARAM 1 : STRING -> ID personne
# PARAM 2 : STRING -> ID cours
post '/api/postDeregisterFromCourse' do
  postDeregisterFromCourse(params[:idPersonne], params[:idCours])
end