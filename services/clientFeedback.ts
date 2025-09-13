import { supabase } from '../lib/supabase';

export type FeedbackRow = {
  id: string;
  client_name: string;
  rating: number; // 1-5
  satisfaction: string; // text label
  feedback: string;
  date: string; // ISO
};

export async function createFeedback(payload: FeedbackRow) {
  const { error } = await supabase.from('client_feedback').insert(payload as any);
  if (error) throw error;
}

