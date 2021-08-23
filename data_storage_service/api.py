from flask import Flask, make_response, request, jsonify
from flask_mongoengine import MongoEngine
import datetime

app = Flask(__name__)
db_uri = 'mongodb://10.10.1.7:27017/Library'
app.config['MONGODB_SETTINGS'] = {
    'db'   : 'Library',
    'host' : db_uri
}

db = MongoEngine(app)
# db.init_app()

# ---------------------- MODELS ---------------------------------
class Movies(db.Document):
	movie_id = db.SequenceField()
	title = db.StringField()
	cinema = db.StringField()
	category = db.StringField()
	start_date = db.DateTimeField(default=datetime.datetime.utcnow().replace(microsecond=0), required=False)
	end_date = db.DateTimeField(required=False)

	def to_json(self):
		return {
			"movie_id"   : self.movie_id,
			"title"      : self.title,
			"cinema"     : self.cinema,
			"start_date" : self.start_date,
			"end_date"   : self.end_date
		}

class Favorites(db.Document):
	fav_id = db.SequenceField()
	movie_id = db.StringField()
	user_id = db.StringField()

	def to_json(self):
		return {
			"fav_id"   : self.movie_id,
			"movie_id" : self.title,
			"user_id"  : self.cinema
		}
# ----------------------------------------------------------------

# ---------------------- API ENDPOINTS ---------------------------
#get-update-delete a specific movie
@app.route('/api/movies/<slug>/', methods=['GET', 'PUT', 'DELETE',])
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
		movie_obj = Movies.objects(title = slug).first()
		movie_obj.delete()
		return make_response("deleted!", 204)

# /api/movies/search/<slug> for use with search and __contains  <-----------

@app.route('/api/movies', methods=['GET', 'POST'])
def api_movies():
	if request.method == 'GET':
		movies = []
		for mv in Movies.objects:
			movies.append(mv)
		return make_response(jsonify(movies), 200)
	elif request.method == 'POST':
		content = request.json
		
		#convert dates to fit the datetimefield of mongo
		st = datetime.datetime.strptime(content['start_date'], "%m-%d-%Y")
		ed = datetime.datetime.strptime(content['end_date'], "%m-%d-%Y")
		
		movie = Movies(title = content['title'], cinema = content['cinema'], category = content['category'],start_date=st,end_date=ed)
		movie.save()
		return make_response("added", 201)

# ----------------------------------------------------------------
@app.route('/api/db_init', methods=['POST'])
def db_init():
	st = datetime.datetime.strptime("10-15-2021", "%m-%d-%Y")
	ed = datetime.datetime.strptime("10-25-2021", "%m-%d-%Y")
	movie1 = Movies(title="Movie 1",cinema="Odeon",category="action",start_date=st,end_date=ed)
	movie1.save()
	movie2 = Movies(title="Movie 2",cinema="Ster Cinema",category="drama",start_date=st,end_date=ed)
	movie2.save()
	movie3 = Movies(title="Movie 3",cinema="Odeon",category="comedy",start_date=st,end_date=ed)
	movie3.save()

	return make_response("ok",201)


if __name__=='__main__':
	app.run(debug=True, host="0.0.0.0") #debug=True so server autoreloads on every change!