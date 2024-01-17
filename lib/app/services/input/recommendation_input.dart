class RecommendationInput {
  final int? gender;
  final int? weight;
  final int? height;
  final int? age;
  final int? activityLevel;
  final int? target;

  RecommendationInput({
    this.gender,
    this.height,
    this.weight,
    this.age,
    this.activityLevel ,
    this.target,
  });
}

// {
//     "gender": 0,
//     "weight": 50,
//     "height": 169,
//     "age": 20,
//     "activity_level": 3,
//     "target":0
// }