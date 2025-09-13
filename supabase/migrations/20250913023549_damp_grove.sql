-- ========================================
-- VENA PICTURES - COMPREHENSIVE MOCK DATA
-- Photography/Videography Business Management System
-- ========================================

/*
  # Mock Data for Vena Pictures Database

  1. Organizations & Users
    - 3 organizations with admin users
    - User permissions and profiles
  
  2. Configuration Data
    - Categories for income, expenses, projects, events, assets, SOPs, packages
    - Project status configurations with sub-statuses
    - Public page configurations
  
  3. Business Data
    - 10 clients with realistic profiles
    - 11 projects in various stages
    - 8 team members with different roles
    - 14 financial transactions
    - 5 financial cards and pockets
  
  4. Advanced Features
    - Team payments and records
    - Contracts with e-signatures
    - Social media posts planning
    - Client feedback and notifications
    - Promo codes and SOPs
*/

-- ========================================
-- ORGANIZATIONS & USERS
-- ========================================

-- Insert Organizations
INSERT INTO organizations (id, name, slug, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Vena Pictures', 'vena-pictures', NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440001', 'Momen Studio', 'momen-studio', NOW(), NOW()),
('550e8400-e29b-41d4-a716-446655440002', 'Capture Dreams', 'capture-dreams', NOW(), NOW());

-- Insert Users
INSERT INTO users (id, organization_id, email, password_hash, full_name, role, is_approved, is_active, created_at, updated_at) VALUES
('user-admin-001', '550e8400-e29b-41d4-a716-446655440000', 'admin@vena.pictures', '$2b$10$hashedpassword1', 'Andi Vena', 'admin', true, true, NOW(), NOW()),
('user-member-001', '550e8400-e29b-41d4-a716-446655440000', 'member@vena.pictures', '$2b$10$hashedpassword2', 'Rina Asisten', 'member', true, true, NOW(), NOW()),
('user-admin-002', '550e8400-e29b-41d4-a716-446655440001', 'admin@momen.studio', '$2b$10$hashedpassword3', 'Budi Momen', 'admin', true, true, NOW(), NOW());

-- Insert User Permissions
INSERT INTO user_permissions (id, user_id, view_type, created_at) VALUES
('perm-001', 'user-member-001', 'Manajemen Klien', NOW()),
('perm-002', 'user-member-001', 'Proyek', NOW()),
('perm-003', 'user-member-001', 'Kalender', NOW()),
('perm-004', 'user-member-001', 'Perencana Media Sosial', NOW()),
('perm-005', 'user-member-001', 'Laporan Klien', NOW());

-- Insert Organization Profiles
INSERT INTO organization_profiles (
    id, organization_id, admin_user_id, full_name, email, phone, company_name, website, address, 
    bank_account, authorized_signer, id_number, bio, brand_color, 
    briefing_template, terms_and_conditions, contract_template, package_share_template, booking_form_template,
    created_at, updated_at
) VALUES (
    'profile-001', 
    '550e8400-e29b-41d4-a716-446655440000', 
    'user-admin-001',
    'Andi Vena',
    'admin@vena.pictures',
    '+6281234567890',
    'Vena Pictures',
    'https://venapictures.com',
    'Jl. Sudirman No. 123, Jakarta Selatan 12190',
    'BCA 1234567890 a.n. Vena Pictures',
    'Andi Vena',
    '3171234567890123',
    'Vena Pictures adalah studio fotografi dan videografi profesional yang berfokus pada momen-momen berharga dalam hidup Anda. Dengan pengalaman lebih dari 5 tahun, kami telah melayani ratusan klien dengan hasil yang memuaskan.',
    '#3b82f6',
    'Halo {clientName}! Terima kasih telah mempercayakan {projectName} kepada Vena Pictures. Berikut adalah brief lengkap untuk proyek Anda...',
    E'📜 SYARAT DAN KETENTUAN UMUM VENA PICTURES\n\n📅 JADWAL DAN WAKTU\n- Jadwal pemotretan yang telah disepakati bersifat final\n- Perubahan jadwal hanya dapat dilakukan maksimal H-7 dengan konfirmasi tertulis\n- Keterlambatan dari pihak klien akan mengurangi durasi pemotretan\n\n💰 PEMBAYARAN\n- DP minimal 30% dari total biaya saat booking\n- Pelunasan dilakukan maksimal H-3 sebelum hari pelaksanaan\n- Pembayaran melalui transfer bank ke rekening resmi\n- DP yang sudah dibayar tidak dapat dikembalikan (non-refundable)\n\n📦 HASIL DAN PENGIRIMAN\n- Hasil foto/video akan diserahkan sesuai timeline yang disepakati\n- File mentah (RAW) tidak disertakan kecuali ada kesepakatan khusus\n- Revisi minor dapat dilakukan maksimal 2x tanpa biaya tambahan\n- Revisi major akan dikenakan biaya sesuai kesepakatan\n\n⏱ HAK CIPTA DAN PENGGUNAAN\n- Hak cipta hasil karya tetap milik Vena Pictures\n- Klien berhak menggunakan hasil untuk keperluan pribadi\n- Penggunaan komersial memerlukan izin tertulis\n- Vena Pictures berhak menggunakan hasil untuk portofolio dan promosi\n\n➕ KETENTUAN LAIN\n- Force majeure (bencana alam, pandemi, dll) dapat mengubah kesepakatan\n- Segala perubahan harus dikonfirmasi secara tertulis\n- Sengketa diselesaikan secara kekeluargaan atau melalui jalur hukum\n- Syarat dan ketentuan dapat berubah sewaktu-waktu dengan pemberitahuan',
    'SURAT PERJANJIAN KERJA SAMA JASA FOTOGRAFI & VIDEOGRAFI\n\nPada hari ini, {signingDate}, bertempat di {signingLocation}, telah dibuat dan disepakati perjanjian kerja sama antara:\n\nPIHAK PERTAMA: {vendorCompanyName}, diwakili oleh {vendorSignerName}\nPIHAK KEDUA: {clientName1}\n\nRuang lingkup: {projectName} pada {projectDate} di {projectLocation}\nTotal biaya: {totalCost}\nPembayaran: DP {dpAmount} pada {dpDate}, pelunasan {finalPaymentDate}\n\nKebijakan pembatalan:\n{cancellationPolicy}',
    'Lihat semua paket eksklusif kami di {websiteUrl}. Hubungi kami di {phone} untuk konsultasi gratis!',
    'Formulir booking online tersedia 24/7. Isi detail acara Anda dan dapatkan konfirmasi dalam 24 jam.',
    NOW(), 
    NOW()
);

-- ========================================
-- CONFIGURATION CATEGORIES
-- ========================================

-- Income Categories
INSERT INTO income_categories (id, organization_id, name, created_at) VALUES
('inc-cat-001', '550e8400-e29b-41d4-a716-446655440000', 'DP Proyek', NOW()),
('inc-cat-002', '550e8400-e29b-41d4-a716-446655440000', 'Pelunasan Proyek', NOW()),
('inc-cat-003', '550e8400-e29b-41d4-a716-446655440000', 'Add-On Services', NOW()),
('inc-cat-004', '550e8400-e29b-41d4-a716-446655440000', 'Printing & Album', NOW()),
('inc-cat-005', '550e8400-e29b-41d4-a716-446655440000', 'Transport Fee', NOW()),
('inc-cat-006', '550e8400-e29b-41d4-a716-446655440000', 'Lain-lain', NOW());

-- Expense Categories
INSERT INTO expense_categories (id, organization_id, name, created_at) VALUES
('exp-cat-001', '550e8400-e29b-41d4-a716-446655440000', 'Fee Freelancer', NOW()),
('exp-cat-002', '550e8400-e29b-41d4-a716-446655440000', 'Transport & Akomodasi', NOW()),
('exp-cat-003', '550e8400-e29b-41d4-a716-446655440000', 'Peralatan & Maintenance', NOW()),
('exp-cat-004', '550e8400-e29b-41d4-a716-446655440000', 'Printing & Produksi', NOW()),
('exp-cat-005', '550e8400-e29b-41d4-a716-446655440000', 'Marketing & Promosi', NOW()),
('exp-cat-006', '550e8400-e29b-41d4-a716-446655440000', 'Operasional', NOW()),
('exp-cat-007', '550e8400-e29b-41d4-a716-446655440000', 'Pajak & Administrasi', NOW()),
('exp-cat-008', '550e8400-e29b-41d4-a716-446655440000', 'Hadiah & Bonus Tim', NOW()),
('exp-cat-009', '550e8400-e29b-41d4-a716-446655440000', 'Lain-lain', NOW());

-- Project Types
INSERT INTO project_types (id, organization_id, name, created_at) VALUES
('proj-type-001', '550e8400-e29b-41d4-a716-446655440000', 'Wedding', NOW()),
('proj-type-002', '550e8400-e29b-41d4-a716-446655440000', 'Prewedding', NOW()),
('proj-type-003', '550e8400-e29b-41d4-a716-446655440000', 'Engagement', NOW()),
('proj-type-004', '550e8400-e29b-41d4-a716-446655440000', 'Corporate Event', NOW()),
('proj-type-005', '550e8400-e29b-41d4-a716-446655440000', 'Birthday Party', NOW()),
('proj-type-006', '550e8400-e29b-41d4-a716-446655440000', 'Product Photography', NOW()),
('proj-type-007', '550e8400-e29b-41d4-a716-446655440000', 'Graduation', NOW());

-- Event Types (for calendar)
INSERT INTO event_types (id, organization_id, name, created_at) VALUES
('event-type-001', '550e8400-e29b-41d4-a716-446655440000', 'Meeting Klien', NOW()),
('event-type-002', '550e8400-e29b-41d4-a716-446655440000', 'Survey Lokasi', NOW()),
('event-type-003', '550e8400-e29b-41d4-a716-446655440000', 'Libur', NOW()),
('event-type-004', '550e8400-e29b-41d4-a716-446655440000', 'Workshop', NOW()),
('event-type-005', '550e8400-e29b-41d4-a716-446655440000', 'Maintenance Alat', NOW()),
('event-type-006', '550e8400-e29b-41d4-a716-446655440000', 'Lainnya', NOW());

