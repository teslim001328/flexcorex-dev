"use client";

import {Home, Calendar, ListChecks, Users, Flame} from "lucide-react";
import Link from "next/link";
import {cn} from "@/lib/utils";
import {usePathname} from "next/navigation";

const BottomNav = () => {
  const pathname = usePathname();
  return (
    <footer className="sticky bottom-0 bg-card border-t z-50">
      <nav className="container h-16 flex items-center justify-around">
        <NavItem href="/" icon={Home} label="Home" active={pathname === "/"}/>
        <NavItem href="/meals" icon={Calendar} label="Meals" active={pathname === "/meals"}/>
        <NavItem href="/workouts" icon={Flame} label="Workouts" active={pathname === "/workouts"}/>
        <div className="flex items-center justify-center">
          <Link href="/flexai" className="relative">
            <button className="w-12 h-12 rounded-full bg-primary text-primary-foreground flex items-center justify-center shadow-md glow">
              <Flame className="h-6 w-6"/>
            </button>
          </Link>
        </div>
        <NavItem href="/progress" icon={ListChecks} label="Progress" active={pathname === "/progress"}/>
        <NavItem href="/community" icon={Users} label="Community" active={pathname === "/community"}/>
      </nav>
    </footer>
  );
};

const NavItem = ({href, icon: Icon, label, active}: { href: string; icon: any; label: string; active: boolean }) => (
  <Link href={href} className={cn("flex flex-col items-center", active ? "text-primary" : "text-foreground")}>
    <Icon className="h-6 w-6"/>
    <span className="text-xs">{label}</span>
  </Link>
);

export default BottomNav;
