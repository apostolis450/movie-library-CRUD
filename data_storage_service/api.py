from flask import Flask, make_response, request, jsonify
from flask_mongoengine import MongoEngine


app = Flask(__name__)
db_uri = 'mongodb://10.10.1.7:27017/Library'
app.config['MONGODB_SETTINGS'] = {
    'db'   : 'Library',
    'host' : db_uri
}

db = MongoEngine(app)
# db.init_app()


class Movies(db.Document):
	movie_id = db.SequenceField()
	title = db.StringField()
	cinema = db.StringField()

	def to_json(self):
		return {
			"movie_id" : self.movie_id,
			"title"    : self.title,
			"cinema"   : self.cinema
		}

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

# /api/movies/search/<slug> for use with search and __contains

@app.route('/api/movies', methods=['GET', 'POST'])
def api_movies():
	if request.method == 'GET':
		movies = []
		for mv in Movies.objects:
			movies.append(mv)
		return make_response(jsonify(movies), 200)
	elif request.method == 'POST':
		content = request.json
		movie = Movies(title = content['title'], cinema = content['cinema'])
		movie.save()
		return make_response("added", 201)


@app.route('/api/db_init', methods=['POST'])
def db_init():
	movie1 = Movies(title="Movie 1",cinema="Odeon")
	movie1.save()
	movie2 = Movies(title="Movie 2",cinema="Ster Cinema")
	movie2.save()
	movie3 = Movies(title="Movie 3",cinema="Odeon")
	movie3.save()

	return make_response("ok",201)



if __name__=='__main__':
	app.run(debug=True, host="0.0.0.0") #debug=True so server autoreloads on every change!