-- Asset Categories
INSERT INTO asset_categories (id, organization_id, name, created_at) VALUES
('asset-cat-001', '550e8400-e29b-41d4-a716-446655440000', 'Kamera', NOW()),
('asset-cat-002', '550e8400-e29b-41d4-a716-446655440000', 'Lensa', NOW()),
('asset-cat-003', '550e8400-e29b-41d4-a716-446655440000', 'Lighting', NOW()),
('asset-cat-004', '550e8400-e29b-41d4-a716-446655440000', 'Audio', NOW()),
('asset-cat-005', '550e8400-e29b-41d4-a716-446655440000', 'Drone', NOW()),
('asset-cat-006', '550e8400-e29b-41d4-a716-446655440000', 'Aksesoris', NOW()),
('asset-cat-007', '550e8400-e29b-41d4-a716-446655440000', 'Komputer & Storage', NOW());

-- SOP Categories
INSERT INTO sop_categories (id, organization_id, name, created_at) VALUES
('sop-cat-001', '550e8400-e29b-41d4-a716-446655440000', 'Pemotretan', NOW()),
('sop-cat-002', '550e8400-e29b-41d4-a716-446655440000', 'Editing', NOW()),
('sop-cat-003', '550e8400-e29b-41d4-a716-446655440000', 'Client Service', NOW()),
('sop-cat-004', '550e8400-e29b-41d4-a716-446655440000', 'Administrasi', NOW()),
('sop-cat-005', '550e8400-e29b-41d4-a716-446655440000', 'Peralatan', NOW());

-- Package Categories
INSERT INTO package_categories (id, organization_id, name, created_at) VALUES
('pkg-cat-001', '550e8400-e29b-41d4-a716-446655440000', 'Wedding Package', NOW()),
('pkg-cat-002', '550e8400-e29b-41d4-a716-446655440000', 'Prewedding Package', NOW()),
('pkg-cat-003', '550e8400-e29b-41d4-a716-446655440000', 'Corporate Package', NOW()),
('pkg-cat-004', '550e8400-e29b-41d4-a716-446655440000', 'Event Package', NOW()),
('pkg-cat-005', '550e8400-e29b-41d4-a716-446655440000', 'Product Package', NOW());

-- ========================================
-- PROJECT STATUS CONFIGURATION
-- ========================================

-- Project Status Configs
INSERT INTO project_status_configs (id, organization_id, name, color, note, sort_order, is_active, created_at, updated_at) VALUES
('status-001', '550e8400-e29b-41d4-a716-446655440000', 'Persiapan', '#94a3b8', 'Tahap awal persiapan proyek', 1, true, NOW(), NOW()),
('status-002', '550e8400-e29b-41d4-a716-446655440000', 'Dikonfirmasi', '#3b82f6', 'Proyek telah dikonfirmasi dan siap dilaksanakan', 2, true, NOW(), NOW()),
('status-003', '550e8400-e29b-41d4-a716-446655440000', 'Berlangsung', '#f59e0b', 'Proyek sedang dalam tahap pelaksanaan', 3, true, NOW(), NOW()),
('status-004', '550e8400-e29b-41d4-a716-446655440000', 'Editing', '#8b5cf6', 'Tahap post-production dan editing', 4, true, NOW(), NOW()),
('status-005', '550e8400-e29b-41d4-a716-446655440000', 'Revisi', '#ef4444', 'Memerlukan revisi dari klien', 5, true, NOW(), NOW()),
('status-006', '550e8400-e29b-41d4-a716-446655440000', 'Dikirim', '#06b6d4', 'Hasil sudah dikirim ke klien', 6, true, NOW(), NOW()),
('status-007', '550e8400-e29b-41d4-a716-446655440000', 'Selesai', '#10b981', 'Proyek telah selesai sepenuhnya', 7, true, NOW(), NOW()),
('status-008', '550e8400-e29b-41d4-a716-446655440000', 'Dibatalkan', '#6b7280', 'Proyek dibatalkan', 8, true, NOW(), NOW());

-- Project Sub-Status Configs
INSERT INTO project_sub_status_configs (id, status_config_id, name, note, sort_order, created_at) VALUES
('sub-status-001', 'status-004', 'Seleksi Foto', 'Memilih foto terbaik dari hasil pemotretan', 1, NOW()),
('sub-status-002', 'status-004', 'Color Grading', 'Proses koreksi warna dan tone', 2, NOW()),
('sub-status-003', 'status-004', 'Retouching', 'Detail retouching dan penyempurnaan', 3, NOW()),
('sub-status-004', 'status-004', 'Video Editing', 'Editing video dan motion graphics', 4, NOW()),
('sub-status-005', 'status-004', 'Audio Mixing', 'Mixing audio dan background music', 5, NOW()),
('sub-status-006', 'status-006', 'Persiapan Album', 'Layout dan persiapan album cetak', 1, NOW()),
('sub-status-007', 'status-006', 'Proses Cetak', 'Proses pencetakan album dan foto', 2, NOW()),
('sub-status-008', 'status-006', 'Quality Check', 'Pemeriksaan kualitas hasil cetak', 3, NOW()),
('sub-status-009', 'status-006', 'Packaging', 'Pengemasan dan persiapan pengiriman', 4, NOW());

-- ========================================
-- PUBLIC PAGE CONFIGURATION
-- ========================================

INSERT INTO public_page_configs (id, organization_id, template, title, introduction, created_at, updated_at) VALUES
('public-001', '550e8400-e29b-41d4-a716-446655440000', 'modern', 'Vena Pictures - Abadikan Momen Berharga Anda', 
'Selamat datang di Vena Pictures! Kami adalah studio fotografi dan videografi profesional yang siap mengabadikan momen-momen berharga dalam hidup Anda. Dengan tim berpengalaman dan peralatan terkini, kami berkomitmen memberikan hasil terbaik untuk setiap klien.', 
NOW(), NOW());

-- ========================================
-- CLIENT MANAGEMENT
-- ========================================

-- Leads
INSERT INTO leads (id, organization_id, name, contact_channel, location, status, date, notes, whatsapp, created_at, updated_at) VALUES
('lead-001', '550e8400-e29b-41d4-a716-446655440000', 'Sarah & Dimas', 'Instagram', 'Jakarta', 'Sedang Diskusi', '2024-01-15', 'Tertarik paket wedding premium, budget 25-30jt', '+6281234567891', NOW(), NOW()),
('lead-002', '550e8400-e29b-41d4-a716-446655440000', 'PT Teknologi Maju', 'Website', 'Bandung', 'Menunggu Follow Up', '2024-01-18', 'Corporate event tahunan, butuh foto dan video dokumentasi', '+6281234567892', NOW(), NOW()),
('lead-003', '550e8400-e29b-41d4-a716-446655440000', 'Rina Sari', 'WhatsApp', 'Surabaya', 'Dikonversi', '2024-01-10', 'Dikonversi menjadi klien untuk prewedding package', '+6281234567893', NOW(), NOW()),
('lead-004', '550e8400-e29b-41d4-a716-446655440000', 'Ahmad Fauzi', 'Referensi', 'Yogyakarta', 'Ditolak', '2024-01-12', 'Budget tidak sesuai dengan ekspektasi', '+6281234567894', NOW(), NOW()),
('lead-005', '550e8400-e29b-41d4-a716-446655440000', 'Maya & Rizki', 'Form Saran', 'Bali', 'Sedang Diskusi', '2024-01-20', 'Wedding destination di Bali, perlu survey lokasi', '+6281234567895', NOW());

-- Clients
INSERT INTO clients (id, organization_id, name, email, phone, whatsapp, instagram, since, status, client_type, last_contact, portal_access_id, created_at, updated_at) VALUES
('client-001', '550e8400-e29b-41d4-a716-446655440000', 'Budi & Sinta Wijaya', 'budi.sinta@email.com', '+6281234567801', '+6281234567801', '@budisinta_wedding', '2023-12-01', 'Aktif', 'Langsung', '2024-01-15T10:30:00Z', 'portal-client-001', NOW(), NOW()),
('client-002', '550e8400-e29b-41d4-a716-446655440000', 'PT Sejahtera Abadi', 'marketing@sejahtera.co.id', '+6281234567802', '+6281234567802', '@sejahtera_corp', '2023-11-15', 'Aktif', 'Langsung', '2024-01-14T14:20:00Z', 'portal-client-002', NOW(), NOW()),
('client-003', '550e8400-e29b-41d4-a716-446655440000', 'Farhan & Aisyah', 'farhan.aisyah@email.com', '+6281234567803', '+6281234567803', '@farhan_aisyah', '2023-10-20', 'Aktif', 'Langsung', '2024-01-13T09:15:00Z', 'portal-client-003', NOW(), NOW()),
('client-004', '550e8400-e29b-41d4-a716-446655440000', 'Dewi Sartika', 'dewi.sartika@email.com', '+6281234567804', '+6281234567804', '@dewisartika', '2023-09-10', 'Aktif', 'Langsung', '2024-01-12T16:45:00Z', 'portal-client-004', NOW(), NOW()),
('client-005', '550e8400-e29b-41d4-a716-446655440000', 'CV Kreatif Nusantara', 'info@kreatifnusantara.com', '+6281234567805', '+6281234567805', '@kreatif_nusantara', '2023-08-25', 'Aktif', 'Vendor', '2024-01-11T11:30:00Z', 'portal-client-005', NOW(), NOW()),
('client-006', '550e8400-e29b-41d4-a716-446655440000', 'Rini & Agus', 'rini.agus@email.com', '+6281234567806', '+6281234567806', '@rini_agus_wedding', '2023-07-15', 'Tidak Aktif', 'Langsung', '2023-12-20T08:00:00Z', 'portal-client-006', NOW(), NOW()),
('client-007', '550e8400-e29b-41d4-a716-446655440000', 'Sari Indah', 'sari.indah@email.com', '+6281234567807', '+6281234567807', '@sari_indah', '2023-06-30', 'Aktif', 'Langsung', '2024-01-10T13:20:00Z', 'portal-client-007', NOW(), NOW()),
('client-008', '550e8400-e29b-41d4-a716-446655440000', 'PT Digital Solusi', 'contact@digitalsolusi.com', '+6281234567808', '+6281234567808', '@digital_solusi', '2023-05-20', 'Aktif', 'Langsung', '2024-01-09T15:10:00Z', 'portal-client-008', NOW(), NOW()),
('client-009', '550e8400-e29b-41d4-a716-446655440000', 'Lina & Bayu', 'lina.bayu@email.com', '+6281234567809', '+6281234567809', '@lina_bayu', '2023-04-10', 'Hilang', 'Langsung', '2023-08-15T12:00:00Z', 'portal-client-009', NOW(), NOW()),
('client-010', '550e8400-e29b-41d4-a716-446655440000', 'Keluarga Hartono', 'keluarga.hartono@email.com', '+6281234567810', '+6281234567810', '@keluarga_hartono', '2023-03-05', 'Aktif', 'Langsung', '2024-01-08T10:45:00Z', 'portal-client-010', NOW(), NOW());

