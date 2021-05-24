Locales['en'] = {
    ['document_deleted'] = "DOKUMEN TERHAPUS.",
    ['document_delete_failed'] = "MENGHAPUS DOKUMEN GAGAL.",
    ['copy_from_player'] = "ANDA MENERIMA SALINAN FORMULIR DARI ORANG.",
    ['from_copied_player'] = "FORMULIR DISALIN KE ORANG",
    ['could_not_copy_form_player'] = "TIDAK DAPAT MENYALIN FORMULIR KE ORANG.",
    ['document_options'] = "OPSI DOKUMEN",
    ['public_documents'] = "DOKUMEN PUBLIK",
    ['job_documents'] = "DOKUMEN PEKERJAAN",
    ['saved_documents'] = "DOKUMEN TERSIMPAN",
    ['close_bt'] = "TUTUP",
    ['no_player_found'] = "TIDAK ADA ORANG",
    ['go_back'] = "KEMBALI",
    ['view_bt'] = "MELIHAT",
    ['show_bt'] = "TUNJUKKAN",
    ['give_copy'] = "MEMBERIKAN SALINAN",
    ['delete_bt'] = "HAPUS",
    ['yes_delete'] = "YA HAPUS",
}

Config.Documents['en'] = {
      ["public"] = {
        {
          headerTitle = "AFFIRMATION FORM",
          headerSubtitle = "Citizen affirmation form.",
          elements = {
            { label = "AFFIRMATION CONTENT", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "WITNESS TESTIMONY",
          headerSubtitle = "Official witness testimony.",
          elements = {
            { label = "DATE OF OCCURENCE", type = "input", value = "", can_be_emtpy = false },
            { label = "TESTIMONY CONTENT", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "VEHICLE CONVEY STATEMENT",
          headerSubtitle = "Vehicle convey statement towards another citizen.",
          elements = {
            { label = "PLATE NUMBER", type = "input", value = "", can_be_emtpy = false },
            { label = "CITIZEN NAME", type = "input", value = "", can_be_emtpy = false },
            { label = "AGREED PRICE", type = "input", value = "", can_be_empty = false },
            { label = "OTHER INFORMATION", type = "textarea", value = "", can_be_emtpy = true },
          }
        },
        {
          headerTitle = "DEBT CLEARANCE DECLARATION",
          headerSubtitle = "Declaration of debt clearance from another citizen.",
          elements = {
            { label = "DEBTOR FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "DEBTOR LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "DEBT AMOUNT", type = "input", value = "", can_be_empty = false },
            { label = "OTHERINFORMATION", type = "textarea", value = "I HEREBY DECLARE THAT THE AFOREMENTIONED CITIZEN HAS COMPLETED A PAYMENT WITH THE AFOREMENTIONED DEBT AMOUNT", can_be_emtpy = false, can_be_edited = false },
          }
        }
      },
      ["police"] = {
        {
          headerTitle = "SURAT IZIN KERAMAIAN",
          headerSubtitle = "SURAT IZIN KERAMAIAN",
          elements = {
            { label = "NAMA LENGKAP", type = "input", value = "", can_be_emtpy = false },
            { label = "ACARA", type = "input", value = "", can_be_emtpy = false },
            { label = "MASA BERLAKU", type = "input", value = "", can_be_empty = false },
            { label = "INFORMASI", type = "textarea", value = "", can_be_emtpy = false },
          }       
        },
        {
          headerTitle = "SURAT TANDA NOMOR KENDARAAN",
          headerSubtitle = "SURAT TANDA NOMOR KENDARAAN",
          elements = {
            { label = "NAMA LENGKAP", type = "input", value = "", can_be_emtpy = false },
            { label = "PLAT KENDARAAN", type = "input", value = "", can_be_emtpy = false },
            { label = "MASA BERLAKU", type = "input", value = "", can_be_empty = false },
            { label = "INFORMASI", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "CATATAN KRIMINAL",
          headerSubtitle = "CATATAN KRIMINAL",
          elements = {
            { label = "NAMA LENGKAP", type = "input", value = "", can_be_emtpy = false },
            { label = "NAMA PASSPORT", type = "input", value = "", can_be_emtpy = false },
            { label = "MASA BERLAKU", type = "input", value = "", can_be_empty = false },
            { label = "INFORMASI", type = "textarea", value = "", can_be_emtpy = false },
          }
        }
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
          headerTitle = "MARIJUANA USE PERMIT",
          headerSubtitle = "Official medical marijuana usage permit for citizens.",
          elements = {
            { label = "INSURED FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "INSURED LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
            { label = "MEDICAL NOTES", type = "textarea", value = "THE AFOREMENTIONED INSURED CITIZEN IS GRANTED, AFTER BEING THOROUGHLY EXAMINED BY A HEALTHCARE SPECIALIST, MARIJUANA USAGE PERMIT DUE TO UNDISCLOSED MEDICAL REASONS. THE LEGAL AND PERMITTED AMOUNT A CITIZEN CAN HOLD CAN NOT BE MORE THAN 100grams.", can_be_emtpy = false, can_be_edited = false },
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
