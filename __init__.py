from flask import Flask, jsonify, Response, request
import datetime

app = Flask(__name__)

from dbhandler import DatabaseConnection

app.config['JSON_AS_ASCII'] = False

# config Database
connection = DatabaseConnection()

@app.route('/')
def hello():
    return 'Hi there :D'

@app.route('/api/', methods=['GET'])
def get_data():
	connection.connect()

	country = "All"
	sort = "None"

	country = request.args.get('country', default = "All", type = str)
	sort = request.args.get('sort', default = "None", type = str)

	query = ""
	attributes = "id, name, address, rating, description, wifi, parking, pet_allowed, fitness, food, price, img1, img2"
	attributes2 = "h.id, h.name, h.address, h.rating, h.description, h.wifi, h.parking, h.pet_allowed, h.fitness, h.food, h.price, h.img1, h.img2"
	if country != "All" and sort == "None":
		query = """
			SELECT {}
			FROM Hotels h
			JOIN Countries c ON h.countryID = c.id
			WHERE c.name = '{}'
		""".format(attributes, country)
	elif country == "All" and sort == "None":
		query = """
			SELECT {}
			FROM Hotels h
		""".format(attributes, country)
	elif country == "All" and sort != "None":
		if sort == "Expensivefirst":
			query = """
				SELECT {}
				FROM Hotels
				ORDER BY price DESC
			""".format(attributes)
		elif sort == "Cheapfirst":
			query = """
				SELECT {}
				FROM Hotels
				ORDER BY price
			""".format(attributes)
		elif sort == "Lowrate":
			query = """
				SELECT {}
				FROM Hotels
				ORDER BY rating 
			""".format(attributes)
		elif sort == "Highrate":
			query = """
				SELECT {}
				FROM Hotels
				ORDER BY rating DESC
			""".format(attributes)
	elif country != "All" and sort != "None":
		if sort == "Expensivefirst":
			query = """
				SELECT {}
				FROM Hotels h
				JOIN Countries c ON h.countryID = c.id
				WHERE c.name = '{}'
				ORDER BY price DESC
			""".format(attributes2, country)
		elif sort == "Cheapfirst":
			query = """
				SELECT {}
				FROM Hotels h
				JOIN Countries c ON h.countryID = c.id
				WHERE c.name = '{}'
				ORDER BY price
			""".format(attributes2, country)
		elif sort == "Lowrate":
			query = """
				SELECT {}
				FROM Hotels h
				JOIN Countries c ON h.countryID = c.id
				WHERE c.name = '{}'
				ORDER BY rating 
			""".format(attributes2, country)
		elif sort == "Highrate":
			query = """
				SELECT {}
				FROM Hotels h
				JOIN Countries c ON h.countryID = c.id
				WHERE c.name = '{}'
				ORDER BY rating DESC
			""".format(attributes2, country)

	hotels = connection.execute_query(query)
	connection.close()
	return jsonify(hotels)
# end def

@app.route('/api/countries/', methods=['GET'])
def get_countries():
	connection.connect()
	query = "SELECT name FROM Countries"
	countries = connection.execute_query(query)
	connection.close()
	return jsonify(countries)
# end def

@app.route('/api/rooms/', methods=['GET'])
def get_rooms():
	connection.connect()
	attributes = "r.id, r.name, r.description, r.price, r.img"
	hotelID = request.args.get('hotel', default = "All", type = int)

	query = """
		SELECT {}
		FROM Hotels h
		JOIN Rooms r ON h.id = r.hotelID
		WHERE h.id = {}
	""".format(attributes, hotelID)

	rooms = connection.execute_query(query)
	connection.close()
	return jsonify(rooms)
# end def

@app.route('/api/reserve', methods=['POST'])
def make_reservation():
	now = datetime.datetime.now()

	connection.connect()

	roomID = request.args.get('room', default = -1, type = int)
	dateFrom = request.args.get('dateFrom', default = "None", type = str)
	dateTo = request.args.get('dateTo', default = "None", type = str)

	query = """
		SELECT id FROM Reservation WHERE roomID = {}
	""".format(roomID)
	data = connection.execute_query(query)

	dateFromObj = datetime.datetime.strptime(dateFrom, '%d.%m.%Y')
	dateToObj = datetime.datetime.strptime(dateTo, '%d.%m.%Y')
	dateNowObj = datetime.datetime.strptime('{}.{}.{}'.format(now.day, now.month, now.year), '%d.%m.%Y')

	if dateFromObj == dateToObj:
		return "Same date was chosen."

	elif dateFromObj < dateNowObj or dateToObj < dateNowObj or dateToObj < dateFromObj:
		return "Wrong date was chosen."

	# return '{}.{}.{}'.format(dateFromObj.day, dateFromObj.month, dateFromObj.year)

	message = "Room already reserved."
	if len(data) == 0:
		query = """
			INSERT INTO Reservation (dateFrom, dateTo, roomID) VALUES (STR_TO_DATE('{}', "%d.%m.%Y"), STR_TO_DATE('{}', "%d.%m.%Y"), {})
		""".format(dateFrom, dateTo, roomID)

		connection.execute_query(query)
		connection.execute_query("commit")
		message = "OK"

	connection.close()

	return message
# end def

if __name__ == '__main__':
    app.run(host="0.0.0.0")