-- ========================================
-- TEAM MANAGEMENT
-- ========================================

-- Team Members
INSERT INTO team_members (id, organization_id, name, role, email, phone, standard_fee, bank_account, reward_balance, rating, portal_access_id, is_active, created_at, updated_at) VALUES
('team-001', '550e8400-e29b-41d4-a716-446655440000', 'Andi Pratama', 'Fotografer Utama', 'andi.pratama@email.com', '+6281234567901', 1500000, 'BCA 9876543210', 250000, 4.8, 'portal-freelancer-001', true, NOW(), NOW()),
('team-002', '550e8400-e29b-41d4-a716-446655440000', 'Sari Dewi', 'Videografer', 'sari.dewi@email.com', '+6281234567902', 1200000, 'Mandiri 1234567890', 150000, 4.6, 'portal-freelancer-002', true, NOW(), NOW()),
('team-003', '550e8400-e29b-41d4-a716-446655440000', 'Rizki Ramadhan', 'Editor Video', 'rizki.ramadhan@email.com', '+6281234567903', 800000, 'BNI 5678901234', 100000, 4.7, 'portal-freelancer-003', true, NOW(), NOW()),
('team-004', '550e8400-e29b-41d4-a716-446655440000', 'Fira Anjani', 'Make Up Artist', 'fira.anjani@email.com', '+6281234567904', 600000, 'BRI 3456789012', 200000, 5.0, 'portal-freelancer-004', true, NOW(), NOW()),
('team-005', '550e8400-e29b-41d4-a716-446655440000', 'Doni Setiawan', 'Fotografer Kedua', 'doni.setiawan@email.com', '+6281234567905', 1000000, 'CIMB 7890123456', 75000, 4.5, 'portal-freelancer-005', true, NOW(), NOW()),
('team-006', '550e8400-e29b-41d4-a716-446655440000', 'Lestari Putri', 'Editor Foto', 'lestari.putri@email.com', '+6281234567906', 700000, 'Danamon 2345678901', 125000, 4.9, 'portal-freelancer-006', true, NOW(), NOW()),
('team-007', '550e8400-e29b-41d4-a716-446655440000', 'Yoga Pratama', 'Drone Pilot', 'yoga.pratama@email.com', '+6281234567907', 900000, 'Permata 6789012345', 50000, 4.4, 'portal-freelancer-007', true, NOW(), NOW()),
('team-008', '550e8400-e29b-41d4-a716-446655440000', 'Nina Sari', 'Koordinator Acara', 'nina.sari@email.com', '+6281234567908', 500000, 'OCBC 4567890123', 175000, 4.8, 'portal-freelancer-008', true, NOW(), NOW());

-- Team Performance Notes
INSERT INTO team_performance_notes (id, team_member_id, date, note, note_type, created_by_user_id, created_at) VALUES
('perf-note-001', 'team-001', '2024-01-10', 'Hasil foto wedding Budi & Sinta sangat memuaskan klien. Komposisi dan timing yang sempurna.', 'Pujian', 'user-admin-001', NOW()),
('perf-note-002', 'team-002', '2024-01-08', 'Video cinematic untuk corporate event PT Sejahtera mendapat apresiasi tinggi dari klien.', 'Pujian', 'user-admin-001', NOW()),
('perf-note-003', 'team-003', '2024-01-05', 'Deadline editing video corporate agak terlambat 2 hari. Perlu perbaikan time management.', 'Keterlambatan Deadline', 'user-admin-001', NOW()),
('perf-note-004', 'team-004', '2024-01-12', 'Makeup untuk prewedding Farhan & Aisyah mendapat pujian khusus dari klien. Sangat natural dan photogenic.', 'Pujian', 'user-admin-001', NOW()),
('perf-note-005', 'team-005', '2024-01-07', 'Perlu lebih memperhatikan backup equipment. Ada kendala flash yang mati saat acara.', 'Perhatian', 'user-admin-001', NOW());

-- ========================================
-- PACKAGE MANAGEMENT
-- ========================================

-- Packages
INSERT INTO packages (id, organization_id, name, price, category_id, processing_time, photographers, videographers, default_printing_cost, default_transport_cost, is_active, created_at, updated_at) VALUES
('pkg-001', '550e8400-e29b-41d4-a716-446655440000', 'Wedding Premium', 25000000, 'pkg-cat-001', '30 hari kerja', '2 Fotografer', '1 Videografer', 2000000, 500000, true, NOW(), NOW()),
('pkg-002', '550e8400-e29b-41d4-a716-446655440000', 'Wedding Standard', 18000000, 'pkg-cat-001', '21 hari kerja', '1 Fotografer', '1 Videografer', 1500000, 300000, true, NOW(), NOW()),
('pkg-003', '550e8400-e29b-41d4-a716-446655440000', 'Prewedding Outdoor', 8000000, 'pkg-cat-002', '14 hari kerja', '1 Fotografer', '', 500000, 200000, true, NOW(), NOW()),
('pkg-004', '550e8400-e29b-41d4-a716-446655440000', 'Prewedding Studio', 5000000, 'pkg-cat-002', '10 hari kerja', '1 Fotografer', '', 300000, 0, true, NOW(), NOW()),
('pkg-005', '550e8400-e29b-41d4-a716-446655440000', 'Corporate Event', 12000000, 'pkg-cat-003', '14 hari kerja', '2 Fotografer', '1 Videografer', 800000, 400000, true, NOW(), NOW()),
('pkg-006', '550e8400-e29b-41d4-a716-446655440000', 'Birthday Party', 6000000, 'pkg-cat-004', '7 hari kerja', '1 Fotografer', '', 400000, 200000, true, NOW(), NOW()),
('pkg-007', '550e8400-e29b-41d4-a716-446655440000', 'Product Photography', 3000000, 'pkg-cat-005', '5 hari kerja', '1 Fotografer', '', 200000, 100000, true, NOW(), NOW());

-- Package Physical Items
INSERT INTO package_physical_items (id, package_id, name, price, created_at) VALUES
('pkg-phys-001', 'pkg-001', 'Album Wedding 30x30 cm (50 halaman)', 2000000, NOW()),
('pkg-phys-002', 'pkg-001', 'Cetak Foto 4R (100 lembar)', 500000, NOW()),
('pkg-phys-003', 'pkg-002', 'Album Wedding 25x25 cm (30 halaman)', 1500000, NOW()),
('pkg-phys-004', 'pkg-003', 'Album Prewedding 20x20 cm (20 halaman)', 800000, NOW()),
('pkg-phys-005', 'pkg-004', 'Cetak Foto 4R (50 lembar)', 300000, NOW()),
('pkg-phys-006', 'pkg-005', 'USB Flashdisk Custom 32GB', 200000, NOW()),
('pkg-phys-007', 'pkg-006', 'Cetak Foto Polaroid (30 lembar)', 150000, NOW());

-- Package Digital Items
INSERT INTO package_digital_items (id, package_id, name, created_at) VALUES
('pkg-dig-001', 'pkg-001', 'Semua Foto Edited High Resolution (300+ foto)', NOW()),
('pkg-dig-002', 'pkg-001', 'Video Cinematic Wedding (8-10 menit)', NOW()),
('pkg-dig-003', 'pkg-001', 'Video Highlight (3-4 menit)', NOW()),
('pkg-dig-004', 'pkg-001', 'Raw Video Ceremony & Reception', NOW()),
('pkg-dig-005', 'pkg-002', 'Semua Foto Edited High Resolution (200+ foto)', NOW()),
('pkg-dig-006', 'pkg-002', 'Video Highlight (3-4 menit)', NOW()),
('pkg-dig-007', 'pkg-003', 'Foto Edited High Resolution (100+ foto)', NOW()),
('pkg-dig-008', 'pkg-003', 'Foto Candid & Behind The Scene (50+ foto)', NOW()),
('pkg-dig-009', 'pkg-004', 'Foto Edited High Resolution (80+ foto)', NOW()),
('pkg-dig-010', 'pkg-005', 'Foto Event High Resolution (150+ foto)', NOW()),
('pkg-dig-011', 'pkg-005', 'Video Dokumentasi Event (5-7 menit)', NOW()),
('pkg-dig-012', 'pkg-006', 'Foto Party High Resolution (100+ foto)', NOW()),
('pkg-dig-013', 'pkg-006', 'Video Highlight Party (2-3 menit)', NOW()),
('pkg-dig-014', 'pkg-007', 'Foto Produk Edited (50+ foto)', NOW());

