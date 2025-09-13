import { supabase } from '../lib/supabase';

export type RevisionRow = {
  id: string;
  project_id: string;
  freelancer_id: string;
  admin_notes?: string | null;
  deadline?: string | null; // ISO
  status: string; // 'Menunggu Revisi' | 'Sedang Dikerjakan' | 'Revisi Selesai'
  freelancer_notes?: string | null;
  drive_link?: string | null;
  completed_date?: string | null; // ISO
};

export async function upsertRevision(row: RevisionRow) {
  const { error } = await supabase.from('revisions').upsert(row as any, { onConflict: 'id' });
  if (error) throw error;
}

