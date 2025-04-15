"use client";

import {Card, CardContent, CardHeader, CardTitle} from "@/components/ui/card";
import {Button} from "@/components/ui/button";

const MealCard = ({name, calories, description, image}: { name: string; calories: string; description: string, image: string }) => (
  <Card className="w-full md:w-64">
    <CardHeader>
      <CardTitle>{name}</CardTitle>
    </CardHeader>
    <CardContent>
      <img src={image} alt={name} className="w-full h-32 object-cover rounded-md mb-2"/>
      <p className="text-sm">{description}</p>
      <p className="text-xs text-muted-foreground">Calories: {calories}</p>
      <Button variant="outline" className="mt-2">How to Cook</Button>
    </CardContent>
  </Card>
);

const MealsPage = () => {
  const meals = [
    {
      name: "Grilled Salmon with Quinoa",
      calories: "450",
      description: "Healthy and delicious meal rich in omega-3 fatty acids.",
      image: "https://picsum.photos/200/150",
    },
    {
      name: "Chicken Breast with Roasted Vegetables",
      calories: "380",
      description: "Lean protein source with fiber-rich vegetables.",
      image: "https://picsum.photos/201/150",
    },
    {
      name: "Tofu Stir-Fry",
      calories: "320",
      description: "Vegetarian meal with plant-based protein and essential nutrients.",
      image: "https://picsum.photos/202/150",
    },
  ];

  return (
    <div className="flex flex-col h-full p-4">
      <h1 className="text-2xl font-bold">Meals</h1>
      <div className="flex flex-row gap-4 overflow-x-auto">
        {meals.map((meal, index) => (
          <MealCard key={index} name={meal.name} calories={meal.calories} description={meal.description} image={meal.image}/>
        ))}
      </div>
    </div>
  );
};

export default MealsPage;