-- Add-Ons
INSERT INTO add_ons (id, organization_id, name, price, is_active, created_at, updated_at) VALUES
('addon-001', '550e8400-e29b-41d4-a716-446655440000', 'Drone Shooting', 2000000, true, NOW(), NOW()),
('addon-002', '550e8400-e29b-41d4-a716-446655440000', 'Live Streaming Setup', 3000000, true, NOW(), NOW()),
('addon-003', '550e8400-e29b-41d4-a716-446655440000', 'Extra Photographer', 1500000, true, NOW(), NOW()),
('addon-004', '550e8400-e29b-41d4-a716-446655440000', 'Same Day Edit Video', 2500000, true, NOW(), NOW()),
('addon-005', '550e8400-e29b-41d4-a716-446655440000', 'Photo Booth Setup', 1800000, true, NOW(), NOW()),
('addon-006', '550e8400-e29b-41d4-a716-446655440000', 'Extra Album Copy', 1200000, true, NOW(), NOW()),
('addon-007', '550e8400-e29b-41d4-a716-446655440000', 'Professional Lighting Setup', 1000000, true, NOW(), NOW());

-- ========================================
-- PROJECT MANAGEMENT
-- ========================================

-- Projects
INSERT INTO projects (id, organization_id, project_name, client_id, project_type_id, package_id, date, deadline_date, location, progress, status, total_cost, amount_paid, payment_status, notes, start_time, end_time, booking_status, created_at, updated_at) VALUES
('proj-001', '550e8400-e29b-41d4-a716-446655440000', 'Wedding Budi & Sinta', 'client-001', 'proj-type-001', 'pkg-001', '2023-12-15', '2024-01-15', 'Ballroom Hotel Mulia, Jakarta', 100, 'Selesai', 26500000, 26500000, 'Lunas', 'Wedding mewah dengan 200 tamu. Dekorasi tema gold & white.', '14:00', '22:00', 'Terkonfirmasi', NOW(), NOW()),
('proj-002', '550e8400-e29b-41d4-a716-446655440000', 'Corporate Event PT Sejahtera', 'client-002', 'proj-type-004', 'pkg-005', '2024-01-25', '2024-02-10', 'Convention Center Jakarta', 60, 'Editing', 8000000, 4000000, 'DP Terbayar', 'Annual company gathering dengan 500 peserta. Butuh live streaming.', '08:00', '17:00', 'Terkonfirmasi', NOW(), NOW()),
('proj-003', '550e8400-e29b-41d4-a716-446655440000', 'Prewedding Farhan & Aisyah', 'client-003', 'proj-type-002', 'pkg-003', '2024-01-20', '2024-02-05', 'Bromo, Jawa Timur', 80, 'Revisi', 8500000, 4250000, 'DP Terbayar', 'Prewedding outdoor dengan konsep sunrise di Bromo. Klien request tone warna lebih warm.', '04:00', '10:00', 'Terkonfirmasi', NOW(), NOW()),
('proj-004', '550e8400-e29b-41d4-a716-446655440000', 'Graduation Dewi', 'client-004', 'proj-type-007', 'pkg-007', '2024-02-01', '2024-02-08', 'Universitas Indonesia, Depok', 30, 'Dikonfirmasi', 3500000, 1750000, 'DP Terbayar', 'Foto wisuda individual dengan keluarga.', '09:00', '12:00', 'Terkonfirmasi', NOW(), NOW()),
('proj-005', '550e8400-e29b-41d4-a716-446655440000', 'Product Shoot CV Kreatif', 'client-005', 'proj-type-006', 'pkg-007', '2024-02-05', '2024-02-12', 'Studio Vena Pictures', 0, 'Persiapan', 3200000, 0, 'Belum Bayar', 'Product photography untuk 20 item fashion.', '10:00', '16:00', 'Terkonfirmasi', NOW(), NOW()),
('proj-006', '550e8400-e29b-41d4-a716-446655440000', 'Birthday Party Sari', 'client-007', 'proj-type-005', 'pkg-006', '2024-02-10', '2024-02-17', 'Rumah Sari, Kemang', 20, 'Dikonfirmasi', 6200000, 3100000, 'DP Terbayar', 'Ulang tahun ke-30 dengan tema garden party.', '16:00', '21:00', 'Terkonfirmasi', NOW(), NOW()),
('proj-007', '550e8400-e29b-41d4-a716-446655440000', 'Corporate Branding PT Digital', 'client-008', 'proj-type-006', 'pkg-007', '2024-02-15', '2024-02-22', 'Kantor PT Digital Solusi', 10, 'Persiapan', 4000000, 2000000, 'DP Terbayar', 'Foto profil karyawan dan dokumentasi kantor.', '09:00', '15:00', 'Terkonfirmasi', NOW(), NOW()),
('proj-008', '550e8400-e29b-41d4-a716-446655440000', 'Family Portrait Hartono', 'client-010', 'proj-type-005', 'pkg-006', '2024-02-20', '2024-02-27', 'Taman Mini Indonesia Indah', 0, 'Persiapan', 6500000, 0, 'Belum Bayar', 'Family portrait 3 generasi dengan konsep outdoor.', '08:00', '12:00', 'Terkonfirmasi', NOW(), NOW()),
('proj-009', '550e8400-e29b-41d4-a716-446655440000', 'Engagement Maya & Rizki', 'client-001', 'proj-type-003', 'pkg-004', '2024-03-01', '2024-03-10', 'Cafe Romantis, Bandung', 0, 'Persiapan', 5500000, 2750000, 'DP Terbayar', 'Engagement session dengan konsep intimate cafe.', '15:00', '18:00', 'Baru', NOW(), NOW()),
('proj-010', '550e8400-e29b-41d4-a716-446655440000', 'Wedding Sarah & Dimas', 'client-002', 'proj-type-001', 'pkg-002', '2024-03-15', '2024-04-15', 'Gedung Pernikahan Graha Mandiri', 0, 'Persiapan', 19000000, 0, 'Belum Bayar', 'Wedding dengan tema rustic modern, 150 tamu.', '13:00', '21:00', 'Baru', NOW(), NOW()),
('proj-011', '550e8400-e29b-41d4-a716-446655440000', 'Prewedding Studio Lina & Bayu', 'client-009', 'proj-type-002', 'pkg-004', '2024-03-20', '2024-03-30', 'Studio Vena Pictures', 0, 'Dibatalkan', 5000000, 1500000, 'DP Terbayar', 'Dibatalkan karena klien mengundur pernikahan.', '10:00', '14:00', 'Ditolak', NOW(), NOW());

-- Project Add-Ons
INSERT INTO project_add_ons (id, project_id, add_on_id, price, created_at) VALUES
('proj-addon-001', 'proj-001', 'addon-001', 2000000, NOW()),
('proj-addon-002', 'proj-001', 'addon-005', 1800000, NOW()),
('proj-addon-003', 'proj-002', 'addon-002', 3000000, NOW()),
('proj-addon-004', 'proj-003', 'addon-001', 2000000, NOW());

-- Project Team Assignments
INSERT INTO project_team_assignments (id, project_id, team_member_id, fee, reward, sub_job, created_at) VALUES
('assign-001', 'proj-001', 'team-001', 1500000, 100000, 'Lead Photographer', NOW()),
('assign-002', 'proj-001', 'team-002', 1200000, 80000, 'Videographer', NOW()),
('assign-003', 'proj-001', 'team-004', 600000, 50000, 'Bridal Makeup', NOW()),
('assign-004', 'proj-002', 'team-001', 1500000, 0, 'Event Photographer', NOW()),
('assign-005', 'proj-002', 'team-002', 1200000, 0, 'Event Videographer', NOW()),
('assign-006', 'proj-002', 'team-005', 1000000, 0, 'Second Photographer', NOW()),
('assign-007', 'proj-003', 'team-001', 1500000, 0, 'Prewedding Photographer', NOW()),
('assign-008', 'proj-003', 'team-007', 900000, 0, 'Drone Operator', NOW()),
('assign-009', 'proj-004', 'team-001', 1500000, 0, 'Graduation Photographer', NOW()),
('assign-010', 'proj-005', 'team-001', 1500000, 0, 'Product Photographer', NOW()),
('assign-011', 'proj-006', 'team-005', 1000000, 0, 'Party Photographer', NOW()),
('assign-012', 'proj-006', 'team-008', 500000, 0, 'Event Coordinator', NOW()),
('assign-013', 'proj-007', 'team-001', 1500000, 0, 'Corporate Photographer', NOW()),
('assign-014', 'proj-008', 'team-005', 1000000, 0, 'Family Photographer', NOW());

-- Project Active Sub-Statuses
INSERT INTO project_active_sub_statuses (id, project_id, sub_status_name, created_at) VALUES
('active-sub-001', 'proj-002', 'Color Grading', NOW()),
('active-sub-002', 'proj-002', 'Video Editing', NOW()),
('active-sub-003', 'proj-003', 'Retouching', NOW());

-- Project Revisions
INSERT INTO project_revisions (id, project_id, revision_date, admin_notes, deadline, assigned_freelancer_id, status, freelancer_notes, drive_link, completed_date, created_at, updated_at) VALUES
('revision-001', 'proj-003', '2024-01-22T10:00:00Z', 'Klien request tone warna lebih warm dan natural. Fokus pada golden hour effect.', '2024-01-25T17:00:00Z', 'team-006', 'Revisi Selesai', 'Sudah adjust tone sesuai request. Added warm filter dan enhance golden hour.', 'https://drive.google.com/folder/revised-farhan-aisyah', '2024-01-24T16:30:00Z', NOW(), NOW()),
('revision-002', 'proj-002', '2024-01-23T14:00:00Z', 'Video corporate perlu tambahan motion graphics untuk logo company dan adjust audio mixing.', '2024-01-26T18:00:00Z', 'team-003', 'Sedang Dikerjakan', '', '', NULL, NOW(), NOW());

-- Project Chat Messages
INSERT INTO project_chat_messages (id, project_id, sender, message, sent_at) VALUES
('chat-001', 'proj-002', 'client', 'Halo, untuk video corporate event kemarin, bisa tolong ditambahkan logo perusahaan di opening?', '2024-01-23T09:30:00Z'),
('chat-002', 'proj-002', 'vendor', 'Baik pak, akan kami tambahkan logo di opening video. Estimasi selesai besok sore.', '2024-01-23T10:15:00Z'),
('chat-003', 'proj-003', 'client', 'Hasil foto prewedding sudah bagus, tapi bisa tolong tone warnanya dibuat lebih hangat?', '2024-01-22T14:20:00Z'),
('chat-004', 'proj-003', 'vendor', 'Siap kak, akan kami revisi dengan tone yang lebih warm. Estimasi 2-3 hari ya.', '2024-01-22T14:45:00Z'),
('chat-005', 'proj-001', 'client', 'Terima kasih untuk hasil wedding kemarin. Sangat puas dengan hasilnya!', '2024-01-16T11:00:00Z');

