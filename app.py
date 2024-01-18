from flask import Flask, request, jsonify
from dotenv import load_dotenv
from recomendation import recommendation, calculate_total_calories_user, calculate_total_protein_user
from flask_cors import CORS
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

load_dotenv()

app = Flask(__name__)
app.config['DEBUG'] = os.environ.get('FLASK_DEBUG')
app.config['MAX_CONTENT_LENGTH'] = 100 * 1024 * 1024  # Example: 100MB max size
@app.route('/get-recommendation', methods=['POST'])
def get_recommendation():
    data = request.json
    if not all(k in data for k in ('gender', 'weight', 'height', 'age', 'activity_level', 'target')):
        return jsonify({'message': 'Missing data in request'}), 400

    gender = data['gender']
    weight = data['weight']
    height = data['height']
    age = data['age']
    activity_level = data['activity_level']
    target = data['target']

    breakfast, lunch, dinner = recommendation(gender, weight, height, age, activity_level, target)
    total_calories= calculate_total_calories_user(gender, weight, height, age, activity_level, target)
    total_protein= calculate_total_protein_user(age, weight,activity_level, target)

    # Assuming breakfast, lunch, and dinner are DataFrames
    breakfast_dict = breakfast.to_dict(orient='records')
    lunch_dict = lunch.to_dict(orient='records')
    dinner_dict = dinner.to_dict(orient='records')

    return jsonify({
        'Breakfast': breakfast_dict,
        'Lunch': lunch_dict,
        'Dinner': dinner_dict,
        'total_protein': total_protein,
        'total_calories': total_calories,
    })

if __name__ == '__main__':
    app.run(debug=True)
