import {Card, CardContent, CardHeader, CardTitle} from "@/components/ui/card";
import {Button} from "@/components/ui/button";

const FeatureCard = ({title, description}: { title: string; description: string }) => (
  <Card className="w-64">
    <CardHeader>
      <CardTitle>{title}</CardTitle>
    </CardHeader>
    <CardContent>
      {description}
    </CardContent>
  </Card>
);

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

export default function Home() {
  return (
    <div className="flex flex-col gap-4 p-4">
      <h1 className="text-2xl font-bold">Welcome Back, User!</h1>

      <div className="flex flex-row gap-4 overflow-x-auto">
        <FeatureCard title="Meal Planning" description="Plan your meals for the week."/>
        <FeatureCard title="Today's Workout" description="View your personalized workout."/>
        <FeatureCard title="Track Progress" description="Monitor your fitness journey."/>
      </div>

      <div>
        <h2 className="text-xl font-bold">Today's Overview</h2>
        <div className="flex flex-row gap-4">
          <StatCard title="Steps" value="5,234"/>
          <StatCard title="Calories" value="1,872"/>
          <StatCard title="Water" value="2.5L"/>
        </div>
      </div>

       {/* Add FlexAI Prompt Test*/}
      <div>
        <Button>
            <a href="/flexai">Go to FlexAI</a>
          </Button>
      </div>
    </div>
  );
}