-- ========================================
-- FINANCIAL MANAGEMENT
-- ========================================

-- Financial Cards
INSERT INTO financial_cards (id, organization_id, card_holder_name, bank_name, card_type, last_four_digits, expiry_date, balance, color_gradient, is_active, created_at, updated_at) VALUES
('card-001', '550e8400-e29b-41d4-a716-446655440000', 'Andi Vena', 'BCA', 'Debit', '3090', '12/26', 52500000, 'from-blue-500 to-sky-400', true, NOW(), NOW()),
('card-002', '550e8400-e29b-41d4-a716-446655440000', 'Vena Pictures', 'Mandiri', 'Kredit', '7821', '08/25', -2500000, 'from-red-500 to-pink-400', true, NOW(), NOW()),
('card-003', '550e8400-e29b-41d4-a716-446655440000', 'Andi Vena', 'BNI', 'Debit', '1234', '03/27', 15000000, 'from-green-500 to-emerald-400', true, NOW(), NOW()),
('card-004', '550e8400-e29b-41d4-a716-446655440000', 'Vena Pictures', 'CIMB Niaga', 'Prabayar', '5678', '11/25', 3000000, 'from-purple-500 to-violet-400', true, NOW(), NOW()),
('card-005', '550e8400-e29b-41d4-a716-446655440000', 'Cash', 'Tunai', 'Tunai', '0000', '', 5000000, 'from-slate-600 to-slate-400', true, NOW(), NOW());

-- Financial Pockets
INSERT INTO financial_pockets (id, organization_id, name, description, icon, pocket_type, amount, goal_amount, lock_end_date, source_card_id, is_active, created_at, updated_at) VALUES
('pocket-001', '550e8400-e29b-41d4-a716-446655440000', 'Dana Darurat', 'Cadangan untuk kebutuhan mendesak', 'piggy-bank', 'Nabung & Bayar', 10000000, 20000000, NULL, 'card-001', true, NOW(), NOW()),
('pocket-002', '550e8400-e29b-41d4-a716-446655440000', 'Tabungan Pajak', 'Simpanan untuk pembayaran pajak tahunan', 'lock', 'Terkunci', 5000000, 8000000, '2025-03-31', 'card-001', true, NOW(), NOW()),
('pocket-003', '550e8400-e29b-41d4-a716-446655440000', 'Upgrade Peralatan', 'Tabungan untuk beli kamera dan lensa baru', 'piggy-bank', 'Nabung & Bayar', 8500000, 40000000, NULL, 'card-003', true, NOW(), NOW()),
('pocket-004', '550e8400-e29b-41d4-a716-446655440000', 'Hadiah Tim', 'Pool hadiah untuk freelancer berprestasi', 'star', 'Tabungan Hadiah Freelancer', 500000, NULL, NULL, 'card-004', true, NOW(), NOW()),
('pocket-005', '550e8400-e29b-41d4-a716-446655440000', 'Marketing Budget', 'Anggaran untuk promosi dan iklan', 'clipboard-list', 'Anggaran Pengeluaran', 2000000, 5000000, NULL, 'card-002', true, NOW(), NOW());

-- Financial Pocket Members (for shared pockets)
INSERT INTO financial_pocket_members (id, pocket_id, team_member_id, created_at) VALUES
('pocket-member-001', 'pocket-004', 'team-001', NOW()),
('pocket-member-002', 'pocket-004', 'team-002', NOW()),
('pocket-member-003', 'pocket-004', 'team-003', NOW()),
('pocket-member-004', 'pocket-004', 'team-004', NOW()),
('pocket-member-005', 'pocket-004', 'team-006', NOW());

-- Financial Transactions
INSERT INTO financial_transactions (id, organization_id, transaction_date, description, amount, transaction_type, project_id, category, payment_method, card_id, pocket_id, created_at, updated_at) VALUES
('txn-001', '550e8400-e29b-41d4-a716-446655440000', '2024-01-15', 'Pelunasan Wedding Budi & Sinta', 13250000, 'Pemasukan', 'proj-001', 'Pelunasan Proyek', 'Transfer Bank', 'card-001', NULL, NOW(), NOW()),
('txn-002', '550e8400-e29b-41d4-a716-446655440000', '2024-01-16', 'Fee Andi Pratama - Wedding Budi & Sinta', 1500000, 'Pengeluaran', 'proj-001', 'Fee Freelancer', 'Transfer Bank', 'card-001', NULL, NOW(), NOW()),
('txn-003', '550e8400-e29b-41d4-a716-446655440000', '2024-01-16', 'Fee Sari Dewi - Wedding Budi & Sinta', 1200000, 'Pengeluaran', 'proj-001', 'Fee Freelancer', 'Transfer Bank', 'card-001', NULL, NOW(), NOW()),
('txn-004', '550e8400-e29b-41d4-a716-446655440000', '2024-01-18', 'DP Corporate Event PT Sejahtera', 4000000, 'Pemasukan', 'proj-002', 'DP Proyek', 'Transfer Bank', 'card-001', NULL, NOW(), NOW()),
('txn-005', '550e8400-e29b-41d4-a716-446655440000', '2024-01-19', 'Transport Bromo - Prewedding Farhan', 500000, 'Pengeluaran', 'proj-003', 'Transport & Akomodasi', 'Tunai', 'card-005', NULL, NOW(), NOW()),
('txn-006', '550e8400-e29b-41d4-a716-446655440000', '2024-01-20', 'DP Prewedding Farhan & Aisyah', 4250000, 'Pemasukan', 'proj-003', 'DP Proyek', 'Transfer Bank', 'card-001', NULL, NOW(), NOW()),
('txn-007', '550e8400-e29b-41d4-a716-446655440000', '2024-01-21', 'Beli Memory Card 128GB', 800000, 'Pengeluaran', NULL, 'Peralatan & Maintenance', 'Kartu', 'card-002', NULL, NOW(), NOW()),
('txn-008', '550e8400-e29b-41d4-a716-446655440000', '2024-01-22', 'Bonus Kinerja Tim Editing', 300000, 'Pengeluaran', NULL, 'Hadiah & Bonus Tim', 'Transfer Bank', 'card-001', 'pocket-004', NOW(), NOW()),
('txn-009', '550e8400-e29b-41d4-a716-446655440000', '2024-01-23', 'DP Graduation Dewi', 1750000, 'Pemasukan', 'proj-004', 'DP Proyek', 'Transfer Bank', 'card-001', NULL, NOW(), NOW()),
('txn-010', '550e8400-e29b-41d4-a716-446655440000', '2024-01-24', 'Sewa Studio Lighting', 1200000, 'Pengeluaran', 'proj-005', 'Peralatan & Maintenance', 'Transfer Bank', 'card-003', NULL, NOW(), NOW()),
('txn-011', '550e8400-e29b-41d4-a716-446655440000', '2024-01-25', 'DP Birthday Party Sari', 3100000, 'Pemasukan', 'proj-006', 'DP Proyek', 'Transfer Bank', 'card-001', NULL, NOW(), NOW()),
('txn-012', '550e8400-e29b-41d4-a716-446655440000', '2024-01-26', 'Iklan Instagram Ads', 500000, 'Pengeluaran', NULL, 'Marketing & Promosi', 'Kartu', 'card-002', 'pocket-005', NOW(), NOW()),
('txn-013', '550e8400-e29b-41d4-a716-446655440000', '2024-01-27', 'DP Corporate Branding PT Digital', 2000000, 'Pemasukan', 'proj-007', 'DP Proyek', 'Transfer Bank', 'card-001', NULL, NOW(), NOW()),
('txn-014', '550e8400-e29b-41d4-a716-446655440000', '2024-01-28', 'Service Kamera Canon R5', 750000, 'Pengeluaran', NULL, 'Peralatan & Maintenance', 'Transfer Bank', 'card-003', NULL, NOW(), NOW());

-- ========================================
-- TEAM PAYMENT MANAGEMENT
-- ========================================

-- Team Project Payments
INSERT INTO team_project_payments (id, project_id, team_member_id, payment_date, status, fee, reward, created_at, updated_at) VALUES
('pay-001', 'proj-001', 'team-001', '2024-01-16', 'Paid', 1500000, 100000, NOW(), NOW()),
('pay-002', 'proj-001', 'team-002', '2024-01-16', 'Paid', 1200000, 80000, NOW(), NOW()),
('pay-003', 'proj-001', 'team-004', '2024-01-16', 'Paid', 600000, 50000, NOW(), NOW()),
('pay-004', 'proj-002', 'team-001', '2024-02-01', 'Unpaid', 1500000, 0, NOW(), NOW()),
('pay-005', 'proj-002', 'team-002', '2024-02-01', 'Unpaid', 1200000, 0, NOW(), NOW()),
('pay-006', 'proj-002', 'team-005', '2024-02-01', 'Unpaid', 1000000, 0, NOW(), NOW()),
('pay-007', 'proj-003', 'team-001', '2024-02-05', 'Unpaid', 1500000, 0, NOW(), NOW()),
('pay-008', 'proj-003', 'team-007', '2024-02-05', 'Unpaid', 900000, 0, NOW(), NOW()),
('pay-009', 'proj-004', 'team-001', '2024-02-08', 'Unpaid', 1500000, 0, NOW(), NOW()),
('pay-010', 'proj-005', 'team-001', '2024-02-12', 'Unpaid', 1500000, 0, NOW(), NOW()),
('pay-011', 'proj-006', 'team-005', '2024-02-17', 'Unpaid', 1000000, 0, NOW(), NOW()),
('pay-012', 'proj-006', 'team-008', '2024-02-17', 'Unpaid', 500000, 0, NOW(), NOW()),
('pay-013', 'proj-007', 'team-001', '2024-02-22', 'Unpaid', 1500000, 0, NOW(), NOW()),
('pay-014', 'proj-008', 'team-005', '2024-02-27', 'Unpaid', 1000000, 0, NOW(), NOW());

