'use server';
/**
 * @fileOverview A workout suggestion AI agent.
 *
 * - suggestWorkout - A function that handles the workout suggestion process.
 * - SuggestWorkoutInput - The input type for the suggestWorkout function.
 * - SuggestWorkoutOutput - The return type for the suggestWorkout function.
 */

import {ai} from '@/ai/ai-instance';
import {z} from 'genkit';

const SuggestWorkoutInputSchema = z.object({
  fitnessLevel: z.enum(['beginner', 'intermediate', 'advanced']).describe('The user\'s current fitness level.'),
  availableEquipment: z.string().describe('A description of the equipment the user has access to.'),
  timeConstraint: z.number().describe('The amount of time the user has to workout, in minutes.'),
});
export type SuggestWorkoutInput = z.infer<typeof SuggestWorkoutInputSchema>;

const SuggestWorkoutOutputSchema = z.object({
  workoutRoutine: z.string().describe('A suggested workout routine based on the input parameters.'),
});
export type SuggestWorkoutOutput = z.infer<typeof SuggestWorkoutOutputSchema>;

export async function suggestWorkout(input: SuggestWorkoutInput): Promise<SuggestWorkoutOutput> {
  return suggestWorkoutFlow(input);
}

const prompt = ai.definePrompt({
  name: 'suggestWorkoutPrompt',
  input: {
    schema: z.object({
      fitnessLevel: z.enum(['beginner', 'intermediate', 'advanced']).describe('The user\'s current fitness level.'),
      availableEquipment: z.string().describe('A description of the equipment the user has access to.'),
      timeConstraint: z.number().describe('The amount of time the user has to workout, in minutes.'),
    }),
  },
  output: {
    schema: z.object({
      workoutRoutine: z.string().describe('A suggested workout routine based on the input parameters.'),
    }),
  },
  prompt: `You are a personal trainer, and will provide a workout routine for the user based on their fitness level, available equipment, and time constraints.

Fitness Level: {{{fitnessLevel}}}
Available Equipment: {{{availableEquipment}}}
Time Constraint: {{{timeConstraint}}} minutes

Suggest a workout routine that is appropriate for the user.`, 
});

const suggestWorkoutFlow = ai.defineFlow<
  typeof SuggestWorkoutInputSchema,
  typeof SuggestWorkoutOutputSchema
>({
  name: 'suggestWorkoutFlow',
  inputSchema: SuggestWorkoutInputSchema,
  outputSchema: SuggestWorkoutOutputSchema,
}, async input => {
  const {output} = await prompt(input);
  return output!;
});
