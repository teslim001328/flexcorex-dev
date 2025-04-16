import {Card, CardContent, CardHeader, CardTitle} from "@/components/ui/card";
import {Button} from "@/components/ui/button";
import Link from "next/link";

const FeatureCard = ({title, description}: { title: string; description: string }) => (
  <Card className="w-full md:w-64">
    <CardHeader>
      <CardTitle>{title}</CardTitle>
    </CardHeader>
    <CardContent>
      {description}
    </CardContent>
  </Card>
);

const StatCard = ({title, value}: { title: string; value: string }) => (
  <Card className="w-full md:w-32">
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
      <h1 className="text-2xl font-bold">Flex. Thrive. Conquer., User!</h1>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <FeatureCard title="Meal Planning" description="Plan your meals for the week."/>
        <FeatureCard title="Today's Workout" description="View your personalized workout."/>
        <FeatureCard title="Track Progress" description="Monitor your fitness journey."/>
      </div>

      <div>
        <h2 className="text-xl font-bold">Today's Overview</h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <StatCard title="Steps" value="5,234"/>
          <StatCard title="Calories" value="1,872"/>
          <StatCard title="Water" value="2.5L"/>
        </div>
      </div>

       {/* Add FlexAI Prompt Test*/}
      <div>
        <Button>
            <Link href="/flexai">Go to FlexAI</Link>
          </Button>
      </div>
    </div>
  );
}