-- Team Payment Records
INSERT INTO team_payment_records (id, organization_id, record_number, team_member_id, payment_date, total_amount, created_at) VALUES
('record-001', '550e8400-e29b-41d4-a716-446655440000', 'VP/PAY/2024/001', 'team-001', '2024-01-16', 1600000, NOW()),
('record-002', '550e8400-e29b-41d4-a716-446655440000', 'VP/PAY/2024/002', 'team-002', '2024-01-16', 1280000, NOW()),
('record-003', '550e8400-e29b-41d4-a716-446655440000', 'VP/PAY/2024/003', 'team-004', '2024-01-16', 650000, NOW()),
('record-004', '550e8400-e29b-41d4-a716-446655440000', 'VP/PAY/2024/004', 'team-006', '2024-01-25', 500000, NOW());

-- Team Payment Record Items
INSERT INTO team_payment_record_items (id, payment_record_id, project_payment_id, created_at) VALUES
('record-item-001', 'record-001', 'pay-001', NOW()),
('record-item-002', 'record-002', 'pay-002', NOW()),
('record-item-003', 'record-003', 'pay-003', NOW()),
('record-item-004', 'record-004', 'pay-001', NOW()), -- Bonus payment
('record-item-005', 'record-004', 'pay-002', NOW()), -- Bonus payment
('record-item-006', 'record-004', 'pay-003', NOW()); -- Bonus payment

-- Reward Ledger Entries
INSERT INTO reward_ledger_entries (id, team_member_id, entry_date, description, amount, project_id, created_at) VALUES
('reward-001', 'team-001', '2024-01-16', 'Bonus kinerja excellent - Wedding Budi & Sinta', 100000, 'proj-001', NOW()),
('reward-002', 'team-002', '2024-01-16', 'Bonus kinerja excellent - Wedding Budi & Sinta', 80000, 'proj-001', NOW()),
('reward-003', 'team-004', '2024-01-16', 'Bonus kinerja excellent - Wedding Budi & Sinta', 50000, 'proj-001', NOW()),
('reward-004', 'team-006', '2024-01-25', 'Bonus revisi cepat - Prewedding Farhan & Aisyah', 25000, 'proj-003', NOW()),
('reward-005', 'team-003', '2024-01-20', 'Potongan reward - Terlambat deadline video corporate', -50000, 'proj-002', NOW());

-- ========================================
-- ASSET MANAGEMENT
-- ========================================

-- Assets
INSERT INTO assets (id, organization_id, name, category_id, purchase_date, purchase_price, serial_number, status, notes, is_active, created_at, updated_at) VALUES
('asset-001', '550e8400-e29b-41d4-a716-446655440000', 'Canon EOS R5', 'asset-cat-001', '2023-06-15', 65000000, 'CR5001234567', 'Tersedia', 'Kamera utama untuk wedding dan corporate', true, NOW(), NOW()),
('asset-002', '550e8400-e29b-41d4-a716-446655440000', 'Canon RF 24-70mm f/2.8L', 'asset-cat-002', '2023-06-15', 32000000, 'RF2470001234', 'Digunakan', 'Lensa utama untuk portrait dan event', true, NOW(), NOW()),
('asset-003', '550e8400-e29b-41d4-a716-446655440000', 'Sony A7 IV', 'asset-cat-001', '2023-08-20', 42000000, 'SA7IV567890', 'Tersedia', 'Kamera backup dan untuk videografi', true, NOW(), NOW()),
('asset-004', '550e8400-e29b-41d4-a716-446655440000', 'Godox AD600Pro', 'asset-cat-003', '2023-07-10', 8500000, 'GD600789012', 'Tersedia', 'Flash studio untuk indoor shooting', true, NOW(), NOW()),
('asset-005', '550e8400-e29b-41d4-a716-446655440000', 'DJI Mavic 3 Pro', 'asset-cat-005', '2023-09-05', 28000000, 'DJI3P345678', 'Digunakan', 'Drone untuk aerial photography', true, NOW(), NOW()),
('asset-006', '550e8400-e29b-41d4-a716-446655440000', 'MacBook Pro M2', 'asset-cat-007', '2023-05-20', 35000000, 'MBP2M901234', 'Tersedia', 'Laptop untuk editing dan backup', true, NOW(), NOW()),
('asset-007', '550e8400-e29b-41d4-a716-446655440000', 'Rode Wireless GO II', 'asset-cat-004', '2023-10-12', 4500000, 'RWG2456789', 'Tersedia', 'Wireless microphone untuk video', true, NOW(), NOW()),
('asset-008', '550e8400-e29b-41d4-a716-446655440000', 'Manfrotto Tripod', 'asset-cat-006', '2023-04-18', 3200000, 'MF567890123', 'Perbaikan', 'Tripod carbon fiber - leg patah', true, NOW(), NOW()),
('asset-009', '550e8400-e29b-41d4-a716-446655440000', 'Sandisk Extreme Pro 256GB', 'asset-cat-007', '2024-01-21', 800000, 'SD256789012', 'Tersedia', 'Memory card untuk backup', true, NOW(), NOW()),
('asset-010', '550e8400-e29b-41d4-a716-446655440000', 'Aputure MC RGBWW', 'asset-cat-003', '2023-11-30', 2200000, 'AP789012345', 'Tersedia', 'LED light untuk creative lighting', true, NOW(), NOW());

-- ========================================
-- CONTRACT MANAGEMENT
-- ========================================

-- Contracts
INSERT INTO contracts (id, organization_id, contract_number, client_id, project_id, signing_date, signing_location, 
    client_name_1, client_address_1, client_phone_1, client_name_2, client_address_2, client_phone_2,
    shooting_duration, guaranteed_photos, album_details, digital_files_format, other_items, personnel_count, delivery_timeframe,
    dp_date, final_payment_date, cancellation_policy, jurisdiction, vendor_signature, client_signature, created_at, updated_at) VALUES
('contract-001', '550e8400-e29b-41d4-a716-446655440000', 'VP/CTR/2023/001', 'client-001', 'proj-001', '2023-11-20', 'Kantor Vena Pictures',
    'Budi Wijaya', 'Jl. Kemang Raya No. 45, Jakarta Selatan', '+6281234567801', 'Sinta Dewi', 'Jl. Kemang Raya No. 45, Jakarta Selatan', '+6281234567801',
    '8 jam (14:00-22:00)', '300+ foto edited', 'Album Wedding 30x30 cm, 50 halaman, cover kulit premium', 'JPG High Resolution', 'Drone shooting, Photo booth setup', '2 Fotografer, 1 Videografer, 1 MUA', '30 hari kerja',
    '2023-11-25', '2023-12-10', 'DP yang sudah dibayarkan tidak dapat dikembalikan.\nJika pembatalan dilakukan H-7 sebelum hari pelaksanaan, PIHAK KEDUA wajib membayar 50% dari total biaya.', 'Jakarta Selatan', 
    'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==', 
    'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==', NOW(), NOW()),
('contract-002', '550e8400-e29b-41d4-a716-446655440000', 'VP/CTR/2024/002', 'client-002', 'proj-002', '2024-01-10', 'Kantor PT Sejahtera Abadi',
    'Direktur PT Sejahtera Abadi', 'Jl. Sudirman Kav. 25, Jakarta Pusat', '+6281234567802', '', '', '',
    '9 jam (08:00-17:00)', '200+ foto event', 'USB Flashdisk Custom 32GB', 'JPG High Resolution + RAW untuk pilihan', 'Live streaming setup, Extra photographer', '2 Fotografer, 1 Videografer', '14 hari kerja',
    '2024-01-15', '2024-01-20', 'DP yang sudah dibayarkan tidak dapat dikembalikan.\nPembatalan H-3 sebelum acara dikenakan biaya 30% dari total.', 'Jakarta Pusat', 
    'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==', 
    NULL, NOW(), NOW()),
('contract-003', '550e8400-e29b-41d4-a716-446655440000', 'VP/CTR/2024/003', 'client-003', 'proj-003', '2024-01-05', 'Cafe Meeting Point, Jakarta',
    'Farhan Maulana', 'Jl. Cipete Raya No. 12, Jakarta Selatan', '+6281234567803', 'Aisyah Putri', 'Jl. Fatmawati No. 88, Jakarta Selatan', '+6281234567803',
    '6 jam (04:00-10:00)', '150+ foto edited', 'Album Prewedding 20x20 cm, 20 halaman', 'JPG High Resolution', 'Drone shooting untuk aerial view Bromo', '1 Fotografer, 1 Drone Pilot', '14 hari kerja',
    '2024-01-08', '2024-01-15', 'DP yang sudah dibayarkan tidak dapat dikembalikan.\nPerubahan lokasi outdoor tergantung cuaca, ada backup plan indoor.', 'Jawa Timur', 
    'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==', 
    'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==', NOW(), NOW());

-- ========================================
-- MARKETING & SOCIAL MEDIA
-- ========================================

-- Promo Codes
INSERT INTO promo_codes (id, organization_id, code, discount_type, discount_value, is_active, usage_count, max_usage, expiry_date, created_at, updated_at) VALUES
('promo-001', '550e8400-e29b-41d4-a716-446655440000', 'WEDDING2024', 'percentage', 10, true, 3, 20, '2024-12-31', NOW(), NOW()),
('promo-002', '550e8400-e29b-41d4-a716-446655440000', 'NEWCLIENT', 'fixed', 1000000, true, 8, 50, '2024-06-30', NOW(), NOW()),
('promo-003', '550e8400-e29b-41d4-a716-446655440000', 'EARLYBIRD', 'percentage', 15, true, 2, 10, '2024-03-31', NOW(), NOW()),
('promo-004', '550e8400-e29b-41d4-a716-446655440000', 'CORPORATE50', 'fixed', 2000000, false, 1, 5, '2024-02-29', NOW(), NOW());

