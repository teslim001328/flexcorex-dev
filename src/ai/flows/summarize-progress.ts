'use server';
/**
 * @fileOverview Summarizes the user's progress towards their fitness goals.
 *
 * - summarizeProgress - A function that handles the summarization of user progress.
 * - SummarizeProgressInput - The input type for the summarizeProgress function.
 * - SummarizeProgressOutput - The return type for the summarizeProgress function.
 */

import {ai} from '@/ai/ai-instance';
import {z} from 'genkit';

const SummarizeProgressInputSchema = z.object({
  period: z.string().describe('The period for which to summarize progress (e.g., "last week", "last month").'),
  stepsTaken: z.number().describe('The number of steps taken during the period.'),
  caloriesBurned: z.number().describe('The number of calories burned during the period.'),
  waterIntake: z.number().describe('The amount of water intake during the period (in liters).'),
});
export type SummarizeProgressInput = z.infer<typeof SummarizeProgressInputSchema>;

const SummarizeProgressOutputSchema = z.object({
  summary: z.string().describe('A summary of the user progress towards their fitness goals.'),
});
export type SummarizeProgressOutput = z.infer<typeof SummarizeProgressOutputSchema>;

export async function summarizeProgress(input: SummarizeProgressInput): Promise<SummarizeProgressOutput> {
  return summarizeProgressFlow(input);
}

const prompt = ai.definePrompt({
  name: 'summarizeProgressPrompt',
  input: {
    schema: z.object({
      period: z.string().describe('The period for which to summarize progress (e.g., "last week", "last month").'),
      stepsTaken: z.number().describe('The number of steps taken during the period.'),
      caloriesBurned: z.number().describe('The number of calories burned during the period.'),
      waterIntake: z.number().describe('The amount of water intake during the period (in liters).'),
    }),
  },
  output: {
    schema: z.object({
      summary: z.string().describe('A summary of the user progress towards their fitness goals.'),
    }),
  },
  prompt: `Summarize the user's progress towards their fitness goals over the specified period.

Period: {{{period}}}
Steps Taken: {{{stepsTaken}}}
Calories Burned: {{{caloriesBurned}}}
Water Intake: {{{waterIntake}}} liters

Provide a concise and encouraging summary of their progress.  The user should be encouraged to continue to improve their fitness.
`,
});

const summarizeProgressFlow = ai.defineFlow<
  typeof SummarizeProgressInputSchema,
  typeof SummarizeProgressOutputSchema
>({
  name: 'summarizeProgressFlow',
  inputSchema: SummarizeProgressInputSchema,
  outputSchema: SummarizeProgressOutputSchema,
}, async input => {
  const {output} = await prompt(input);
  return output!;
});
