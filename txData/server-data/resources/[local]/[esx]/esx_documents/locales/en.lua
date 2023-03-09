Locales['en'] = {
    ['document_deleted'] = "Document was ~g~deleted~w~.",
    ['document_delete_failed'] = "Document delete ~r~failed~w~.",
    ['copy_from_player'] = "You ~g~received~w~ a form copy from a player.",
    ['from_copied_player'] = "Form ~g~copied~w~ to player",
    ['could_not_copy_form_player'] = "Could ~r~not~w~ copy form to player.",
    ['document_options'] = "Document Options",
    ['public_documents'] = "Public Documents",
    ['job_documents'] = "Job Documents",
    ['saved_documents'] = "Saved Documents",
    ['close_bt'] = "Close",
    ['no_player_found'] = "No players found",
    ['go_back'] = "Go Back",
    ['view_bt'] = "View",
    ['show_bt'] = "Show",
    ['give_copy'] = "Give Copy",
    ['delete_bt'] = "Delete",
    ['yes_delete'] = "Yes Delete",
}

Config.Documents['en'] = {
      ["public"] = {
        {
          headerTitle = "SURAT KETERANGAN",
          headerSubtitle = "Surat Keterangan.",
          elements = {
            { label = "Isi Surat :", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "SURAT KESAKSIAN",
          headerSubtitle = "Surat Kesaksian.",
          elements = {
            { label = "Nama :", type = "input", value = "", can_be_emtpy = false },
            { label = "Tanggal dan Waktu", type = "input", value = "", can_be_emtpy = false },
            { label = "Isi Surat :", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "SURAT IZIN TOURING",
          headerSubtitle = "Surat izin touring di Kota Los Santos.",
          elements = {
            { label = "PLAT NOMOR", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA", type = "input", value = "", can_be_emtpy = false },
            { label = "TANGGAL DAN WAKTU", type = "input", value = "", can_be_empty = false },
            { label = "INFORMASI", type = "textarea", value = "Banyak anggota :", can_be_emtpy = true },
          }
        },
        {
          headerTitle = "SURAT PINJAMAN DANA",
          headerSubtitle = "Official Pinjaman Dana.",
          elements = {
            { label = "NAMA DEPAN PEMINJAM", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA BELAKANG PEMINJAM", type = "input", value = "", can_be_emtpy = false },
            { label = "JUMLAH", type = "input", value = "", can_be_empty = false },
            { label = "JATUH TEMPO", type = "input", value = "", can_be_empty = false },
            { label = "CATATAN", type = "textarea", value = "", can_be_emtpy = true },
          }
        },
        {
          headerTitle = "SURAT PENGAJUAN KASUS",
          headerSubtitle = "Surat diberikan kepada kepolisian.",
          elements = {
            { label = "NAMA DEPAN", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA BELAKANG", type = "input", value = "", can_be_emtpy = false },
            { label = "TANGGAL PENGAJUAN", type = "input", value = "", can_be_empty = false },
            { label = "PENGAJUAN KASUS", type = "textarea", value = "Dengan surat ini saya mengajukan kasus berupa", can_be_emtpy = false, can_be_edited = false },
          }
        }
      },
      ["police"] = {
        {
          headerTitle = "SURAT PENILANGAN",
          headerSubtitle = "Surat Tilang.",
          elements = {
            { label = "NAMA DEPAN", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA BELAKANG", type = "input", value = "", can_be_emtpy = false },
            { label = "TANGGAL PENILANGAN", type = "input", value = "", can_be_empty = false },
            { label = "PELANGGARAN", type = "textarea", value = "Jenis Pelanggaran :", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "CRIMINAL RECORD",
          headerSubtitle = "Criminal Record Warga.",
          elements = {
            { label = "NAMA DEPAN", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA BELAKANG", type = "input", value = "", can_be_emtpy = false },
            { label = "TANGGAL", type = "input", value = "", can_be_empty = false },
            { label = "KRIMINAL", type = "textarea", value = "Kriminal yang dilakukan :", can_be_emtpy = false },
            { label = "DENDA", type = "textarea", value = "Denda yang diberikan :", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "PEMBERSIHAN KASUS",
          headerSubtitle = "Catatan pembersihan kasus warga.",
          elements = {
            { label = "NAMA DEPAN", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA BELAKANG", type = "input", value = "", can_be_emtpy = false },
            { label = "TANGGAL", type = "input", value = "", can_be_empty = false },
            { label = "CATATAN", type = "textarea", value = "DENGAN INI POLICE DEPARTEMENT MENYATAKAN BAHWA WARGA BERSIH DARI CRIMINAL RECORD.", can_be_emtpy = false, can_be_edited = false },
          }         }
      },
      ["ambulance"] = {
        {
          headerTitle = "MEDICAL REPORT - PATHOLOGY",
          headerSubtitle = "Official medical report provided by a pathologist.",
          elements = {
            { label = "INSURED FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "INSURED LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
            { label = "MEDICAL NOTES", type = "textarea", value = "THE AFOREMENTIONED INSURED CITIZEN WAS TESTED BY A HEALTHCARE OFFICIAL AND DETERMINED HEALTHY WITH NO DETECTED LONGTERM CONDITIONS. THIS REPORT IS VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "MEDICAL REPORT - PSYCHOLOGY",
          headerSubtitle = "Official medical report provided by a psychologist.",
          elements = {
            { label = "INSURED FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "INSURED LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
            { label = "MEDICAL NOTES", type = "textarea", value = "THE AFOREMENTIONED INSURED CITIZEN WAS TESTED BY A HEALTHCARE OFFICIAL AND DETERMINED MENTALLY HEALTHY BY THE LOWEST APPROVED PSYCHOLOGY STANDARDS. THIS REPORT IS VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "MEDICAL REPORT - EYE SPECIALIST",
          headerSubtitle = "Official medical report provided by an eye specialist.",
          elements = {
            { label = "INSURED FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "INSURED LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
            { label = "MEDICAL NOTES", type = "textarea", value = "THE AFOREMENTIONED INSURED CITIZEN WAS TESTED BY A HEALTHCARE OFFICIAL AND DETERMINED WITH A HEALTHY AND ACCURATE EYESIGHT. THIS REPORT IS VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "BPJS",
          headerSubtitle = "Official pillbox BPJS.",
          elements = {
            { label = "Nama Lengkap", type = "input", value = "", can_be_emtpy = false },
            { label = "Kelas", type = "input", value = "", can_be_emtpy = false },
            { label = "Pekerjaan", type = "input", value = "", can_be_empty = false },
            { label = "Expired", type = "input", value = "", can_be_emtpy = false },
          }
        },

      ["avocat"] = {
        {
          headerTitle = "LEGAL SERVICES CONTRACT",
          headerSubtitle = "Legal services contract provided by a lawyer.",
          elements = {
            { label = "CITIZEN FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "CITIZEN LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
            { label = "INFORMATION", type = "textarea", value = "THIS DOCUMENT IS PROOF OF LEGAL REPRESANTATION AND COVERAGE OF THE AFOREMENTIONED CITIZEN. LEGAL SERVICES ARE VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
          }
        }
      }
    }
  }