-- Social Media Posts
INSERT INTO social_media_posts (id, organization_id, project_id, client_name, post_type, platform, scheduled_date, caption, media_url, status, notes, created_at, updated_at) VALUES
('social-001', '550e8400-e29b-41d4-a716-446655440000', 'proj-001', 'Budi & Sinta', 'Instagram Feed', 'Instagram', '2024-01-20T10:00:00Z', 'Congratulations to Budi & Sinta! ✨ Terima kasih telah mempercayakan momen bahagia kalian kepada kami. Semoga langgeng sampai maut memisahkan! 💕\n\n#VenaPictures #WeddingPhotography #Jakarta #WeddingInspiration', 'https://drive.google.com/folder/wedding-budi-sinta-feed', 'Diposting', 'Post utama wedding, engagement rate tinggi', NOW(), NOW()),
('social-002', '550e8400-e29b-41d4-a716-446655440000', 'proj-001', 'Budi & Sinta', 'Instagram Story', 'Instagram', '2024-01-21T15:00:00Z', 'Behind the scenes wedding Budi & Sinta kemarin! Swipe untuk lihat prosesnya 📸', 'https://drive.google.com/folder/wedding-bts', 'Diposting', 'BTS content, good engagement', NOW(), NOW()),
('social-003', '550e8400-e29b-41d4-a716-446655440000', 'proj-002', 'PT Sejahtera Abadi', 'Instagram Feed', 'Instagram', '2024-02-15T12:00:00Z', 'Corporate event documentation untuk PT Sejahtera Abadi. Professional photography & videography untuk acara perusahaan Anda! 📊💼\n\n#CorporateEvent #BusinessPhotography #ProfessionalService', 'https://drive.google.com/folder/corporate-sejahtera', 'Terjadwal', 'Menunggu approval dari klien', NOW(), NOW()),
('social-004', '550e8400-e29b-41d4-a716-446655440000', 'proj-003', 'Farhan & Aisyah', 'Instagram Reels', 'Instagram', '2024-02-10T18:00:00Z', 'Golden hour magic at Bromo! 🌅 Prewedding Farhan & Aisyah dengan backdrop sunrise yang memukau. Lokasi outdoor memang selalu memberikan hasil yang spectacular! ⛰️✨', 'https://drive.google.com/folder/prewedding-bromo-reels', 'Terjadwal', 'Reels untuk showcase lokasi outdoor', NOW(), NOW()),
('social-005', '550e8400-e29b-41d4-a716-446655440000', NULL, 'Vena Pictures', 'Instagram Feed', 'Instagram', '2024-02-05T09:00:00Z', 'Tips memilih fotografer wedding yang tepat! 💡\n\n1. Lihat portfolio lengkap\n2. Pastikan style sesuai selera\n3. Diskusikan detail paket\n4. Check availability tanggal\n\nKonsultasi gratis dengan kami! DM atau WA ya 📱', '', 'Draf', 'Educational content untuk engagement', NOW(), NOW()),
('social-006', '550e8400-e29b-41d4-a716-446655440000', NULL, 'Vena Pictures', 'TikTok Video', 'TikTok', '2024-02-12T20:00:00Z', 'POV: Kamu photographer wedding dan harus capture momen cincin exchange dalam 0.5 detik 😅📸 #photographerlife #weddingphotographer #behindthescenes', 'https://drive.google.com/folder/tiktok-pov-photographer', 'Draf', 'Viral content idea untuk TikTok', NOW(), NOW()),
('social-007', '550e8400-e29b-41d4-a716-446655440000', NULL, 'Vena Pictures', 'Artikel Blog', 'Website', '2024-02-08T14:00:00Z', 'Panduan Lengkap Persiapan Prewedding: Tips dari Fotografer Profesional', 'https://drive.google.com/folder/blog-prewedding-guide', 'Terjadwal', 'SEO content untuk website', NOW(), NOW());

-- ========================================
-- KNOWLEDGE MANAGEMENT
-- ========================================

-- SOPs
INSERT INTO sops (id, organization_id, title, category_id, content, last_updated, is_active, created_at, updated_at) VALUES
('sop-001', '550e8400-e29b-41d4-a716-446655440000', 'Prosedur Pemotretan Wedding', 'sop-cat-001', 
E'# PROSEDUR PEMOTRETAN WEDDING\n\n## PERSIAPAN H-1\n- Check semua equipment (kamera, lensa, flash, battery, memory card)\n- Charge semua battery hingga 100%\n- Format memory card dan pastikan backup storage tersedia\n- Review rundown acara dengan klien\n- Koordinasi dengan tim (videographer, MUA, koordinator)\n\n## HARI H - TIMELINE\n\n### 2 Jam Sebelum Akad\n- Tiba di lokasi dan setup equipment\n- Foto detail (cincin, sepatu, dress, jas, undangan)\n- Foto preparation bride (makeup, dress up)\n- Foto preparation groom\n\n### Saat Akad Nikah\n- Posisi strategis untuk capture momen ijab kabul\n- Foto keluarga besar kedua belah pihak\n- Foto formal pengantin dengan keluarga inti\n\n### Resepsi\n- Foto entrance pengantin\n- Foto saat pemotongan kue\n- Foto dance pertama\n- Foto candid tamu dan suasana\n- Foto group dengan teman-teman\n\n## POST-PRODUCTION\n- Backup semua file ke 2 storage berbeda\n- Seleksi foto terbaik (minimal sesuai paket)\n- Editing dengan style yang konsisten\n- Quality check sebelum delivery\n- Upload ke cloud storage untuk klien', 
NOW(), true, NOW(), NOW()),

('sop-002', '550e8400-e29b-41d4-a716-446655440000', 'Workflow Editing Foto', 'sop-cat-002',
E'# WORKFLOW EDITING FOTO\n\n## IMPORT & ORGANIZE\n1. Import semua RAW files ke Lightroom\n2. Buat folder struktur: [Tanggal]_[Nama_Klien]_[Jenis_Acara]\n3. Tambahkan keyword dan metadata\n4. Backup RAW files ke external storage\n\n## SELEKSI FOTO\n1. Quick review semua foto (flag system)\n2. Reject foto blur, overexposed, atau tidak layak\n3. Pilih foto terbaik sesuai jumlah yang dijanjikan\n4. Prioritaskan momen penting (akad, cincin, keluarga)\n\n## BASIC EDITING\n1. Koreksi exposure dan white balance\n2. Adjust highlights dan shadows\n3. Crop dan straighten jika perlu\n4. Noise reduction untuk ISO tinggi\n\n## CREATIVE EDITING\n1. Color grading sesuai mood dan tema\n2. Enhance skin tone (natural, jangan berlebihan)\n3. Remove distraction (jerawat kecil, noda, dll)\n4. Sharpen untuk detail yang crisp\n\n## EXPORT & DELIVERY\n1. Export JPG quality 95%, sRGB color space\n2. Resize untuk web (2048px long edge) dan print (original size)\n3. Watermark untuk preview\n4. Upload ke Google Drive dengan struktur folder yang rapi\n5. Share link dengan klien dan set permission view-only',
NOW(), true, NOW(), NOW()),

('sop-003', '550e8400-e29b-41d4-a716-446655440000', 'Customer Service Excellence', 'sop-cat-003',
E'# CUSTOMER SERVICE EXCELLENCE\n\n## FIRST CONTACT\n- Respon inquiry maksimal 2 jam (jam kerja)\n- Gunakan greeting yang warm dan professional\n- Tanyakan detail basic: tanggal, lokasi, jenis acara, budget range\n- Berikan informasi paket yang sesuai\n- Schedule meeting atau video call untuk diskusi detail\n\n## CONSULTATION MEETING\n- Datang tepat waktu (15 menit lebih awal)\n- Bawa portfolio fisik dan tablet untuk showcase\n- Listen actively pada kebutuhan dan ekspektasi klien\n- Explain paket dengan detail dan transparent\n- Berikan timeline yang realistic\n- Follow up dalam 24 jam dengan proposal tertulis\n\n## DURING PROJECT\n- Update progress secara berkala via WhatsApp\n- Share behind the scenes content\n- Respond pertanyaan klien dengan cepat\n- Manage expectation jika ada kendala\n\n## POST-DELIVERY\n- Follow up kepuasan klien\n- Request testimonial dan review\n- Maintain relationship untuk repeat business\n- Ask for referral jika klien satisfied',
NOW(), true, NOW(), NOW()),

('sop-004', '550e8400-e29b-41d4-a716-446655440000', 'Maintenance Peralatan', 'sop-cat-005',
E'# MAINTENANCE PERALATAN\n\n## DAILY MAINTENANCE\n- Bersihkan lensa dengan microfiber cloth\n- Check battery level dan charge jika perlu\n- Format memory card setelah backup\n- Simpan equipment di dry box dengan silica gel\n\n## WEEKLY MAINTENANCE\n- Deep clean semua lensa dengan lens cleaning solution\n- Check fungsi semua tombol dan dial kamera\n- Test flash dan wireless trigger\n- Organize dan inventory semua equipment\n\n## MONTHLY MAINTENANCE\n- Professional cleaning untuk sensor kamera\n- Calibrate monitor untuk color accuracy\n- Update firmware kamera dan lensa\n- Check kondisi tas dan case equipment\n\n## ANNUAL MAINTENANCE\n- Service resmi di authorized service center\n- Replace battery yang sudah menurun performanya\n- Upgrade equipment sesuai kebutuhan dan budget\n- Review dan update insurance coverage',
NOW(), true, NOW(), NOW());

