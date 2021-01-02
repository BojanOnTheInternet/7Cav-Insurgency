// vehicle is defined by
// [classname, cooldown (minutes), max # available at once, "message", "default spawn location (land/air)", {conditions}, {after create callback}]

GarageVehicles = [

    // MRZR 4
    ["rhsusf_mrzr4_d", 2, -1, "", "land", {}, {}],

    // POLARIS
    ["B_LSV_01_unarmed_F", 2, -1, "", "land", {}, {}],

    // HWWMV (M2)
    ["rhsusf_m1025_d_m2", 2, -1, "", "land", {}, {}],

    // HWWMV (MK19)
    ["rhsusf_m1025_w_mk19", 2, -1, "", "land", {}, {}],

    // HWWMV (SPG)
    ["rhsusf_m1045_d", 2, -1, "", "land", {}, {}],

    // HWWMV (Open)
    ["rhsusf_m998_d_4dr", 2, -1, "", "land", {}, {}],

    // HWWMV (GPK M2)
    ["rhsusf_m1151_m2_v2_usarmy_d", 2, -1, "", "land", {}, {}],

    // HWWMV (GPK M240)
    ["rhsusf_m1151_m240_v2_usarmy_d", 2, -1, "", "land", {}, {}],

    // HWWMV (GPK MK19)
    ["rhsusf_m1151_mk19_v2_usarmy_d", 2, -1, "", "land", {}, {}],

    // M1083A1 (M2 Flatbed)
    ["rhsusf_M1083A1P2_B_M2_D_flatbed_fmtv_usarmy", 5, -1, "", "land", {}, {}],

    // M977A4 (Ammo)
    ["rhsusf_M977A4_AMMO_usarmy_d", 5, -1, "", "land", {}, {}],

    // M977A4 (Repair)
    ["rhsusf_M977A4_REPAIR_usarmy_d", 5, -1, "", "land", {}, {}],

    // M1240 (M2 CROWS)
    ["rhsusf_m1240a1_m2crows_usarmy_d", 5, -1, "", "land", {}, {}],

    // M1240 (MK19 CROWS)
    ["rhsusf_m1240a1_mk19crows_usarmy_d", 5, -1, "", "land", {}, {}],

    // M1220 (M2 CROWS)
    ["rhsusf_M1220_M153_M2_usarmy_d", 5, -1, "", "land", {}, {}],

    // M1220 (MK19 CROWS)
    ["rhsusf_M1220_M153_MK19_usarmy_d", 5, -1, "", "land", {}, {}],

    // M1230A1 (MEDEVAC)
    ["rhsusf_M1230a1_usarmy_d", 5, -1, "", "land", {}, {}],

    // M113 (M2)
    ["rhsusf_m113d_usarmy", 5, -1, "", "land", {}, {}],

    // M113 (MEV)
    ["rhsusf_m113d_usarmy_medical", 5, -1, "Must be in Atlas 1/2 slot to drive", "land", {}, {(_this select 0) setvariable ["ace_medical_isMedicalFacility", true, true];}],
    
    // UGV Stomper
    ["B_UGV_01_F", 5, -1, "", "land", {}, {createVehicleCrew (_this select 0);}],

    // Predator Drone
    ["B_UAV_02_F", 5, -1, "", "air", {}, {createVehicleCrew (_this select 0);}],

    // Stealth UAV
    ["B_UAV_05_F", 5, -1, "", "air", {}, {createVehicleCrew (_this select 0);}],

    ["TFC_vs_luvw_F", 2, -1, "Unarmed truck", "land", {}, {}],

    ["TFC_vs_luvw_armed_F", 2, -1, "Military truck with 7.62 MMG turret", "land", {}, {}],

    ["RCOMM_wnato_mrap_hmg", 2, -1, "(WINTER SKIN BY DEFAULT)", "land", {}, {}]

];