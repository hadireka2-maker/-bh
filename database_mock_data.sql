-- ========================================
-- VENA PICTURES - COMPREHENSIVE MOCK DATA
-- Photography/Videography Business Management System
-- ========================================

-- Disable foreign key checks temporarily for data insertion
SET session_replication_role = replica;

-- ========================================
-- CORE SYSTEM DATA
-- ========================================

-- Organizations
INSERT INTO organizations (id, name, slug, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Vena Pictures', 'vena-pictures', '2023-01-01 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440001', 'Momen Studio', 'momen-studio', '2023-01-15 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440002', 'Capture Dreams', 'capture-dreams', '2023-02-01 00:00:00+00', NOW());

-- Users
INSERT INTO users (id, organization_id, email, password_hash, full_name, role, is_approved, is_active, last_login_at, created_at, updated_at) VALUES
('c1e1f2b4-a0f1-4a47-9c9c-2b2a6b2a0c1b', '550e8400-e29b-41d4-a716-446655440000', 'admin@vena.pictures', '$2b$10$N9qo8uLOickgx2ZMRZoMye23pJTtKE0z7LdSjRkWkcgr3CRsOL3Cy', 'Andi Vena', 'admin', true, true, NOW(), '2023-01-01 00:00:00+00', NOW()),
('d2e2f3b5-b1f2-5b58-8d8d-3c3b7c3b1d2c', '550e8400-e29b-41d4-a716-446655440000', 'member@vena.pictures', '$2b$10$N9qo8uLOickgx2ZMRZoMye23pJTtKE0z7LdSjRkWkcgr3CRsOL3Cy', 'Rina Asisten', 'member', true, true, NOW(), '2023-01-02 00:00:00+00', NOW()),
('00000000-0000-4000-8000-000000000031', '550e8400-e29b-41d4-a716-446655440000', 'editor@vena.pictures', '$2b$10$N9qo8uLOickgx2ZMRZoMye23pJTtKE0z7LdSjRkWkcgr3CRsOL3Cy', 'Dika Editor', 'member', true, true, NULL, '2023-02-01 00:00:00+00', NOW());

-- User permissions for members
INSERT INTO user_permissions (id, user_id, view_type, created_at) VALUES
('00000000-0000-4000-8000-000000000101', 'd2e2f3b5-b1f2-5b58-8d8d-3c3b7c3b1d2c', 'Manajemen Klien', NOW()),
('00000000-0000-4000-8000-000000000102', 'd2e2f3b5-b1f2-5b58-8d8d-3c3b7c3b1d2c', 'Proyek', NOW()),
('00000000-0000-4000-8000-000000000103', 'd2e2f3b5-b1f2-5b58-8d8d-3c3b7c3b1d2c', 'Kalender', NOW()),
('00000000-0000-4000-8000-000000000104', '00000000-0000-4000-8000-000000000031', 'Proyek', NOW()),
('00000000-0000-4000-8000-000000000105', '00000000-0000-4000-8000-000000000031', 'Freelancer', NOW());

-- Organization Profile
INSERT INTO organization_profiles (organization_id, admin_user_id, full_name, email, phone, company_name, website, address, bank_account, authorized_signer, id_number, bio, logo_base64, brand_color, briefing_template, terms_and_conditions, contract_template, package_share_template, booking_form_template, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'c1e1f2b4-a0f1-4a47-9c9c-2b2a6b2a0c1b', 'Andi Vena', 'admin@vena.pictures', '081288889999', 'Vena Pictures', 'https://venapictures.com', 'Jl. Kreatif No. 10, Jakarta Pusat', 'BCA - 9876543210 a/n Vena Pictures', 'Andi Vena', '3171234567890002', 'Mengabadikan momen dengan sentuhan sinematik. Spesialis pernikahan dan prewedding di Vena Pictures.', NULL, '#3b82f6', 'Halo tim,\nBerikut adalah briefing untuk acara besok.\n\nKey Persons:\n- [Nama CP Klien]\n- [Nama WO]\n\nJangan lupa:\n- Bawa baterai cadangan & memory card kosong.\n- Datang 1 jam sebelum acara dimulai.\n- Dress code: Hitam rapi.\n\nSemangat!', '📜 **Syarat & Ketentuan Umum**\n- Harga yang tertera dapat berubah sewaktu-waktu sebelum adanya kesepakatan.\n\n💰 **Pembayaran**\n- Pemesanan dianggap sah setelah pembayaran Uang Muka (DP) sebesar 50% dari total biaya.\n- Pelunasan wajib dilakukan paling lambat 3 (tiga) hari sebelum tanggal acara.', 'Template kontrak standar...', 'Halo {leadName},\n\nTerima kasih atas ketertarikan Anda dengan layanan dari Vena Pictures. Berikut adalah tautan untuk melihat daftar paket layanan kami:\n\n{packageLink}', 'Halo {leadName},\n\nMenindaklanjuti diskusi kita, silakan isi formulir pemesanan pada tautan berikut untuk melanjutkan ke tahap selanjutnya:\n\n{bookingFormLink}', '2023-01-01 00:00:00+00', NOW());

-- Configuration Categories
INSERT INTO income_categories (organization_id, name, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'DP Proyek', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Pelunasan Proyek', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Penjualan Cetak', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Sewa Alat', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Modal', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Penjualan Add-on', NOW());

INSERT INTO expense_categories (organization_id, name, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Gaji Freelancer', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Transportasi', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Akomodasi', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Konsumsi', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Peralatan', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Marketing', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Operasional Kantor', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Cetak Album', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Penarikan Hadiah Freelancer', NOW());

INSERT INTO project_types (organization_id, name, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Pernikahan', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Lamaran', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Prewedding', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Korporat', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Ulang Tahun', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Produk', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Keluarga', NOW());

INSERT INTO event_types (organization_id, name, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Meeting Klien', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Survey Lokasi', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Libur', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Workshop', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Acara Internal', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Lainnya', NOW());

INSERT INTO asset_categories (organization_id, name, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Kamera', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Lensa', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Lighting', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Komputer', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Drone', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Aksesoris', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Lainnya', NOW());

INSERT INTO sop_categories (organization_id, name, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Pernikahan', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Korporat', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Umum', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Editing', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Prewedding', NOW());

INSERT INTO package_categories (organization_id, name, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Pernikahan', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Lamaran', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Prewedding', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Korporat', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Ulang Tahun', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Produk', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Keluarga', NOW());

-- Project Status Configuration
INSERT INTO project_status_configs (organization_id, name, color, note, sort_order, is_active, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Persiapan', '#6366f1', 'Tahap awal persiapan proyek.', 1, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Dikonfirmasi', '#3b82f6', 'Proyek telah dikonfirmasi oleh klien.', 2, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Editing', '#8b5cf6', 'Proses pasca-produksi.', 3, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Revisi', '#14b8a6', 'Tahap revisi berdasarkan masukan klien.', 4, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Cetak', '#f97316', 'Proses pencetakan output fisik.', 5, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Dikirim', '#06b6d4', 'Hasil akhir telah dikirim ke klien.', 6, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Selesai', '#10b981', 'Proyek telah selesai dan semua pembayaran lunas.', 7, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Dibatalkan', '#ef4444', 'Proyek dibatalkan oleh klien atau vendor.', 8, true, NOW(), NOW());

-- Sub-status configurations
INSERT INTO project_sub_status_configs (status_config_id, name, note, sort_order, created_at) VALUES
-- Persiapan sub-statuses
((SELECT id FROM project_status_configs WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Persiapan'), 'Briefing Internal', 'Rapat tim internal untuk membahas konsep.', 1, NOW()),
((SELECT id FROM project_status_configs WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Persiapan'), 'Survey Lokasi', 'Kunjungan ke lokasi acara jika diperlukan.', 2, NOW()),
-- Dikonfirmasi sub-statuses
((SELECT id FROM project_status_configs WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Dikonfirmasi'), 'Pembayaran DP', 'Menunggu konfirmasi pembayaran DP dari klien.', 1, NOW()),
((SELECT id FROM project_status_configs WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Dikonfirmasi'), 'Penjadwalan Tim', 'Mengalokasikan freelancer untuk proyek.', 2, NOW()),
-- Editing sub-statuses
((SELECT id FROM project_status_configs WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Editing'), 'Seleksi Foto', 'Proses pemilihan foto terbaik oleh tim atau klien.', 1, NOW()),
((SELECT id FROM project_status_configs WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Editing'), 'Color Grading Video', 'Penyesuaian warna pada video.', 2, NOW()),
((SELECT id FROM project_status_configs WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Editing'), 'Music Scoring', 'Pemilihan musik latar untuk video.', 3, NOW()),
-- Cetak sub-statuses
((SELECT id FROM project_status_configs WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Cetak'), 'Approval Desain Album', 'Menunggu persetujuan final desain album dari klien.', 1, NOW()),
((SELECT id FROM project_status_configs WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Cetak'), 'Proses Cetak', 'Album dan foto sedang dalam proses pencetakan.', 2, NOW()),
((SELECT id FROM project_status_configs WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Cetak'), 'QC Album', 'Pemeriksaan kualitas hasil cetakan.', 3, NOW());

-- Public Page Configuration
INSERT INTO public_page_configs (organization_id, template, title, introduction, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'classic', 'Galeri & Paket Layanan Kami', 'Lihat portofolio terbaru dan paket layanan yang kami tawarkan. Kami siap mengabadikan momen spesial Anda.', NOW(), NOW());

-- ========================================
-- CLIENT MANAGEMENT DATA
-- ========================================

-- Leads
INSERT INTO leads (organization_id, name, contact_channel, location, status, date, notes, whatsapp, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Sarah Putri', 'Instagram', 'Jakarta', 'Sedang Diskusi', '2024-09-10 10:00:00+00', 'Menanyakan paket prewedding untuk bulan Desember. Budget sekitar 7-8 juta.', '628123456789', NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Bapak Hendra', 'Website', 'Surabaya', 'Menunggu Follow Up', '2024-09-05 14:30:00+00', 'Minta penawaran untuk acara gathering kantor. Sudah dikirim proposal, tunggu balasan.', '628987654321', NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Rini Maharani', 'WhatsApp', 'Tangerang', 'Ditolak', '2024-09-02 09:15:00+00', 'Budget tidak sesuai dengan paket yang diinginkan.', '628555666777', NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'David & Lisa', 'Referensi', 'Bandung', 'Sedang Diskusi', '2024-09-08 16:00:00+00', 'Referensi dari Budi & Sinta. Tertarik paket pernikahan gold.', '628111222333', NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'PT Maju Bersama', 'Telepon', 'Jakarta', 'Dikonversi', '2024-08-20 11:00:00+00', 'Sudah booking untuk acara ulang tahun perusahaan.', '62215551234', NOW(), NOW());

-- Clients
INSERT INTO clients (organization_id, name, email, phone, whatsapp, instagram, since, status, client_type, last_contact, portal_access_id, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Budi & Sinta', 'budi.sinta@example.com', '081234567890', '6281234567890', '@budisinta.wedding', '2023-01-15', 'Aktif', 'Langsung', '2024-05-20 10:00:00+00', 'portal-budi-sinta', '2023-01-15 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'PT Sejahtera Abadi', 'hrd@sejahteraabadi.com', '021-555-1234', NULL, NULL, '2023-03-22', 'Aktif', 'Langsung', '2024-07-10 14:00:00+00', 'portal-sejahtera-abadi', '2023-03-22 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Maya & Reza', 'maya.reza@example.com', '082345678901', '6282345678901', '@mayareza_couple', '2023-05-10', 'Aktif', 'Langsung', '2024-06-15 12:00:00+00', 'portal-maya-reza', '2023-05-10 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Dewi & Rian', 'dewi.rian@example.com', '08111222333', '628111222333', '@dewi_rian', '2023-08-01', 'Aktif', 'Langsung', '2024-06-25 11:00:00+00', 'portal-dewi-rian', '2023-08-01 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Farhan & Aisyah', 'farhan.aisyah@example.com', '085678901234', '6285678901234', '@farhan_aisyah', '2023-11-10', 'Aktif', 'Langsung', '2024-07-12 09:00:00+00', 'portal-farhan-aisyah', '2023-11-10 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Agung & Bella', 'agung.bella@example.com', '087712345678', '6287712345678', '@agungbella_wedding', '2024-02-05', 'Aktif', 'Langsung', '2024-07-15 16:00:00+00', 'portal-agung-bella', '2024-02-05 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Rina & Doni', 'rina.doni@example.com', '089987654321', '6289987654321', '@rinadoni_story', '2024-04-12', 'Aktif', 'Langsung', '2024-07-01 13:00:00+00', 'portal-rina-doni', '2024-04-12 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'CV Maju Jaya', 'contact@majujaya.co.id', '031-888-4567', NULL, NULL, '2024-05-20', 'Tidak Aktif', 'Vendor', '2024-06-15 10:00:00+00', 'portal-maju-jaya', '2024-05-20 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Kevin & Laura', 'kevin.laura@example.com', '082123450987', '6282123450987', '@kevinlaura_couple', '2024-01-10', 'Hilang', 'Langsung', '2024-03-01 18:00:00+00', 'portal-kevin-laura', '2024-01-10 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Indira & Arif', 'indira.arif@example.com', '081999888777', '6281999888777', '@indira_arif', '2024-06-20', 'Aktif', 'Langsung', '2024-08-30 14:00:00+00', 'portal-indira-arif', '2024-06-20 00:00:00+00', NOW());

-- ========================================
-- TEAM MANAGEMENT DATA
-- ========================================

-- Team Members
INSERT INTO team_members (organization_id, name, role, email, phone, standard_fee, bank_account, reward_balance, rating, portal_access_id, is_active, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Andi Pratama', 'Fotografer', 'andi.p@freelance.com', '081211112222', 2000000.00, 'BCA 1234567890', 250000.00, 4.8, 'freelance-andi', true, '2023-01-05 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Citra Lestari', 'Videografer', 'citra.l@freelance.com', '081233334444', 2500000.00, 'Mandiri 0987654321', 150000.00, 4.5, 'freelance-citra', true, '2023-01-10 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Doni Firmansyah', 'Editor', 'doni.f@freelance.com', '081255556666', 1500000.00, 'BNI 5678901234', 0.00, 4.2, 'freelance-doni', true, '2023-02-01 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Rian Hidayat', 'Asisten Fotografer', 'rian.h@freelance.com', '081277778888', 750000.00, 'BRI 2345678901', 50000.00, 4.0, 'freelance-rian', true, '2023-02-15 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Fira Anjani', 'MUA', 'fira.a@freelance.com', '081299990000', 1000000.00, 'CIMB 3456789012', 0.00, 5.0, 'freelance-fira', true, '2023-03-01 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Eka Wijaya', 'Pilot Drone', 'eka.w@freelance.com', '081212341234', 1200000.00, 'Mandiri 4567890123', 100000.00, 4.7, 'freelance-eka', true, '2023-03-10 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Sari Indah', 'Fotografer', 'sari.i@freelance.com', '081311112222', 1800000.00, 'BCA 5678901234', 75000.00, 4.6, 'freelance-sari', true, '2023-04-01 00:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Bram Satria', 'Videografer', 'bram.s@freelance.com', '081344445555', 2200000.00, 'BRI 6789012345', 0.00, 4.3, 'freelance-bram', true, '2023-04-15 00:00:00+00', NOW());

-- Team Performance Notes
INSERT INTO team_performance_notes (team_member_id, date, note, note_type, created_by_user_id, created_at) VALUES
((SELECT id FROM team_members WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='freelance-andi'), '2024-02-15 10:00:00+00', 'Komposisi foto sangat baik di acara Budi & Sinta. Hasil sangat memuaskan klien.', 'Pujian', 'c1e1f2b4-a0f1-4a47-9c9c-2b2a6b2a0c1b', NOW()),
((SELECT id FROM team_members WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='freelance-doni'), '2024-05-10 10:00:00+00', 'Pengiriman video teaser terlambat 1 hari untuk proyek Farhan & Aisyah.', 'Keterlambatan Deadline', 'c1e1f2b4-a0f1-4a47-9c9c-2b2a6b2a0c1b', NOW()),
((SELECT id FROM team_members WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='freelance-fira'), '2024-06-20 14:30:00+00', 'Hasil makeup sangat natural dan tahan lama. Klien sangat puas.', 'Pujian', 'd2e2f3b5-b1f2-5b58-8d8d-3c3b7c3b1d2c', NOW()),
((SELECT id FROM team_members WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='freelance-citra'), '2024-07-01 09:00:00+00', 'Perlu lebih memperhatikan stabilitas video saat handheld shooting.', 'Perhatian', 'c1e1f2b4-a0f1-4a47-9c9c-2b2a6b2a0c1b', NOW()),
((SELECT id FROM team_members WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='freelance-eka'), '2024-07-15 16:00:00+00', 'Teknik aerial shot sangat cinematic. Memberikan nilai tambah pada video.', 'Pujian', 'c1e1f2b4-a0f1-4a47-9c9c-2b2a6b2a0c1b', NOW());

-- ========================================
-- PACKAGE MANAGEMENT DATA
-- ========================================

-- Service Packages
INSERT INTO packages (organization_id, name, price, category_id, processing_time, photographers, videographers, default_printing_cost, default_transport_cost, cover_image_base64, is_active, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Paket Pernikahan Silver', 12000000.00, (SELECT id FROM package_categories WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Pernikahan'), '30 hari kerja', '2 Fotografer', '1 Videografer', 0.00, 0.00, NULL, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Paket Pernikahan Gold', 25000000.00, (SELECT id FROM package_categories WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Pernikahan'), '45 hari kerja', '2 Fotografer', '2 Videografer', 0.00, 0.00, NULL, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Paket Acara Korporat', 8000000.00, (SELECT id FROM package_categories WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Korporat'), '14 hari kerja', '1 Fotografer', '1 Videografer', 0.00, 0.00, NULL, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Paket Lamaran', 5000000.00, (SELECT id FROM package_categories WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Lamaran'), '14 hari kerja', '1 Fotografer', NULL, 0.00, 0.00, NULL, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Paket Prewedding', 6500000.00, (SELECT id FROM package_categories WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Prewedding'), '21 hari kerja', '1 Fotografer', '1 Videografer', 0.00, 0.00, NULL, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Sesi Foto Keluarga', 3500000.00, (SELECT id FROM package_categories WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Keluarga'), '10 hari kerja', '1 Fotografer', NULL, 0.00, 0.00, NULL, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Paket Birthday Premium', 4500000.00, (SELECT id FROM package_categories WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Ulang Tahun'), '7 hari kerja', '1 Fotografer', '1 Videografer', 0.00, 0.00, NULL, true, NOW(), NOW());

-- Package Physical Items
INSERT INTO package_physical_items (package_id, name, price, created_at) VALUES
-- Silver Wedding Package Items
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Pernikahan Silver'), 'Album Cetak Eksklusif 20x30cm 20 Halaman', 850000.00, NOW()),
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Pernikahan Silver'), 'Cetak Foto 16R + Bingkai Minimalis (2pcs)', 400000.00, NOW()),
-- Gold Wedding Package Items
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Pernikahan Gold'), 'Album Cetak Premium 25x30cm 30 Halaman', 1500000.00, NOW()),
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Pernikahan Gold'), 'Cetak Foto 20R + Bingkai Premium (2pcs)', 750000.00, NOW()),
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Pernikahan Gold'), 'Box Kayu Eksklusif + Flashdisk 64GB', 500000.00, NOW()),
-- Prewedding Package Items
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Prewedding'), 'Cetak Foto Kanvas 40x60cm', 600000.00, NOW()),
-- Family Session Items
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Sesi Foto Keluarga'), 'Cetak Foto 10R + Bingkai (5pcs)', 350000.00, NOW());

-- Package Digital Items
INSERT INTO package_digital_items (package_id, name, created_at) VALUES
-- Silver Wedding Package Items
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Pernikahan Silver'), 'Semua file foto (JPG) hasil seleksi', NOW()),
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Pernikahan Silver'), '1 Video highlight (3-5 menit)', NOW()),
-- Gold Wedding Package Items
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Pernikahan Gold'), 'Semua file foto (JPG) tanpa seleksi', NOW()),
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Pernikahan Gold'), '1 Video sinematik (5-7 menit)', NOW()),
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Pernikahan Gold'), 'Video Teaser 1 menit untuk sosmed', NOW()),
-- Corporate Package Items
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Acara Korporat'), 'Dokumentasi foto (JPG)', NOW()),
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Acara Korporat'), '1 Video dokumentasi (10-15 menit)', NOW()),
-- Engagement Package Items
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Lamaran'), 'Semua file foto (JPG) hasil seleksi', NOW()),
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Lamaran'), '1 Video highlight (1-2 menit)', NOW()),
-- Prewedding Package Items
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Prewedding'), '50 foto edit high-resolution', NOW()),
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Prewedding'), '1 video sinematik 1 menit', NOW()),
-- Family Session Items
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Sesi Foto Keluarga'), '25 foto edit high-resolution', NOW()),
-- Birthday Package Items
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Birthday Premium'), '50 foto edit high-resolution', NOW()),
((SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Birthday Premium'), '1 video highlight (2-3 menit)', NOW());

-- Add-on Services
INSERT INTO add_ons (organization_id, name, price, is_active, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Same Day Edit Video', 2500000.00, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Aerial Drone Shot', 1500000.00, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Jasa MUA Profesional', 1000000.00, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Album Tambahan untuk Orang Tua', 1200000.00, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Live Streaming Setup', 3000000.00, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Extra Hours Coverage', 800000.00, true, NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'Photo Booth Setup', 1500000.00, true, NOW(), NOW());

-- ========================================
-- PROMO CODES
-- ========================================

-- Promo codes need to be inserted before projects that reference them
INSERT INTO promo_codes (organization_id, code, discount_type, discount_value, is_active, usage_count, max_usage, expiry_date, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'WEDDINGFEST', 'percentage', 10.00, true, 5, 20, '2024-12-31', '2024-01-01 10:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'AKHIRTAHUN', 'fixed', 1000000.00, false, 15, 15, '2023-12-31', '2023-11-01 10:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'NEWCLIENT', 'percentage', 15.00, true, 3, 50, '2024-12-31', '2024-03-01 10:00:00+00', NOW()),
('550e8400-e29b-41d4-a716-446655440000', 'EARLYBIRD', 'fixed', 500000.00, true, 8, 25, '2024-11-30', '2024-06-01 10:00:00+00', NOW());

-- ========================================
-- PROJECT MANAGEMENT DATA
-- ========================================

-- Projects
INSERT INTO projects (organization_id, project_name, client_id, project_type_id, package_id, date, deadline_date, location, progress, status, total_cost, amount_paid, payment_status, notes, accommodation, drive_link, client_drive_link, final_drive_link, start_time, end_time, cover_image_base64, promo_code_id, discount_amount, shipping_details, dp_proof_url, printing_cost, transport_cost, is_editing_confirmed_by_client, is_printing_confirmed_by_client, is_delivery_confirmed_by_client, invoice_signature, booking_status, rejection_reason, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Pernikahan Budi & Sinta', (SELECT id FROM clients WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='portal-budi-sinta'), (SELECT id FROM project_types WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Pernikahan'), (SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Pernikahan Gold'), '2024-02-14', '2024-03-30', 'Hotel Mulia, Jakarta', 100, 'Selesai', 26500000.00, 26500000.00, 'Lunas', 'Klien sangat kooperatif. Acara berjalan lancar.', 'Hotel Mulia - Kamar Suite', 'https://drive.google.com/drive/folders/project001', 'https://bit.ly/vena-budi-sinta', 'https://bit.ly/vena-budi-sinta', '08:00', '22:00', NULL, NULL, 0.00, NULL, NULL, 0.00, 0.00, true, true, true, 'signature_base64_string', 'Terkonfirmasi', NULL, '2024-01-15 00:00:00+00', NOW()),

('550e8400-e29b-41d4-a716-446655440000', 'Acara Tahunan PT Sejahtera Abadi', (SELECT id FROM clients WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='portal-sejahtera-abadi'), (SELECT id FROM project_types WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Korporat'), (SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Acara Korporat'), '2024-08-20', '2024-09-03', 'Ritz-Carlton, Jakarta', 60, 'Editing', 8000000.00, 4000000.00, 'DP Terbayar', 'Acara korporat dengan 200+ karyawan.', NULL, 'https://drive.google.com/drive/folders/project002', NULL, NULL, '09:00', '17:00', NULL, NULL, 0.00, NULL, NULL, 0.00, 0.00, false, false, false, NULL, 'Terkonfirmasi', NULL, '2024-07-10 00:00:00+00', NOW()),

('550e8400-e29b-41d4-a716-446655440000', 'Prewedding Maya & Reza', (SELECT id FROM clients WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='portal-maya-reza'), (SELECT id FROM project_types WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Prewedding'), (SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Prewedding'), '2024-07-15', '2024-08-05', 'Pantai Kuta, Bali', 90, 'Cetak', 6500000.00, 6500000.00, 'Lunas', 'Lokasi pantai yang indah. Cuaca mendukung.', 'Hotel Bali Beach Resort', 'https://drive.google.com/drive/folders/project003', 'https://bit.ly/vena-maya-reza', NULL, '16:00', '19:00', NULL, NULL, 0.00, NULL, NULL, 600000.00, 200000.00, true, false, false, NULL, 'Terkonfirmasi', NULL, '2024-06-01 00:00:00+00', NOW()),

('550e8400-e29b-41d4-a716-446655440000', 'Lamaran Dewi & Rian', (SELECT id FROM clients WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='portal-dewi-rian'), (SELECT id FROM project_types WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Lamaran'), (SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Lamaran'), '2024-06-15', '2024-06-29', 'Plataran Menteng, Jakarta', 95, 'Dikirim', 5000000.00, 5000000.00, 'Lunas', 'Acara intimate dengan keluarga besar.', NULL, 'https://drive.google.com/drive/folders/project004', NULL, 'https://bit.ly/vena-dewi-rian', '15:00', '19:00', NULL, NULL, 0.00, 'Dikirim via GDrive', NULL, 0.00, 0.00, true, false, true, NULL, 'Terkonfirmasi', NULL, '2024-05-20 00:00:00+00', NOW()),

('550e8400-e29b-41d4-a716-446655440000', 'Prewedding Farhan & Aisyah', (SELECT id FROM clients WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='portal-farhan-aisyah'), (SELECT id FROM project_types WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Prewedding'), (SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Prewedding'), '2024-05-05', '2024-05-26', 'Bromo, Jawa Timur', 80, 'Revisi', 6500000.00, 6500000.00, 'Lunas', 'Sunrise di Bromo sangat spektakuler.', 'Jiwa Jawa Resort Bromo', 'https://drive.google.com/drive/folders/project005', NULL, NULL, '04:00', '10:00', NULL, NULL, 0.00, NULL, NULL, 0.00, 500000.00, false, false, false, NULL, 'Terkonfirmasi', NULL, '2024-04-01 00:00:00+00', NOW()),

('550e8400-e29b-41d4-a716-446655440000', 'Foto Keluarga Indira & Arif', (SELECT id FROM clients WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='portal-indira-arif'), (SELECT id FROM project_types WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Keluarga'), (SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Sesi Foto Keluarga'), '2024-08-25', '2024-09-04', 'Studio Vena Pictures', 100, 'Selesai', 3500000.00, 3500000.00, 'Lunas', 'Sesi foto keluarga dengan 2 anak kecil. Sangat menggemaskan.', NULL, 'https://drive.google.com/drive/folders/project006', 'https://bit.ly/vena-indira-arif', 'https://bit.ly/vena-indira-arif', '10:00', '13:00', NULL, NULL, 0.00, NULL, NULL, 0.00, 0.00, true, false, true, NULL, 'Terkonfirmasi', NULL, '2024-08-10 00:00:00+00', NOW()),

('550e8400-e29b-41d4-a716-446655440000', 'Pernikahan Agung & Bella', (SELECT id FROM clients WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='portal-agung-bella'), (SELECT id FROM project_types WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Pernikahan'), (SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Pernikahan Silver'), '2024-09-10', NULL, 'Bandung', 10, 'Persiapan', 12000000.00, 0.00, 'Belum Bayar', 'Acara akan diselenggarakan di venue outdoor Bandung.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0.00, 0.00, false, false, false, NULL, 'Terkonfirmasi', NULL, '2024-08-15 00:00:00+00', NOW()),

('550e8400-e29b-41d4-a716-446655440000', 'Pernikahan Rina & Doni', (SELECT id FROM clients WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='portal-rina-doni'), (SELECT id FROM project_types WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Pernikahan'), (SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Pernikahan Silver'), '2024-07-28', '2024-08-28', 'Bali', 90, 'Cetak', 13200000.00, 6600000.00, 'DP Terbayar', 'Pernikahan dengan tema tradisional Bali.', 'Villa Ubud Hanging Gardens', 'https://drive.google.com/drive/folders/project008', NULL, NULL, '14:00', '22:00', NULL, NULL, 0.00, NULL, NULL, 1000000.00, 300000.00, true, true, false, NULL, 'Terkonfirmasi', NULL, '2024-06-20 00:00:00+00', NOW()),

('550e8400-e29b-41d4-a716-446655440000', 'Foto Produk CV Maju Jaya', (SELECT id FROM clients WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='portal-maju-jaya'), (SELECT id FROM project_types WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Produk'), (SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Sesi Foto Keluarga'), '2024-06-01', '2024-06-11', 'Studio Vena', 100, 'Selesai', 3500000.00, 3500000.00, 'Lunas', 'Foto produk furniture dan dekorasi rumah.', NULL, 'https://drive.google.com/drive/folders/project009', NULL, 'https://bit.ly/vena-majujaya', '09:00', '16:00', NULL, NULL, 0.00, NULL, NULL, 0.00, 0.00, true, false, true, NULL, 'Terkonfirmasi', NULL, '2024-05-15 00:00:00+00', NOW()),

('550e8400-e29b-41d4-a716-446655440000', 'Prewedding Kevin & Laura', (SELECT id FROM clients WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='portal-kevin-laura'), (SELECT id FROM project_types WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Prewedding'), (SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Paket Prewedding'), '2024-04-15', NULL, 'Yogyakarta', 25, 'Dibatalkan', 6500000.00, 3250000.00, 'DP Terbayar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0.00, 0.00, false, false, false, NULL, 'Ditolak', 'Klien membatalkan H-2 karena alasan pribadi.', '2024-03-20 00:00:00+00', NOW()),

('550e8400-e29b-41d4-a716-446655440000', 'Sesi Maternity Budi & Sinta', (SELECT id FROM clients WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND portal_access_id='portal-budi-sinta'), (SELECT id FROM project_types WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Keluarga'), (SELECT id FROM packages WHERE organization_id='550e8400-e29b-41d4-a716-446655440000' AND name='Sesi Foto Keluarga'), '2024-08-15', NULL, 'Studio Vena', 0, 'Dikonfirmasi', 3500000.00, 1000000.00, 'DP Terbayar', 'Sesi foto maternity untuk kehamilan kedua.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0.00, 0.00, false, false, false, NULL, 'Baru', NULL, '2024-08-01 00:00:00+00', NOW());

-- Project Add-ons
INSERT INTO project_add_ons (id, project_id, add_on_id, price, created_at) VALUES
('pa-001', 'proj-001', 'addon-002', 1500000.00, NOW()), -- Drone for Budi & Sinta
('pa-002', 'proj-008', 'addon-004', 1200000.00, NOW()), -- Extra Album for Rina & Doni
('pa-003', 'proj-003', 'addon-003', 1000000.00, NOW()), -- MUA for Maya & Reza (but price overridden)
('pa-004', 'proj-002', 'addon-005', 3000000.00, NOW()); -- Live Streaming for Corporate Event

-- Project Active Sub-statuses
INSERT INTO project_active_sub_statuses (id, project_id, sub_status_name, created_at) VALUES
('pas-001', 'proj-002', 'Color Grading Video', NOW()),
('pas-002', 'proj-008', 'Proses Cetak', NOW()),
('pas-003', 'proj-005', 'Seleksi Foto', NOW());

-- Project Team Assignments
INSERT INTO project_team_assignments (id, project_id, team_member_id, fee, reward, sub_job, created_at) VALUES
-- Project 1: Budi & Sinta Wedding
('pta-001', 'proj-001', 'tm-001', 2000000.00, 250000.00, 'Main Photographer', NOW()),
('pta-002', 'proj-001', 'tm-002', 2500000.00, 0.00, 'Main Videographer', NOW()),
('pta-003', 'proj-001', 'tm-006', 1200000.00, 100000.00, 'Drone Pilot', NOW()),
-- Project 2: Corporate Event
('pta-004', 'proj-002', 'tm-001', 1000000.00, 0.00, 'Event Photographer', NOW()),
('pta-005', 'proj-002', 'tm-002', 1500000.00, 0.00, 'Event Videographer', NOW()),
-- Project 3: Maya & Reza Prewedding
('pta-006', 'proj-003', 'tm-007', 1800000.00, 0.00, 'Prewedding Photographer', NOW()),
('pta-007', 'proj-003', 'tm-008', 2200000.00, 0.00, 'Prewedding Videographer', NOW()),
('pta-008', 'proj-003', 'tm-005', 1000000.00, 0.00, 'MUA', NOW()),
-- Project 4: Dewi & Rian Engagement
('pta-009', 'proj-004', 'tm-001', 1500000.00, 0.00, 'Engagement Photographer', NOW()),
-- Project 5: Farhan & Aisyah Prewedding
('pta-010', 'proj-005', 'tm-001', 2000000.00, 0.00, 'Prewedding Photographer', NOW()),
('pta-011', 'proj-005', 'tm-003', 1000000.00, 0.00, 'Video Editor', NOW()),
-- Project 8: Rina & Doni Wedding
('pta-012', 'proj-008', 'tm-001', 2000000.00, 0.00, 'Main Photographer', NOW()),
('pta-013', 'proj-008', 'tm-004', 750000.00, 0.00, 'Assistant Photographer', NOW()),
-- Project 9: Product Photography
('pta-014', 'proj-009', 'tm-001', 1000000.00, 0.00, 'Product Photographer', NOW());

-- Project Revisions
INSERT INTO project_revisions (id, project_id, revision_date, admin_notes, deadline, assigned_freelancer_id, status, freelancer_notes, drive_link, completed_date, created_at, updated_at) VALUES
('rev-001', 'proj-005', '2024-05-22 10:00:00+00', 'Klien meminta tone warna lebih warm dan ada beberapa foto yang ingin dihilangkan jerawatnya.', '2024-05-25 10:00:00+00', 'tm-003', 'Menunggu Revisi', NULL, NULL, NULL, NOW(), NOW()),
('rev-002', 'proj-003', '2024-07-20 14:00:00+00', 'Tambahkan beberapa filter vintage pada video dan perbaiki color grading pada foto sunset.', '2024-07-23 14:00:00+00', 'tm-008', 'Revisi Selesai', 'Sudah diperbaiki sesuai permintaan. Video dan foto sudah diupload ke drive.', 'https://drive.google.com/revised/project003', '2024-07-22 16:30:00+00', NOW(), NOW());

-- Project Chat Messages
INSERT INTO project_chat_messages (id, project_id, sender, message, sent_at) VALUES
('pcm-001', 'proj-001', 'client', 'Halo, sudah bisa lihat preview fotonya?', '2024-03-01 10:00:00+00'),
('pcm-002', 'proj-001', 'vendor', 'Halo Budi & Sinta! Preview sudah bisa dilihat di link yang sudah kami kirim via email ya.', '2024-03-01 10:15:00+00'),
('pcm-003', 'proj-001', 'client', 'Wah bagus banget hasilnya! Terima kasih tim Vena Pictures!', '2024-03-01 11:00:00+00'),
('pcm-004', 'proj-005', 'vendor', 'Halo Farhan & Aisyah, ada beberapa revisi yang ingin kami konfirmasi...', '2024-05-22 09:30:00+00'),
('pcm-005', 'proj-008', 'client', 'Kapan ya albumnya bisa selesai?', '2024-08-15 14:00:00+00');

-- ========================================
-- FINANCIAL MANAGEMENT DATA
-- ========================================

-- Financial Cards
INSERT INTO financial_cards (id, organization_id, card_holder_name, bank_name, card_type, last_four_digits, expiry_date, balance, color_gradient, is_active, created_at, updated_at) VALUES
('card-001', '550e8400-e29b-41d4-a716-446655440000', 'Andi Vena', 'BCA', 'Debit', '3090', '09/28', 52500000.00, 'from-blue-500 to-sky-400', true, NOW(), NOW()),
('card-002', '550e8400-e29b-41d4-a716-446655440000', 'Andi Vena', 'Mandiri', 'Kredit', '1121', '11/27', -2500000.00, 'from-yellow-400 to-amber-500', true, NOW(), NOW()),
('card-003', '550e8400-e29b-41d4-a716-446655440000', 'Kas Operasional', 'Tunai', 'Tunai', 'CASH', NULL, 5000000.00, 'from-slate-100 to-slate-300', true, NOW(), NOW()),
('card-004', '550e8400-e29b-41d4-a716-446655440000', 'Vena Pictures', 'BNI', 'Debit', '4567', '03/29', 18750000.00, 'from-green-500 to-emerald-400', true, NOW(), NOW()),
('card-005', '550e8400-e29b-41d4-a716-446655440000', 'Andi Vena', 'CIMB Niaga', 'Kredit', '9876', '07/26', -1250000.00, 'from-purple-500 to-violet-400', true, NOW(), NOW());

-- Financial Pockets
INSERT INTO financial_pockets (id, organization_id, name, description, icon, pocket_type, amount, goal_amount, lock_end_date, source_card_id, is_active, created_at, updated_at) VALUES
('pocket-001', '550e8400-e29b-41d4-a716-446655440000', 'Dana Pajak 2024', 'Alokasi dana untuk pembayaran pajak tahunan.', 'clipboard-list', 'Terkunci', 5000000.00, NULL, '2025-03-31', NULL, true, NOW(), NOW()),
('pocket-002', '550e8400-e29b-41d4-a716-446655440000', 'Tabungan Lensa & Kamera Baru', 'Menabung untuk upgrade gear photography.', 'piggy-bank', 'Nabung & Bayar', 8500000.00, 40000000.00, NULL, NULL, true, NOW(), NOW()),
('pocket-003', '550e8400-e29b-41d4-a716-446655440000', 'Anggaran Operasional September 2024', 'Dana untuk pengeluaran bulanan.', 'clipboard-list', 'Anggaran Pengeluaran', 2000000.00, 5000000.00, NULL, 'card-001', true, NOW(), NOW()),
('pocket-004', '550e8400-e29b-41d4-a716-446655440000', 'Tabungan Hadiah Freelancer', 'Akumulasi hadiah untuk tim freelancer.', 'star', 'Tabungan Hadiah Freelancer', 500000.00, NULL, NULL, NULL, true, NOW(), NOW()),
('pocket-005', '550e8400-e29b-41d4-a716-446655440000', 'Dana Darurat Studio', 'Dana untuk keperluan darurat bisnis.', 'lock', 'Terkunci', 10000000.00, NULL, '2024-12-31', NULL, true, NOW(), NOW());

-- Financial Pocket Members (for shared pockets)
INSERT INTO financial_pocket_members (id, pocket_id, team_member_id, created_at) VALUES
('fpm-001', 'pocket-004', 'tm-001', NOW()),
('fpm-002', 'pocket-004', 'tm-002', NOW()),
('fpm-003', 'pocket-004', 'tm-003', NOW()),
('fpm-004', 'pocket-004', 'tm-005', NOW()),
('fpm-005', 'pocket-004', 'tm-006', NOW());

-- Financial Transactions
INSERT INTO financial_transactions (id, organization_id, transaction_date, description, amount, transaction_type, project_id, category, payment_method, pocket_id, card_id, printing_item_id, vendor_signature, created_at, updated_at) VALUES
-- Project 1: Budi & Sinta Income
('ft-001', '550e8400-e29b-41d4-a716-446655440000', '2024-01-20', 'DP Proyek Pernikahan Budi & Sinta', 13250000.00, 'Pemasukan', 'proj-001', 'DP Proyek', 'Transfer Bank', NULL, 'card-001', NULL, NULL, NOW(), NOW()),
('ft-002', '550e8400-e29b-41d4-a716-446655440000', '2024-02-10', 'Pelunasan Proyek Pernikahan Budi & Sinta', 13250000.00, 'Pemasukan', 'proj-001', 'Pelunasan Proyek', 'Transfer Bank', NULL, 'card-001', NULL, NULL, NOW(), NOW()),
-- Project 1: Budi & Sinta Expenses
('ft-003', '550e8400-e29b-41d4-a716-446655440000', '2024-02-20', 'Gaji Freelancer - Andi P (Budi & Sinta)', 2000000.00, 'Pengeluaran', 'proj-001', 'Gaji Freelancer', 'Transfer Bank', NULL, 'card-001', NULL, 'signature_data', NOW(), NOW()),
('ft-004', '550e8400-e29b-41d4-a716-446655440000', '2024-02-20', 'Gaji Freelancer - Citra L (Budi & Sinta)', 2500000.00, 'Pengeluaran', 'proj-001', 'Gaji Freelancer', 'Transfer Bank', NULL, 'card-001', NULL, 'signature_data', NOW(), NOW()),
('ft-005', '550e8400-e29b-41d4-a716-446655440000', '2024-02-20', 'Gaji Freelancer - Eka W (Budi & Sinta)', 1200000.00, 'Pengeluaran', 'proj-001', 'Gaji Freelancer', 'Transfer Bank', NULL, 'card-001', NULL, 'signature_data', NOW(), NOW()),
-- Project 2: Corporate Event
('ft-006', '550e8400-e29b-41d4-a716-446655440000', '2024-07-10', 'DP Proyek Acara Tahunan PT SA', 4000000.00, 'Pemasukan', 'proj-002', 'DP Proyek', 'Transfer Bank', NULL, 'card-004', NULL, NULL, NOW(), NOW()),
-- General Operational Expenses
('ft-007', '550e8400-e29b-41d4-a716-446655440000', '2024-07-05', 'Biaya langganan Adobe Creative Cloud', 870000.00, 'Pengeluaran', NULL, 'Operasional Kantor', 'Kartu', NULL, 'card-002', NULL, NULL, NOW(), NOW()),
('ft-008', '550e8400-e29b-41d4-a716-446655440000', '2024-08-01', 'Pembelian Memory Card & Baterai', 2500000.00, 'Pengeluaran', NULL, 'Peralatan', 'Transfer Bank', NULL, 'card-004', NULL, NULL, NOW(), NOW()),
-- Project 4: Dewi & Rian
('ft-009', '550e8400-e29b-41d4-a716-446655440000', '2024-06-01', 'Pelunasan Proyek Lamaran Dewi & Rian', 5000000.00, 'Pemasukan', 'proj-004', 'Pelunasan Proyek', 'Tunai', NULL, 'card-003', NULL, NULL, NOW(), NOW()),
-- Project 5: Farhan & Aisyah
('ft-010', '550e8400-e29b-41d4-a716-446655440000', '2024-04-15', 'Pelunasan Proyek Prewedding F&A', 6500000.00, 'Pemasukan', 'proj-005', 'Pelunasan Proyek', 'Transfer Bank', NULL, 'card-001', NULL, NULL, NOW(), NOW()),
-- More operational expenses
('ft-011', '550e8400-e29b-41d4-a716-446655440000', '2024-08-15', 'Biaya Transportasi ke Bali', 1500000.00, 'Pengeluaran', 'proj-003', 'Transportasi', 'Transfer Bank', NULL, 'card-004', NULL, NULL, NOW(), NOW()),
('ft-012', '550e8400-e29b-41d4-a716-446655440000', '2024-08-20', 'Sewa Studio untuk 1 bulan', 3000000.00, 'Pengeluaran', NULL, 'Operasional Kantor', 'Transfer Bank', NULL, 'card-001', NULL, NULL, NOW(), NOW()),
-- Pocket transfers
('ft-013', '550e8400-e29b-41d4-a716-446655440000', '2024-09-01', 'Transfer ke Tabungan Pajak', 2500000.00, 'Pengeluaran', NULL, 'Transfer Internal', 'Sistem', 'pocket-001', 'card-001', NULL, NULL, NOW(), NOW()),
('ft-014', '550e8400-e29b-41d4-a716-446655440000', '2024-09-01', 'Deposit Tabungan Gear', 5000000.00, 'Pengeluaran', NULL, 'Transfer Internal', 'Sistem', 'pocket-002', 'card-004', NULL, NULL, NOW(), NOW());

-- ========================================
-- TEAM PAYMENT MANAGEMENT DATA
-- ========================================

-- Team Project Payments
INSERT INTO team_project_payments (id, project_id, team_member_id, payment_date, status, fee, reward, created_at, updated_at) VALUES
('tpp-001', 'proj-001', 'tm-001', '2024-02-14', 'Paid', 2000000.00, 250000.00, NOW(), NOW()),
('tpp-002', 'proj-001', 'tm-002', '2024-02-14', 'Paid', 2500000.00, 0.00, NOW(), NOW()),
('tpp-003', 'proj-001', 'tm-006', '2024-02-14', 'Paid', 1200000.00, 100000.00, NOW(), NOW()),
('tpp-004', 'proj-002', 'tm-001', '2024-08-20', 'Unpaid', 1000000.00, 0.00, NOW(), NOW()),
('tpp-005', 'proj-002', 'tm-002', '2024-08-20', 'Unpaid', 1500000.00, 0.00, NOW(), NOW()),
('tpp-006', 'proj-004', 'tm-001', '2024-06-15', 'Paid', 1500000.00, 0.00, NOW(), NOW()),
('tpp-007', 'proj-003', 'tm-007', '2024-07-15', 'Paid', 1800000.00, 0.00, NOW(), NOW()),
('tpp-008', 'proj-003', 'tm-008', '2024-07-15', 'Paid', 2200000.00, 0.00, NOW(), NOW()),
('tpp-009', 'proj-003', 'tm-005', '2024-07-15', 'Paid', 1000000.00, 0.00, NOW(), NOW()),
('tpp-010', 'proj-005', 'tm-001', '2024-05-05', 'Paid', 2000000.00, 0.00, NOW(), NOW()),
('tpp-011', 'proj-005', 'tm-003', '2024-05-05', 'Unpaid', 1000000.00, 0.00, NOW(), NOW()),
('tpp-012', 'proj-008', 'tm-001', '2024-07-28', 'Unpaid', 2000000.00, 0.00, NOW(), NOW()),
('tpp-013', 'proj-008', 'tm-004', '2024-07-28', 'Unpaid', 750000.00, 0.00, NOW(), NOW()),
('tpp-014', 'proj-009', 'tm-001', '2024-06-01', 'Paid', 1000000.00, 0.00, NOW(), NOW());

-- Team Payment Records
INSERT INTO team_payment_records (id, organization_id, record_number, team_member_id, payment_date, total_amount, vendor_signature, created_at) VALUES
('tpr-001', '550e8400-e29b-41d4-a716-446655440000', 'PAY-FR-TM001-20240220', 'tm-001', '2024-02-20', 4500000.00, 'vendor_signature_base64', NOW()),
('tpr-002', '550e8400-e29b-41d4-a716-446655440000', 'PAY-FR-TM007-20240720', 'tm-007', '2024-07-20', 1800000.00, 'vendor_signature_base64', NOW()),
('tpr-003', '550e8400-e29b-41d4-a716-446655440000', 'PAY-FR-TM008-20240720', 'tm-008', '2024-07-20', 2200000.00, 'vendor_signature_base64', NOW()),
('tpr-004', '550e8400-e29b-41d4-a716-446655440000', 'PAY-FR-TM005-20240720', 'tm-005', '2024-07-20', 1000000.00, 'vendor_signature_base64', NOW());

-- Team Payment Record Items
INSERT INTO team_payment_record_items (id, payment_record_id, project_payment_id, created_at) VALUES
('tpri-001', 'tpr-001', 'tpp-001', NOW()), -- Andi: Budi & Sinta project
('tpri-002', 'tpr-001', 'tpp-006', NOW()), -- Andi: Dewi & Rian project  
('tpri-003', 'tpr-001', 'tpp-010', NOW()), -- Andi: Farhan & Aisyah project
('tpri-004', 'tpr-002', 'tpp-007', NOW()), -- Sari: Maya & Reza project
('tpri-005', 'tpr-003', 'tpp-008', NOW()), -- Bram: Maya & Reza project
('tpri-006', 'tpr-004', 'tpp-009', NOW()); -- Fira: Maya & Reza project

-- Reward Ledger Entries
INSERT INTO reward_ledger_entries (id, team_member_id, entry_date, description, amount, project_id, created_at) VALUES
('rle-001', 'tm-001', '2024-02-15', 'Hadiah dari proyek Pernikahan Budi & Sinta', 250000.00, 'proj-001', NOW()),
('rle-002', 'tm-006', '2024-02-15', 'Hadiah dari proyek Pernikahan Budi & Sinta', 100000.00, 'proj-001', NOW()),
('rle-003', 'tm-004', '2024-07-01', 'Hadiah dari proyek Lamaran Dewi & Rian', 50000.00, 'proj-004', NOW()),
('rle-004', 'tm-001', '2024-08-01', 'Penarikan reward untuk keperluan pribadi', -100000.00, NULL, NOW()),
('rle-005', 'tm-007', '2024-08-15', 'Hadiah performance terbaik bulan Juli', 75000.00, NULL, NOW());

-- ========================================
-- ASSET MANAGEMENT DATA
-- ========================================

-- Assets
INSERT INTO assets (id, organization_id, name, category_id, purchase_date, purchase_price, serial_number, status, notes, is_active, created_at, updated_at) VALUES
('asset-001', '550e8400-e29b-41d4-a716-446655440000', 'Sony A7 IV', 'ac-001', '2023-01-10', 38000000.00, 'SN12345678', 'Tersedia', 'Kamera utama untuk wedding photography', true, NOW(), NOW()),
('asset-002', '550e8400-e29b-41d4-a716-446655440000', 'Sony FE 50mm f/1.8', 'ac-002', '2023-01-10', 3500000.00, NULL, 'Tersedia', 'Lensa portrait standard', true, NOW(), NOW()),
('asset-003', '550e8400-e29b-41d4-a716-446655440000', 'DJI Mavic 3', 'ac-005', '2023-05-15', 32000000.00, 'SN98765432', 'Digunakan', 'Digunakan untuk proyek PT SA', true, NOW(), NOW()),
('asset-004', '550e8400-e29b-41d4-a716-446655440000', 'Canon EOS R5', 'ac-001', '2023-03-20', 45000000.00, 'SN11223344', 'Tersedia', 'Kamera backup dan untuk videography', true, NOW(), NOW()),
('asset-005', '550e8400-e29b-41d4-a716-446655440000', 'Sony FE 24-70mm f/2.8', 'ac-002', '2023-02-15', 15000000.00, NULL, 'Tersedia', 'Lensa zoom serbaguna', true, NOW(), NOW()),
('asset-006', '550e8400-e29b-41d4-a716-446655440000', 'Godox AD600 Pro', 'ac-003', '2023-04-01', 8500000.00, 'SN55667788', 'Tersedia', 'Flash studio portable', true, NOW(), NOW()),
('asset-007', '550e8400-e29b-41d4-a716-446655440000', 'MacBook Pro 16" M2', 'ac-004', '2023-06-10', 42000000.00, 'SN99887766', 'Tersedia', 'Laptop untuk editing video dan foto', true, NOW(), NOW()),
('asset-008', '550e8400-e29b-41d4-a716-446655440000', 'Tripod Manfrotto 055', 'ac-006', '2022-12-20', 2500000.00, NULL, 'Tersedia', 'Tripod heavy duty untuk kamera', true, NOW(), NOW()),
('asset-009', '550e8400-e29b-41d4-a716-446655440000', 'Sony FX3', 'ac-001', '2023-08-05', 35000000.00, 'SN13579246', 'Perbaikan', 'Dalam perbaikan LCD screen', true, NOW(), NOW()),
('asset-010', '550e8400-e29b-41d4-a716-446655440000', 'Rode Wireless GO II', 'ac-006', '2023-07-12', 4500000.00, 'SN24681357', 'Tersedia', 'Wireless microphone system', true, NOW(), NOW());

-- ========================================
-- CONTRACT MANAGEMENT DATA
-- ========================================

-- Contracts
INSERT INTO contracts (id, organization_id, contract_number, client_id, project_id, signing_date, signing_location, client_name_1, client_address_1, client_phone_1, client_name_2, client_address_2, client_phone_2, shooting_duration, guaranteed_photos, album_details, digital_files_format, other_items, personnel_count, delivery_timeframe, dp_date, final_payment_date, cancellation_policy, jurisdiction, vendor_signature, client_signature, created_at, updated_at) VALUES
('ctr-001', '550e8400-e29b-41d4-a716-446655440000', 'VP/CTR/2024/001', 'cli-001', 'proj-001', '2024-01-16', 'Kantor Vena Pictures', 'Budi Santoso', 'Jl. Merdeka No. 1, Jakarta Selatan', '081234567890', 'Sinta Maharani', 'Jl. Merdeka No. 1, Jakarta Selatan', '081234567891', '8 Jam (08:00-16:00)', '300 Foto Edit High-Resolution', '1 Album Premium 25x30cm 30 Halaman', 'JPG High-Resolution', 'Video Sinematik 5-7 menit, Video Teaser 1 menit', '2 Fotografer, 2 Videografer, 1 Drone Pilot', '45 hari kerja', '2024-01-20', '2024-02-10', 'DP tidak dapat dikembalikan jika pembatalan dari pihak klien.', 'Jakarta Pusat', 'vendor_signature_base64_string', 'client_signature_base64_string', NOW(), NOW()),

('ctr-002', '550e8400-e29b-41d4-a716-446655440000', 'VP/CTR/2024/002', 'cli-002', 'proj-002', '2024-07-09', 'Kantor PT Sejahtera Abadi', 'HRD PT Sejahtera Abadi', 'Jl. Jenderal Sudirman Kav. 52-53, Jakarta Selatan', '021-555-1234', NULL, NULL, NULL, '6 Jam (09:00-15:00)', 'Semua foto dokumentasi acara', 'Tidak ada album fisik', 'JPG High-Resolution', 'Video dokumentasi 10-15 menit', '1 Fotografer, 1 Videografer', '14 hari kerja', '2024-07-10', '2024-08-17', 'DP tidak dapat dikembalikan jika pembatalan dari pihak klien.', 'Jakarta Selatan', 'vendor_signature_base64_string', NULL, NOW(), NOW()),

('ctr-003', '550e8400-e29b-41d4-a716-446655440000', 'VP/CTR/2024/003', 'cli-003', 'proj-003', '2024-06-25', 'Kantor Vena Pictures', 'Maya Sari Dewi', 'Jl. Kemang Raya No. 15, Jakarta Selatan', '082345678901', 'Reza Pratama', 'Jl. Kemang Raya No. 15, Jakarta Selatan', '082345678902', '3 Jam (16:00-19:00)', '50 foto edit high-resolution', '1 Cetak Foto Kanvas 40x60cm', 'JPG High-Resolution', '1 video sinematik 1 menit', '1 Fotografer, 1 Videografer, 1 MUA', '21 hari kerja', '2024-06-30', '2024-07-10', 'DP tidak dapat dikembalikan jika pembatalan dari pihak klien.', 'Jakarta Pusat', 'vendor_signature_base64_string', 'client_signature_base64_string', NOW(), NOW());

-- ========================================
-- KNOWLEDGE MANAGEMENT DATA
-- ========================================

-- SOPs
INSERT INTO sops (id, organization_id, title, category_id, content, last_updated, is_active, created_at, updated_at) VALUES
('sop-001', '550e8400-e29b-41d4-a716-446655440000', 'Alur Kerja Hari-H Pernikahan', 'sop-001', '# Alur Kerja Hari-H Pernikahan

## Persiapan Tim
1. Tim berkumpul di lokasi 1 jam sebelum acara
2. Briefing cepat dengan WO dan CP Klien
3. Pembagian tugas:
   - Fotografer A: Fokus pengantin dan keluarga
   - Fotografer B: Dokumentasi tamu dan detail dekorasi
   - Videografer: Sinematik dan dokumentasi

## Backup & Security
- Selalu backup data setiap selesai sesi (e.g., setelah akad)
- Gunakan minimal 2 memory card per kamera
- Bawa baterai cadangan yang cukup

## Komunikasi
- Koordinasi dengan WO untuk timeline acara
- Update progress ke admin melalui WhatsApp grup
- Konfirmasi dengan klien untuk moment khusus', '2024-08-01 10:00:00+00', true, NOW(), NOW()),

('sop-002', '550e8400-e29b-41d4-a716-446655440000', 'Prosedur Backup Data', 'sop-003', '# Prosedur Backup Data

## Langkah Backup
1. Segera setelah acara selesai, backup semua memory card ke 2 hard drive terpisah
2. Satu hard drive disimpan di kantor, satu dibawa pulang oleh PIC
3. Beri nama folder dengan format: YYYY-MM-DD_[NamaProyek]
4. Upload ke cloud storage dalam 24 jam

## Verifikasi
- Pastikan semua file ter-copy dengan benar
- Cek integritas data dengan sample checking
- Dokumentasikan proses backup di log sheet

## Keamanan Data
- Enkripsi hard drive eksternal
- Gunakan password yang kuat untuk cloud storage
- Jangan hapus data dari memory card sampai konfirmasi backup berhasil', '2024-07-15 10:00:00+00', true, NOW(), NOW()),

('sop-003', '550e8400-e29b-41d4-a716-446655440000', 'Panduan Editing Video Pernikahan', 'sop-004', '# Panduan Editing Video Pernikahan

## Color Grading
- Gunakan LUT standard studio untuk konsistensi
- Sesuaikan exposure dan contrast per klip
- Perhatikan skin tone untuk hasil natural

## Audio Processing
- Sinkronisasi audio dengan video ceremony
- Noise reduction untuk audio ambient
- Level audio music dan dialog seimbang

## Timeline
- Rough cut: 3-5 hari setelah shooting
- Color grading dan audio: 2-3 hari
- Final render dan review: 1-2 hari
- Client preview dan revisi: 3-5 hari', '2024-08-20 14:00:00+00', true, NOW(), NOW()),

('sop-004', '550e8400-e29b-41d4-a716-446655440000', 'Protokol Komunikasi dengan Klien', 'sop-003', '# Protokol Komunikasi dengan Klien

## Response Time
- WhatsApp: Maksimal 2 jam di jam kerja
- Email: Maksimal 24 jam
- Telepon: Dijawab atau callback dalam 1 jam

## Tone Komunikasi
- Profesional namun friendly
- Gunakan bahasa yang mudah dipahami
- Selalu konfirmasi pemahaman klien

## Dokumentasi
- Catat semua permintaan khusus klien
- Screenshot atau rekam instruksi penting
- Update project notes secara real-time', '2024-09-01 09:00:00+00', true, NOW(), NOW());

-- Chat Templates
INSERT INTO chat_templates (id, organization_id, title, template, is_active, created_at, updated_at) VALUES
('ct-001', '550e8400-e29b-41d4-a716-446655440000', 'Ucapan Selamat Datang', 'Halo {clientName}, selamat! Booking Anda untuk proyek "{projectName}" telah kami konfirmasi. Kami sangat senang bisa bekerja sama dengan Anda! Tim kami akan segera menghubungi Anda untuk langkah selanjutnya. Terima kasih!', true, NOW(), NOW()),

('ct-002', '550e8400-e29b-41d4-a716-446655440000', 'Langkah Selanjutnya', 'Hai {clientName}, menindaklanjuti konfirmasi proyek "{projectName}", berikut adalah beberapa langkah selanjutnya yang bisa kita diskusikan: [Sebutkan langkah selanjutnya, misal: jadwal meeting, survey lokasi, dll]. Mohon informasikan waktu terbaik Anda. Terima kasih.', true, NOW(), NOW()),

('ct-003', '550e8400-e29b-41d4-a716-446655440000', 'Pengingat Pelunasan', 'Yth. {clientName},\n\nIni adalah pengingat ramah untuk pembayaran pelunasan proyek "{projectName}" Anda yang akan segera jatuh tempo.\n\nMohon informasikan jika Anda sudah melakukan pembayaran.\n\nTerima kasih.', true, NOW(), NOW()),

('ct-004', '550e8400-e29b-41d4-a716-446655440000', 'Konfirmasi Jadwal Shooting', 'Halo {clientName},\n\nKami ingin konfirmasi jadwal shooting untuk proyek "{projectName}" pada:\n📅 Tanggal: {shootingDate}\n⏰ Waktu: {shootingTime}\n📍 Lokasi: {location}\n\nMohon konfirmasi paling lambat H-2. Terima kasih!', true, NOW(), NOW()),

('ct-005', '550e8400-e29b-41d4-a716-446655440000', 'Update Progress Editing', 'Hi {clientName}! Update progress editing proyek "{projectName}":\n\n✅ Seleksi foto: Selesai\n🔄 Color grading: Sedang berlangsung (80%)\n⏳ Video editing: Akan dimulai minggu depan\n\nEstimasi selesai sesuai timeline ya. Terima kasih atas kesabarannya! 😊', true, NOW(), NOW());

-- ========================================
-- COMMUNICATION & FEEDBACK DATA
-- ========================================

-- Client Feedback
INSERT INTO client_feedback (id, organization_id, client_name, satisfaction, rating, feedback, feedback_date, created_at) VALUES
('cf-001', '550e8400-e29b-41d4-a716-446655440000', 'Budi & Sinta', 'Sangat Puas', 5, 'Tim Vena Pictures sangat profesional dan hasilnya melebihi ekspektasi! Terima kasih banyak! Video dan foto pernikahan kami sangat cinematic dan indah. Semua keluarga sangat senang dengan hasilnya.', '2024-04-05 10:00:00+00', NOW()),

('cf-002', '550e8400-e29b-41d4-a716-446655440000', 'Kevin & Laura', 'Tidak Puas', 2, 'Komunikasi kurang lancar dan ada beberapa permintaan kami yang terlewat saat sesi foto. Hasil foto juga kurang sesuai dengan ekspektasi yang disampaikan di awal.', '2024-03-02 10:00:00+00', NOW()),

('cf-003', '550e8400-e29b-41d4-a716-446655440000', 'Maya & Reza', 'Sangat Puas', 5, 'Prewedding di Bali sangat berkesan! Tim sangat kreatif dalam mengambil angle dan memanfaatkan golden hour. Hasil videonya juga sangat cinematic. Recommended!', '2024-08-10 14:30:00+00', NOW()),

('cf-004', '550e8400-e29b-41d4-a716-446655440000', 'PT Sejahtera Abadi', 'Puas', 4, 'Dokumentasi acara perusahaan berjalan dengan baik. Tim sangat profesional dan tidak mengganggu jalannya acara. Hasil sesuai dengan kebutuhan untuk keperluan internal dan marketing.', '2024-09-01 11:00:00+00', NOW()),

('cf-005', '550e8400-e29b-41d4-a716-446655440000', 'Indira & Arif', 'Sangat Puas', 5, 'Sesi foto keluarga sangat menyenangkan! Tim sabar menghadapi anak-anak kami yang aktif. Hasilnya natural dan menangkap momen kebahagiaan keluarga dengan sempurna.', '2024-09-01 16:00:00+00', NOW());

-- Freelancer Feedback
INSERT INTO freelancer_feedback (id, organization_id, freelancer_id, feedback_date, message, created_at) VALUES
('ff-001', '550e8400-e29b-41d4-a716-446655440000', 'tm-001', '2024-08-15 10:00:00+00', 'Terima kasih untuk project-project yang diberikan bulan ini. Semua berjalan lancar dan klien-klien juga sangat kooperatif. Looking forward untuk project berikutnya!', NOW()),

('ff-002', '550e8400-e29b-41d4-a716-446655440000', 'tm-002', '2024-08-20 14:30:00+00', 'Saran untuk project corporate: mungkin perlu brief yang lebih detail tentang ekspektasi hasil video, apakah lebih ke dokumentasi atau cinematic. Overall good collaboration!', NOW()),

('ff-003', '550e8400-e29b-41d4-a716-446655440000', 'tm-005', '2024-09-01 09:15:00+00', 'Senang bisa kontribusi di project Maya & Reza. Setup makeup di outdoor location memang challenging tapi hasilnya memuaskan. Tim juga supportive banget!', NOW());

-- Notifications
INSERT INTO notifications (id, organization_id, title, message, notification_timestamp, is_read, icon, link_view, link_action_type, link_action_id, link_action_tab, created_at) VALUES
('notif-001', '550e8400-e29b-41d4-a716-446655440000', 'Prospek Baru dari Instagram!', 'Sarah Putri menanyakan tentang paket prewedding untuk Desember 2024.', '2024-09-10 10:15:00+00', false, 'lead', 'Prospek', NULL, NULL, NULL, NOW()),

('notif-002', '550e8400-e29b-41d4-a716-446655440000', 'Pembayaran Diterima', 'DP sebesar Rp 4.000.000 dari PT Sejahtera Abadi telah dikonfirmasi untuk project Annual Event.', '2024-07-10 14:05:00+00', true, 'payment', 'Keuangan', NULL, NULL, NULL, NOW()),

('notif-003', '550e8400-e29b-41d4-a716-446655440000', 'Deadline Mendekat', 'Proyek "Lamaran Dewi & Rian" akan melewati deadline dalam 3 hari. Pastikan semua deliverable sudah siap.', '2024-06-26 09:00:00+00', true, 'deadline', 'Proyek', 'VIEW_PROJECT_DETAILS', 'proj-004', 'info', NOW()),

('notif-004', '550e8400-e29b-41d4-a716-446655440000', 'Revisi Selesai', 'Doni telah menyelesaikan revisi untuk project Maya & Reza. Silakan review hasil revisi.', '2024-07-22 17:00:00+00', false, 'completed', 'Proyek', 'VIEW_PROJECT_DETAILS', 'proj-003', 'revision', NOW()),

('notif-005', '550e8400-e29b-41d4-a716-446655440000', 'Feedback Klien Baru', 'Indira & Arif memberikan rating 5 bintang untuk sesi foto keluarga mereka.', '2024-09-01 16:30:00+00', false, 'feedback', 'Laporan Klien', NULL, NULL, NULL, NOW());

-- ========================================
-- SOCIAL MEDIA PLANNER DATA
-- ========================================

-- Social Media Posts
INSERT INTO social_media_posts (id, organization_id, project_id, client_name, post_type, platform, scheduled_date, caption, media_url, status, notes, created_at, updated_at) VALUES
('smp-001', '550e8400-e29b-41d4-a716-446655440000', 'proj-001', 'Budi & Sinta', 'Instagram Feed', 'Instagram', '2024-03-01 10:00:00+00', 'Momen bahagia dari pernikahan Budi & Sinta. Sebuah kehormatan bagi kami untuk mengabadikannya. 💕\n\n#VenaPictures #WeddingDay #JakartaWedding #WeddingPhotography', 'https://drive.google.com/file/d/wedding_budisinta_01', 'Diposting', 'Post mendapat engagement tinggi - 500+ likes', NOW(), NOW()),

('smp-002', '550e8400-e29b-41d4-a716-446655440000', 'proj-005', 'Farhan & Aisyah', 'TikTok Video', 'TikTok', '2024-07-25 19:00:00+00', 'BTS keseruan prewedding Farhan & Aisyah di Bromo! Sunrise yang spektakuler 🌅\n\n#prewedding #bromo #behindthescenes #sunrise #couplegoals', 'https://drive.google.com/file/d/prewedding_farhan_bts', 'Terjadwal', 'Video BTS 30 detik sudah ready', NOW(), NOW()),

('smp-003', '550e8400-e29b-41d4-a716-446655440000', NULL, 'Konten Umum', 'Artikel Blog', 'Website', '2024-09-15 10:00:00+00', '5 Tips Memilih Fotografer Pernikahan yang Tepat', NULL, 'Draf', 'Artikel educational untuk SEO', NOW(), NOW()),

('smp-004', '550e8400-e29b-41d4-a716-446655440000', 'proj-003', 'Maya & Reza', 'Instagram Story', 'Instagram', '2024-08-01 08:00:00+00', 'Sneak peek prewedding Maya & Reza di Bali! 🏝️', 'https://drive.google.com/file/d/prewedding_maya_story', 'Diposting', '24 jam story - archived', NOW(), NOW()),

('smp-005', '550e8400-e29b-41d4-a716-446655440000', 'proj-002', 'PT Sejahtera Abadi', 'Instagram Feed', 'Instagram', '2024-09-20 15:00:00+00', 'Corporate event photography - Annual Gathering PT Sejahtera Abadi 🏢\n\n#CorporateEvent #EventPhotography #Jakarta #VenaPictures', 'https://drive.google.com/file/d/corporate_sejahtera', 'Draf', 'Pending approval dari klien', NOW(), NOW()),

('smp-006', '550e8400-e29b-41d4-a716-446655440000', NULL, 'Konten Umum', 'Instagram Reels', 'Instagram', '2024-09-25 17:00:00+00', 'Behind the scenes: Vena Pictures team in action! 🎥📸', 'https://drive.google.com/file/d/bts_team_general', 'Draf', 'Konten BTS general untuk branding', NOW(), NOW()),

('smp-007', '550e8400-e29b-41d4-a716-446655440000', 'proj-006', 'Indira & Arif', 'Instagram Feed', 'Instagram', '2024-09-10 11:00:00+00', 'Family session yang penuh kehangatan 👨‍👩‍👧‍👦💕\n\n#FamilyPhotography #FamilySession #VenaPictures #Jakarta', 'https://drive.google.com/file/d/family_indira_arif', 'Diposting', 'Positive feedback dari followers', NOW(), NOW());

-- ========================================
-- CALENDAR & EVENTS DATA
-- ========================================

-- Calendar Events
INSERT INTO calendar_events (id, organization_id, title, description, event_type_id, start_date, end_date, location, is_all_day, created_by_user_id, created_at, updated_at) VALUES
('cal-001', '550e8400-e29b-41d4-a716-446655440000', 'Meeting Klien - David & Lisa', 'Diskusi paket pernikahan dan survey lokasi', 'et-001', '2024-09-15 14:00:00+00', '2024-09-15 16:00:00+00', 'Kantor Vena Pictures', false, 'c1e1f2b4-a0f1-4a47-9c9c-2b2a6b2a0c1b', NOW(), NOW()),

('cal-002', '550e8400-e29b-41d4-a716-446655440000', 'Workshop Editing Video', 'Internal training untuk tim editor', 'et-004', '2024-09-20 09:00:00+00', '2024-09-20 17:00:00+00', 'Studio Vena Pictures', false, 'c1e1f2b4-a0f1-4a47-9c9c-2b2a6b2a0c1b', NOW(), NOW()),

('cal-003', '550e8400-e29b-41d4-a716-446655440000', 'Survey Lokasi - Pernikahan Agung & Bella', 'Survey venue di Bandung untuk persiapan shooting', 'et-002', '2024-09-05 08:00:00+00', '2024-09-05 18:00:00+00', 'Bandung', false, 'd2e2f3b5-b1f2-5b58-8d8d-3c3b7c3b1d2c', NOW(), NOW()),

('cal-004', '550e8400-e29b-41d4-a716-446655440000', 'Libur Nasional - Hari Kemerdekaan', 'Office closed', 'et-003', '2024-08-17 00:00:00+00', '2024-08-17 23:59:59+00', 'All Locations', true, 'c1e1f2b4-a0f1-4a47-9c9c-2b2a6b2a0c1b', NOW(), NOW()),

('cal-005', '550e8400-e29b-41d4-a716-446655440000', 'Team Building Quarterly', 'Team outing dan evaluasi kuartal', 'et-005', '2024-09-28 09:00:00+00', '2024-09-28 18:00:00+00', 'Puncak, Bogor', false, 'c1e1f2b4-a0f1-4a47-9c9c-2b2a6b2a0c1b', NOW(), NOW()),

('cal-006', '550e8400-e29b-41d4-a716-446655440000', 'Maintenance Studio Equipment', 'Perawatan rutin kamera dan peralatan', 'et-006', '2024-09-12 08:00:00+00', '2024-09-12 12:00:00+00', 'Studio Vena Pictures', false, 'd2e2f3b5-b1f2-5b58-8d8d-3c3b7c3b1d2c', NOW(), NOW());

-- ========================================
-- SETTINGS & PREFERENCES DATA
-- ========================================

-- Notification Settings
INSERT INTO notification_settings (id, organization_id, new_project, payment_confirmation, deadline_reminder, created_at, updated_at) VALUES
('ns-001', '550e8400-e29b-41d4-a716-446655440000', true, true, true, NOW(), NOW());

-- Security Settings
INSERT INTO security_settings (id, organization_id, two_factor_enabled, created_at, updated_at) VALUES
('ss-001', '550e8400-e29b-41d4-a716-446655440000', false, NOW(), NOW());

-- Re-enable foreign key checks
SET session_replication_role = DEFAULT;

-- ========================================
-- COMPLETION MESSAGE
-- ========================================
SELECT 'Mock data insertion completed successfully!' as status;