-- Chat Templates
INSERT INTO chat_templates (id, organization_id, title, template, is_active, created_at, updated_at) VALUES
('chat-001', '550e8400-e29b-41d4-a716-446655440000', 'Konfirmasi Booking', 'Halo {clientName}! Terima kasih telah memilih Vena Pictures untuk {projectName}. Booking Anda telah kami konfirmasi. Kami akan menghubungi Anda H-3 sebelum acara untuk koordinasi final.', true, NOW(), NOW()),
('chat-002', '550e8400-e29b-41d4-a716-446655440000', 'Reminder H-3', 'Halo {clientName}, ini reminder untuk acara {projectName} yang akan dilaksanakan 3 hari lagi. Mohon konfirmasi alamat lengkap dan contact person di lokasi ya.', true, NOW(), NOW()),
('chat-003', '550e8400-e29b-41d4-a716-446655440000', 'Delivery Hasil', 'Halo {clientName}! Hasil foto/video untuk {projectName} sudah ready. Silakan cek di link Google Drive yang sudah kami kirim via email. Terima kasih!', true, NOW(), NOW()),
('chat-004', '550e8400-e29b-41d4-a716-446655440000', 'Follow Up Pembayaran', 'Halo {clientName}, ini reminder untuk pelunasan {projectName}. Mohon transfer ke rekening yang sudah diberikan ya. Terima kasih!', true, NOW(), NOW()),
('chat-005', '550e8400-e29b-41d4-a716-446655440000', 'Request Testimonial', 'Halo {clientName}! Semoga puas dengan hasil {projectName}. Boleh minta tolong review dan testimonial untuk membantu bisnis kami? Terima kasih banyak!', true, NOW(), NOW());

-- ========================================
-- COMMUNICATION & FEEDBACK
-- ========================================

-- Client Feedback
INSERT INTO client_feedback (id, organization_id, client_name, satisfaction, rating, feedback, feedback_date, created_at) VALUES
('feedback-001', '550e8400-e29b-41d4-a716-446655440000', 'Budi & Sinta Wijaya', 'Sangat Puas', 5, 'Hasil foto wedding kami sangat memuaskan! Tim Vena Pictures sangat profesional dan hasilnya melebihi ekspektasi. Terima kasih sudah mengabadikan momen bahagia kami dengan sempurna.', '2024-01-16T20:00:00Z', NOW()),
('feedback-002', '550e8400-e29b-41d4-a716-446655440000', 'PT Sejahtera Abadi', 'Puas', 4, 'Dokumentasi corporate event sangat baik. Tim datang tepat waktu dan bekerja dengan profesional. Hasil video dan foto sesuai dengan kebutuhan perusahaan.', '2024-01-30T14:30:00Z', NOW()),
('feedback-003', '550e8400-e29b-41d4-a716-446655440000', 'Farhan & Aisyah', 'Sangat Puas', 5, 'Prewedding di Bromo luar biasa! Meskipun cuaca sempat tidak mendukung, tim tetap bisa menghasilkan foto yang amazing. Drone shots-nya keren banget!', '2024-01-28T16:45:00Z', NOW()),
('feedback-004', '550e8400-e29b-41d4-a716-446655440000', 'Dewi Sartika', 'Puas', 4, 'Foto graduation bagus, tapi agak terlambat dari jadwal yang dijanjikan. Overall satisfied dengan hasilnya.', '2024-02-10T11:20:00Z', NOW()),
('feedback-005', '550e8400-e29b-41d4-a716-446655440000', 'Sari Indah', 'Biasa Saja', 3, 'Hasil foto birthday party cukup baik, tapi ada beberapa momen penting yang terlewat. Mungkin perlu koordinasi yang lebih baik dengan event organizer.', '2024-02-20T19:15:00Z', NOW());

-- Freelancer Feedback
INSERT INTO freelancer_feedback (id, organization_id, freelancer_id, feedback_date, message, created_at) VALUES
('freelancer-feedback-001', '550e8400-e29b-41d4-a716-446655440000', 'team-001', '2024-01-20T10:00:00Z', 'Terima kasih untuk project wedding kemarin. Kliennya sangat kooperatif dan hasilnya memuaskan. Semoga bisa kerja sama lagi!', NOW()),
('freelancer-feedback-002', '550e8400-e29b-41d4-a716-446655440000', 'team-003', '2024-01-25T15:30:00Z', 'Untuk project corporate, deadline agak tight. Mungkin next time bisa kasih buffer waktu lebih untuk editing yang lebih detail.', NOW()),
('freelancer-feedback-003', '550e8400-e29b-41d4-a716-446655440000', 'team-007', '2024-01-28T09:45:00Z', 'Drone shooting di Bromo challenging tapi fun! Weather sempat tidak mendukung tapi alhamdulillah bisa dapet shot yang bagus.', NOW());

-- Notifications
INSERT INTO notifications (id, organization_id, title, message, notification_timestamp, is_read, icon, link_view, link_action_type, link_action_id, created_at) VALUES
('notif-001', '550e8400-e29b-41d4-a716-446655440000', 'Deadline Mendekat', 'Proyek "Corporate Event PT Sejahtera" deadline dalam 3 hari. Pastikan editing video sudah selesai.', '2024-01-27T09:00:00Z', false, 'deadline', 'Proyek', 'VIEW_PROJECT_DETAILS', 'proj-002', NOW()),
('notif-002', '550e8400-e29b-41d4-a716-446655440000', 'Pembayaran Tertunda', 'Ada 6 pembayaran freelancer yang belum diselesaikan. Total: Rp 8.400.000', '2024-01-28T10:30:00Z', false, 'payment', 'Freelancer', '', '', NOW()),
('notif-003', '550e8400-e29b-41d4-a716-446655440000', 'Feedback Baru', 'Feedback baru dari Budi & Sinta Wijaya: Rating 5 bintang!', '2024-01-16T20:15:00Z', true, 'feedback', 'Laporan Klien', '', '', NOW()),
('notif-004', '550e8400-e29b-41d4-a716-446655440000', 'Revisi Selesai', 'Lestari Putri telah menyelesaikan revisi untuk proyek "Prewedding Farhan & Aisyah".', '2024-01-24T16:45:00Z', true, 'revision', 'Proyek', 'VIEW_PROJECT_DETAILS', 'proj-003', NOW()),
('notif-005', '550e8400-e29b-41d4-a716-446655440000', 'Booking Baru', 'Booking baru dari Maya & Rizki untuk wedding destination di Bali. Menunggu konfirmasi Anda.', '2024-01-29T11:20:00Z', false, 'booking', 'Booking', '', '', NOW());

-- ========================================
-- CALENDAR & EVENTS
-- ========================================

-- Calendar Events
INSERT INTO calendar_events (id, organization_id, title, description, event_type_id, start_date, end_date, location, is_all_day, created_by_user_id, created_at, updated_at) VALUES
('event-001', '550e8400-e29b-41d4-a716-446655440000', 'Meeting Klien Sarah & Dimas', 'Diskusi detail wedding package dan timeline', 'event-type-001', '2024-02-02T14:00:00Z', '2024-02-02T16:00:00Z', 'Cafe Central Park Mall', false, 'user-admin-001', NOW(), NOW()),
('event-002', '550e8400-e29b-41d4-a716-446655440000', 'Survey Lokasi Bromo', 'Survey lokasi untuk prewedding outdoor', 'event-type-002', '2024-01-18T06:00:00Z', '2024-01-18T12:00:00Z', 'Bromo, Jawa Timur', false, 'user-admin-001', NOW(), NOW()),
('event-003', '550e8400-e29b-41d4-a716-446655440000', 'Workshop Editing Video', 'Training editing video untuk tim', 'event-type-004', '2024-02-03T09:00:00Z', '2024-02-03T17:00:00Z', 'Studio Vena Pictures', false, 'user-admin-001', NOW()),
('event-004', '550e8400-e29b-41d4-a716-446655440000', 'Libur Nasional', 'Hari libur nasional', 'event-type-003', '2024-02-14T00:00:00Z', '2024-02-14T23:59:59Z', '', true, 'user-admin-001', NOW(), NOW()),
('event-005', '550e8400-e29b-41d4-a716-446655440000', 'Maintenance Kamera', 'Service rutin kamera Canon R5', 'event-type-005', '2024-02-05T10:00:00Z', '2024-02-05T15:00:00Z', 'Canon Service Center', false, 'user-admin-001', NOW(), NOW()),
('event-006', '550e8400-e29b-41d4-a716-446655440000', 'Team Building', 'Acara team building bulanan', 'event-type-006', '2024-02-10T08:00:00Z', '2024-02-10T17:00:00Z', 'Puncak, Bogor', false, 'user-admin-001', NOW(), NOW());

-- ========================================
-- SETTINGS & PREFERENCES
-- ========================================

-- Notification Settings
INSERT INTO notification_settings (id, organization_id, new_project, payment_confirmation, deadline_reminder, created_at, updated_at) VALUES
('notif-settings-001', '550e8400-e29b-41d4-a716-446655440000', true, true, true, NOW(), NOW());

-- Security Settings
INSERT INTO security_settings (id, organization_id, two_factor_enabled, created_at, updated_at) VALUES
('security-settings-001', '550e8400-e29b-41d4-a716-446655440000', false, NOW(), NOW());

-- ========================================
-- SUMMARY STATISTICS
-- ========================================

/*
MOCK DATA SUMMARY:
- Organizations: 3
- Users: 3 (1 admin, 2 members)
- Clients: 10 (mix of individuals and companies)
- Projects: 11 (various stages from preparation to completed)
- Team Members: 8 (different roles and specialties)
- Packages: 7 (covering all major service types)
- Add-Ons: 7 (popular additional services)
- Transactions: 14 (realistic business flow)
- Assets: 10 (professional photography equipment)
- Contracts: 3 (with e-signatures)
- SOPs: 4 (covering main business processes)
- Social Media Posts: 7 (content planning examples)
- Notifications: 5 (various business alerts)
- Total Records: ~200+ across all tables

BUSINESS SCENARIOS COVERED:
✅ Complete wedding project lifecycle
✅ Ongoing corporate event with revisions
✅ Prewedding with location challenges
✅ Team payment processing
✅ Client feedback collection
✅ Asset management and maintenance
✅ Contract management with e-signatures
✅ Social media content planning
✅ Financial tracking across multiple cards
✅ Reward system for team members
*/