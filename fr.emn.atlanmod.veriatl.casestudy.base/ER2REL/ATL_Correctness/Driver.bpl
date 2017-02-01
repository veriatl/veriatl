implementation driver(){
call init_tar_model(); 

call S2S_matchAll();
call E2R_matchAll();
call R2R_matchAll();
call EA2A_matchAll();
call RA2A_matchAll();
call RA2AK_matchAll();

call S2S_applyAll();
call E2R_applyAll();
call R2R_applyAll();
call EA2A_applyAll();
call RA2A_applyAll();
call RA2AK_applyAll();
}
