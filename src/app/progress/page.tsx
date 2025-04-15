;"use client";

import {Card, CardContent, CardHeader, CardTitle} from "@/components/ui/card";
import {LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer} from 'recharts';

const ProgressChart = () => {
  const data = [
    {name: 'Day 1', weight: 80},
    {name: 'Day 2', weight: 79},
    {name: 'Day 3', weight: 78},
    {name: 'Day 4', weight: 77},
    {name: 'Day 5', weight: 76},
    {name: 'Day 6', weight: 75},
  ];

  return (
    <ResponsiveContainer width="100%" height={300}>
      <LineChart data={data} margin={{top: 5, right: 30, left: 20, bottom: 5}}>
        <CartesianGrid strokeDasharray="3 3"/>
        <XAxis dataKey="name"/>
        <YAxis/>
        <Tooltip/>
        <Legend/>
        <Line type="monotone" dataKey="weight" stroke="#8884d8" activeDot={{r: 8}}/>
      </LineChart>
    </ResponsiveContainer>
  );
};

const StatCard = ({title, value}: { title: string; value: string }) => (
  <Card className="w-32">
    <CardHeader>
      <CardTitle>{title}</CardTitle>
    </CardHeader>
    <CardContent>
      {value}
    </CardContent>
  </Card>
);

const AchievementCard = ({title, description}: { title: string; description: string }) => (
  <Card className="w-64">
    <CardHeader>
      <CardTitle>{title}</CardTitle>
    </CardHeader>
    <CardContent>
      {description}
    </CardContent>
  </Card>
);

const ProgressPage = () => {
  return (
    <div className="flex flex-col h-full p-4">
      <h1 className="text-2xl font-bold">Progress</h1>

      <Card className="mb-4">
        <CardHeader>
          <CardTitle>Weight Progress</CardTitle>
        </CardHeader>
        <CardContent>
          <ProgressChart/>
        </CardContent>
      </Card>

      <h2 className="text-xl font-bold">Daily Stats</h2>
      <div className="flex flex-row gap-4 mb-4">
        <StatCard title="Weight" value="75 kg"/>
        <StatCard title="Calories" value="1,900"/>
        <StatCard title="Water" value="3L"/>
        <StatCard title="Sleep" value="7.5h"/>
      </div>

      <h2 className="text-xl font-bold">Achievements</h2>
      <div className="flex flex-row gap-4 overflow-x-auto">
          <AchievementCard title="First Workout" description="Completed your first workout!"/>
          <AchievementCard title="Healthy Eating" description="Maintained a balanced diet for 7 days!"/>
          <AchievementCard title="Hydration Hero" description="Drank 3L of water every day for a week!"/>
      </div>
    </div>
  );
};

export default ProgressPage;

