'use server';
/**
 * @fileOverview Provides personalized wellness insights and recommendations based on user data.
 *
 * - getPersonalizedWellnessInsights - A function that returns personalized wellness insights.
 * - PersonalizedWellnessInsightsInput - The input type for the getPersonalizedWellnessInsights function.
 * - PersonalizedWellnessInsightsOutput - The return type for the getPersonalizedWellnessInsights function.
 */

import {ai} from '@/ai/ai-instance';
import {z} from 'genkit';

const PersonalizedWellnessInsightsInputSchema = z.object({
  activityData: z.string().describe('User activity data, including steps, workouts, etc.'),
  sleepData: z.string().describe('User sleep data, including duration, quality, etc.'),
  nutritionData: z.string().describe('User nutrition data, including calorie intake, macros, etc.'),
});
export type PersonalizedWellnessInsightsInput = z.infer<typeof PersonalizedWellnessInsightsInputSchema>;

const PersonalizedWellnessInsightsOutputSchema = z.object({
  insights: z.string().describe('Personalized wellness insights and recommendations.'),
});
export type PersonalizedWellnessInsightsOutput = z.infer<typeof PersonalizedWellnessInsightsOutputSchema>;

export async function getPersonalizedWellnessInsights(input: PersonalizedWellnessInsightsInput): Promise<PersonalizedWellnessInsightsOutput> {
  return personalizedWellnessInsightsFlow(input);
}

const prompt = ai.definePrompt({
  name: 'personalizedWellnessInsightsPrompt',
  input: {
    schema: z.object({
      activityData: z.string().describe('User activity data, including steps, workouts, etc.'),
      sleepData: z.string().describe('User sleep data, including duration, quality, etc.'),
      nutritionData: z.string().describe('User nutrition data, including calorie intake, macros, etc.'),
    }),
  },
  output: {
    schema: z.object({
      insights: z.string().describe('Personalized wellness insights and recommendations.'),
    }),
  },
  prompt: `You are FlexAI, a personalized wellness assistant. Analyze the user's activity, sleep, and nutrition data to provide personalized insights and recommendations.

Activity Data: {{{activityData}}}
Sleep Data: {{{sleepData}}}
Nutrition Data: {{{nutritionData}}}

Provide helpful and actionable insights to help the user thrive.`, // Changed from advice to insights
});

const personalizedWellnessInsightsFlow = ai.defineFlow<
  typeof PersonalizedWellnessInsightsInputSchema,
  typeof PersonalizedWellnessInsightsOutputSchema
>({
  name: 'personalizedWellnessInsightsFlow',
  inputSchema: PersonalizedWellnessInsightsInputSchema,
  outputSchema: PersonalizedWellnessInsightsOutputSchema,
}, async input => {
  const {output} = await prompt(input);
  return output!;
});
