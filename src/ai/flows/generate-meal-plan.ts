'use server';
/**
 * @fileOverview A meal plan generator AI agent.
 *
 * - generateMealPlan - A function that handles the meal plan generation process.
 * - GenerateMealPlanInput - The input type for the generateMealPlan function.
 * - GenerateMealPlanOutput - The return type for the generateMealPlan function.
 */

import {ai} from '@/ai/ai-instance';
import {z} from 'genkit';

const GenerateMealPlanInputSchema = z.object({
  dietaryPreferences: z.string().describe('The dietary preferences of the user, e.g., vegetarian, vegan, gluten-free.'),
  fitnessGoals: z.string().describe('The fitness goals of the user, e.g., weight loss, muscle gain, general health.'),
  numberOfDays: z.number().describe('The number of days for which to generate the meal plan.'),
});
export type GenerateMealPlanInput = z.infer<typeof GenerateMealPlanInputSchema>;

const GenerateMealPlanOutputSchema = z.object({
  mealPlan: z.string().describe('The generated meal plan.'),
});
export type GenerateMealPlanOutput = z.infer<typeof GenerateMealPlanOutputSchema>;

export async function generateMealPlan(input: GenerateMealPlanInput): Promise<GenerateMealPlanOutput> {
  return generateMealPlanFlow(input);
}

const prompt = ai.definePrompt({
  name: 'generateMealPlanPrompt',
  input: {
    schema: z.object({
      dietaryPreferences: z.string().describe('The dietary preferences of the user, e.g., vegetarian, vegan, gluten-free.'),
      fitnessGoals: z.string().describe('The fitness goals of the user, e.g., weight loss, muscle gain, general health.'),
      numberOfDays: z.number().describe('The number of days for which to generate the meal plan.'),
    }),
  },
  output: {
    schema: z.object({
      mealPlan: z.string().describe('The generated meal plan.'),
    }),
  },
  prompt: `You are an expert nutritionist specializing in creating personalized meal plans.

You will use the following information to generate a meal plan for the user.

Dietary Preferences: {{{dietaryPreferences}}}
Fitness Goals: {{{fitnessGoals}}}
Number of Days: {{{numberOfDays}}}

Generate a meal plan that takes into account the user's dietary preferences and fitness goals. The meal plan should include breakfast, lunch, and dinner for each day.

Make sure the output is a JSON object with a single key called mealPlan, whose value is a string.
`,
});

const generateMealPlanFlow = ai.defineFlow<
  typeof GenerateMealPlanInputSchema,
  typeof GenerateMealPlanOutputSchema
>({
  name: 'generateMealPlanFlow',
  inputSchema: GenerateMealPlanInputSchema,
  outputSchema: GenerateMealPlanOutputSchema,
}, async input => {
  const {output} = await prompt(input);
  return output!;
});
