"use client";

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import {Badge} from "@/components/ui/badge";

const WorkoutCard = ({name, duration, intensity, muscleGroups}: { name: string; duration: string; intensity: string, muscleGroups: string[] }) => (
  <Card className="w-full md:w-64">
    <CardHeader>
      <CardTitle>{name}</CardTitle>
    </CardHeader>
    <CardContent>
      <p className="text-sm">Duration: {duration}</p>
      <Badge variant="secondary">{intensity}</Badge>
      <div className="flex flex-row gap-2 mt-2">
        {muscleGroups.map((muscleGroup, index) => (
          <span key={index} className="text-xs text-muted-foreground">{muscleGroup}</span>
        ))}
      </div>
    </CardContent>
  </Card>
);

const WorkoutsPage = () => {
  const workouts = [
    {
      name: "Full Body Strength Training",
      duration: "60 minutes",
      intensity: "High",
      muscleGroups: ["Chest", "Back", "Legs", "Shoulders", "Arms"],
    },
    {
      name: "Cardio Blast",
      duration: "45 minutes",
      intensity: "Medium",
      muscleGroups: ["Heart", "Lungs"],
    },
    {
      name: "Yoga Flow",
      duration: "30 minutes",
      intensity: "Low",
      muscleGroups: ["Core", "Flexibility"],
    },
  ];

  return (
    <div className="flex flex-col h-full p-4">
      <h1 className="text-2xl font-bold">Workouts</h1>
      <div className="flex flex-row gap-4 overflow-x-auto">
        {workouts.map((workout, index) => (
          <WorkoutCard key={index} name={workout.name} duration={workout.duration} intensity={workout.intensity} muscleGroups={workout.muscleGroups}/>
        ))}
      </div>
    </div>
  );
};

export default WorkoutsPage;
