import pandas as pd
import random
from sklearn.utils import shuffle
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
import tensorflow as tf


# Function to load and preprocess data
def load_and_preprocess_data(file_path):
    df = pd.read_csv(file_path)
    df = shuffle(df)
    features_values = df.iloc[:, 5:7].values
    return df, features_values

# TensorFlow function to normalize features and find nearest neighbors
def find_nearest_neighbors(features, k=10):
    normalizer = tf.keras.layers.Normalization(axis=-1)
    normalizer.adapt(features)
    features_normalized = normalizer(features)

    # Calculate pairwise distances and find nearest neighbors
    distances = tf.norm(features_normalized[:, tf.newaxis] - features_normalized, axis=-1)
    _, indices = tf.math.top_k(-distances, k=k)
    return indices.numpy()  # Convert tensor to numpy array for later use

# Function to calculate BMR
def calculate_bmr(gender, weight, height, age):
    if gender == 0:
        bmr = 10 * weight + 6.25 * height - 5 * age + 5
    elif gender == 1:
        bmr = 10 * weight + 6.25 * height - 5 * age - 161
    else:
        raise ValueError("Invalid gender. Please choose 'male' or 'female'.")
    return bmr

# Function to calculate total calories
def calculate_total_calories(bmr, activity_level, target):
    activity_levels = {
        3: 1.375, # easy
        2: 1.55,  # medium 
        1: 1.725, # hard
        0: 1.9    # extreme
    }
    targets = {
        0: 0.8, # reduce_weight
        1: 1.2, # increase_muscle
        2: 1    # be_healthy
    }
    maintain_calories = bmr * activity_levels[activity_level]
    total_calories = maintain_calories * targets[target]
    return int(total_calories)

def calculate_total_calories_user(gender, weight, height, age, activity_level, target):
    bmr = calculate_bmr(gender, weight, height, age)
    return calculate_total_calories(bmr, activity_level, target)

def calculate_total_protein_user(age,weight, activity_level, target):
    # Basic protein need multiplier based on age
    protein_needs = 0.8
    if age >= 65:
        return weight
    # Adjust protein needs based on activity level
    activity_levels = {
        3: 1.5, # easy
        2: 1.75, # medium
        1: 2, # hard
        0: 2    # extreme
    }

    # Adjust protein needs based on target goals
    targets = {
        0: 1,   # reduce_weight
        1: 2,   # increase_muscle
        2: 1    # be_healthy
    }

    # Check if the activity level is valid
    if activity_level in activity_levels:
        # Calculate the base protein requirement
        base_protein_requirement = weight * protein_needs * activity_levels[activity_level]
        # Adjust for target goal
        if target in targets:
            if target == 1:
                total_protein = weight * protein_needs * targets[target]
            else:
                total_protein = base_protein_requirement * targets[target]
        else:
            raise ValueError("Invalid target. Please choose a valid target.")
    else:
        raise ValueError("Invalid activity level. Please choose a value between 0 and 3.")

    return int(total_protein)

# Function to allocate meal calories
def allocate_meal_calories(total_calories):
    breakfast_calories = total_calories * 0.15
    lunch_calories = total_calories * 0.50
    dinner_calories = total_calories * 0.35
    return breakfast_calories, lunch_calories, dinner_calories

# Function to find the closest food item in calories
def find_closest_food(all_calories, meal_calories):
    closest_index = min(range(len(all_calories)), key=lambda i: abs(all_calories[i] - meal_calories))
    return closest_index

# Function to get random selection from neighbors
def get_random_selection(df, indices, food_code):
    neighbors_indices = indices[food_code]
    selected_indices = random.sample(list(neighbors_indices), 5)
    return df.iloc[selected_indices]

# Function to clean data
def clean_data(df):
    df.loc[:, 'Foto'] = df['Foto'].fillna('')
    return df

# Main recommendation function
def recommendation(gender, weight, height, age, activity_level, target):
    # Load and preprocess data
    df, features_values = load_and_preprocess_data('dataset/makanan_indonesia.csv')

    # Find nearest neighbors using TensorFlow
    indices = find_nearest_neighbors(features_values)

    # Calculate BMR and total calories
    bmr = calculate_bmr(gender, weight, height, age)
    total_calories = calculate_total_calories(bmr, activity_level, target)

    # Allocate calories to meals
    breakfast_calories, lunch_calories, dinner_calories = allocate_meal_calories(total_calories)

    # Find closest food items for each meal
    all_calories = list(df['kalori'].values)
    breakfast_food_code = find_closest_food(all_calories, breakfast_calories)
    lunch_food_code = find_closest_food(all_calories, lunch_calories)
    dinner_food_code = find_closest_food(all_calories, dinner_calories)

    # Get random selections for each meal
    breakfast_recommendations = get_random_selection(df, indices, breakfast_food_code)
    lunch_recommendations = get_random_selection(df, indices, lunch_food_code)
    dinner_recommendations = get_random_selection(df, indices, dinner_food_code)

    # Clean data
    breakfast_recommendations = clean_data(breakfast_recommendations)
    lunch_recommendations = clean_data(lunch_recommendations)
    dinner_recommendations = clean_data(dinner_recommendations)

    return breakfast_recommendations, lunch_recommendations, dinner_recommendations
