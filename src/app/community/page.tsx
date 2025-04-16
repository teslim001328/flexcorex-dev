"use client";

import {Card, CardContent, CardHeader, CardTitle} from "@/components/ui/card";

const GroupCard = ({name, image, memberCount}: { name: string; image: string; memberCount: string }) => (
  <Card className="w-full md:w-64">
    <CardHeader>
      <CardTitle>{name}</CardTitle>
    </CardHeader>
    <CardContent>
      <img src={image} alt={name} className="w-full h-32 object-cover rounded-md mb-2"/>
      <p className="text-sm text-muted-foreground">Members: {memberCount}</p>
    </CardContent>
  </Card>
);

const CommunityPage = () => {
  const groups = [
    {
      name: "Fitness Fanatics",
      image: "https://picsum.photos/203/150",
      memberCount: "1,234",
    },
    {
      name: "Healthy Eating Community",
      image: "https://picsum.photos/204/150",
      memberCount: "567",
    },
    {
      name: "Yoga and Mindfulness",
      image: "https://picsum.photos/205/150",
      memberCount: "890",
    },
  ];

  return (
    <div className="flex flex-col h-full p-4">
      <h1 className="text-2xl font-bold">Community</h1>

      <div className="flex flex-row gap-4 overflow-x-auto">
        {groups.map((group, index) => (
          <GroupCard key={index} name={group.name} image={group.image} memberCount={group.memberCount}/>
        ))}
      </div>
    </div>
  );
};

export default CommunityPage;
