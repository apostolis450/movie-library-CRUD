from flask import Flask, make_response, request, jsonify
from flask_mongoengine import MongoEngine
from mongoengine import *
import datetime, json

app = Flask(__name__)
db_uri = 'mongodb://mongo_db:27017/Library'
app.config['MONGODB_SETTINGS'] = {
    'db'   : 'Library',
    'host' : db_uri
}

db = MongoEngine(app)
# db.init_app()

# ---------------------- MODELS ---------------------------------
class Cinema(db.Document):
	name = db.StringField()
	owner_id = db.StringField() # store ID from keyrock response
	# movie_id = db.ReferenceField(Movies, required=True)

	def to_json(self):
		return {
			"_id" : str(self.pk),
			# "Movie" : self.movie_id.title,
			"Owner_id" : self.owner_id,
			"Cinema name"  : self.name
		}

class Movies(db.Document):
	title = db.StringField()
	cinema = db.StringField()
	cinema_id = db.ReferenceField(Cinema, required=True)
	category = db.StringField()
	start_date = db.DateTimeField(default=datetime.datetime.utcnow().replace(microsecond=0), required=False)
	end_date = db.DateTimeField(required=True)
	

	def to_json(self):
		return {
			"id"         : str(self.pk),
			"title"      : self.title,
			"cinema"     : self.cinema,
			"cinema_id"  : str(self.cinema_id),
			"category"   : self.category,
			"start_date" : self.start_date,
			"end_date"   : self.end_date
		}

class Favorites(db.Document):
	movie_id = db.ReferenceField(Movies, required=True, reverse_delete_rule=CASCADE)
	user_id = db.StringField() # store ID from keyrock response

	def to_json(self):
		return {
			"_id" : str(self.pk),
			"movie_id" : str(self.movie_id.pk),
			"user_id"  : self.user_id
		}

# ----------------------------------------------------------------

# ---------------------- API ENDPOINTS ---------------------------
#get-update-delete a specific movie
@app.route('/api/movies/<slug>', methods=['GET', 'PUT', 'DELETE',])
def api_movie(slug):
	if request.method == 'GET':
		movie_obj = Movies.objects(title = slug).first()
		if movie_obj:
			return make_response(jsonify(movie_obj.to_json()), 200)
	elif request.method == 'PUT':
		content = request.json
		movie_obj = Movies.objects(title = slug).first()
		movie_obj.update(title = content['title'], cinema = content['cinema'])
		return make_response("updated", 204)
	elif request.method == 'DELETE':
		movie_obj = Movies.objects(pk = slug).first()
		movie_obj.delete()
		return make_response("deleted!", 204)

# /api/movies/search/<slug> for use with search and __contains  <-----------

#get all movies / Post new movie
@app.route('/api/movies', methods=['GET', 'POST'])
def api_movies():
	if request.method == 'GET':
		movies = []
		for mv in Movies.objects:
			movies.append(mv.to_json())
		# print(movies[0]['title'])
		return make_response(jsonify(movies), 200)
	elif request.method == 'POST':
		content = request.json
		
		#convert dates to fit the datetimefield of mongo
		st = datetime.datetime.strptime(content['start_date'], "%m-%d-%Y")
		ed = datetime.datetime.strptime(content['end_date'], "%m-%d-%Y")
		
		movie = Movies(title = content['title'], cinema = content['cinema'], category = content['category'],start_date=st,end_date=ed)
		movie.save()
		return make_response("added", 201)

@app.route('/api/favorites', methods=['GET', 'POST', 'DELETE'])
def api_favorites():
	if request.method == 'GET':
		favs = []
		movies = []
		for fv in Favorites.objects:
			favs.append(fv.to_json())
		for i in range(len(favs)):
			mv = Movies.objects(pk = favs[i]['movie_id']).first()
			movies.append(mv.to_json())
		return make_response(jsonify(movies), 200)
	elif request.method == 'POST':
		content = request.form.to_dict() #decode ajax's data
		movie_id = content["id"]
		uid = content["uid"]
		mv = Movies.objects(pk = movie_id).first()
		fv = Favorites.objects(movie_id = mv,user_id = uid).first()
		if fv is not None:
			return make_response("Already in favorites!", 202)
		else:	
			Favorites(movie_id = mv,user_id = uid).save()
			return make_response("Added to favorites!", 201)
	else: #DELETE
		content = request.form.to_dict() #decode ajax's data
		movie_id = content["id"]
		uid = content["uid"]
		mv = Movies.objects(pk = movie_id).first()
		fv=Favorites.objects(movie_id = mv,user_id = uid).first()
		fv.delete()
		return make_response("Successfuly deleted!", 204)

# ----------------------------------------------------------------
@app.route('/api/db_init', methods=['POST'])
def db_init():
	Movies.drop_collection()
	Favorites.drop_collection()
	Cinema.drop_collection()

	st = datetime.datetime.strptime("10-15-2021", "%m-%d-%Y")
	ed = datetime.datetime.strptime("10-25-2021", "%m-%d-%Y")

	cinema1 = Cinema(name = "Odeon", owner_id= "37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5").save()

	movie1 = Movies(title="The Suicide Squad",cinema=cinema1.name,cinema_id=cinema1,category="action",start_date=st,end_date=ed)
	movie1.save()
	movie2 = Movies(title="Joker",cinema=cinema1.name,cinema_id=cinema1,category="drama",start_date=st,end_date=ed)
	movie2.save()
	movie3 = Movies(title="Tenet",cinema=cinema1.name,cinema_id=cinema1,category="comedy",start_date=st,end_date=ed)
	movie3.save()
	
	fav = Favorites(movie_id = movie3,user_id = "37ff7ea9-e8c1-416b-82f1-5ce3c5e68ed5").save()
	fav.delete()
	
	return make_response("ok",201)


if __name__=='__main__':
	app.run(debug=True, host="0.0.0.0") #debug=True so server autoreloads on every change!