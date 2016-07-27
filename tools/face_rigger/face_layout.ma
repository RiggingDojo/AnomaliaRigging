//Maya ASCII 2014 scene
//Name: face_layout.ma
//Last modified: Tue, Jul 26, 2016 10:11:46 PM
//Codeset: 1252
requires maya "2014";
requires -nodeType "mentalrayFramebuffer" -nodeType "mentalrayOutputPass" -nodeType "mentalrayRenderPass"
		 -nodeType "mentalrayUserBuffer" -nodeType "mentalraySubdivApprox" -nodeType "mentalrayCurveApprox"
		 -nodeType "mentalraySurfaceApprox" -nodeType "mentalrayDisplaceApprox" -nodeType "mentalrayOptions"
		 -nodeType "mentalrayGlobals" -nodeType "mentalrayItemsList" -nodeType "mentalrayShader"
		 -nodeType "mentalrayUserData" -nodeType "mentalrayText" -nodeType "mentalrayTessellation"
		 -nodeType "mentalrayPhenomenon" -nodeType "mentalrayLightProfile" -nodeType "mentalrayVertexColors"
		 -nodeType "mentalrayIblShape" -nodeType "mapVizShape" -nodeType "mentalrayCCMeshProxy"
		 -nodeType "cylindricalLightLocator" -nodeType "discLightLocator" -nodeType "rectangularLightLocator"
		 -nodeType "sphericalLightLocator" -nodeType "abcimport" -nodeType "mia_physicalsun"
		 -nodeType "mia_physicalsky" -nodeType "mia_material" -nodeType "mia_material_x" -nodeType "mia_roundcorners"
		 -nodeType "mia_exposure_simple" -nodeType "mia_portal_light" -nodeType "mia_light_surface"
		 -nodeType "mia_exposure_photographic" -nodeType "mia_exposure_photographic_rev" -nodeType "mia_lens_bokeh"
		 -nodeType "mia_envblur" -nodeType "mia_ciesky" -nodeType "mia_photometric_light"
		 -nodeType "mib_texture_vector" -nodeType "mib_texture_remap" -nodeType "mib_texture_rotate"
		 -nodeType "mib_bump_basis" -nodeType "mib_bump_map" -nodeType "mib_passthrough_bump_map"
		 -nodeType "mib_bump_map2" -nodeType "mib_lookup_spherical" -nodeType "mib_lookup_cube1"
		 -nodeType "mib_lookup_cube6" -nodeType "mib_lookup_background" -nodeType "mib_lookup_cylindrical"
		 -nodeType "mib_texture_lookup" -nodeType "mib_texture_lookup2" -nodeType "mib_texture_filter_lookup"
		 -nodeType "mib_texture_checkerboard" -nodeType "mib_texture_polkadot" -nodeType "mib_texture_polkasphere"
		 -nodeType "mib_texture_turbulence" -nodeType "mib_texture_wave" -nodeType "mib_reflect"
		 -nodeType "mib_refract" -nodeType "mib_transparency" -nodeType "mib_continue" -nodeType "mib_opacity"
		 -nodeType "mib_twosided" -nodeType "mib_refraction_index" -nodeType "mib_dielectric"
		 -nodeType "mib_ray_marcher" -nodeType "mib_illum_lambert" -nodeType "mib_illum_phong"
		 -nodeType "mib_illum_ward" -nodeType "mib_illum_ward_deriv" -nodeType "mib_illum_blinn"
		 -nodeType "mib_illum_cooktorr" -nodeType "mib_illum_hair" -nodeType "mib_volume"
		 -nodeType "mib_color_alpha" -nodeType "mib_color_average" -nodeType "mib_color_intensity"
		 -nodeType "mib_color_interpolate" -nodeType "mib_color_mix" -nodeType "mib_color_spread"
		 -nodeType "mib_geo_cube" -nodeType "mib_geo_torus" -nodeType "mib_geo_sphere" -nodeType "mib_geo_cone"
		 -nodeType "mib_geo_cylinder" -nodeType "mib_geo_square" -nodeType "mib_geo_instance"
		 -nodeType "mib_geo_instance_mlist" -nodeType "mib_geo_add_uv_texsurf" -nodeType "mib_photon_basic"
		 -nodeType "mib_light_infinite" -nodeType "mib_light_point" -nodeType "mib_light_spot"
		 -nodeType "mib_light_photometric" -nodeType "mib_cie_d" -nodeType "mib_blackbody"
		 -nodeType "mib_shadow_transparency" -nodeType "mib_lens_stencil" -nodeType "mib_lens_clamp"
		 -nodeType "mib_lightmap_write" -nodeType "mib_lightmap_sample" -nodeType "mib_amb_occlusion"
		 -nodeType "mib_fast_occlusion" -nodeType "mib_map_get_scalar" -nodeType "mib_map_get_integer"
		 -nodeType "mib_map_get_vector" -nodeType "mib_map_get_color" -nodeType "mib_map_get_transform"
		 -nodeType "mib_map_get_scalar_array" -nodeType "mib_map_get_integer_array" -nodeType "mib_fg_occlusion"
		 -nodeType "mib_bent_normal_env" -nodeType "mib_glossy_reflection" -nodeType "mib_glossy_refraction"
		 -nodeType "builtin_bsdf_architectural" -nodeType "builtin_bsdf_architectural_comp"
		 -nodeType "builtin_bsdf_carpaint" -nodeType "builtin_bsdf_ashikhmin" -nodeType "builtin_bsdf_lambert"
		 -nodeType "builtin_bsdf_mirror" -nodeType "builtin_bsdf_phong" -nodeType "contour_store_function"
		 -nodeType "contour_store_function_simple" -nodeType "contour_contrast_function_levels"
		 -nodeType "contour_contrast_function_simple" -nodeType "contour_shader_simple" -nodeType "contour_shader_silhouette"
		 -nodeType "contour_shader_maxcolor" -nodeType "contour_shader_curvature" -nodeType "contour_shader_factorcolor"
		 -nodeType "contour_shader_depthfade" -nodeType "contour_shader_framefade" -nodeType "contour_shader_layerthinner"
		 -nodeType "contour_shader_widthfromcolor" -nodeType "contour_shader_widthfromlightdir"
		 -nodeType "contour_shader_widthfromlight" -nodeType "contour_shader_combi" -nodeType "contour_only"
		 -nodeType "contour_composite" -nodeType "contour_ps" -nodeType "mi_metallic_paint"
		 -nodeType "mi_metallic_paint_x" -nodeType "mi_bump_flakes" -nodeType "mi_car_paint_phen"
		 -nodeType "mi_metallic_paint_output_mixer" -nodeType "mi_car_paint_phen_x" -nodeType "physical_lens_dof"
		 -nodeType "physical_light" -nodeType "dgs_material" -nodeType "dgs_material_photon"
		 -nodeType "dielectric_material" -nodeType "dielectric_material_photon" -nodeType "oversampling_lens"
		 -nodeType "path_material" -nodeType "parti_volume" -nodeType "parti_volume_photon"
		 -nodeType "transmat" -nodeType "transmat_photon" -nodeType "mip_rayswitch" -nodeType "mip_rayswitch_advanced"
		 -nodeType "mip_rayswitch_environment" -nodeType "mip_card_opacity" -nodeType "mip_motionblur"
		 -nodeType "mip_motion_vector" -nodeType "mip_matteshadow" -nodeType "mip_cameramap"
		 -nodeType "mip_mirrorball" -nodeType "mip_grayball" -nodeType "mip_gamma_gain" -nodeType "mip_render_subset"
		 -nodeType "mip_matteshadow_mtl" -nodeType "mip_binaryproxy" -nodeType "mip_rayswitch_stage"
		 -nodeType "mip_fgshooter" -nodeType "mib_ptex_lookup" -nodeType "misss_physical"
		 -nodeType "misss_physical_phen" -nodeType "misss_fast_shader" -nodeType "misss_fast_shader_x"
		 -nodeType "misss_fast_shader2" -nodeType "misss_fast_shader2_x" -nodeType "misss_skin_specular"
		 -nodeType "misss_lightmap_write" -nodeType "misss_lambert_gamma" -nodeType "misss_call_shader"
		 -nodeType "misss_set_normal" -nodeType "misss_fast_lmap_maya" -nodeType "misss_fast_simple_maya"
		 -nodeType "misss_fast_skin_maya" -nodeType "misss_fast_skin_phen" -nodeType "misss_fast_skin_phen_d"
		 -nodeType "misss_mia_skin2_phen" -nodeType "misss_mia_skin2_phen_d" -nodeType "misss_lightmap_phen"
		 -nodeType "misss_mia_skin2_surface_phen" -nodeType "surfaceSampler" -nodeType "mib_data_bool"
		 -nodeType "mib_data_int" -nodeType "mib_data_scalar" -nodeType "mib_data_vector"
		 -nodeType "mib_data_color" -nodeType "mib_data_string" -nodeType "mib_data_texture"
		 -nodeType "mib_data_shader" -nodeType "mib_data_bool_array" -nodeType "mib_data_int_array"
		 -nodeType "mib_data_scalar_array" -nodeType "mib_data_vector_array" -nodeType "mib_data_color_array"
		 -nodeType "mib_data_string_array" -nodeType "mib_data_texture_array" -nodeType "mib_data_shader_array"
		 -nodeType "mib_data_get_bool" -nodeType "mib_data_get_int" -nodeType "mib_data_get_scalar"
		 -nodeType "mib_data_get_vector" -nodeType "mib_data_get_color" -nodeType "mib_data_get_string"
		 -nodeType "mib_data_get_texture" -nodeType "mib_data_get_shader" -nodeType "mib_data_get_shader_bool"
		 -nodeType "mib_data_get_shader_int" -nodeType "mib_data_get_shader_scalar" -nodeType "mib_data_get_shader_vector"
		 -nodeType "mib_data_get_shader_color" -nodeType "user_ibl_env" -nodeType "user_ibl_rect"
		 -nodeType "mia_material_x_passes" -nodeType "mi_metallic_paint_x_passes" -nodeType "mi_car_paint_phen_x_passes"
		 -nodeType "misss_fast_shader_x_passes" -dataType "byteArray" "Mayatomr" "2014.0 - 3.11.1.4 ";
requires -nodeType "ilrOptionsNode" -nodeType "ilrUIOptionsNode" -nodeType "ilrBakeLayerManager"
		 -nodeType "ilrBakeLayer" -nodeType "ilrBssrdfShader" -nodeType "ilrOccSampler" -nodeType "ilrOccData"
		 -nodeType "ilrNormalMap" -nodeType "ilrSurfaceThickness" -nodeType "ilrRaySampler"
		 -nodeType "ilrBasicPhotonShader" -nodeType "ilrPhysicPhotonShader" -nodeType "ilrDielectricPhotonShader"
		 -nodeType "ilrOrenNayarShader" -nodeType "ilrAshikhminShader" -nodeType "ilrDielectricShader"
		 -nodeType "ilrLuaNode" -nodeType "ilrHwBakeVisualizer" -nodeType "ilrShadowMask"
		 -nodeType "ilrPolyColorPerVertex" -nodeType "ilrUVMappingVisualizer" -nodeType "ilrOutputShaderBackendNode"
		 -nodeType "ilrPointCloudShape" "Turtle" "2014.0.0";
requires -nodeType "proLocator" "proLocatorNode" "0.1";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014 x64";
fileInfo "cutIdentifier" "201303010241-864206";
fileInfo "osv" "Microsoft Windows 7 Home Premium Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 12.38710412721807 65.210840137288059 -16.749094333027507 ;
	setAttr ".r" -type "double3" -6.9383527296059224 -3.399999999998367 2.489189747178802e-017 ;
	setAttr ".rp" -type "double3" -1.0658141036401504e-014 7.1054273576010019e-015 -5.3290705182007514e-015 ;
	setAttr ".rpt" -type "double3" -11.665699631652393 -32.809734751240953 42.742731283218738 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 30.546658698575399;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.25500000000000012 2.4310362284288094 55.492422012864552 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100.1 ;
	setAttr ".r" -type "double3" 89.999999999999986 0 0 ;
	setAttr ".rp" -type "double3" 0 0 -100.1 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1.5730594366875614 -101.74067301974162 8.2395976403508051 ;
	setAttr ".r" -type "double3" 179.99999999999997 0 0 ;
	setAttr ".rp" -type "double3" 2.6599999999999997 -13.110000000000008 -146.84159959801198 ;
	setAttr ".rpt" -type "double3" 0 159.95159959801202 133.731599598012 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.10000000000002;
	setAttr ".ow" 9.8537626265321698;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" -2.66 -46.741599598011987 13.110000000000021 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 157.15628471006545 1.7542117796948169 56.238354445212146 ;
	setAttr ".r" -type "double3" 90 4.7708320221952805e-014 89.999999999999986 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 7.8649026423470083;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "grp_face_main";
	setAttr ".t" -type "double3" -1.8095862499226862 -24.156821824238182 3.9066374079260113e-016 ;
	setAttr ".r" -type "double3" -90 -90 0 ;
	setAttr ".s" -type "double3" 0.26640910338404039 0.26640910338404061 0.26640910338404061 ;
	setAttr ".rp" -type "double3" 0.25499999999999301 1.7948535624403479 54.538148013881866 ;
	setAttr ".rpt" -type "double3" 1.5398535624403398 52.743294451441521 -54.28314801388187 ;
	setAttr ".sp" -type "double3" 0.25499999999997341 0.043044760016499518 51.910434810246088 ;
	setAttr ".spt" -type "double3" 1.9595436384634013e-014 1.7518088024238412 2.6277132036355653 ;
createNode transform -n "grp_ctrl_face_main" -p "grp_face_main";
	setAttr ".s" -type "double3" 1 1.0000000000000002 0.99999999999999989 ;
	setAttr ".rp" -type "double3" 0 0 56.442140997626467 ;
	setAttr ".sp" -type "double3" 0 0 56.442140997626481 ;
	setAttr ".spt" -type "double3" 0 0 -6.3948846218409004e-014 ;
createNode transform -n "ctrl_fac_main" -p "grp_ctrl_face_main";
	addAttr -ci true -k true -sn "grp_c_brow_visibility" -ln "grp_c_brow_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -k true -sn "grp_l_brow_visibility" -ln "grp_l_brow_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -k true -sn "grp_l_lid_up_visibility" -ln "grp_l_lid_up_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -k true -sn "grp_l_lid_center_visibility" -ln "grp_l_lid_center_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -k true -sn "grp_l_lid_low_visibility" -ln "grp_l_lid_low_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -k true -sn "grp_l_nasal_visibility" -ln "grp_l_nasal_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -k true -sn "grp_l_zygo_visibility" -ln "grp_l_zygo_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -k true -sn "grp_l_cheek_visibility" -ln "grp_l_cheek_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -k true -sn "grp_c_mouth_up_visibility" -ln "grp_c_mouth_up_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -k true -sn "grp_l_mouth_up_visibility" -ln "grp_l_mouth_up_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -k true -sn "grp_l_mouth_corner_visibility" -ln "grp_l_mouth_corner_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -k true -sn "grp_c_mouth_low_visibility" -ln "grp_c_mouth_low_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -k true -sn "grp_l_mouth_low_visibility" -ln "grp_l_mouth_low_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -k true -sn "grp_l_chin_visibility" -ln "grp_l_chin_visibility" 
		-min 0 -max 1 -en "off:on" -at "enum";
	addAttr -ci true -sn "Control_Vis" -ln "Control_Vis" -min 0 -max 1 -en "off:on" 
		-at "enum";
	setAttr ".t" -type "double3" 0 0 4.9737991503207013e-014 ;
	setAttr ".rp" -type "double3" 0 0 56.230000000000025 ;
	setAttr ".sp" -type "double3" 0 0 56.230000000000025 ;
	setAttr -k on ".grp_c_brow_visibility" 1;
	setAttr -k on ".grp_l_brow_visibility" 1;
	setAttr -k on ".grp_l_lid_up_visibility" 1;
	setAttr -k on ".grp_l_lid_center_visibility" 1;
	setAttr -k on ".grp_l_lid_low_visibility" 1;
	setAttr -k on ".grp_l_nasal_visibility" 1;
	setAttr -k on ".grp_l_zygo_visibility" 1;
	setAttr -k on ".grp_l_cheek_visibility" 1;
	setAttr -k on ".grp_c_mouth_up_visibility" 1;
	setAttr -k on ".grp_l_mouth_up_visibility" 1;
	setAttr -k on ".grp_l_mouth_corner_visibility" 1;
	setAttr -k on ".grp_c_mouth_low_visibility" 1;
	setAttr -k on ".grp_l_mouth_low_visibility" 1;
	setAttr -k on ".grp_l_chin_visibility" 1;
	setAttr -k on ".Control_Vis" 1;
createNode proLocator -n "ctrl_fac_mainShape" -p "ctrl_fac_main";
	setAttr -k off ".v";
	setAttr ".lp" -type "double3" 0 0 56.230000000000025 ;
	setAttr ".tp" 1;
	setAttr ".pt" 4;
	setAttr ".sz" 18.438;
	setAttr ".ptz" 57;
	setAttr ".prz" 90;
createNode transform -n "grp_lyt_ctrls" -p "ctrl_fac_main";
	setAttr ".rp" -type "double3" 0 0 56.230000000000025 ;
	setAttr ".sp" -type "double3" 0 0 56.230000000000025 ;
createNode transform -n "grp_sub_headBtm" -p "grp_lyt_ctrls";
	setAttr ".rp" -type "double3" 0 0 56.230000000000025 ;
	setAttr ".sp" -type "double3" 0 0 56.230000000000025 ;
createNode transform -n "grp_L_mouth_up" -p "grp_sub_headBtm";
	setAttr ".rp" -type "double3" 0 0 56.230000000000025 ;
	setAttr ".sp" -type "double3" 0 0 56.230000000000025 ;
createNode transform -n "grp_ctrl_main_L_mouth_up" -p "grp_L_mouth_up";
	setAttr ".t" -type "double3" 0.079999999999996074 0.27999999999999958 0.059999999999966747 ;
	setAttr ".rp" -type "double3" 2.4100000000000041 1.2000000000000008 54.610000000000035 ;
	setAttr ".sp" -type "double3" 2.4100000000000041 1.2000000000000008 54.610000000000035 ;
createNode transform -n "ctrl_main_L_mouth_up" -p "grp_ctrl_main_L_mouth_up";
	addAttr -ci true -k true -sn "_L_mouth_up_x" -ln "_L_mouth_up_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_mouth_up_z" -ln "_L_mouth_up_z" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_obic_x" -ln "_L_obic_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_obic_z" -ln "_L_obic_z" -dv 0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 2.42 1.1400000000000039 54.8 ;
	setAttr ".rp" -type "double3" -0.23452318065557001 -0.13578734294496236 -0.14272426925092374 ;
	setAttr ".sp" -type "double3" -0.23452318065557001 -0.13578734294496236 -0.14272426925092374 ;
	setAttr -k on "._L_obic_x" 0.8600000000000001;
	setAttr -k on "._L_obic_z" 1.29;
createNode proLocator -n "ctrl_main_L_mouth_upShape" -p "ctrl_main_L_mouth_up";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".lp" -type "double3" 4.4200000000000035 2.4000000000000004 110.19000000000004 ;
	setAttr ".pt" 4;
	setAttr ".sz" 1.304;
	setAttr ".ra" 0.91799998283386242;
	setAttr ".ptz" -0.40000000596046448;
createNode transform -n "folicle_L_mouth_up" -p "ctrl_main_L_mouth_up";
	setAttr ".s" -type "double3" 1 0.999999999999998 0.99999999999999933 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_mouth_upShape" -p "folicle_L_mouth_up";
	setAttr -k off ".v";
	setAttr ".pu" 0.54;
	setAttr ".pv" 0.37;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_mouth_up" -p "folicle_L_mouth_up";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -2.2204460492503131e-016 1.7763568394002505e-015 ;
	setAttr ".sp" -type "double3" 0 -2.2204460492503131e-016 1.7763568394002505e-015 ;
createNode proLocator -n "lyt_ctrl_L_mouth_upShape" -p "lyt_ctrl_L_mouth_up";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "folicle_L_obic" -p "ctrl_main_L_mouth_up";
	setAttr ".s" -type "double3" 0.99999999999999922 0.99999999999999811 0.99999999999999989 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_obicShape" -p "folicle_L_obic";
	setAttr -k off ".v";
	setAttr ".pu" 0.73499998092651364;
	setAttr ".pv" 0.25000000715255732;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_obic" -p "folicle_L_obic";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 7.1054273576010019e-015 3.3306690738754696e-016 -6.6613381477509392e-016 ;
	setAttr ".sp" -type "double3" 7.1054273576010019e-015 3.3306690738754696e-016 -6.6613381477509392e-016 ;
createNode proLocator -n "lyt_ctrl_L_obicShape" -p "lyt_ctrl_L_obic";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "grp_L_mouth_corner" -p "grp_sub_headBtm";
	setAttr ".t" -type "double3" 1.0800000000000023 2.7400000000000015 53.780000000000022 ;
	setAttr ".s" -type "double3" 1.0000000000000018 1.0000000000000009 1 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010019e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010019e-015 ;
createNode transform -n "grp_ctrl_main_L_mouth_corner" -p "grp_L_mouth_corner";
	setAttr ".t" -type "double3" 5.5511151231257827e-017 4.4408920985006262e-016 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
	setAttr ".rp" -type "double3" -2.2204460492503131e-016 -8.8817841970012504e-016 
		1.4210854715202004e-014 ;
	setAttr ".sp" -type "double3" -2.2204460492503131e-016 -8.8817841970012523e-016 
		1.4210854715202004e-014 ;
	setAttr ".spt" -type "double3" 0 1.972152263052533e-031 0 ;
createNode transform -n "ctrl_main_L_mouth_corner" -p "grp_ctrl_main_L_mouth_corner";
	addAttr -ci true -k true -sn "_L_mouthcorner_up_x" -ln "_L_mouthcorner_up_x" -dv 
		0.5 -at "double";
	addAttr -ci true -k true -sn "_L_mouthcorner_up_z" -ln "_L_mouthcorner_up_z" -dv 
		0.5 -at "double";
	addAttr -ci true -k true -sn "_L_mouthcorner_low_x" -ln "_L_mouthcorner_low_x" -dv 
		0.5 -at "double";
	addAttr -ci true -k true -sn "_L_mouthcorner_low_z" -ln "_L_mouthcorner_low_z" -dv 
		0.5 -at "double";
	addAttr -ci true -k true -sn "_L_mouthcorner_out_x" -ln "_L_mouthcorner_out_x" -dv 
		0.5 -at "double";
	addAttr -ci true -k true -sn "_L_mouthcorner_out_z" -ln "_L_mouthcorner_out_z" -dv 
		0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" 0.42999999999999811 0.38000000000000017 0.54999999999999183 ;
	setAttr ".rp" -type "double3" -0.36191475685540264 -0.34032365792210861 -0.34309519324092719 ;
	setAttr ".sp" -type "double3" -0.36191475685540264 -0.34032365792210861 -0.34309519324092719 ;
	setAttr -k on "._L_mouthcorner_up_x" 1.15;
	setAttr -k on "._L_mouthcorner_up_z" 0.89000000000000012;
	setAttr -k on "._L_mouthcorner_low_x" 1.1800000000000002;
	setAttr -k on "._L_mouthcorner_low_z" 0.28;
	setAttr -k on "._L_mouthcorner_out_x" 1.73;
	setAttr -k on "._L_mouthcorner_out_z" 0.64;
createNode proLocator -n "ctrl_main_L_mouth_cornerShape" -p "ctrl_main_L_mouth_corner";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 7;
	setAttr ".lp" -type "double3" -0.80999999999999872 0.049999999999997435 0 ;
	setAttr ".pt" 4;
	setAttr ".sz" 1.404;
	setAttr ".ra" 0.91799998283386242;
	setAttr ".ptz" -0.40000000596046448;
createNode transform -n "folicle_L_mouthcorner_up" -p "ctrl_main_L_mouth_corner";
	setAttr ".s" -type "double3" 1 0.99999999999999845 0.99999999999999811 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_mouthcorner_upShape" -p "folicle_L_mouthcorner_up";
	setAttr -k off ".v";
	setAttr ".pu" 0.61499999284744278;
	setAttr ".pv" 0.47499998807907107;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_mouthcorner_up" -p "folicle_L_mouthcorner_up";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 4.4408920985006252e-016 -8.8817841970012523e-016 ;
	setAttr ".sp" -type "double3" 0 4.4408920985006262e-016 -8.8817841970012523e-016 ;
	setAttr ".spt" -type "double3" 0 -9.8607613152626443e-032 0 ;
createNode proLocator -n "lyt_ctrl_L_mouthcorner_upShape" -p "lyt_ctrl_L_mouthcorner_up";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "folicle_L_mouthcorner_low" -p "ctrl_main_L_mouth_corner";
	setAttr ".s" -type "double3" 0.99999999999999933 0.99999999999999822 0.99999999999999822 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_mouthcorner_lowShape" -p "folicle_L_mouthcorner_low";
	setAttr -k off ".v";
	setAttr ".pu" 0.31000000059604649;
	setAttr ".pv" 0.50999997377395634;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_mouthcorner_low" -p "folicle_L_mouthcorner_low";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode proLocator -n "lyt_ctrl_L_mouthcorner_lowShape" -p "lyt_ctrl_L_mouthcorner_low";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "folicle_L_mouthcorner_out" -p "ctrl_main_L_mouth_corner";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999845 0.99999999999999856 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_mouthcorner_outShape" -p "folicle_L_mouthcorner_out";
	setAttr -k off ".v";
	setAttr ".pu" 0.44999999284744263;
	setAttr ".pv" 0.82500000953674324;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_mouthcorner_out" -p "folicle_L_mouthcorner_out";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -7.1054273576010019e-015 8.8817841970012504e-016 1.7763568394002505e-015 ;
	setAttr ".sp" -type "double3" -7.1054273576010019e-015 8.8817841970012523e-016 1.7763568394002505e-015 ;
	setAttr ".spt" -type "double3" 0 -1.972152263052533e-031 0 ;
createNode proLocator -n "lyt_ctrl_L_mouthcorner_outShape" -p "lyt_ctrl_L_mouthcorner_out";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "grp_C_mouth_up" -p "grp_sub_headBtm";
	setAttr ".t" -type "double3" 2.540000000000004 -5.6399329650958022e-016 53.730000000000025 ;
	setAttr ".s" -type "double3" 1.0000000000000009 1.0000000000000018 1 ;
createNode transform -n "grp_ctrl_main_C_mouth_up" -p "grp_C_mouth_up";
createNode transform -n "ctrl_main_C_mouth_up" -p "grp_ctrl_main_C_mouth_up";
	addAttr -ci true -k true -sn "_C_mouth_up_x" -ln "_C_mouth_up_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_C_mouth_up_z" -ln "_C_mouth_up_z" -dv 0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 1.9721522630525365e-031 0 0 ;
	setAttr ".rp" -type "double3" -0.23237272078739124 -1.1102230246251563e-016 0.61764763131696054 ;
	setAttr ".sp" -type "double3" -0.23237272078739124 -1.1102230246251563e-016 0.61764763131696054 ;
	setAttr -k on "._C_mouth_up_x" 1;
	setAttr -k on "._C_mouth_up_z" 1;
createNode proLocator -n "ctrl_main_C_mouth_upShape" -p "ctrl_main_C_mouth_up";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".lp" -type "double3" -0.37999999999999889 -0.37999999999999823 1.1102230246251563e-015 ;
	setAttr ".pt" 4;
	setAttr ".sz" 2.104;
	setAttr ".ra" 0.91799998283386242;
	setAttr ".ptz" 0.5;
createNode transform -n "folicle_C_mouth_up" -p "ctrl_main_C_mouth_up";
	setAttr ".s" -type "double3" 1 0.99999999999999734 0.99999999999999922 ;
	setAttr ".it" no;
createNode follicle -n "folicle_C_mouth_upShape" -p "folicle_C_mouth_up";
	setAttr -k off ".v";
	setAttr ".pu" 0.6;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_C_mouth_up" -p "folicle_C_mouth_up";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" -90.00000000000297 -90 -89.999999999997513 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -7.1054273576010019e-015 0 3.5527136788005009e-015 ;
	setAttr ".sp" -type "double3" -7.1054273576010019e-015 0 3.5527136788005009e-015 ;
createNode proLocator -n "lyt_ctrl_C_mouth_upShape" -p "lyt_ctrl_C_mouth_up";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "grp_L_mouth_low" -p "grp_sub_headBtm";
	setAttr ".t" -type "double3" 2.0785709708602234 1.6083352234710742 52.890000000000022 ;
	setAttr ".s" -type "double3" 1.0000000000000009 1.0000000000000016 1 ;
	setAttr ".rp" -type "double3" 4.4408920985006311e-016 2.220446049250316e-016 -7.1054273576010019e-015 ;
	setAttr ".sp" -type "double3" 4.4408920985006262e-016 2.2204460492503131e-016 -7.1054273576010019e-015 ;
	setAttr ".spt" -type "double3" 3.9443045261050704e-031 3.4512664603419385e-031 0 ;
createNode transform -n "grp_ctrl_main_L_mouth_low" -p "grp_L_mouth_low";
	setAttr ".t" -type "double3" 0 0 4.4408920985006262e-016 ;
	setAttr ".rp" -type "double3" 8.8817841970012523e-016 4.4408920985006262e-016 -1.4210854715202004e-014 ;
	setAttr ".sp" -type "double3" 8.8817841970012523e-016 4.4408920985006262e-016 -1.4210854715202004e-014 ;
createNode transform -n "ctrl_main_L_mouth_low" -p "grp_ctrl_main_L_mouth_low";
	addAttr -ci true -k true -sn "_L_mouth_low_x" -ln "_L_mouth_low_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_mouth_low_z" -ln "_L_mouth_low_z" -dv 0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -6.9330464661723513e-018 0.57999999999999963 0.14000000000001589 ;
	setAttr ".rp" -type "double3" -0.061125702045940922 -0.60073581539693777 0.12327557685254448 ;
	setAttr ".sp" -type "double3" -0.061125702045940922 -0.60073581539693777 0.12327557685254448 ;
createNode proLocator -n "ctrl_main_L_mouth_lowShape" -p "ctrl_main_L_mouth_low";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".lp" -type "double3" -0.57999999999999985 -0.57999999999999929 0 ;
	setAttr ".pt" 4;
	setAttr ".sz" 2.104;
	setAttr ".mul" 0.80000001192092896;
	setAttr ".ra" 0.91799998283386242;
	setAttr ".ptz" -0.10000000149011612;
createNode transform -n "folicle_L_mouth_low" -p "ctrl_main_L_mouth_low";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999745 0.999999999999999 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_mouth_lowShape" -p "folicle_L_mouth_low";
	setAttr -k off ".v";
	setAttr ".pu" 0.6100000000000001;
	setAttr ".pv" 0.39;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_mouth_low" -p "folicle_L_mouth_low";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode proLocator -n "lyt_ctrl_L_mouth_lowShape" -p "lyt_ctrl_L_mouth_low";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "grp_C_mouth_low" -p "grp_sub_headBtm";
	setAttr ".t" -type "double3" 2.2300000000000035 -4.951594689828205e-016 52.800000000000026 ;
	setAttr ".s" -type "double3" 1.0000000000000009 1.0000000000000018 1 ;
	setAttr ".rp" -type "double3" 4.4408920985006311e-016 -9.8607613152626651e-032 -7.1054273576010019e-015 ;
	setAttr ".sp" -type "double3" 4.4408920985006262e-016 -9.8607613152626476e-032 -7.1054273576010019e-015 ;
	setAttr ".spt" -type "double3" 3.9443045261050704e-031 -1.7516230804060209e-046 
		0 ;
createNode transform -n "grp_ctrl_main_C_mouth_low" -p "grp_C_mouth_low";
	setAttr ".rp" -type "double3" 8.8817841970012523e-016 -1.9721522630525335e-031 
		-1.4210854715202004e-014 ;
	setAttr ".sp" -type "double3" 8.8817841970012523e-016 -1.9721522630525335e-031 -1.4210854715202004e-014 ;
createNode transform -n "ctrl_main_C_mouth_low" -p "grp_ctrl_main_C_mouth_low";
	addAttr -ci true -k true -sn "_C_mouth_low_x" -ln "_C_mouth_low_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_C_mouth_low_z" -ln "_C_mouth_low_z" -dv 0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 4.4408920985006148e-016 7.6327832942979522e-016 0.51999999999998281 ;
	setAttr ".rp" -type "double3" -0.33089251838978262 -1.1102230246251563e-016 5.5511151231257827e-017 ;
	setAttr ".sp" -type "double3" -0.33089251838978262 -1.1102230246251563e-016 5.5511151231257827e-017 ;
	setAttr -k on "._C_mouth_low_x" 1;
	setAttr -k on "._C_mouth_low_z" 1;
createNode proLocator -n "ctrl_main_C_mouth_lowShape" -p "ctrl_main_C_mouth_low";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".lp" -type "double3" -0.4800000000000012 -0.48000000000000054 0 ;
	setAttr ".pt" 4;
	setAttr ".sz" 2.104;
	setAttr ".ra" 0.91799998283386242;
createNode transform -n "folicle_C_mouth_low" -p "ctrl_main_C_mouth_low";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999734 0.99999999999999922 ;
	setAttr ".it" no;
createNode follicle -n "folicle_C_mouth_lowShape" -p "folicle_C_mouth_low";
	setAttr -k off ".v";
	setAttr ".pu" 0.5;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_C_mouth_low" -p "folicle_C_mouth_low";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" -90 -90 -90 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
	setAttr ".rp" -type "double3" -7.1054273576010003e-015 -1.0339757656912853e-025 
		3.5527136788005001e-015 ;
	setAttr ".sp" -type "double3" -7.1054273576010019e-015 -1.0339757656912853e-025 
		3.5527136788005009e-015 ;
	setAttr ".spt" -type "double3" 1.577721810442025e-030 2.2958874039497798e-041 -7.8886090522101303e-031 ;
createNode proLocator -n "lyt_ctrl_C_mouth_lowShape" -p "lyt_ctrl_C_mouth_low";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "grp_L_chin" -p "grp_sub_headBtm";
	setAttr ".t" -type "double3" 1.4100000000000024 1.3 52.340000000000025 ;
	setAttr ".s" -type "double3" 1.0000000000000009 1.0000000000000018 1 ;
createNode transform -n "grp_ctrl_main_L_chin" -p "grp_L_chin";
createNode transform -n "ctrl_main_L_chin" -p "grp_ctrl_main_L_chin";
	addAttr -ci true -k true -sn "_L_chin_x" -ln "_L_chin_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_chin_z" -ln "_L_chin_z" -dv 0.5 -at "double";
	addAttr -ci true -sn "_L_chin_y" -ln "_L_chin_y" -dv 0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.53999999999999926 0.46999999999999736 0.42999999999999849 ;
	setAttr ".rp" -type "double3" -0.3517504948711121 -0.24910368552188511 0.095572628310691021 ;
	setAttr ".sp" -type "double3" -0.3517504948711121 -0.24910368552188511 0.095572628310691021 ;
	setAttr -k on "._L_chin_x" 0.87000000000000011;
	setAttr -l on "._L_chin_y";
createNode proLocator -n "ctrl_main_L_chinShape" -p "ctrl_main_L_chin";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".lp" -type "double3" -1.0099999999999969 0.070000000000001672 0 ;
	setAttr ".pt" 4;
	setAttr ".sz" 1.004;
	setAttr ".ra" 0.91799998283386242;
	setAttr ".ptz" -0.20000000298023224;
createNode transform -n "folicle_L_chin" -p "ctrl_main_L_chin";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999756 0.99999999999999922 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_chinShape" -p "folicle_L_chin";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".pu" 0.53;
	setAttr ".pv" 0.43500000238418574;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_chin" -p "folicle_L_chin";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".s" -type "double3" 1 0.99999999999999989 1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -1.4210854715202004e-014 1.7763568394002501e-015 0 ;
	setAttr ".sp" -type "double3" -1.4210854715202004e-014 1.7763568394002505e-015 0 ;
	setAttr ".spt" -type "double3" 0 -3.944304526105066e-031 0 ;
createNode proLocator -n "lyt_ctrl_L_chinShape" -p "lyt_ctrl_L_chin";
	setAttr -k off ".v";
	setAttr ".oc" 4;
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "grp_sub_headTop" -p "grp_lyt_ctrls";
	setAttr ".rp" -type "double3" 0 0 56.230000000000025 ;
	setAttr ".sp" -type "double3" 0 0 56.230000000000025 ;
createNode transform -n "grp_L_lid_low" -p "grp_sub_headTop";
	setAttr ".t" -type "double3" 1.9100000000000044 2.9400000000000013 56.280000000000022 ;
	setAttr ".s" -type "double3" 1.0000000000000009 1.0000000000000018 1 ;
createNode transform -n "grp_ctrl_main_L_lid_low" -p "grp_L_lid_low";
createNode transform -n "ctrl_main_L_lid_low" -p "grp_ctrl_main_L_lid_low";
	addAttr -ci true -k true -sn "_L_lid1_low_x" -ln "_L_lid1_low_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_lid1_low_z" -ln "_L_lid1_low_z" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_lid2_low_x" -ln "_L_lid2_low_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_lid2_low_z" -ln "_L_lid2_low_z" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_lid3_low_x" -ln "_L_lid3_low_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_lid3_low_z" -ln "_L_lid3_low_z" -dv 0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0 0.02000000000000024 -0.32000000000000028 ;
	setAttr ".rp" -type "double3" -0.59000000000000208 0.0079165751491849876 0.28745989189864929 ;
	setAttr ".sp" -type "double3" -0.59000000000000208 0.0079165751491849876 0.28745989189864929 ;
	setAttr -k on "._L_lid2_low_x" 0.8;
	setAttr -k on "._L_lid3_low_x" 1.2000000000000002;
createNode proLocator -n "ctrl_main_L_lid_lowShape" -p "ctrl_main_L_lid_low";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".lp" -type "double3" -0.59000000000000208 -0.59000000000000086 7.1054273576010019e-015 ;
	setAttr ".pt" 4;
	setAttr ".sz" 0.804;
	setAttr ".ra" 0.32085561752319336;
	setAttr ".ptz" 0.30000001192092896;
createNode transform -n "folicle_L_lid1_low" -p "ctrl_main_L_lid_low";
	setAttr ".s" -type "double3" 1.0000000000000004 0.99999999999999711 0.99999999999999933 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_lid1_lowShape" -p "folicle_L_lid1_low";
	setAttr -k off ".v";
	setAttr ".pu" 0.44000000000000006;
	setAttr ".pv" 0.15999999999999998;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_lid1_low" -p "folicle_L_lid1_low";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-016 4.4408920985006262e-016 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-016 4.4408920985006262e-016 ;
createNode proLocator -n "lyt_ctrl_L_lid1_lowShape" -p "lyt_ctrl_L_lid1_low";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "folicle_L_lid2_low" -p "ctrl_main_L_lid_low";
	setAttr ".s" -type "double3" 1 0.99999999999999789 0.99999999999999889 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_lid2_lowShape" -p "folicle_L_lid2_low";
	setAttr -k off ".v";
	setAttr ".pu" 0.46;
	setAttr ".pv" 0.45000000596046447;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_lid2_low" -p "folicle_L_lid2_low";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -1.4210854715202004e-014 -1.7763568394002505e-015 
		1.3322676295501878e-015 ;
	setAttr ".sp" -type "double3" -1.4210854715202004e-014 -1.7763568394002505e-015 
		1.3322676295501878e-015 ;
createNode proLocator -n "lyt_ctrl_L_lid2_lowShape" -p "lyt_ctrl_L_lid2_low";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "folicle_L_lid3_low" -p "ctrl_main_L_lid_low";
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999845 0.99999999999999756 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_lid3_lowShape" -p "folicle_L_lid3_low";
	setAttr -k off ".v";
	setAttr ".pu" 0.51;
	setAttr ".pv" 0.70000002384185789;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_lid3_low" -p "folicle_L_lid3_low";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -1.7763568394002501e-015 1.3322676295501878e-015 ;
	setAttr ".sp" -type "double3" 0 -1.7763568394002505e-015 1.3322676295501878e-015 ;
	setAttr ".spt" -type "double3" 0 3.944304526105066e-031 0 ;
createNode proLocator -n "lyt_ctrl_L_lid3_lowShape" -p "lyt_ctrl_L_lid3_low";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "grp_L_brow" -p "grp_sub_headTop";
	setAttr ".t" -type "double3" 1.2900000000000027 3.1300000000000017 58.500000000000036 ;
	setAttr ".s" -type "double3" 1.0000000000000009 1.0000000000000018 1 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010019e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010019e-015 ;
createNode transform -n "grp_ctrl_main_L_brow" -p "grp_L_brow";
	setAttr ".rp" -type "double3" 0 0 7.1054273576010019e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010019e-015 ;
createNode transform -n "ctrl_main_L_brow" -p "grp_ctrl_main_L_brow";
	addAttr -ci true -k true -sn "_L_brow1_x" -ln "_L_brow1_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_brow1_z" -ln "_L_brow1_z" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_brow2_x" -ln "_L_brow2_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_brow2_z" -ln "_L_brow2_z" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_brow3_x" -ln "_L_brow3_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_brow3_z" -ln "_L_brow3_z" -dv 0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".rp" -type "double3" 0.052119575585150235 0.20164673757876608 0.29801667912439622 ;
	setAttr ".sp" -type "double3" 0.052119575585150235 0.20164673757876608 0.29801667912439622 ;
	setAttr -k on "._L_brow2_x" 1;
	setAttr -k on "._L_brow3_x" 1.5;
createNode proLocator -n "ctrl_main_L_browShape" -p "ctrl_main_L_brow";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".lp" -type "double3" 0 0 -7.1054273576010019e-015 ;
	setAttr ".pt" 4;
	setAttr ".sz" 2.104;
	setAttr ".ra" 0.37433156371116638;
	setAttr ".ptz" 0.5;
createNode transform -n "folicle_L_brow1" -p "ctrl_main_L_brow";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999589 0.99999999999999756 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_brow1Shape" -p "folicle_L_brow1";
	setAttr -k off ".v";
	setAttr ".pu" 0.25;
	setAttr ".pv" 0.25;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_brow1" -p "folicle_L_brow1";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -1.7763568394002505e-015 3.5527136788005009e-015 ;
	setAttr ".sp" -type "double3" 0 -1.7763568394002505e-015 3.5527136788005009e-015 ;
createNode proLocator -n "lyt_ctrl_L_brow1Shape" -p "lyt_ctrl_L_brow1";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "folicle_L_brow2" -p "ctrl_main_L_brow";
	setAttr ".s" -type "double3" 0.99999999999999889 0.99999999999999611 0.999999999999997 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_brow2Shape" -p "folicle_L_brow2";
	setAttr -k off ".v";
	setAttr ".pu" 0.25;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_brow2" -p "folicle_L_brow2";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode proLocator -n "lyt_ctrl_L_brow2Shape" -p "lyt_ctrl_L_brow2";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "folicle_L_brow3" -p "ctrl_main_L_brow";
	setAttr ".s" -type "double3" 0.99999999999999933 0.99999999999999711 0.99999999999999645 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_brow3Shape" -p "folicle_L_brow3";
	setAttr -k off ".v";
	setAttr ".pu" 0.25;
	setAttr ".pv" 0.75;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_brow3" -p "folicle_L_brow3";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 7.1054273576010019e-015 -3.5527136788005009e-015 0 ;
	setAttr ".sp" -type "double3" 7.1054273576010019e-015 -3.5527136788005009e-015 0 ;
createNode proLocator -n "lyt_ctrl_L_brow3Shape" -p "lyt_ctrl_L_brow3";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "grp_L_lid_center" -p "grp_sub_headTop";
	setAttr ".t" -type "double3" 1.4900000000000029 3.4700000000000029 56.730000000000025 ;
	setAttr ".s" -type "double3" 1.0000000000000009 1.0000000000000018 1 ;
createNode transform -n "grp_ctrl_main_L_lid_center" -p "grp_L_lid_center";
createNode transform -n "ctrl_main_L_lid_center" -p "grp_ctrl_main_L_lid_center";
	addAttr -ci true -k true -sn "_L_lidcrnr_in_x" -ln "_L_lidcrnr_in_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_lidcrnr_in_z" -ln "_L_lidcrnr_in_z" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_lidcrnr_out_x" -ln "_L_lidcrnr_out_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_lidcrnr_out_z" -ln "_L_lidcrnr_out_z" -dv 0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" 0.51000000000000068 -0.67000000000000171 -0.31000000000000938 ;
	setAttr ".rp" -type "double3" 0 0 0.480532954998246 ;
	setAttr ".sp" -type "double3" 0 0 0.480532954998246 ;
	setAttr -k on "._L_lidcrnr_in_x" 0.52;
	setAttr -k on "._L_lidcrnr_in_z" 1.12;
	setAttr -k on "._L_lidcrnr_out_x" 1.7200000000000002;
	setAttr -k on "._L_lidcrnr_out_z" 1.0100000000000002;
createNode proLocator -n "ctrl_main_L_lid_centerShape" -p "ctrl_main_L_lid_center";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 7;
	setAttr ".lp" -type "double3" 2.2204460492503131e-016 4.4408920985006262e-016 0 ;
	setAttr ".pt" 4;
	setAttr ".sz" 0.704;
	setAttr ".ra" 0.53475934267044067;
	setAttr ".ptz" 0.5;
createNode transform -n "folicle_L_lidcrnr_in" -p "ctrl_main_L_lid_center";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999734 0.99999999999999889 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_lidcrnr_inShape" -p "folicle_L_lidcrnr_in";
	setAttr -k off ".v";
	setAttr ".pu" 0.51000000238418575;
	setAttr ".pv" 0.089999990463256796;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_lidcrnr_in" -p "folicle_L_lidcrnr_in";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 1.1102230246251563e-016 0 ;
	setAttr ".sp" -type "double3" 0 1.1102230246251563e-016 0 ;
createNode proLocator -n "lyt_ctrl_L_lidcrnr_inShape" -p "lyt_ctrl_L_lidcrnr_in";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "folicle_L_lidcrnr_out" -p "ctrl_main_L_lid_center";
	setAttr ".s" -type "double3" 1 0.999999999999999 0.99999999999999756 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_lidcrnr_outShape" -p "folicle_L_lidcrnr_out";
	setAttr -k off ".v";
	setAttr ".pu" 0.50499999523162842;
	setAttr ".pv" 0.91000001430511468;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_lidcrnr_out" -p "folicle_L_lidcrnr_out";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 -8.8817841970012523e-016 -8.8817841970012523e-016 ;
	setAttr ".sp" -type "double3" 0 -8.8817841970012523e-016 -8.8817841970012523e-016 ;
createNode proLocator -n "lyt_ctrl_L_lidcrnr_outShape" -p "lyt_ctrl_L_lidcrnr_out";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "grp_C_brow" -p "grp_sub_headTop";
	setAttr ".t" -type "double3" 2.3900000000000037 -5.3068660577082564e-016 59.250000000000036 ;
	setAttr ".s" -type "double3" 1.0000000000000009 1.0000000000000018 1 ;
createNode transform -n "grp_ctrl_main_C_brow" -p "grp_C_brow";
createNode transform -n "ctrl_main_C_brow" -p "grp_ctrl_main_C_brow";
	addAttr -ci true -k true -sn "_C_brow_x" -ln "_C_brow_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_C_brow_z" -ln "_C_brow_z" -dv 0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 3.9443045261050739e-031 -0.051078728474843411 0 ;
	setAttr ".rp" -type "double3" -5.5511151231257827e-017 0.051078728474842995 -1.1102230246251563e-016 ;
	setAttr ".sp" -type "double3" -5.5511151231257827e-017 0.051078728474842995 -1.1102230246251563e-016 ;
createNode proLocator -n "ctrl_main_C_browShape" -p "ctrl_main_C_brow";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".lp" -type "double3" -0.33999999999999986 -0.33999999999999941 -1.1182721415536905e-015 ;
	setAttr ".pt" 4;
	setAttr ".sz" 3.7433154950725198;
	setAttr ".ra" 0.58823531866073608;
createNode transform -n "folicle_C_brow" -p "ctrl_main_C_brow";
	setAttr ".s" -type "double3" 1.0000000000000002 0.99999999999999756 0.99999999999999922 ;
	setAttr ".it" no;
createNode follicle -n "folicle_C_browShape" -p "folicle_C_brow";
	setAttr -k off ".v";
	setAttr ".pu" 0.5;
	setAttr ".pv" 0.5;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_C_brow" -p "folicle_C_brow";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" -90 -90 -90 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 8.6736173798840355e-019 -8.8817841970012523e-016 ;
	setAttr ".sp" -type "double3" 0 8.6736173798840355e-019 -8.8817841970012523e-016 ;
createNode proLocator -n "lyt_ctrl_C_browShape" -p "lyt_ctrl_C_brow";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "grp_L_lid_up" -p "grp_sub_headTop";
	setAttr ".t" -type "double3" 1.9100000000000044 2.9400000000000013 57.380000000000024 ;
	setAttr ".s" -type "double3" 1.0000000000000009 1.0000000000000018 1 ;
createNode transform -n "grp_ctrl_main_L_lid_up" -p "grp_L_lid_up";
createNode transform -n "ctrl_main_L_lid_up" -p "grp_ctrl_main_L_lid_up";
	addAttr -ci true -k true -sn "_L_lid1_up_x" -ln "_L_lid1_up_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_lid1_up_z" -ln "_L_lid1_up_z" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_lid2_up_x" -ln "_L_lid2_up_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_lid2_up_z" -ln "_L_lid2_up_z" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_lid3_up_x" -ln "_L_lid3_up_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_lid3_up_z" -ln "_L_lid3_up_z" -dv 0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".rp" -type "double3" -0.71307329413560527 0.51456980872243474 0.17783057642685146 ;
	setAttr ".sp" -type "double3" -0.71307329413560527 0.51456980872243474 0.17783057642685146 ;
	setAttr -k on "._L_lid1_up_x" 0.6;
	setAttr -k on "._L_lid1_up_z" 0.9;
	setAttr -k on "._L_lid2_up_x" 0.8600000000000001;
	setAttr -k on "._L_lid2_up_z" 0.9;
	setAttr -k on "._L_lid3_up_x" 1.1;
	setAttr -k on "._L_lid3_up_z" 0.9;
createNode proLocator -n "ctrl_main_L_lid_upShape" -p "ctrl_main_L_lid_up";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".lp" -type "double3" 0 4.4408920985006262e-016 7.1054273576010019e-015 ;
	setAttr ".pt" 4;
	setAttr ".sz" 0.804;
	setAttr ".ra" 0.32085561752319336;
	setAttr ".ptz" 0.5;
createNode transform -n "folicle_L_lid1_up" -p "ctrl_main_L_lid_up";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999745 0.99999999999999867 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_lid1_upShape" -p "folicle_L_lid1_up";
	setAttr -k off ".v";
	setAttr ".pu" 0.38999998807907105;
	setAttr ".pv" 0.19000001192092897;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_lid1_up" -p "folicle_L_lid1_up";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -7.1054273576010019e-015 4.4408920985006262e-016 -2.2204460492503131e-016 ;
	setAttr ".sp" -type "double3" -7.1054273576010019e-015 4.4408920985006262e-016 -2.2204460492503131e-016 ;
createNode proLocator -n "lyt_ctrl_L_lid1_upShape" -p "lyt_ctrl_L_lid1_up";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "folicle_L_lid2_up" -p "ctrl_main_L_lid_up";
	setAttr ".s" -type "double3" 1.0000000000000004 0.99999999999999756 0.999999999999999 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_lid2_upShape" -p "folicle_L_lid2_up";
	setAttr -k off ".v";
	setAttr ".pu" 0.39999998807907106;
	setAttr ".pv" 0.47000000715255746;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_lid2_up" -p "folicle_L_lid2_up";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 7.1054273576010019e-015 -8.8817841970012523e-016 1.1102230246251563e-016 ;
	setAttr ".sp" -type "double3" 7.1054273576010019e-015 -8.8817841970012523e-016 1.1102230246251563e-016 ;
createNode proLocator -n "lyt_ctrl_L_lid2_upShape" -p "lyt_ctrl_L_lid2_up";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "folicle_L_lid3_up" -p "ctrl_main_L_lid_up";
	setAttr ".s" -type "double3" 1 0.99999999999999889 0.999999999999998 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_lid3_upShape" -p "folicle_L_lid3_up";
	setAttr -k off ".v";
	setAttr ".pu" 0.38999998807907105;
	setAttr ".pv" 0.75000001192092891;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_lid3_up" -p "folicle_L_lid3_up";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 7.1054273576010003e-015 0 4.4408920985006262e-016 ;
	setAttr ".sp" -type "double3" 7.1054273576010019e-015 0 4.4408920985006262e-016 ;
	setAttr ".spt" -type "double3" -1.577721810442025e-030 0 0 ;
createNode proLocator -n "lyt_ctrl_L_lid3_upShape" -p "lyt_ctrl_L_lid3_up";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "grp_sub_headMid" -p "grp_lyt_ctrls";
	setAttr ".rp" -type "double3" 0 0 56.230000000000025 ;
	setAttr ".sp" -type "double3" 0 0 56.230000000000025 ;
createNode transform -n "grp_L_cheek" -p "grp_sub_headMid";
	setAttr ".t" -type "double3" 0.2600000000000019 4.3100000000000032 54.040000000000035 ;
	setAttr ".s" -type "double3" 1.0000000000000009 1.0000000000000009 1 ;
	setAttr ".rp" -type "double3" 0 8.8817841970012622e-016 0 ;
	setAttr ".sp" -type "double3" 0 8.8817841970012523e-016 0 ;
	setAttr ".spt" -type "double3" 0 7.8886090522101303e-031 0 ;
createNode transform -n "grp_ctrl_main_L_cheek" -p "grp_L_cheek";
	setAttr ".t" -type "double3" 0 4.4408920985006262e-016 0 ;
	setAttr ".rp" -type "double3" -3.3306690738754696e-016 8.8817841970012523e-016 0 ;
	setAttr ".sp" -type "double3" -3.3306690738754696e-016 8.8817841970012523e-016 0 ;
createNode transform -n "ctrl_main_L_cheek" -p "grp_ctrl_main_L_cheek";
	addAttr -ci true -k true -sn "_L_cheek_x" -ln "_L_cheek_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_cheek_z" -ln "_L_cheek_z" -dv 0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0 0 0.52999999999999758 ;
	setAttr ".rp" -type "double3" 0.059902983910370133 0.18229843264758 0.3919598503930064 ;
	setAttr ".sp" -type "double3" 0.059902983910370133 0.18229843264758 0.3919598503930064 ;
	setAttr -k on "._L_cheek_x" 0.9;
	setAttr -k on "._L_cheek_z" 1.2000000000000002;
createNode proLocator -n "ctrl_main_L_cheekShape" -p "ctrl_main_L_cheek";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".lp" -type "double3" -3.3595814036984691e-016 -7.4187059706478569e-016 
		0 ;
	setAttr ".pt" 4;
	setAttr ".sz" 2.104;
	setAttr ".ra" 0.91799998283386242;
	setAttr ".ptz" 0.5;
createNode transform -n "folicle_L_cheek" -p "ctrl_main_L_cheek";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999889 0.99999999999999889 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_cheekShape" -p "folicle_L_cheek";
	setAttr -k off ".v";
	setAttr ".pu" 0.47000002384185791;
	setAttr ".pv" 0.55999998807907103;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_cheek" -p "folicle_L_cheek";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -7.1054273576010019e-015 0 -1.7763568394002505e-015 ;
	setAttr ".sp" -type "double3" -7.1054273576010019e-015 0 -1.7763568394002505e-015 ;
createNode proLocator -n "lyt_ctrl_L_cheekShape" -p "lyt_ctrl_L_cheek";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "grp_L_nasal" -p "grp_sub_headMid";
	setAttr ".t" -type "double3" 2.5600000000000041 0.88000000000000034 56.230000000000025 ;
	setAttr ".s" -type "double3" 1.0000000000000009 1.0000000000000018 1 ;
createNode transform -n "grp_ctrl_main_L_nasal" -p "grp_L_nasal";
createNode transform -n "ctrl_main_L_nasal" -p "grp_ctrl_main_L_nasal";
	addAttr -ci true -k true -sn "_L_nasal1_x" -ln "_L_nasal1_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_nasal1_z" -ln "_L_nasal1_z" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_nasal2_x" -ln "_L_nasal2_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_nasal2_z" -ln "_L_nasal2_z" -dv 0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.28740467848859014 0.63397225452982175 1.0674558237953211 ;
	setAttr ".rp" -type "double3" -0.46490849033912673 0.14904104624836528 -0.8542282701337931 ;
	setAttr ".sp" -type "double3" -0.46490849033912673 0.14904104624836528 -0.8542282701337931 ;
	setAttr -k on "._L_nasal1_z" 1.5600000000000005;
	setAttr -k on "._L_nasal2_z" 1.0100000000000002;
createNode proLocator -n "ctrl_main_L_nasalShape" -p "ctrl_main_L_nasal";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".lp" -type "double3" -0.92137693301841228 -0.34656757604123151 7.1054273576010019e-015 ;
	setAttr ".pt" 4;
	setAttr ".sz" 2.1390374789741582;
	setAttr ".ra" 0.48128342628479009;
	setAttr ".sp" 111.5;
	setAttr ".ptz" -0.5;
createNode transform -n "folicle_L_nasal1" -p "ctrl_main_L_nasal";
	setAttr ".s" -type "double3" 0.99999999999999956 0.99999999999999822 0.99999999999999933 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_nasal1Shape" -p "folicle_L_nasal1";
	setAttr -k off ".v";
	setAttr ".pu" 0.61999997138977048;
	setAttr ".pv" 0.42;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_nasal1" -p "folicle_L_nasal1";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999989 0.99999999999999989 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -7.1054273576010003e-015 -7.1054273576010003e-015 
		-1.7763568394002501e-015 ;
	setAttr ".sp" -type "double3" -7.1054273576010019e-015 -7.1054273576010019e-015 
		-1.7763568394002505e-015 ;
	setAttr ".spt" -type "double3" 1.577721810442025e-030 1.577721810442025e-030 3.944304526105066e-031 ;
createNode proLocator -n "lyt_ctrl_L_nasal1Shape" -p "lyt_ctrl_L_nasal1";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "folicle_L_nasal2" -p "ctrl_main_L_nasal";
	setAttr ".s" -type "double3" 0.999999999999999 0.99999999999999845 0.99999999999999867 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_nasal2Shape" -p "folicle_L_nasal2";
	setAttr -k off ".v";
	setAttr ".pu" 0.22499999523162839;
	setAttr ".pv" 0.41;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_nasal2" -p "folicle_L_nasal2";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 7.1054273576010003e-015 3.5527136788005009e-015 -8.8817841970012523e-016 ;
	setAttr ".sp" -type "double3" 7.1054273576010019e-015 3.5527136788005009e-015 -8.8817841970012523e-016 ;
	setAttr ".spt" -type "double3" -1.577721810442025e-030 0 0 ;
createNode proLocator -n "lyt_ctrl_L_nasal2Shape" -p "lyt_ctrl_L_nasal2";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "grp_L_zygo" -p "grp_sub_headMid";
	setAttr ".t" -type "double3" 1.4500000000000028 3.3000000000000016 55.320000000000029 ;
	setAttr ".s" -type "double3" 1.0000000000000009 1.0000000000000011 1 ;
	setAttr ".rp" -type "double3" 0 -4.4408920985006311e-016 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-016 0 ;
	setAttr ".spt" -type "double3" 0 -4.9303806576313299e-031 0 ;
createNode transform -n "grp_ctrl_main_L_zygo" -p "grp_L_zygo";
	setAttr ".rp" -type "double3" 0 -4.4408920985006262e-016 0 ;
	setAttr ".sp" -type "double3" 0 -4.4408920985006262e-016 0 ;
createNode transform -n "ctrl_main_L_zygo" -p "grp_ctrl_main_L_zygo";
	addAttr -ci true -k true -sn "_L_zygo1_x" -ln "_L_zygo1_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_zygo1_z" -ln "_L_zygo1_z" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_zygo2_x" -ln "_L_zygo2_x" -dv 0.5 -at "double";
	addAttr -ci true -k true -sn "_L_zygo2_z" -ln "_L_zygo2_z" -dv 0.5 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.2700000000000003 0.56000000000000216 0.49999999999998163 ;
	setAttr ".rp" -type "double3" -0.18606266183524756 -0.042393417560564473 0.022344753754024393 ;
	setAttr ".sp" -type "double3" -0.18606266183524756 -0.042393417560564473 0.022344753754024393 ;
	setAttr -k on "._L_zygo1_x" 0.099999999999999978;
	setAttr -k on "._L_zygo1_z" 1.5;
	setAttr -k on "._L_zygo2_x" 1.2600000000000002;
	setAttr -k on "._L_zygo2_z" 1.7100000000000002;
createNode proLocator -n "ctrl_main_L_zygoShape" -p "ctrl_main_L_zygo";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 4;
	setAttr ".lp" -type "double3" -0.83000000000000251 -0.29000000000000165 3.9968028886505628e-015 ;
	setAttr ".pt" 4;
	setAttr ".sz" 2.6737967555854407;
	setAttr ".ra" 0.32085561752319336;
	setAttr ".ptz" -0.30000001192092896;
createNode transform -n "folicle_L_zygo1" -p "ctrl_main_L_zygo";
	setAttr ".s" -type "double3" 1 0.99999999999999811 0.99999999999999922 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_zygo1Shape" -p "folicle_L_zygo1";
	setAttr -k off ".v";
	setAttr ".pu" 0.8;
	setAttr ".pv" 0.27000000074505809;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_zygo1" -p "folicle_L_zygo1";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 7.1054273576010019e-015 -1.7763568394002505e-015 0 ;
	setAttr ".sp" -type "double3" 7.1054273576010019e-015 -1.7763568394002505e-015 0 ;
createNode proLocator -n "lyt_ctrl_L_zygo1Shape" -p "lyt_ctrl_L_zygo1";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "folicle_L_zygo2" -p "ctrl_main_L_zygo";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999845 0.99999999999999856 ;
	setAttr ".it" no;
createNode follicle -n "folicle_L_zygo2Shape" -p "folicle_L_zygo2";
	setAttr -k off ".v";
	setAttr ".pu" 0.7850000190734866;
	setAttr ".pv" 0.7299999952316284;
	setAttr -s 2 ".sts[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".cws[0:1]"  0 1 3 1 0.2 3;
	setAttr -s 2 ".ats[0:1]"  0 1 3 1 0.2 3;
createNode transform -n "lyt_ctrl_L_zygo2" -p "folicle_L_zygo2";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 7.1054273576010019e-015 3.5527136788005009e-015 -3.5527136788005009e-015 ;
	setAttr ".sp" -type "double3" 7.1054273576010019e-015 3.5527136788005009e-015 -3.5527136788005009e-015 ;
createNode proLocator -n "lyt_ctrl_L_zygo2Shape" -p "lyt_ctrl_L_zygo2";
	setAttr -k off ".v";
	setAttr ".usp" 0;
	setAttr ".tp" 1;
	setAttr ".sz" 0.6;
	setAttr ".cnbx" 1;
	setAttr ".uax" 1;
	setAttr ".axt" 0.15508021350033621;
	setAttr ".axrt" 0.30000001192092896;
	setAttr ".dL" 1;
createNode transform -n "FACE_CONTROLS" -p "ctrl_fac_main";
	setAttr ".rp" -type "double3" 0 0 56.230000000000025 ;
	setAttr ".sp" -type "double3" 0 0 56.230000000000025 ;
createNode transform -n "ZERO_grp_ctrl_headTop" -p "FACE_CONTROLS";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0 0 66.56 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_C_headTop" -p "ZERO_grp_ctrl_headTop";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0 0 -10.739999999999988 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1 ;
createNode proLocator -n "ctrl_mr_C_headTopShape" -p "ctrl_mr_C_headTop";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".ed" 1;
	setAttr ".tp" 2;
	setAttr ".pt" 20;
	setAttr ".sz" 3.2085561253289807;
	setAttr ".ra" 0.91799998283386242;
	setAttr ".sd" 4.059999942779541;
	setAttr ".ptz" 10.800000190734863;
createNode transform -n "ZERO_grp_ctrl_C_brow" -p "ctrl_mr_C_headTop";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 2.83 0 3.0499999999999972 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_C_brow" -p "ZERO_grp_ctrl_C_brow";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_C_browShape" -p "ctrl_mr_C_brow";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" 2.7927453458688811 2.9300000000000046 119.0660486663711 ;
	setAttr ".ed" 1;
	setAttr ".pt" 5;
	setAttr ".sz" 0.59999999999999987;
	setAttr ".ra" 1.1180000305175779;
createNode transform -n "ZERO_grp_ctrl_L_brow" -p "ctrl_mr_C_headTop";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 2.33 3.150000000000003 2.9600000000000009 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_L_brow" -p "ZERO_grp_ctrl_L_brow";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_L_browShape" -p "ctrl_mr_L_brow";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -3.1900000000000013 2.5600000000000076 115.30995154080838 ;
	setAttr ".ed" 1;
	setAttr ".pt" 8;
	setAttr ".sz" 1.774;
	setAttr ".ra" 0.26737967133522034;
createNode transform -n "ZERO_grp_ctrl_L_eyeRoot" -p "ctrl_mr_C_headTop";
	setAttr ".t" -type "double3" 2.75 2.8400000000000025 1.1199999999999832 ;
createNode transform -n "ctrl_mr_L_eyeRoot" -p "ZERO_grp_ctrl_L_eyeRoot";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
createNode proLocator -n "ctrl_mr_L_eyeRootShape" -p "ctrl_mr_L_eyeRoot";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".od" 0.71657752990722656;
createNode transform -n "ZERO_grp_ctrl_L_lidUp" -p "ctrl_mr_L_eyeRoot";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -0.020000000000000014 -0.020000000000000465 0.60999999999999943 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_L_lidUp" -p "ZERO_grp_ctrl_L_lidUp";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_L_lidUpShape" -p "ctrl_mr_L_lidUp";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" 0 0 56.009951540808352 ;
	setAttr ".ed" 1;
	setAttr ".pt" 10;
	setAttr ".sz" 1.27;
	setAttr ".ra" 1.0970000028610227;
	setAttr ".sl" 250.26737967555857;
	setAttr ".ptz" -0.60000002384185791;
createNode transform -n "ZERO_grp_ctrl_L_lidLow" -p "ctrl_mr_L_eyeRoot";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -0.029999999999999805 4.4408920985006262e-016 -0.50999999999999801 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_L_lidLow" -p "ZERO_grp_ctrl_L_lidLow";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_L_lidLowShape" -p "ctrl_mr_L_lidLow";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -3.1900000000000013 2.4900000000000082 112.23995154080841 ;
	setAttr ".ed" 1;
	setAttr ".pt" 10;
	setAttr ".sz" 0.97;
	setAttr ".ra" 0.91799998283386242;
	setAttr ".sp" 180;
	setAttr ".sl" 211.76470572457595;
	setAttr ".ptz" 0.20000000298023224;
createNode transform -n "ZERO_grp_ctrl_L_eye" -p "ctrl_mr_L_eyeRoot";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0 0 -7.1054273576010019e-015 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_L_eye" -p "ZERO_grp_ctrl_L_eye";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_L_eyeShape" -p "ctrl_mr_L_eye";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -2.412214848064862 -1.0133015316582656 113.37719705407012 ;
	setAttr ".ed" 1;
	setAttr ".pt" 14;
	setAttr ".sz" 1.0699999999999998;
createNode transform -n "ZERO_grp_ctrl_L_lidIn" -p "ctrl_mr_L_eyeRoot";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -0.029999999999999805 -0.82000000000000084 -0.0099999999999980105 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_L_lidIn" -p "ZERO_grp_ctrl_L_lidIn";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_L_lidInShape" -p "ctrl_mr_L_lidIn";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -1.5200000000000005 2.1900000000000106 112.9299515408084 ;
	setAttr ".ed" 1;
	setAttr ".pt" 3;
	setAttr ".sz" 0.57000000000000006;
	setAttr ".ra" 1.0180000066757202;
	setAttr ".sp" 90;
createNode transform -n "ZERO_grp_ctrl_L_lidOut" -p "ctrl_mr_L_eyeRoot";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -0.040000000000000029 0.87000000000000144 -0.019999999999996021 ;
	setAttr ".s" -type "double3" 1 1.0000000000000004 1 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_L_lidOut" -p "ZERO_grp_ctrl_L_lidOut";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_L_lidOutShape" -p "ctrl_mr_L_lidOut";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -4.6000000000000014 2.1900000000000057 112.92995154080836 ;
	setAttr ".ed" 1;
	setAttr ".pt" 3;
	setAttr ".sz" 0.57000000000000006;
	setAttr ".ra" 1.0180000066757202;
	setAttr ".sp" 28.877004623413089;
createNode transform -n "ZERO_grp_ctrl_headMid" -p "FACE_CONTROLS";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0 0 57.51 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_C_headMid" -p "ZERO_grp_ctrl_headMid";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_C_headMidShape" -p "ctrl_mr_C_headMid";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -1.585398479164725e-015 -2.3200000000000029 113.61995154080836 ;
	setAttr ".ed" 1;
	setAttr ".pt" 14;
	setAttr ".sz" 2.009;
	setAttr ".ra" 0.91799998283386242;
	setAttr ".od" 0.72727274894714355;
	setAttr ".ptz" 7.8000001907348642;
createNode transform -n "ZERO_grp_ctrl_L_nasal" -p "ctrl_mr_C_headMid";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 2.3099999999999996 1.1000000000000003 -1.1400000000000006 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_L_nasal" -p "ZERO_grp_ctrl_L_nasal";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_L_nasalShape" -p "ctrl_mr_L_nasal";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -1.5000000000000004 2.9300000000000037 112.27995154080836 ;
	setAttr ".ed" 1;
	setAttr ".pt" 3;
	setAttr ".sz" 0.674;
	setAttr ".ra" 2.3180000782012939;
	setAttr ".sp" 205.98930358886719;
createNode transform -n "ZERO_grp_ctrl_L_cheek" -p "ctrl_mr_C_headMid";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 1.07 4.8800000000000008 -3.4499999999999886 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_L_cheek" -p "ZERO_grp_ctrl_L_cheek";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_L_cheekShape" -p "ctrl_mr_L_cheek";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -4.450000000000002 2.5600000000000076 110.52995154080838 ;
	setAttr ".ed" 1;
	setAttr ".pt" 8;
	setAttr ".sz" 0.57000000000000006;
	setAttr ".ra" 1.0160428285598757;
createNode transform -n "ZERO_grp_ctrl_L_zygo" -p "ctrl_mr_C_headMid";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 2.2 3.5600000000000014 -2.2500000000000071 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_L_zygo" -p "ZERO_grp_ctrl_L_zygo";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_L_zygoShape" -p "ctrl_mr_L_zygo";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -2.9400000000000026 2.5600000000000089 111.48995154080841 ;
	setAttr ".ed" 1;
	setAttr ".pt" 7;
	setAttr ".sz" 0.67;
	setAttr ".ra" 1.0160428285598757;
	setAttr ".sp" 179.03742980957031;
	setAttr ".sl" 188.66310162220728;
createNode transform -n "ZERO_grp_ctrl_C_nose" -p "ctrl_mr_C_headMid";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 2.6499999999999995 0 -1.9899999999999949 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_C_nose" -p "ZERO_grp_ctrl_C_nose";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_C_noseShape" -p "ctrl_mr_C_nose";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -1.154631945610061e-016 2.4900000000000011 112.43995154080838 ;
	setAttr ".ed" 1;
	setAttr ".pt" 5;
	setAttr ".sz" 0.674;
	setAttr ".ra" 2.3180000782012939;
createNode transform -n "ZERO_grp_ctrl_L_nose" -p "ctrl_mr_C_nose";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -4.4408920985006281e-016 0.67000000000000037 0 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_L_nose" -p "ZERO_grp_ctrl_L_nose";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_L_noseShape" -p "ctrl_mr_L_nose";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -0.77000000000000179 2.2899999999999978 112.02995154080836 ;
	setAttr ".ed" 1;
	setAttr ".pt" 6;
	setAttr ".sz" 0.674;
	setAttr ".ra" 0.91799998283386242;
	setAttr ".sp" 90;
createNode transform -n "ZERO_grp_ctrl_headBtm" -p "FACE_CONTROLS";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0 0 56.309999999999995 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_C_headBtm" -p "ZERO_grp_ctrl_headBtm";
	addAttr -ci true -k true -sn "_L_mouth_low_X" -ln "_L_mouth_low_X" -dv 0.1 -at "double";
	addAttr -ci true -k true -sn "_L_mouth_low_Y" -ln "_L_mouth_low_Y" -dv 0.1 -at "double";
	addAttr -ci true -k true -sn "_L_chin_X" -ln "_L_chin_X" -dv 0.1 -at "double";
	addAttr -ci true -k true -sn "_L_chin_Y" -ln "_L_chin_Y" -dv 0.1 -at "double";
	addAttr -ci true -k true -sn "_L_mouthcorner_low_X" -ln "_L_mouthcorner_low_X" -dv 
		0.1 -at "double";
	addAttr -ci true -k true -sn "_L_mouthcorner_low_Y" -ln "_L_mouthcorner_low_Y" -dv 
		0.1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_C_headBtmShape" -p "ctrl_mr_C_headBtm";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -1.8852063770808736 4.1859990520107217e-016 113.84978439944422 ;
	setAttr ".ed" 1;
	setAttr ".tp" 2;
	setAttr ".pt" 20;
	setAttr ".sz" 3.2085561253289807;
	setAttr ".ra" 0.91799998283386242;
	setAttr ".sd" -4.5989303588867187;
	setAttr ".ptz" 7.0999999046325684;
createNode transform -n "ZERO_grp_ctrl_C_mouthUp" -p "ctrl_mr_C_headBtm";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 2.7 0 -1.759999999999998 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_C_mouthUp" -p "ZERO_grp_ctrl_C_mouthUp";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_C_mouthUpShape" -p "ctrl_mr_C_mouthUp";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -1.885206377080872 2.9300000000000059 168.50978439944427 ;
	setAttr ".ed" 1;
	setAttr ".pt" 11;
	setAttr ".sz" 1.874;
	setAttr ".ra" 0.8021390438079834;
	setAttr ".sl" 231.01604270006723;
	setAttr ".ptz" -0.40000000596046448;
createNode transform -n "ZERO_grp_ctrl_C_mouthDown" -p "ctrl_mr_C_headBtm";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 2.6499999999999995 0 -2.6599999999999895 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_C_mouthDown" -p "ZERO_grp_ctrl_C_mouthDown";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_C_mouthDownShape" -p "ctrl_mr_C_mouthDown";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -1.8866886660098323 2.824495695207816 166.29053856843413 ;
	setAttr ".ed" 1;
	setAttr ".pt" 11;
	setAttr ".sz" 2.6737967555854407;
	setAttr ".mul" 0.69999998807907104;
	setAttr ".ra" 0.8021390438079834;
	setAttr ".sp" 180;
	setAttr ".sl" 231.01604270006723;
createNode transform -n "ZERO_grp_ctrl_L_mouthCorner" -p "ctrl_mr_C_headBtm";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 2.54 2.0500000000000007 -2.5699999999999861 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_L_mouthCorner" -p "ZERO_grp_ctrl_L_mouthCorner";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_L_mouthCornerShape" -p "ctrl_mr_L_mouthCorner";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -4.275206377080873 2.6200000000000077 167.65978439944425 ;
	setAttr ".ed" 1;
	setAttr ".pt" 3;
	setAttr ".sz" 0.87400000000000011;
	setAttr ".ra" 1.1180000305175779;
	setAttr ".sp" 90;
createNode transform -n "ZERO_grp_ctrl_C_muzzle" -p "ctrl_mr_C_headBtm";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -1.6800000000000002 0 -2.3399999999999821 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_C_muzzle" -p "ZERO_grp_ctrl_C_muzzle";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_C_muzzleShape" -p "ctrl_mr_C_muzzle";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -1.8852063770808736 -0.63000000000000123 168.84978439944425 ;
	setAttr ".ed" 1;
	setAttr ".pt" 4;
	setAttr ".sz" 2.1390374789741582;
	setAttr ".ra" 0.58823531866073608;
	setAttr ".ptx" 5.0209999084472656;
createNode transform -n "ZERO_grp_ctrl_L_mouthUp" -p "ctrl_mr_C_headBtm";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 2.68 1.4100000000000006 -1.6700000000000088 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_L_mouthUp" -p "ZERO_grp_ctrl_L_mouthUp";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_L_mouthUpShape" -p "ctrl_mr_L_mouthUp";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -2.8652063770808729 2.9300000000000059 168.50978439944427 ;
	setAttr ".ed" 1;
	setAttr ".pt" 11;
	setAttr ".sz" 0.43499999999999994;
	setAttr ".ra" 0.91799998283386242;
createNode transform -n "ZERO_grp_ctrl_L_mouthLow" -p "ctrl_mr_C_headBtm";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 2.73 1.4300000000000006 -3.4199999999999946 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_L_mouthLow" -p "ZERO_grp_ctrl_L_mouthLow";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_L_mouthLowShape" -p "ctrl_mr_L_mouthLow";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -2.8652063770808729 2.9300000000000059 166.31978439944425 ;
	setAttr ".ed" 1;
	setAttr ".pt" 14;
	setAttr ".sz" 0.43499999999999994;
	setAttr ".ra" 0.91799998283386242;
createNode transform -n "ZERO_grp_ctrl_C_jaw" -p "ctrl_mr_C_headBtm";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -2.32 0 -0.86999999999999744 ;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode transform -n "ctrl_mr_C_jaw" -p "ZERO_grp_ctrl_C_jaw";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".rp" -type "double3" 0 0 7.1054273576010145e-015 ;
	setAttr ".sp" -type "double3" 0 0 7.1054273576010145e-015 ;
createNode proLocator -n "ctrl_mr_C_jawShape" -p "ctrl_mr_C_jaw";
	setAttr -k off ".v";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".lp" -type "double3" -1.8852063770808749 -3.2600000000000025 171.03978439944427 ;
	setAttr ".ed" 1;
	setAttr ".pt" 8;
	setAttr ".sz" 2.6737967555854407;
	setAttr ".ra" 0.37433156371116638;
	setAttr ".sd" 8.8000001907348633;
	setAttr ".ptx" 5.4000000953674316;
	setAttr ".ptz" -3.7000000476837158;
createNode transform -n "World_grp_FAC_EDC";
	setAttr ".rp" -type "double3" 0 0 56.021348829266536 ;
	setAttr ".sp" -type "double3" 0 0 56.021348829266536 ;
createNode transform -n "ZERO_grp_surfaces" -p "World_grp_FAC_EDC";
createNode transform -n "grp_surf_headTop" -p "ZERO_grp_surfaces";
	setAttr ".rp" -type "double3" -2.3200000000000029 -1.2612133559741776e-015 58.660000000000025 ;
	setAttr ".sp" -type "double3" -2.3200000000000029 -1.2612133559741776e-015 58.660000000000025 ;
createNode transform -n "surf_L_brow" -p "grp_surf_headTop";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" -3.7747582837255316e-014 -3.3750779948604759e-014 
		1.4210854715202004e-014 ;
	setAttr ".sp" -type "double3" -3.7747582837255316e-014 -3.3750779948604759e-014 
		1.4210854715202004e-014 ;
createNode nurbsSurface -n "surf_L_browShape" -p "surf_L_brow";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		2 -0.1599999999999997 57.299999999999997
		2 0.64999999999999991 57.299999999999997
		2 2 57.299999999999997
		2 3.4299999999999997 57.299999999999997
		2 4.4799999999999995 57.299999999999997
		2 4.8999999999999995 57.299999999999997
		2 -0.1599999999999997 57.700000000000003
		2 0.64999999999999991 57.700000000000003
		2 2 57.700000000000003
		2 3.4299999999999997 57.700000000000003
		2 4.4799999999999995 57.700000000000003
		2 4.8999999999999995 57.700000000000003
		2 -0.1599999999999997 58.729999999999997
		2 0.64999999999999991 58.729999999999997
		2 2 58.729999999999997
		2 3.4299999999999997 58.729999999999997
		2 4.4799999999999995 58.729999999999997
		2 4.8999999999999995 58.729999999999997
		2 -0.1599999999999997 59.959999999999994
		2 0.64999999999999991 59.959999999999994
		2 2 59.959999999999994
		2 3.4299999999999997 59.959999999999994
		2 4.4799999999999995 59.959999999999994
		2 4.8999999999999995 59.959999999999994
		2 -0.1599999999999997 60.950000000000003
		2 0.64999999999999991 60.950000000000003
		2 2 60.950000000000003
		2 3.4299999999999997 60.950000000000003
		2 4.4799999999999995 60.950000000000003
		2 4.8999999999999995 60.950000000000003
		2 -0.1599999999999997 61.43
		2 0.64999999999999991 61.43
		2 2 61.43
		2 3.4299999999999997 61.43
		2 4.4799999999999995 61.43
		2 4.8999999999999995 61.43
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_L_brow_parentConstraint1" -p "surf_L_brow";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_browW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -1.3421195755851896 -3.3316467375787968 -58.798016679124359 ;
	setAttr ".tg[0].tor" -type "double3" -1.8606244886561581e-013 3.4986101496098599e-014 
		1.991027230596161e-014 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" -6.3108872417680986e-030 -8.8817841970012523e-016 
		0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_L_brow_scaleConstraint1" -p "surf_L_brow";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_browW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 0.999999999999999 0.99999999999999778 1 ;
	setAttr -k on ".w0";
createNode transform -n "surf_C_brow" -p "grp_surf_headTop";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" -0.34000000000003761 -3.4119373992780285e-014 -1.4210854715202004e-014 ;
	setAttr ".sp" -type "double3" -0.34000000000003761 -3.4119373992780285e-014 -1.4210854715202004e-014 ;
createNode nurbsSurface -n "surf_C_browShape" -p "surf_C_brow";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".op" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		1.8 0.79609616428285934 57.027584294962111
		1.8 0.62153990124128766 57.016740595102007
		1.8 0.27554625102026986 56.99383599080641
		1.8 -0.275259517605555 56.993805963538925
		1.8 -0.62145927358661091 57.016728367503909
		1.8 -0.79611388251321469 57.027576694561709
		1.8 0.7858510739507959 57.445026104113438
		1.8 0.61418975922219987 57.437421140699612
		1.8 0.27438282063938468 57.42135031407166
		1.8 -0.27201075393933039 57.421406959412643
		1.8 -0.61375899826138181 57.437444213726735
		1.8 -0.786340243854456 57.445040447590841
		1.8 0.84262170880541165 58.252492183369711
		1.8 0.65379090307086729 58.255262485160799
		1.8 0.27787731602520271 58.261115469301821
		1.8 -0.2980419466300166 58.261072313222954
		1.8 -0.66209283813678788 58.255244889390831
		1.8 -0.84530452439083459 58.252481239775911
		1.8 1.0359395027488991 59.421269350151455
		1.8 0.80067936021755581 59.438288702619325
		1.8 0.32984072101960005 59.474268076501609
		1.8 -0.36550945860763306 59.473517116045649
		1.8 -0.82040113503436862 59.437982017944535
		1.8 -1.0481096555084273 59.421078462019274
		1.8 1.1329544549414481 60.161070451706586
		1.8 0.8909849734121098 60.185970349780469
		1.8 0.40928625983654049 60.238092806793013
		1.8 -0.36027374508892546 60.240784245450669
		1.8 -0.89211535942872655 60.187069805266205
		1.8 -1.1578411663410526 60.161754867946392
		1.8 1.1810785969348647 60.478375011497334
		1.8 0.92324747029276444 60.506877315333064
		1.8 0.40941106790176063 60.566671945134843
		1.8 -0.39459082272091323 60.568576189991688
		1.8 -0.93873113631980321 60.507655687086142
		1.8 -1.2109231184816356 60.478859694369895
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_C_brow_parentConstraint1" -p "surf_C_brow";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_C_browW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -2.7300000000000386 -3.3172353752774947e-014 
		-59.249999999999993 ;
	setAttr ".tg[0].tor" -type "double3" 0 0 1.4124500153760544e-030 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" 4.4408920985006262e-016 -6.3108872417680986e-030 
		0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_C_brow_scaleConstraint1" -p "surf_C_brow";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_C_browW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 0.999999999999999 0.99999999999999778 1 ;
	setAttr -k on ".w0";
createNode transform -n "ZERO_grp_eyeRoot" -p "grp_surf_headTop";
	setAttr ".rp" -type "double3" -1.0133015316582663 2.4122148480648606 57.367245513261757 ;
	setAttr ".sp" -type "double3" -1.0133015316582663 2.4122148480648606 57.367245513261757 ;
createNode transform -n "grp_eyeRoot" -p "ZERO_grp_eyeRoot";
	setAttr ".t" -type "double3" 0 0 7.1054273576010019e-015 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1 ;
	setAttr ".rp" -type "double3" -1.0133015316582663 2.4122148480648606 57.367245513261757 ;
	setAttr ".sp" -type "double3" -1.0133015316582663 2.4122148480648615 57.367245513261757 ;
	setAttr ".spt" -type "double3" 0 -8.8817841970012484e-016 0 ;
createNode transform -n "surf_L_lidLow" -p "grp_eyeRoot";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" -0.5900000000000396 -3.4638958368304897e-014 0 ;
	setAttr ".sp" -type "double3" -0.5900000000000396 -3.4638958368304884e-014 0 ;
	setAttr ".spt" -type "double3" 0 -1.2621774483536194e-029 0 ;
createNode nurbsSurface -n "surf_L_lidLowShape" -p "surf_L_lidLow";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		1.3441138198218248 0.94898302873282991 56.25289038912755
		1.5561337362904355 1.4610624074990337 55.741672888444761
		1.4742195414292094 2.850872490475552 55.546366265940755
		0.56737370963192135 4.783940471716015 55.611517073543666
		-0.80930306949606412 4.9890751237242776 56.146188070156022
		-1.28947295802555 5.2932751851759248 56.470419212421596
		1.3450958453207449 0.94678966985474555 56.351865426386695
		1.5822701651231024 1.4929492702118037 55.959556885943904
		1.5376938613741955 2.8661277267416407 55.802450674601957
		0.55276229427522683 4.7157326678347324 55.830659369253581
		-0.74283890584566981 4.9939502773647506 56.262757524243611
		-1.2645146701631751 5.2831835212393372 56.535661092364315
		1.3474727586728936 0.94354503159132108 56.547794407714377
		1.6374363704287418 1.5625504279254492 56.396838277668685
		1.6686025616613207 2.8992015372811895 56.320182096919872
		0.51625304031816732 4.5712109594577157 56.267714627899089
		-0.60580619294391924 5.0040903418986202 56.494890674175785
		-1.2148930213481468 5.2626112464667703 56.664159228369968
		1.3326408489476116 0.89907963526558565 56.891566071091077
		1.6562179764592313 1.5413477780109668 56.964600212078437
		1.7693340374397433 2.8862900926207016 56.953924401855645
		0.51429348832737976 4.4938289319932299 56.881280087216304
		-0.50949855055696147 5.0120784228807977 56.871853933930659
		-1.1453128146352036 5.2474284700929941 56.904836364313283
		1.3055853546041631 0.83782496234767867 57.148288994419509
		1.6397673071343335 1.4734051895905549 57.251041046417065
		1.7854738375439847 2.843789038741749 57.292775983012419
		0.66168839728469653 4.5917925034227789 57.205339281286243
		-0.51240292424746481 5.0154624665568059 57.142411977863262
		-1.1119635052830357 5.2511513411948476 57.090837666935037
		1.2926257132999073 0.80815316600168241 57.276061162100042
		1.6319799532472783 1.4401397515029857 57.397474253575403
		1.7945839416128253 2.8232456550201697 57.46412783533475
		0.73418948015060415 4.6384461478709316 57.370957125355098
		-0.51222474898287451 5.0171373997909221 57.277182697530009
		-1.0947131676925437 5.2525679042514106 57.183317888959081
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_L_lidLow_parentConstraint1" -p "surf_L_lidLow";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_lid_lowW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -1.9100000000000397 -2.9679165751492165 -56.247459891898615 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" -2.2204460492503131e-016 -4.4408920985006262e-016 
		-7.1054273576010019e-015 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_L_lidLow_scaleConstraint1" -p "surf_L_lidLow";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_lid_lowW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 0.999999999999999 0.99999999999999778 1 ;
	setAttr -k on ".w0";
createNode transform -n "surf_L_lidCenter" -p "grp_eyeRoot";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" -3.730349362740526e-014 -3.2418512319054584e-014 2.1316282072803009e-014 ;
	setAttr ".sp" -type "double3" -3.730349362740526e-014 -3.2418512319054571e-014 2.1316282072803009e-014 ;
	setAttr ".spt" -type "double3" 0 -1.2621774483536194e-029 0 ;
createNode nurbsSurface -n "surf_L_lidCenterShape" -p "surf_L_lidCenter";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		1.3914888537335677 0.8877322891300885 56.08944210796988
		1.5245876213708964 1.4962473101659175 56.094974540215688
		1.6001866444852304 2.974889590567185 56.148789575862338
		0.80377805574139805 4.2882035767137712 56.13923811233213
		-0.046755649609046046 4.8532736271042678 56.249665742836321
		-0.61728386517247291 4.994581382143112 56.312315942272448
		1.408860049508375 0.88773228913008828 56.252797044881099
		1.541958817145705 1.4962473101659175 56.2583294771269
		1.6175578402600339 2.9748895905671855 56.31214451277355
		0.82114925151619933 4.2882035767137712 56.302593049243349
		-0.029384453834243093 4.853273627104266 56.413020679747483
		-0.59991266939766485 4.994581382143112 56.475670879183667
		1.4437558788824398 0.8877322891300885 56.580949814544283
		1.5768546465197777 1.4962473101659206 56.586482246790212
		1.6524536696341037 2.9748895905671864 56.640297282436791
		0.85604508089026721 4.2882035767137712 56.63074581890654
		0.0055113755398248643 4.8532736271042678 56.741173449410717
		-0.5650168400235972 4.9945813821431138 56.803823648846915
		1.4917266449464706 0.88773228913008795 57.03205643757466
		1.6248254125838082 1.4962473101659215 57.037588869820581
		1.7004244356981353 2.9748895905671855 57.091403905467175
		0.90401584695430148 4.2882035767137712 57.081852441936931
		0.053482141603855518 4.8532736271042696 57.1922800724411
		-0.51704607395956714 4.9945813821431155 57.254930271877264
		1.5207918369911078 0.88773228913008795 57.305379165285203
		1.6538906046284407 1.4962473101659166 57.310911597531089
		1.7294896277427716 2.9748895905671828 57.364726633177696
		0.93308103899893891 4.2882035767137712 57.355175169647509
		0.082547333648492496 4.853273627104266 57.46560280015165
		-0.48798088191492733 4.994581382143112 57.528252999587842
		1.5354011519256616 0.88773228913008795 57.442761977060954
		1.6684999195629906 1.4962473101659175 57.448294409306783
		1.7440989426773239 2.9748895905671828 57.502109444953426
		0.94769035393348677 4.2882035767137729 57.492557981423211
		0.097156648583046443 4.8532736271042678 57.602985611927394
		-0.47337156698037774 4.994581382143112 57.665635811363551
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_L_lidCenter_parentConstraint1" -p "surf_L_lidCenter";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_lid_centerW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -2.0000000000000395 -2.8000000000000278 -56.900532954998177 ;
	setAttr ".tg[0].tor" -type "double3" 0 4.071109992273305e-013 0 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" 0 -4.4408920985006262e-016 -3.1554436208840493e-030 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_L_lidCenter_scaleConstraint1" -p "surf_L_lidCenter";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_lid_centerW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 0.999999999999999 0.99999999999999778 1 ;
	setAttr -k on ".w0";
createNode transform -n "surf_L_lidUp" -p "grp_eyeRoot";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" -3.7525538232330285e-014 -3.3750779948604771e-014 
		7.1054273576010019e-015 ;
	setAttr ".sp" -type "double3" -3.7525538232330285e-014 -3.3750779948604759e-014 
		7.1054273576010019e-015 ;
	setAttr ".spt" -type "double3" 0 -1.2621774483536194e-029 0 ;
createNode nurbsSurface -n "surf_L_lidUpShape" -p "surf_L_lidUp";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		1.4190597552272175 1.0708032174134434 56.62379652029032
		1.4305005869251153 1.528214321795083 56.24879367645346
		1.9632945925406944 2.7802113511572193 56.095409005403752
		0.8779936118727929 4.6483012102829218 56.14500768730349
		-0.26034417828352047 4.8138746791927831 56.477490649443389
		-0.61703804229371284 5.0865808621665414 56.723094948310845
		1.4066818576073363 1.0297200501970498 56.78465701092361
		1.4471235970333445 1.5236570693603717 56.524570879100239
		2.0378065684720985 2.7755823612098465 56.411742854050765
		0.94083446544290927 4.6319257748011413 56.439285784181259
		-0.27580399690077867 4.8625844328114187 56.728442882756774
		-0.65620076732468668 5.1192903721037801 56.897551303592969
		1.3763496300397824 0.94409468811036434 57.101140066194667
		1.4790712782727449 1.5135577017216406 57.077583675408583
		2.1921756870510483 2.7668562609771472 57.039864555301079
		1.0695732493118539 4.5999139683348123 57.026460297457618
		-0.23716014650435249 4.9105871993499655 57.09663437012177
		-0.6682656513067784 5.1351244172494344 57.110845738536845
		1.373547109996534 0.94996726861849023 57.676674776899809
		1.4804948263538689 1.5163554257607306 57.881084772291921
		2.1845160367620329 2.7452224641425493 58.0259525070758
		1.0640960864978997 4.5349996004303197 57.883350539054113
		-0.16303017822692853 4.9389583877835479 57.681486487140319
		-0.59657109713207668 5.1368980098707206 57.530340687687627
		1.3142010380872753 1.0698400527841994 58.091732347449337
		1.3887053460460617 1.5227010846137921 58.410901424275558
		1.9556984065061376 2.7299937971632202 58.649281593295179
		0.84564256720675468 4.4835397342715382 58.391930108628415
		-0.11974427932692658 4.8921789064054559 58.09612100729057
		-0.52098538182312804 5.0992905742761137 57.88877707082478
		1.2880797405160636 1.1260981127399925 58.299286029530307
		1.3467160164740362 1.5259335815699315 58.675690979610643
		1.8487008698315528 2.7222846440200863 58.96334525587514
		0.7440239087536723 4.4579520599880809 58.648979021647335
		-0.090247315962500935 4.8713688539541158 58.341551673608151
		-0.4758714850257264 5.0820627468058701 58.10446397693601
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_L_lidUp_parentConstraint1" -p "surf_L_lidUp";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_lid_upW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -1.1969267058644348 -3.4545698087224643 -57.557830576426809 ;
	setAttr ".tg[0].tor" -type "double3" 1.8250022762237657e-013 2.0355549961366525e-013 
		0 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" -6.3108872417680986e-030 4.4408920985006262e-016 
		-7.1054273576010019e-015 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_L_lidUp_scaleConstraint1" -p "surf_L_lidUp";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_lid_upW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 0.999999999999999 0.99999999999999778 1 ;
	setAttr -k on ".w0";
createNode transform -n "grp_surf_headMid" -p "ZERO_grp_surfaces";
	setAttr ".rp" -type "double3" -2.3200000000000029 1.0702549957386518e-015 57.610000000000021 ;
	setAttr ".sp" -type "double3" -2.3200000000000029 1.0702549957386518e-015 57.610000000000021 ;
createNode transform -n "ZERO_grp_surf_muzzleSubB" -p "grp_surf_headMid";
	setAttr ".rp" -type "double3" -0.63000000000000234 1.3988810110276987e-016 55.000000000000036 ;
	setAttr ".sp" -type "double3" -0.63000000000000234 1.3988810110276987e-016 55.000000000000036 ;
createNode transform -n "grp_surf_muzzleSubB" -p "ZERO_grp_surf_muzzleSubB";
	setAttr ".rp" -type "double3" -0.63000000000000234 1.3988810110276987e-016 55.000000000000036 ;
	setAttr ".sp" -type "double3" -0.63000000000000234 1.3988810110276987e-016 55.000000000000036 ;
createNode transform -n "surf_L_nasal" -p "grp_surf_muzzleSubB";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" -0.63397225452982497 0.2874046784885933 1.0674558237953278 ;
	setAttr ".sp" -type "double3" -0.63397225452982497 0.2874046784885933 1.0674558237953278 ;
createNode nurbsSurface -n "surf_L_nasalShape" -p "surf_L_nasal";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		1.6809132623364824 1.8578530998973364 54.842035972360563
		1.6422067108575191 1.9372842921904616 54.870225614212835
		1.5647936078995908 2.0961466767767289 54.926604897917237
		1.4486739534627029 2.3344402536561266 55.011173823473918
		1.3712608505047708 2.4933026382423851 55.067553107178384
		1.3325542990258077 2.572733830535511 55.095742749030642
		1.7319549322296683 1.7398970361778832 55.107052532474256
		1.6949821831970844 1.8187712735891279 55.13604011983989
		1.6210366851319236 1.9765197484116237 55.194015294571187
		1.5101184380341806 2.2131424606453747 55.280978056668111
		1.4361729399690162 2.3708909354678829 55.33895323139928
		1.3992001909364358 2.4497651728791356 55.367940818764879
		1.8263191824627401 1.4195439154607428 55.677986965457578
		1.7916647008118558 1.4952102491337351 55.707674398007498
		1.7223557375100833 1.6465429164797305 55.767049263107211
		1.6183922925574341 1.873541917498734 55.856111560756887
		1.5490833292556638 2.0248745848447181 55.915486425856685
		1.5144288476047774 2.1005409185177273 55.945173858406477
		1.9925486764950848 0.92269588202208974 56.482831578166113
		1.9448989826055072 0.99227594695740018 56.520441797771639
		1.8495995948263573 1.1314360768279836 56.595662236982839
		1.7066505131576359 1.3401762716338712 56.708492895799566
		1.611351125378486 1.4793364015044559 56.783713335010766
		1.5637014314889128 1.5489164664397592 56.82132355461632
		1.864588780381802 0.63361648427490125 57.091482742511758
		1.8181123586328969 0.70864745024876274 57.110919859944126
		1.7251595151350914 0.85870938219648629 57.14979409480889
		1.585730249888379 1.0838022801180729 57.208105447106036
		1.4927774063905666 1.2338642120657957 57.246979681970792
		1.4463009846416619 1.3088951780396585 57.266416799403167
		1.7710120521586119 0.49686649149544154 57.333208502742274
		1.729283753443984 0.56868676881346536 57.353928730513665
		1.6458271560147304 0.71232732344951355 57.395369186056477
		1.5206422598708511 0.92778815540358661 57.457529869370681
		1.4371856624415953 1.0714287100396342 57.498970324913479
		1.3954573637269696 1.1432489873576586 57.519690552684885
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_L_nasal_parentConstraint1" -p "surf_L_nasal";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_nasalW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -3.0164684426792898 -1.3756086222895931 -55.375771729866166 ;
	setAttr ".tg[0].tor" -type "double3" 0 -1.7884258973869377e-013 -3.8166656177562658e-016 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" 2.2204460492503131e-016 0 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_L_nasal_scaleConstraint1" -p "surf_L_nasal";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_nasalW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 0.999999999999999 0.99999999999999778 1 ;
	setAttr -k on ".w0";
createNode transform -n "surf_L_zygo" -p "grp_surf_muzzleSubB";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" -0.56000000000000227 11.812443197322771 1.0180426431782481 ;
	setAttr ".sp" -type "double3" -0.56000000000000227 11.812443197322771 1.0180426431782481 ;
createNode nurbsSurface -n "surf_L_zygoShape" -p "surf_L_zygo";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333337 0.66666666666666674 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		2 2.8753967868124137 54.664793291687175
		2 3.0854993850682235 54.664793291687175
		2 3.5016641469979963 54.664793291687175
		2 4.1844975913293645 54.664793291687175
		2 4.5642984420225581 54.664793291687175
		2 4.7946032131875764 54.664793291687175
		2 2.8753967868124137 54.931461974088762
		2 3.0854993850682235 54.931461974088762
		2 3.5016641469979963 54.931461974088762
		2 4.1844975913293645 54.931461974088762
		2 4.5642984420225581 54.931461974088762
		2 4.7946032131875764 54.931461974088762
		2 2.8753967868124137 55.169847614417485
		2 3.0854993850682235 55.169847614417485
		2 3.5016641469979963 55.169847614417485
		2 4.1844975913293645 55.169847614417485
		2 4.5642984420225581 55.169847614417485
		2 4.7946032131875764 55.169847614417485
		2 2.8753967868124137 55.476920642637509
		2 3.0854993850682235 55.476920642637509
		2 3.5016641469979963 55.476920642637509
		2 4.1844975913293645 55.476920642637509
		2 4.5642984420225581 55.476920642637509
		2 4.7946032131875764 55.476920642637509
		2 2.8753967868124137 55.763791497948333
		2 3.0854993850682235 55.763791497948333
		2 3.5016641469979963 55.763791497948333
		2 4.1844975913293645 55.763791497948333
		2 4.5642984420225581 55.763791497948333
		2 4.7946032131875764 55.763791497948333
		2 2.8753967868124137 55.905206708312832
		2 3.0854993850682235 55.905206708312832
		2 3.5016641469979963 55.905206708312832
		2 4.1844975913293645 55.905206708312832
		2 4.5642984420225581 55.905206708312832
		2 4.7946032131875764 55.905206708312832
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_L_zygo_parentConstraint1" -p "surf_L_zygo";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_zygoW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -2.0939373381647566 7.994836614883317 -54.824302110575751 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" -4.4408920985006262e-016 0 -2.1538326677728037e-014 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_L_zygo_scaleConstraint1" -p "surf_L_zygo";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_zygoW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 0.999999999999999 0.99999999999999845 1 ;
	setAttr -k on ".w0";
createNode transform -n "grp_surf_headBtm" -p "ZERO_grp_surfaces";
	setAttr ".rp" -type "double3" -2.3200000000000029 1.0702549957386518e-015 56.620000000000026 ;
	setAttr ".sp" -type "double3" -2.3200000000000029 1.0702549957386518e-015 56.620000000000026 ;
createNode transform -n "surf_L_cheek" -p "grp_surf_headBtm";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" 2.9420910152566648e-015 -6.2172489379008766e-015 0.53000000000000824 ;
	setAttr ".sp" -type "double3" 2.9420910152566648e-015 -6.2172489379008766e-015 0.53000000000000824 ;
createNode nurbsSurface -n "surf_L_cheekShape" -p "surf_L_cheek";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333337 0.66666666666666674 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		1 3.5939135213988376 52.863457035503728
		1 3.7601688576103296 52.863457035503728
		1 4.0977175705245656 52.863457035503728
		1 4.7728149963530422 52.863457035503728
		1 4.9995268184596187 52.863457035503728
		1 5.2060864786011667 52.863457035503728
		1 3.5939135213988376 53.075054736136536
		1 3.7601688576103296 53.075054736136536
		1 4.0977175705245656 53.075054736136536
		1 4.7728149963530422 53.075054736136536
		1 4.9995268184596187 53.075054736136536
		1 5.2060864786011667 53.075054736136536
		1 3.5939135213988376 53.367261084629483
		1 3.7601688576103296 53.367261084629483
		1 4.0977175705245656 53.367261084629483
		1 4.7728149963530422 53.367261084629483
		1 4.9995268184596187 53.367261084629483
		1 5.2060864786011667 53.367261084629483
		1 3.5939135213988376 53.871065133755209
		1 3.7601688576103296 53.871065133755209
		1 4.0977175705245656 53.871065133755209
		1 4.7728149963530422 53.871065133755209
		1 4.9995268184596187 53.871065133755209
		1 5.2060864786011667 53.871065133755209
		1 3.5939135213988376 54.274108373055739
		1 3.7601688576103296 54.274108373055739
		1 4.0977175705245656 54.274108373055739
		1 4.7728149963530422 54.274108373055739
		1 4.9995268184596187 54.274108373055739
		1 5.2060864786011667 54.274108373055739
		1 3.5939135213988376 54.596542964496223
		1 3.7601688576103296 54.596542964496223
		1 4.0977175705245656 54.596542964496223
		1 4.7728149963530422 54.596542964496223
		1 4.9995268184596187 54.596542964496223
		1 5.2060864786011667 54.596542964496223
		
		;
	setAttr ".info" -type "string" "";
createNode nurbsSurface -n "surf_L_cheekShapeOrig" -p "surf_L_cheek";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333337 0.66666666666666674 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		3.3077137252140618 -0.42532885661508529 -3.3826648956405325
		3.4282963163122955 -0.40889562529900458 -3.3926634457980271
		3.6633576001023278 -0.38256110585772479 -3.4124925565058737
		4.0763113999307903 -0.14947257218883928 -3.4363499865695561
		4.3078606000715425 0.14046863553541292 -3.440438536214439
		4.4267795725990666 0.28176819288026944 -3.4429810311315832
		3.4286867948994719 -0.61443579716842711 -3.1477818842076775
		3.5650089603464696 -0.57503990889273238 -3.1526649626384509
		3.8335824952512079 -0.50311075974915431 -3.1624781711974723
		4.2590735417986627 -0.20613718812914669 -3.1722916703782902
		4.4887716637242177 0.11308864275035746 -3.1729269363989463
		4.6066791598652923 0.26962506447991175 -3.1734625683641813
		3.5784470093027054 -0.89423924252532483 -2.5872834878393873
		3.7337856780816505 -0.82210990798721995 -2.5851165702315302
		4.0427890802701487 -0.68486930903960375 -2.5808637457356789
		4.4821542584176335 -0.30063102984845474 -2.5737015998333561
		4.7058477959052949 0.058447353257534848 -2.5695331349783475
		4.8207765287733215 0.23565774344960519 -2.5674061772003656
		3.8059155918738834 -1.1991536228653816 -1.7031247922017207
		3.9739203528650529 -1.0800422897543929 -1.692416603204808
		4.3108510375496243 -0.84825692740436387 -1.6708427380286308
		4.742012581845243 -0.35063876843296427 -1.6463121420521876
		4.9444868399939734 0.05628001161337113 -1.6376494652298967
		5.0488017147313284 0.25834927942261005 -1.6330571022953533
		3.8339554748797382 -1.2885674706413917 -1.0602304368263451
		3.9981145822741193 -1.1563626992703839 -1.048005489168552
		4.3278546962046356 -0.89789066782793636 -1.0232917217033095
		4.7408238612379741 -0.37411963625673195 -0.99673816357690381
		4.9313077285679841 0.041254297481331213 -0.9882629559060786
		5.0295033507305522 0.24778102257131507 -0.98372995762459026
		3.8516500515824976 -1.3089354053604334 -0.74305880874411467
		4.0108566102225156 -1.1704158552258306 -0.73048200549217812
		4.3309006251123545 -0.89894316886865588 -0.7050204121977347
		4.7278953907954895 -0.36475264059187706 -0.67851602870566785
		4.9101228069848144 0.052618539082257526 -0.67079036350183219
		5.0040478188719595 0.26024790184068292 -0.66661478934544716
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_L_cheek_parentConstraint1" -p "surf_L_cheek";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_cheekW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -0.31990298391036881 -4.4922984326475861 -54.431959850392957 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" 5.5511151231257827e-017 0 7.1054273576010019e-015 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_L_cheek_scaleConstraint1" -p "surf_L_cheek";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_cheekW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 0.999999999999999 0.99999999999999867 1 ;
	setAttr -k on ".w0";
createNode transform -n "ZERO_grp_surf_muzzleSubA" -p "grp_surf_headBtm";
	setAttr ".rp" -type "double3" -0.63000000000000234 1.3988810110276987e-016 55.000000000000036 ;
	setAttr ".sp" -type "double3" -0.63000000000000234 1.3988810110276987e-016 55.000000000000036 ;
createNode transform -n "grp_surf_muzzleSubA" -p "ZERO_grp_surf_muzzleSubA";
	setAttr ".rp" -type "double3" -0.63000000000000234 1.3988810110276987e-016 55.000000000000036 ;
	setAttr ".sp" -type "double3" -0.63000000000000234 1.3988810110276987e-016 55.000000000000036 ;
createNode transform -n "surf_L_mouthUp" -p "grp_surf_muzzleSubA";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" -0.28999999999999782 -7.1054273576010019e-015 0.53999999999999915 ;
	setAttr ".sp" -type "double3" -0.28999999999999782 -7.1054273576010019e-015 0.53999999999999915 ;
createNode nurbsSurface -n "surf_L_mouthUpShape" -p "surf_L_mouthUp";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		1 0.76018878427547532 53.775478535531633
		1 1.1284683949372258 53.775478535531633
		1 1.5785879190793659 53.775478535531633
		1 2.5095169349187909 53.775478535531633
		1 2.9698664482459782 53.775478535531633
		1 3.1898112157245242 53.775478535531633
		1 0.76018878427547554 54.031228265157871
		1 1.1284683949372258 54.031228265157871
		1 1.5785879190793659 54.031228265157871
		1 2.5095169349187909 54.031228265157871
		1 2.9698664482459782 54.031228265157871
		1 3.1898112157245242 54.031228265157871
		1 0.76018878427547532 54.711522545963589
		1 1.1284683949372258 54.711522545963589
		1 1.5785879190793659 54.711522545963589
		1 2.5095169349187909 54.711522545963589
		1 2.9698664482459782 54.711522545963589
		1 3.1898112157245242 54.711522545963589
		1 0.76018878427547532 55.054227183662725
		1 1.1284683949372258 55.054227183662725
		1 1.5785879190793659 55.054227183662725
		1 2.5095169349187909 55.054227183662725
		1 2.9698664482459782 55.054227183662725
		1 3.1898112157245242 55.054227183662725
		1 0.76018878427547532 55.483886729434765
		1 1.1284683949372258 55.483886729434765
		1 1.5785879190793659 55.483886729434765
		1 2.5095169349187909 55.483886729434765
		1 2.9698664482459782 55.483886729434765
		1 3.1898112157245242 55.483886729434765
		1 0.76018878427547532 55.734521464468457
		1 1.1284683949372258 55.734521464468457
		1 1.5785879190793659 55.734521464468457
		1 2.5095169349187909 55.734521464468457
		1 2.9698664482459782 55.734521464468457
		1 3.1898112157245242 55.734521464468457
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_L_mouthUp_parentConstraint1" -p "surf_L_mouthUp";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_mouth_upW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -2.5554768193444244 -1.2842126570550485 -54.177275730748995 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" -4.4408920985006262e-016 -2.2204460492503131e-016 
		-7.1054273576010019e-015 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_L_mouthUp_scaleConstraint1" -p "surf_L_mouthUp";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_mouth_upW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 1 0.99999999999999956 1 ;
	setAttr -k on ".w0";
createNode transform -n "surf_C_mouthUp" -p "grp_surf_muzzleSubA";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" -0.37999999999999634 -6.1328719880293579e-015 0.49000000000000199 ;
	setAttr ".sp" -type "double3" -0.37999999999999634 -6.1328719880293579e-015 0.49000000000000199 ;
createNode nurbsSurface -n "surf_C_mouthUpShape" -p "surf_C_mouthUp";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".op" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		1.6665221457781707 0.78006754544562651 53.505483578055994
		1.6665221457781692 0.60671920201326601 53.505483578055994
		1.6665221457781718 0.2600225151485428 53.505483578055994
		1.6665221457781692 -0.26002251514853991 53.50548357805598
		1.6665221457781685 -0.60671920201326068 53.505483578055994
		1.6665221457781692 -0.78006754544562251 53.505483578055994
		1.7360069722235414 0.77073018158399764 53.626764109569805
		1.7360069722235405 0.59945680789866518 53.626764109569805
		1.7360069722235432 0.25691006052800136 53.626764109569805
		1.7360069722235425 -0.2569100605279967 53.626764109569805
		1.7360069722235414 -0.59945680789866118 53.626764109569805
		1.7360069722235405 -0.77073018158399387 53.626764109569805
		1.963731722177207 0.75355868887726196 53.892515961868163
		1.9637317221772064 0.5861012024600929 53.892515961868163
		1.9637317221772053 0.2511862296257546 53.892515961868163
		1.9637317221772088 -0.25118622962575182 53.892515961868163
		1.9637317221772053 -0.58610120246008934 53.892515961868163
		1.9637317221772064 -0.75355868887725919 53.892515961868163
		2.2085885668139413 0.72797466215474338 54.856448098628235
		2.2085885668139387 0.56620251500925134 54.856448098628192
		2.2085885668139431 0.24265822071827833 54.856448098628285
		2.2085885668139542 -0.24265822071818072 54.856448098628547
		2.2085885668139436 -0.56620251500916874 54.856448098628285
		2.2085885668139436 -0.72797466215465845 54.856448098628285
		2.1743350570977267 0.69637692191755884 55.139009890033975
		2.1743350570977267 0.5416264948247691 55.139009890033975
		2.174335057097724 0.23212564063918781 55.139009890033975
		2.174335057097728 -0.23212564063918431 55.139009890033961
		2.1743350570977262 -0.5416264948247651 55.139009890033975
		2.1743350570977262 -0.6963769219175564 55.139009890033961
		2.1687831844490262 0.65875428953755866 55.278453614859359
		2.1687831844490244 0.51236444741810105 55.278453614859359
		2.1687831844490253 0.2195847631791876 55.278453614859359
		2.1687831844490271 -0.21958476317918368 55.278453614859359
		2.1687831844490248 -0.5123644474180975 55.278453614859359
		2.1687831844490257 -0.65875428953755444 55.278453614859359
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_C_mouthUp_parentConstraint1" -p "surf_C_mouthUp";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_C_mouth_upW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -2.6876272792126064 -5.4578563890572502e-015 
		-53.857647631316929 ;
	setAttr ".tg[0].tor" -type "double3" 0 0 1.4124500153760544e-030 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" 4.4408920985006262e-016 0 0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_C_mouthUp_scaleConstraint1" -p "surf_C_mouthUp";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_C_mouth_upW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 0.999999999999999 0.99999999999999778 1 ;
	setAttr -k on ".w0";
createNode transform -n "ZERO_grp_surf_jawSubA" -p "grp_surf_muzzleSubA";
	setAttr ".rp" -type "double3" -3.2600000000000025 7.2386541205560044e-016 57.190000000000047 ;
	setAttr ".sp" -type "double3" -3.2600000000000025 7.2386541205560044e-016 57.190000000000047 ;
createNode transform -n "grp_surf_jawSubA" -p "ZERO_grp_surf_jawSubA";
	setAttr ".rp" -type "double3" -3.2600000000000025 7.2386541205560044e-016 57.190000000000047 ;
	setAttr ".sp" -type "double3" -3.2600000000000025 7.2386541205560044e-016 57.190000000000047 ;
createNode transform -n "surf_C_mouthLow" -p "grp_surf_jawSubA";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" -0.47999999999999776 -6.110667527536856e-015 0.51999999999999602 ;
	setAttr ".sp" -type "double3" -0.47999999999999776 -6.110667527536856e-015 0.51999999999999602 ;
createNode nurbsSurface -n "surf_C_mouthLowShape" -p "surf_C_mouthLow";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".op" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		1.2000183385654599 0.7800675448729375 52.495560915954115
		1.2000183385654599 0.60671920144057578 52.495560915954115
		1.2000183385654619 0.26002251457585385 52.495560915954123
		1.2000183385654619 -0.26002251572122975 52.495560915954115
		1.2000183385654619 -0.60671920258595091 52.495560915954123
		1.2000183385654628 -0.78006754601831252 52.49556091595413
		1.2830575182726571 0.77073018101130908 52.607995799615637
		1.283057518272656 0.59945680732597639 52.607995799615637
		1.283057518272654 0.25691005995531108 52.60799579961563
		1.2830575182726578 -0.25691006110068609 52.607995799615637
		1.2830575182726569 -0.59945680847135063 52.607995799615637
		1.2830575182726589 -0.77073018215668421 52.607995799615637
		1.4581135890634858 0.75355868830457506 52.839655126198217
		1.4581135890634866 0.58610120188740511 52.839655126198203
		1.4581135890634891 0.25118622905306698 52.839655126198217
		1.4581135890634884 -0.25118623019844033 52.839655126198217
		1.4581135890634862 -0.58610120303277868 52.839655126198203
		1.4581135890634838 -0.75355868944994853 52.839655126198203
		1.9567285225267517 0.72797466158200652 53.892256369075113
		1.9567285225267508 0.56620251443651948 53.892256369075113
		1.9567285225267499 0.24265822014554633 53.892256369075099
		1.9567285225267528 -0.24265822129091405 53.892256369075099
		1.9567285225267528 -0.56620251558188706 53.892256369075099
		1.9567285225267528 -0.72797466272737388 53.892256369075099
		1.9815570926352359 0.69637692134487517 54.175801799292557
		1.9815570926352359 0.54162649425208476 54.175801799292557
		1.9815570926352384 0.23212564006650327 54.175801799292557
		1.9815570926352384 -0.23212564121186929 54.175801799292557
		1.9815570926352359 -0.54162649539745056 54.175801799292557
		1.9815570926352373 -0.6963769224902423 54.175801799292557
		2.0049174829938989 0.65875428896491139 54.313386928741934
		2.0049174829939016 0.51236444684545557 54.313386928742005
		2.004917482993898 0.21958476260653548 54.313386928741949
		2.0049174829938998 -0.21958476375184244 54.313386928741977
		2.0049174829938972 -0.51236444799076253 54.313386928741934
		2.0049174829939003 -0.6587542901102208 54.313386928741977
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_C_mouthLow_parentConstraint1" -p "surf_C_mouthLow";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_C_mouth_lowW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -2.3791074816102169 -6.2677640855213045e-015 
		-52.799999999999955 ;
	setAttr ".tg[0].tor" -type "double3" 0 1.6793328718127387e-013 1.5748817671442993e-030 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" -2.2204460492503131e-016 -7.8886090522101303e-031 
		0 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_C_mouthLow_scaleConstraint1" -p "surf_C_mouthLow";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_C_mouth_lowW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 0.999999999999999 0.99999999999999778 1 ;
	setAttr -k on ".w0";
createNode transform -n "surf_L_chin" -p "grp_surf_jawSubA";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" -0.46999999999999553 0.53999999999999315 0.42999999999999966 ;
	setAttr ".sp" -type "double3" -0.46999999999999553 0.53999999999999315 0.42999999999999966 ;
createNode nurbsSurface -n "surf_L_chinShape" -p "surf_L_chin";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333337 0.66666666666666674 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		1 1.6125223169999381 51.499742886111065
		1 1.777794308888843 51.499742886111065
		1 1.9194560162221896 51.499742886111065
		1 2.3916617073333484 51.499742886111065
		1 2.7127615772889317 51.499742886111065
		1 2.8874776830000624 51.499742886111065
		1 1.6125223169999381 51.622516365799974
		1 1.777794308888843 51.622516365799974
		1 1.9194560162221896 51.622516365799974
		1 2.3916617073333484 51.622516365799974
		1 2.7127615772889317 51.622516365799974
		1 2.8874776830000624 51.622516365799974
		1 1.6125223169999381 51.924728008111117
		1 1.777794308888843 51.924728008111117
		1 1.9194560162221896 51.924728008111117
		1 2.3916617073333484 51.924728008111117
		1 2.7127615772889317 51.924728008111117
		1 2.8874776830000624 51.924728008111117
		1 1.6125223169999381 52.255271991888904
		1 1.777794308888843 52.255271991888904
		1 1.9194560162221896 52.255271991888904
		1 2.3916617073333484 52.255271991888904
		1 2.7127615772889317 52.255271991888904
		1 2.8874776830000624 52.255271991888904
		1 1.6125223169999381 52.524429235822289
		1 1.777794308888843 52.524429235822289
		1 1.9194560162221896 52.524429235822289
		1 2.3916617073333484 52.524429235822289
		1 2.7127615772889317 52.524429235822289
		1 2.8874776830000624 52.524429235822289
		1 1.6125223169999381 52.680257113888935
		1 1.777794308888843 52.680257113888935
		1 1.9194560162221896 52.680257113888935
		1 2.3916617073333484 52.680257113888935
		1 2.7127615772889317 52.680257113888935
		1 2.8874776830000624 52.680257113888935
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_L_chin_parentConstraint1" -p "surf_L_chin";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_chinW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -2.0682495051288838 -0.9808963144781182 -52.435572628310659 ;
	setAttr ".tg[0].tor" -type "double3" 0 0 -6.3611093629270422e-015 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" -4.4408920985006262e-016 -3.3306690738754696e-016 
		5.5511151231257827e-017 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_L_chin_scaleConstraint1" -p "surf_L_chin";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_chinW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 0.999999999999999 0.99999999999999778 1 ;
	setAttr -k on ".w0";
createNode transform -n "ZERO_grp_surf_jawSubB" -p "grp_surf_muzzleSubA";
	setAttr ".rp" -type "double3" -3.2600000000000025 7.2386541205560044e-016 57.190000000000047 ;
	setAttr ".sp" -type "double3" -3.2600000000000025 7.2386541205560044e-016 57.190000000000047 ;
createNode transform -n "grp_surf_jawSubB" -p "ZERO_grp_surf_jawSubB";
	setAttr ".rp" -type "double3" -3.2600000000000025 7.2386541205560044e-016 57.190000000000047 ;
	setAttr ".sp" -type "double3" -3.2600000000000025 7.2386541205560044e-016 57.190000000000047 ;
createNode transform -n "surf_L_mouthLow" -p "grp_surf_jawSubB";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" -5.5484129333646726 -4.6629367034256575e-015 0.57037195009389308 ;
	setAttr ".sp" -type "double3" -5.5484129333646726 -4.6629367034256575e-015 0.57037195009389308 ;
createNode nurbsSurface -n "surf_L_mouthLowShape" -p "surf_L_mouthLow";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		2 0.56976430621916496 52.442210494304874
		2 0.82770692548595604 52.442210494304874
		2 1.2857332776616068 52.442210494304874
		2 1.859477402553122 52.442210494304874
		2 2.3026095946268432 52.442210494304874
		2 2.6002356937808333 52.442210494304874
		2 0.56976430621916496 52.678139722920157
		2 0.82770692548595604 52.678139722920157
		2 1.2910370337714585 52.678139722920157
		2 1.859477402553122 52.678139722920157
		2 2.3026095946268432 52.678139722920157
		2 2.6002356937808333 52.678139722920157
		2 0.56976430621916496 53.11629400463427
		2 0.82770692548595604 53.11629400463427
		2 1.2967331560622029 53.11629400463427
		2 1.859477402553122 53.11629400463427
		2 2.3026095946268432 53.11629400463427
		2 2.6002356937808333 53.11629400463427
		2 0.56976430621916496 53.573707815214902
		2 0.82770692548595604 53.573707815214902
		2 1.2683877873880087 53.573707815214902
		2 1.859477402553122 53.573707815214902
		2 2.3026095946268432 53.573707815214902
		2 2.6002356937808333 53.573707815214902
		2 0.56976430621916496 53.958898392545997
		2 0.82770692548595604 53.958898392545997
		2 1.2561955062680761 53.958898392545997
		2 1.859477402553122 53.958898392545997
		2 2.3026095946268432 53.958898392545997
		2 2.6002356937808333 53.958898392545997
		2 0.56976430621916496 54.117789505695086
		2 0.82770692548595604 54.117789505695086
		2 1.2379893625063745 54.117789505695086
		2 1.859477402553122 54.117789505695086
		2 2.3026095946268432 54.117789505695086
		2 2.6002356937808333 54.117789505695086
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_L_mouthLow_parentConstraint1" -p "surf_L_mouthLow";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_mouth_lowW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -7.5658582021789487 -1.5875994080741389 -52.582903626758672 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" -8.8817841970012523e-016 -4.4408920985006262e-016 
		-4.2632564145606011e-014 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_L_mouthLow_scaleConstraint1" -p "surf_L_mouthLow";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_mouth_lowW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 0.999999999999999 0.999999999999998 1 ;
	setAttr -k on ".w0";
createNode transform -n "ZERO_grp_surf_jawSubC" -p "grp_surf_muzzleSubA";
	setAttr ".rp" -type "double3" -3.2600000000000025 7.2386541205560044e-016 57.190000000000047 ;
	setAttr ".sp" -type "double3" -3.2600000000000025 7.2386541205560044e-016 57.190000000000047 ;
createNode transform -n "grp_surf_jawSubC" -p "ZERO_grp_surf_jawSubC";
	setAttr ".t" -type "double3" 0 0 7.1054273576010019e-015 ;
	setAttr ".s" -type "double3" 1 0.99999999999999956 1 ;
	setAttr ".rp" -type "double3" -3.2600000000000025 7.2386541205560044e-016 57.19000000000004 ;
	setAttr ".sp" -type "double3" -3.2600000000000025 7.2386541205560083e-016 57.19000000000004 ;
	setAttr ".spt" -type "double3" 0 -2.9582283945788e-031 0 ;
createNode transform -n "surf_L_mcorner" -p "grp_surf_jawSubC";
	setAttr ".ove" yes;
	setAttr ".rp" -type "double3" -0.37999999999999906 0.42999999999999233 0.54999999999997584 ;
	setAttr ".sp" -type "double3" -0.37999999999999906 0.42999999999999233 0.54999999999997584 ;
createNode nurbsSurface -n "surf_L_mcornerShape" -p "surf_L_mcorner";
	addAttr -ci true -sn "isi" -ln "IsInvisible" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "isd" -ln "IsDynamicObject" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "info" -ln "UserInfo" -dt "string";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dvu" 0;
	setAttr ".dvv" 0;
	setAttr ".cpr" 4;
	setAttr ".cps" 4;
	setAttr ".cc" -type "nurbsSurface" 
		3 3 0 0 no 
		8 0 0 0 0.33333333333333337 0.66666666666666674 1 1 1
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		
		36
		1 1.4701887842754753 52.43547853553163
		1 1.8384683949372256 52.43547853553163
		1 2.2885879190793652 52.43547853553163
		1 3.21951693491879 52.43547853553163
		1 3.6798664482459778 52.43547853553163
		1 3.8998112157245233 52.43547853553163
		1 1.4701887842754753 52.691228265157875
		1 1.8384683949372256 52.691228265157875
		1 2.2885879190793652 52.691228265157875
		1 3.21951693491879 52.691228265157875
		1 3.6798664482459778 52.691228265157875
		1 3.8998112157245233 52.691228265157875
		1 1.4701887842754753 53.371522545963586
		1 1.8384683949372256 53.371522545963586
		1 2.2885879190793652 53.371522545963586
		1 3.21951693491879 53.371522545963586
		1 3.6798664482459778 53.371522545963586
		1 3.8998112157245233 53.371522545963586
		1 1.4701887842754753 53.714227183662722
		1 1.8384683949372256 53.714227183662722
		1 2.2885879190793652 53.714227183662722
		1 3.21951693491879 53.714227183662722
		1 3.6798664482459778 53.714227183662722
		1 3.8998112157245233 53.714227183662722
		1 1.4701887842754753 54.143886729434769
		1 1.8384683949372256 54.143886729434769
		1 2.2885879190793652 54.143886729434769
		1 3.21951693491879 54.143886729434769
		1 3.6798664482459778 54.143886729434769
		1 3.8998112157245233 54.143886729434769
		1 1.4701887842754753 54.394521464468454
		1 1.8384683949372256 54.394521464468454
		1 2.2885879190793652 54.394521464468454
		1 3.21951693491879 54.394521464468454
		1 3.6798664482459778 54.394521464468454
		1 3.8998112157245233 54.394521464468454
		
		;
	setAttr ".info" -type "string" "";
createNode parentConstraint -n "surf_L_mcorner_parentConstraint1" -p "surf_L_mcorner";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_mouth_cornerW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -1.5280852431445946 -2.3496763420779003 -53.436904806759053 ;
	setAttr ".tg[0].tor" -type "double3" 1.7105023076910789e-013 8.1422199845466191e-013 
		0 ;
	setAttr ".lr" -type "double3" -89.999999999999972 -89.999999999999972 0 ;
	setAttr ".rst" -type "double3" -3.8857805861880479e-016 -4.4408920985006262e-016 
		-7.1054273576010019e-015 ;
	setAttr -k on ".w0";
createNode scaleConstraint -n "surf_L_mcorner_scaleConstraint1" -p "surf_L_mcorner";
	addAttr -ci true -k true -sn "w0" -ln "ctrl_main_L_mouth_cornerW0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 0.99999999999999822 0.99999999999999845 1 ;
	setAttr -k on ".w0";
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 3 ".lnk";
	setAttr -s 3 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr ".cdl" 1;
	setAttr -s 7 ".dli[1:6]"  4 1 2 3 5 6;
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode reference -n "GlumshanksEDC_2016_01RN";
	setAttr ".fn[0]" -type "string" "E:/Supernova/Assets/Actors/NPC/GlumshanksEDC/Rig/GlumshanksEDC_2016_01.ma";
	setAttr ".ed" -type "dataReferenceEdits" 
		"GlumshanksEDC_2016_01RN"
		"GlumshanksEDC_2016_01RN" 2
		2 "|GlumshanksEDC_2016_01:Bone_Root" "visibility" " 1"
		2 "GlumshanksEDC_2016_01:mesh_2016_mesh_layer" "visibility" " 0";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode reference -n "sharedReferenceNode";
	setAttr ".ed" -type "dataReferenceEdits" 
		"sharedReferenceNode";
createNode materialInfo -n "face_layout_materialInfo44";
createNode shadingEngine -n "face_layout_lambert2SG1";
	setAttr ".ihi" 0;
	setAttr -s 14 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "face_layout_mat_surf1";
	setAttr ".it" -type "float3" 0.2399939 0.2399939 0.2399939 ;
createNode container -n "AST_FaceEDC";
	setAttr ".isc" yes;
	setAttr ".ctor" -type "string" "rgriffin";
	setAttr ".cdat" -type "string" "2015/09/24 12:59:15";
createNode hyperLayout -n "face_layout_hyperLayout55";
	setAttr ".ihi" 0;
	setAttr -s 313 ".hyp";
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n"
		+ "            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n"
		+ "            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n"
		+ "                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n"
		+ "                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n"
		+ "            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n"
		+ "            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n"
		+ "            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n"
		+ "                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n"
		+ "            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n"
		+ "            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n"
		+ "            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n"
		+ "                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n"
		+ "            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n"
		+ "            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n"
		+ "            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 1\n"
		+ "                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 1\n"
		+ "            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 0\n            -showAssets 1\n            -showContainedOnly 0\n            -showPublishedAsConnected 0\n            -showContainerContents 0\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 0\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n"
		+ "            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n"
		+ "                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.25\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n"
		+ "                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n"
		+ "                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.25\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n"
		+ "                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n"
		+ "                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n"
		+ "                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n"
		+ "                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n"
		+ "                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n"
		+ "                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\t\tif (`objExists nodeEditorPanel1Info`) nodeEditor -e -restoreInfo nodeEditorPanel1Info $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n"
		+ "                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\t\tif (`objExists nodeEditorPanel1Info`) nodeEditor -e -restoreInfo nodeEditorPanel1Info $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n"
		+ "\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 30 -ast 0 -aet 60 ";
	setAttr ".st" 6;
createNode ilrOptionsNode -s -n "TurtleRenderOptions";
lockNode -l 1 ;
createNode ilrUIOptionsNode -s -n "TurtleUIOptions";
lockNode -l 1 ;
createNode ilrBakeLayerManager -s -n "TurtleBakeLayerManager";
lockNode -l 1 ;
createNode ilrBakeLayer -s -n "TurtleDefaultBakeLayer";
lockNode -l 1 ;
createNode hyperGraphInfo -n "nodeEditorPanel1Info";
createNode hyperView -n "hyperView1";
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout1";
	setAttr ".ihi" 0;
	setAttr -s 4 ".hyp";
	setAttr ".hyp[0].nvs" 1920;
	setAttr ".hyp[1].nvs" 1920;
	setAttr ".hyp[2].nvs" 1920;
	setAttr ".hyp[3].nvs" 1920;
	setAttr ".anf" yes;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 0;
	setAttr -av ".unw";
	setAttr -k on ".etw";
	setAttr -k on ".tps";
	setAttr -k on ".tms";
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
lockNode -l 1 ;
select -ne :initialShadingGroup;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -k on ".mico";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -av -cb on ".micc";
	setAttr -k on ".micr";
	setAttr -k on ".micg";
	setAttr -k on ".micb";
	setAttr -cb on ".mica";
	setAttr -av -cb on ".micw";
	setAttr -cb on ".mirw";
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -k on ".mico";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -av -cb on ".micc";
	setAttr -k on ".micr";
	setAttr -k on ".micg";
	setAttr -k on ".micb";
	setAttr -cb on ".mica";
	setAttr -av -cb on ".micw";
	setAttr -cb on ".mirw";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av ".w";
	setAttr -av ".h";
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av ".dar";
	setAttr -av -k on ".ldar";
	setAttr -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -k on ".isu";
	setAttr -k on ".pdu";
select -ne :defaultLightSet;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr -k on ".ro" yes;
select -ne :defaultObjectSet;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr ".ro" yes;
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k off ".ctrs" 256;
	setAttr -av -k off ".btrs" 512;
	setAttr -k off ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off -cb on ".eeaa";
	setAttr -k off -cb on ".engm";
	setAttr -k off -cb on ".mes";
	setAttr -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -k off -cb on ".mbs";
	setAttr -k off -cb on ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off ".enpt";
	setAttr -k off -cb on ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off -cb on ".twa";
	setAttr -k off -cb on ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr";
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 18 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surfaces" "Particles" "Fluids" "Image Planes" "UI:" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 18 0 1 1 1 1 1
		 1 0 0 0 0 0 0 0 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
connectAttr "ctrl_fac_main.grp_l_mouth_up_visibility" "grp_L_mouth_up.v";
connectAttr "folicle_L_mouth_upShape.or" "folicle_L_mouth_up.r" -l on;
connectAttr "folicle_L_mouth_upShape.ot" "folicle_L_mouth_up.t" -l on;
connectAttr "surf_L_mouthUpShape.l" "folicle_L_mouth_upShape.is";
connectAttr "surf_L_mouthUpShape.wm" "folicle_L_mouth_upShape.iwm";
connectAttr "folicle_L_obicShape.or" "folicle_L_obic.r" -l on;
connectAttr "folicle_L_obicShape.ot" "folicle_L_obic.t" -l on;
connectAttr "surf_L_mouthUpShape.l" "folicle_L_obicShape.is";
connectAttr "surf_L_mouthUpShape.wm" "folicle_L_obicShape.iwm";
connectAttr "ctrl_fac_main.grp_l_mouth_corner_visibility" "grp_L_mouth_corner.v"
		;
connectAttr "folicle_L_mouthcorner_upShape.or" "folicle_L_mouthcorner_up.r" -l on
		;
connectAttr "folicle_L_mouthcorner_upShape.ot" "folicle_L_mouthcorner_up.t" -l on
		;
connectAttr "surf_L_mcornerShape.l" "folicle_L_mouthcorner_upShape.is";
connectAttr "surf_L_mcornerShape.wm" "folicle_L_mouthcorner_upShape.iwm";
connectAttr "folicle_L_mouthcorner_lowShape.or" "folicle_L_mouthcorner_low.r" -l
		 on;
connectAttr "folicle_L_mouthcorner_lowShape.ot" "folicle_L_mouthcorner_low.t" -l
		 on;
connectAttr "surf_L_mcornerShape.l" "folicle_L_mouthcorner_lowShape.is";
connectAttr "surf_L_mcornerShape.wm" "folicle_L_mouthcorner_lowShape.iwm";
connectAttr "folicle_L_mouthcorner_outShape.or" "folicle_L_mouthcorner_out.r" -l
		 on;
connectAttr "folicle_L_mouthcorner_outShape.ot" "folicle_L_mouthcorner_out.t" -l
		 on;
connectAttr "surf_L_mcornerShape.l" "folicle_L_mouthcorner_outShape.is";
connectAttr "surf_L_mcornerShape.wm" "folicle_L_mouthcorner_outShape.iwm";
connectAttr "ctrl_fac_main.grp_c_mouth_up_visibility" "grp_C_mouth_up.v";
connectAttr "folicle_C_mouth_upShape.or" "folicle_C_mouth_up.r" -l on;
connectAttr "folicle_C_mouth_upShape.ot" "folicle_C_mouth_up.t" -l on;
connectAttr "surf_C_mouthUpShape.l" "folicle_C_mouth_upShape.is";
connectAttr "surf_C_mouthUpShape.wm" "folicle_C_mouth_upShape.iwm";
connectAttr "ctrl_fac_main.grp_l_mouth_low_visibility" "grp_L_mouth_low.v";
connectAttr "folicle_L_mouth_lowShape.or" "folicle_L_mouth_low.r" -l on;
connectAttr "folicle_L_mouth_lowShape.ot" "folicle_L_mouth_low.t" -l on;
connectAttr "surf_L_mouthLowShape.l" "folicle_L_mouth_lowShape.is";
connectAttr "surf_L_mouthLowShape.wm" "folicle_L_mouth_lowShape.iwm";
connectAttr "ctrl_fac_main.grp_c_mouth_low_visibility" "grp_C_mouth_low.v";
connectAttr "folicle_C_mouth_lowShape.or" "folicle_C_mouth_low.r" -l on;
connectAttr "folicle_C_mouth_lowShape.ot" "folicle_C_mouth_low.t" -l on;
connectAttr "surf_C_mouthLowShape.l" "folicle_C_mouth_lowShape.is";
connectAttr "surf_C_mouthLowShape.wm" "folicle_C_mouth_lowShape.iwm";
connectAttr "ctrl_fac_main.grp_l_chin_visibility" "grp_L_chin.v";
connectAttr "folicle_L_chinShape.or" "folicle_L_chin.r" -l on;
connectAttr "folicle_L_chinShape.ot" "folicle_L_chin.t" -l on;
connectAttr "surf_L_chinShape.l" "folicle_L_chinShape.is";
connectAttr "surf_L_chinShape.wm" "folicle_L_chinShape.iwm";
connectAttr "ctrl_fac_main.grp_l_lid_low_visibility" "grp_L_lid_low.v";
connectAttr "folicle_L_lid1_lowShape.or" "folicle_L_lid1_low.r" -l on;
connectAttr "folicle_L_lid1_lowShape.ot" "folicle_L_lid1_low.t" -l on;
connectAttr "surf_L_lidLowShape.l" "folicle_L_lid1_lowShape.is";
connectAttr "surf_L_lidLowShape.wm" "folicle_L_lid1_lowShape.iwm";
connectAttr "folicle_L_lid2_lowShape.or" "folicle_L_lid2_low.r" -l on;
connectAttr "folicle_L_lid2_lowShape.ot" "folicle_L_lid2_low.t" -l on;
connectAttr "surf_L_lidLowShape.l" "folicle_L_lid2_lowShape.is";
connectAttr "surf_L_lidLowShape.wm" "folicle_L_lid2_lowShape.iwm";
connectAttr "folicle_L_lid3_lowShape.or" "folicle_L_lid3_low.r" -l on;
connectAttr "folicle_L_lid3_lowShape.ot" "folicle_L_lid3_low.t" -l on;
connectAttr "surf_L_lidLowShape.l" "folicle_L_lid3_lowShape.is";
connectAttr "surf_L_lidLowShape.wm" "folicle_L_lid3_lowShape.iwm";
connectAttr "ctrl_fac_main.grp_l_brow_visibility" "grp_L_brow.v";
connectAttr "folicle_L_brow1Shape.or" "folicle_L_brow1.r" -l on;
connectAttr "folicle_L_brow1Shape.ot" "folicle_L_brow1.t" -l on;
connectAttr "surf_L_browShape.l" "folicle_L_brow1Shape.is";
connectAttr "surf_L_browShape.wm" "folicle_L_brow1Shape.iwm";
connectAttr "folicle_L_brow2Shape.or" "folicle_L_brow2.r" -l on;
connectAttr "folicle_L_brow2Shape.ot" "folicle_L_brow2.t" -l on;
connectAttr "surf_L_browShape.l" "folicle_L_brow2Shape.is";
connectAttr "surf_L_browShape.wm" "folicle_L_brow2Shape.iwm";
connectAttr "folicle_L_brow3Shape.or" "folicle_L_brow3.r" -l on;
connectAttr "folicle_L_brow3Shape.ot" "folicle_L_brow3.t" -l on;
connectAttr "surf_L_browShape.l" "folicle_L_brow3Shape.is";
connectAttr "surf_L_browShape.wm" "folicle_L_brow3Shape.iwm";
connectAttr "ctrl_fac_main.grp_l_lid_center_visibility" "grp_L_lid_center.v";
connectAttr "folicle_L_lidcrnr_inShape.or" "folicle_L_lidcrnr_in.r" -l on;
connectAttr "folicle_L_lidcrnr_inShape.ot" "folicle_L_lidcrnr_in.t" -l on;
connectAttr "surf_L_lidCenterShape.l" "folicle_L_lidcrnr_inShape.is";
connectAttr "surf_L_lidCenterShape.wm" "folicle_L_lidcrnr_inShape.iwm";
connectAttr "folicle_L_lidcrnr_outShape.or" "folicle_L_lidcrnr_out.r" -l on;
connectAttr "folicle_L_lidcrnr_outShape.ot" "folicle_L_lidcrnr_out.t" -l on;
connectAttr "surf_L_lidCenterShape.l" "folicle_L_lidcrnr_outShape.is";
connectAttr "surf_L_lidCenterShape.wm" "folicle_L_lidcrnr_outShape.iwm";
connectAttr "ctrl_fac_main.grp_c_brow_visibility" "grp_C_brow.v";
connectAttr "folicle_C_browShape.or" "folicle_C_brow.r" -l on;
connectAttr "folicle_C_browShape.ot" "folicle_C_brow.t" -l on;
connectAttr "surf_C_browShape.l" "folicle_C_browShape.is";
connectAttr "surf_C_browShape.wm" "folicle_C_browShape.iwm";
connectAttr "ctrl_fac_main.grp_l_lid_up_visibility" "grp_L_lid_up.v";
connectAttr "folicle_L_lid1_upShape.or" "folicle_L_lid1_up.r" -l on;
connectAttr "folicle_L_lid1_upShape.ot" "folicle_L_lid1_up.t" -l on;
connectAttr "surf_L_lidUpShape.l" "folicle_L_lid1_upShape.is";
connectAttr "surf_L_lidUpShape.wm" "folicle_L_lid1_upShape.iwm";
connectAttr "folicle_L_lid2_upShape.or" "folicle_L_lid2_up.r" -l on;
connectAttr "folicle_L_lid2_upShape.ot" "folicle_L_lid2_up.t" -l on;
connectAttr "surf_L_lidUpShape.l" "folicle_L_lid2_upShape.is";
connectAttr "surf_L_lidUpShape.wm" "folicle_L_lid2_upShape.iwm";
connectAttr "folicle_L_lid3_upShape.or" "folicle_L_lid3_up.r" -l on;
connectAttr "folicle_L_lid3_upShape.ot" "folicle_L_lid3_up.t" -l on;
connectAttr "surf_L_lidUpShape.l" "folicle_L_lid3_upShape.is";
connectAttr "surf_L_lidUpShape.wm" "folicle_L_lid3_upShape.iwm";
connectAttr "ctrl_fac_main.grp_l_cheek_visibility" "grp_L_cheek.v";
connectAttr "folicle_L_cheekShape.or" "folicle_L_cheek.r" -l on;
connectAttr "folicle_L_cheekShape.ot" "folicle_L_cheek.t" -l on;
connectAttr "surf_L_cheekShape.l" "folicle_L_cheekShape.is";
connectAttr "surf_L_cheekShape.wm" "folicle_L_cheekShape.iwm";
connectAttr "ctrl_fac_main.grp_l_nasal_visibility" "grp_L_nasal.v";
connectAttr "folicle_L_nasal1Shape.or" "folicle_L_nasal1.r" -l on;
connectAttr "folicle_L_nasal1Shape.ot" "folicle_L_nasal1.t" -l on;
connectAttr "surf_L_nasalShape.l" "folicle_L_nasal1Shape.is";
connectAttr "surf_L_nasalShape.wm" "folicle_L_nasal1Shape.iwm";
connectAttr "folicle_L_nasal2Shape.or" "folicle_L_nasal2.r" -l on;
connectAttr "folicle_L_nasal2Shape.ot" "folicle_L_nasal2.t" -l on;
connectAttr "surf_L_nasalShape.l" "folicle_L_nasal2Shape.is";
connectAttr "surf_L_nasalShape.wm" "folicle_L_nasal2Shape.iwm";
connectAttr "ctrl_fac_main.grp_l_zygo_visibility" "grp_L_zygo.v";
connectAttr "folicle_L_zygo1Shape.or" "folicle_L_zygo1.r" -l on;
connectAttr "folicle_L_zygo1Shape.ot" "folicle_L_zygo1.t" -l on;
connectAttr "surf_L_zygoShape.l" "folicle_L_zygo1Shape.is";
connectAttr "surf_L_zygoShape.wm" "folicle_L_zygo1Shape.iwm";
connectAttr "folicle_L_zygo2Shape.or" "folicle_L_zygo2.r" -l on;
connectAttr "folicle_L_zygo2Shape.ot" "folicle_L_zygo2.t" -l on;
connectAttr "surf_L_zygoShape.l" "folicle_L_zygo2Shape.is";
connectAttr "surf_L_zygoShape.wm" "folicle_L_zygo2Shape.iwm";
connectAttr "ctrl_fac_main.Control_Vis" "FACE_CONTROLS.v";
connectAttr "ctrl_fac_main.s" "World_grp_FAC_EDC.s";
connectAttr "ctrl_fac_main.t" "World_grp_FAC_EDC.t";
connectAttr "ctrl_fac_main.r" "World_grp_FAC_EDC.r";
connectAttr "ctrl_fac_main.grp_l_brow_visibility" "surf_L_brow.v";
connectAttr "surf_L_brow_parentConstraint1.ctx" "surf_L_brow.tx";
connectAttr "surf_L_brow_parentConstraint1.cty" "surf_L_brow.ty";
connectAttr "surf_L_brow_parentConstraint1.ctz" "surf_L_brow.tz";
connectAttr "surf_L_brow_parentConstraint1.crx" "surf_L_brow.rx";
connectAttr "surf_L_brow_parentConstraint1.cry" "surf_L_brow.ry";
connectAttr "surf_L_brow_parentConstraint1.crz" "surf_L_brow.rz";
connectAttr "surf_L_brow_scaleConstraint1.csx" "surf_L_brow.sx";
connectAttr "surf_L_brow_scaleConstraint1.csy" "surf_L_brow.sy";
connectAttr "surf_L_brow_scaleConstraint1.csz" "surf_L_brow.sz";
connectAttr "surf_L_brow.ro" "surf_L_brow_parentConstraint1.cro";
connectAttr "surf_L_brow.pim" "surf_L_brow_parentConstraint1.cpim";
connectAttr "surf_L_brow.rp" "surf_L_brow_parentConstraint1.crp";
connectAttr "surf_L_brow.rpt" "surf_L_brow_parentConstraint1.crt";
connectAttr "ctrl_main_L_brow.t" "surf_L_brow_parentConstraint1.tg[0].tt";
connectAttr "ctrl_main_L_brow.rp" "surf_L_brow_parentConstraint1.tg[0].trp";
connectAttr "ctrl_main_L_brow.rpt" "surf_L_brow_parentConstraint1.tg[0].trt";
connectAttr "ctrl_main_L_brow.r" "surf_L_brow_parentConstraint1.tg[0].tr";
connectAttr "ctrl_main_L_brow.ro" "surf_L_brow_parentConstraint1.tg[0].tro";
connectAttr "ctrl_main_L_brow.s" "surf_L_brow_parentConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_brow.pm" "surf_L_brow_parentConstraint1.tg[0].tpm";
connectAttr "surf_L_brow_parentConstraint1.w0" "surf_L_brow_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_L_brow.pim" "surf_L_brow_scaleConstraint1.cpim";
connectAttr "ctrl_main_L_brow.s" "surf_L_brow_scaleConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_brow.pm" "surf_L_brow_scaleConstraint1.tg[0].tpm";
connectAttr "surf_L_brow_scaleConstraint1.w0" "surf_L_brow_scaleConstraint1.tg[0].tw"
		;
connectAttr "ctrl_fac_main.grp_c_brow_visibility" "surf_C_brow.v";
connectAttr "surf_C_brow_parentConstraint1.ctx" "surf_C_brow.tx";
connectAttr "surf_C_brow_parentConstraint1.cty" "surf_C_brow.ty";
connectAttr "surf_C_brow_parentConstraint1.ctz" "surf_C_brow.tz";
connectAttr "surf_C_brow_parentConstraint1.crx" "surf_C_brow.rx";
connectAttr "surf_C_brow_parentConstraint1.cry" "surf_C_brow.ry";
connectAttr "surf_C_brow_parentConstraint1.crz" "surf_C_brow.rz";
connectAttr "surf_C_brow_scaleConstraint1.csx" "surf_C_brow.sx";
connectAttr "surf_C_brow_scaleConstraint1.csy" "surf_C_brow.sy";
connectAttr "surf_C_brow_scaleConstraint1.csz" "surf_C_brow.sz";
connectAttr "surf_C_brow.ro" "surf_C_brow_parentConstraint1.cro";
connectAttr "surf_C_brow.pim" "surf_C_brow_parentConstraint1.cpim";
connectAttr "surf_C_brow.rp" "surf_C_brow_parentConstraint1.crp";
connectAttr "surf_C_brow.rpt" "surf_C_brow_parentConstraint1.crt";
connectAttr "ctrl_main_C_brow.t" "surf_C_brow_parentConstraint1.tg[0].tt";
connectAttr "ctrl_main_C_brow.rp" "surf_C_brow_parentConstraint1.tg[0].trp";
connectAttr "ctrl_main_C_brow.rpt" "surf_C_brow_parentConstraint1.tg[0].trt";
connectAttr "ctrl_main_C_brow.r" "surf_C_brow_parentConstraint1.tg[0].tr";
connectAttr "ctrl_main_C_brow.ro" "surf_C_brow_parentConstraint1.tg[0].tro";
connectAttr "ctrl_main_C_brow.s" "surf_C_brow_parentConstraint1.tg[0].ts";
connectAttr "ctrl_main_C_brow.pm" "surf_C_brow_parentConstraint1.tg[0].tpm";
connectAttr "surf_C_brow_parentConstraint1.w0" "surf_C_brow_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_C_brow.pim" "surf_C_brow_scaleConstraint1.cpim";
connectAttr "ctrl_main_C_brow.s" "surf_C_brow_scaleConstraint1.tg[0].ts";
connectAttr "ctrl_main_C_brow.pm" "surf_C_brow_scaleConstraint1.tg[0].tpm";
connectAttr "surf_C_brow_scaleConstraint1.w0" "surf_C_brow_scaleConstraint1.tg[0].tw"
		;
connectAttr "ctrl_fac_main.grp_l_lid_low_visibility" "surf_L_lidLow.v";
connectAttr "surf_L_lidLow_parentConstraint1.ctx" "surf_L_lidLow.tx";
connectAttr "surf_L_lidLow_parentConstraint1.cty" "surf_L_lidLow.ty";
connectAttr "surf_L_lidLow_parentConstraint1.ctz" "surf_L_lidLow.tz";
connectAttr "surf_L_lidLow_parentConstraint1.crx" "surf_L_lidLow.rx";
connectAttr "surf_L_lidLow_parentConstraint1.cry" "surf_L_lidLow.ry";
connectAttr "surf_L_lidLow_parentConstraint1.crz" "surf_L_lidLow.rz";
connectAttr "surf_L_lidLow_scaleConstraint1.csx" "surf_L_lidLow.sx";
connectAttr "surf_L_lidLow_scaleConstraint1.csy" "surf_L_lidLow.sy";
connectAttr "surf_L_lidLow_scaleConstraint1.csz" "surf_L_lidLow.sz";
connectAttr "surf_L_lidLow.ro" "surf_L_lidLow_parentConstraint1.cro";
connectAttr "surf_L_lidLow.pim" "surf_L_lidLow_parentConstraint1.cpim";
connectAttr "surf_L_lidLow.rp" "surf_L_lidLow_parentConstraint1.crp";
connectAttr "surf_L_lidLow.rpt" "surf_L_lidLow_parentConstraint1.crt";
connectAttr "ctrl_main_L_lid_low.t" "surf_L_lidLow_parentConstraint1.tg[0].tt";
connectAttr "ctrl_main_L_lid_low.rp" "surf_L_lidLow_parentConstraint1.tg[0].trp"
		;
connectAttr "ctrl_main_L_lid_low.rpt" "surf_L_lidLow_parentConstraint1.tg[0].trt"
		;
connectAttr "ctrl_main_L_lid_low.r" "surf_L_lidLow_parentConstraint1.tg[0].tr";
connectAttr "ctrl_main_L_lid_low.ro" "surf_L_lidLow_parentConstraint1.tg[0].tro"
		;
connectAttr "ctrl_main_L_lid_low.s" "surf_L_lidLow_parentConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_lid_low.pm" "surf_L_lidLow_parentConstraint1.tg[0].tpm"
		;
connectAttr "surf_L_lidLow_parentConstraint1.w0" "surf_L_lidLow_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_L_lidLow.pim" "surf_L_lidLow_scaleConstraint1.cpim";
connectAttr "ctrl_main_L_lid_low.s" "surf_L_lidLow_scaleConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_lid_low.pm" "surf_L_lidLow_scaleConstraint1.tg[0].tpm";
connectAttr "surf_L_lidLow_scaleConstraint1.w0" "surf_L_lidLow_scaleConstraint1.tg[0].tw"
		;
connectAttr "ctrl_fac_main.grp_l_lid_center_visibility" "surf_L_lidCenter.v";
connectAttr "surf_L_lidCenter_parentConstraint1.ctx" "surf_L_lidCenter.tx";
connectAttr "surf_L_lidCenter_parentConstraint1.cty" "surf_L_lidCenter.ty";
connectAttr "surf_L_lidCenter_parentConstraint1.ctz" "surf_L_lidCenter.tz";
connectAttr "surf_L_lidCenter_parentConstraint1.crx" "surf_L_lidCenter.rx";
connectAttr "surf_L_lidCenter_parentConstraint1.cry" "surf_L_lidCenter.ry";
connectAttr "surf_L_lidCenter_parentConstraint1.crz" "surf_L_lidCenter.rz";
connectAttr "surf_L_lidCenter_scaleConstraint1.csx" "surf_L_lidCenter.sx";
connectAttr "surf_L_lidCenter_scaleConstraint1.csy" "surf_L_lidCenter.sy";
connectAttr "surf_L_lidCenter_scaleConstraint1.csz" "surf_L_lidCenter.sz";
connectAttr "surf_L_lidCenter.ro" "surf_L_lidCenter_parentConstraint1.cro";
connectAttr "surf_L_lidCenter.pim" "surf_L_lidCenter_parentConstraint1.cpim";
connectAttr "surf_L_lidCenter.rp" "surf_L_lidCenter_parentConstraint1.crp";
connectAttr "surf_L_lidCenter.rpt" "surf_L_lidCenter_parentConstraint1.crt";
connectAttr "ctrl_main_L_lid_center.t" "surf_L_lidCenter_parentConstraint1.tg[0].tt"
		;
connectAttr "ctrl_main_L_lid_center.rp" "surf_L_lidCenter_parentConstraint1.tg[0].trp"
		;
connectAttr "ctrl_main_L_lid_center.rpt" "surf_L_lidCenter_parentConstraint1.tg[0].trt"
		;
connectAttr "ctrl_main_L_lid_center.r" "surf_L_lidCenter_parentConstraint1.tg[0].tr"
		;
connectAttr "ctrl_main_L_lid_center.ro" "surf_L_lidCenter_parentConstraint1.tg[0].tro"
		;
connectAttr "ctrl_main_L_lid_center.s" "surf_L_lidCenter_parentConstraint1.tg[0].ts"
		;
connectAttr "ctrl_main_L_lid_center.pm" "surf_L_lidCenter_parentConstraint1.tg[0].tpm"
		;
connectAttr "surf_L_lidCenter_parentConstraint1.w0" "surf_L_lidCenter_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_L_lidCenter.pim" "surf_L_lidCenter_scaleConstraint1.cpim";
connectAttr "ctrl_main_L_lid_center.s" "surf_L_lidCenter_scaleConstraint1.tg[0].ts"
		;
connectAttr "ctrl_main_L_lid_center.pm" "surf_L_lidCenter_scaleConstraint1.tg[0].tpm"
		;
connectAttr "surf_L_lidCenter_scaleConstraint1.w0" "surf_L_lidCenter_scaleConstraint1.tg[0].tw"
		;
connectAttr "ctrl_fac_main.grp_l_lid_up_visibility" "surf_L_lidUp.v";
connectAttr "surf_L_lidUp_parentConstraint1.ctx" "surf_L_lidUp.tx";
connectAttr "surf_L_lidUp_parentConstraint1.cty" "surf_L_lidUp.ty";
connectAttr "surf_L_lidUp_parentConstraint1.ctz" "surf_L_lidUp.tz";
connectAttr "surf_L_lidUp_parentConstraint1.crx" "surf_L_lidUp.rx";
connectAttr "surf_L_lidUp_parentConstraint1.cry" "surf_L_lidUp.ry";
connectAttr "surf_L_lidUp_parentConstraint1.crz" "surf_L_lidUp.rz";
connectAttr "surf_L_lidUp_scaleConstraint1.csx" "surf_L_lidUp.sx";
connectAttr "surf_L_lidUp_scaleConstraint1.csy" "surf_L_lidUp.sy";
connectAttr "surf_L_lidUp_scaleConstraint1.csz" "surf_L_lidUp.sz";
connectAttr "surf_L_lidUp.ro" "surf_L_lidUp_parentConstraint1.cro";
connectAttr "surf_L_lidUp.pim" "surf_L_lidUp_parentConstraint1.cpim";
connectAttr "surf_L_lidUp.rp" "surf_L_lidUp_parentConstraint1.crp";
connectAttr "surf_L_lidUp.rpt" "surf_L_lidUp_parentConstraint1.crt";
connectAttr "ctrl_main_L_lid_up.t" "surf_L_lidUp_parentConstraint1.tg[0].tt";
connectAttr "ctrl_main_L_lid_up.rp" "surf_L_lidUp_parentConstraint1.tg[0].trp";
connectAttr "ctrl_main_L_lid_up.rpt" "surf_L_lidUp_parentConstraint1.tg[0].trt";
connectAttr "ctrl_main_L_lid_up.r" "surf_L_lidUp_parentConstraint1.tg[0].tr";
connectAttr "ctrl_main_L_lid_up.ro" "surf_L_lidUp_parentConstraint1.tg[0].tro";
connectAttr "ctrl_main_L_lid_up.s" "surf_L_lidUp_parentConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_lid_up.pm" "surf_L_lidUp_parentConstraint1.tg[0].tpm";
connectAttr "surf_L_lidUp_parentConstraint1.w0" "surf_L_lidUp_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_L_lidUp.pim" "surf_L_lidUp_scaleConstraint1.cpim";
connectAttr "ctrl_main_L_lid_up.s" "surf_L_lidUp_scaleConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_lid_up.pm" "surf_L_lidUp_scaleConstraint1.tg[0].tpm";
connectAttr "surf_L_lidUp_scaleConstraint1.w0" "surf_L_lidUp_scaleConstraint1.tg[0].tw"
		;
connectAttr "ctrl_fac_main.grp_l_nasal_visibility" "surf_L_nasal.v";
connectAttr "surf_L_nasal_parentConstraint1.ctx" "surf_L_nasal.tx";
connectAttr "surf_L_nasal_parentConstraint1.cty" "surf_L_nasal.ty";
connectAttr "surf_L_nasal_parentConstraint1.ctz" "surf_L_nasal.tz";
connectAttr "surf_L_nasal_parentConstraint1.crx" "surf_L_nasal.rx";
connectAttr "surf_L_nasal_parentConstraint1.cry" "surf_L_nasal.ry";
connectAttr "surf_L_nasal_parentConstraint1.crz" "surf_L_nasal.rz";
connectAttr "surf_L_nasal_scaleConstraint1.csx" "surf_L_nasal.sx";
connectAttr "surf_L_nasal_scaleConstraint1.csy" "surf_L_nasal.sy";
connectAttr "surf_L_nasal_scaleConstraint1.csz" "surf_L_nasal.sz";
connectAttr "surf_L_nasal.ro" "surf_L_nasal_parentConstraint1.cro";
connectAttr "surf_L_nasal.pim" "surf_L_nasal_parentConstraint1.cpim";
connectAttr "surf_L_nasal.rp" "surf_L_nasal_parentConstraint1.crp";
connectAttr "surf_L_nasal.rpt" "surf_L_nasal_parentConstraint1.crt";
connectAttr "ctrl_main_L_nasal.t" "surf_L_nasal_parentConstraint1.tg[0].tt";
connectAttr "ctrl_main_L_nasal.rp" "surf_L_nasal_parentConstraint1.tg[0].trp";
connectAttr "ctrl_main_L_nasal.rpt" "surf_L_nasal_parentConstraint1.tg[0].trt";
connectAttr "ctrl_main_L_nasal.r" "surf_L_nasal_parentConstraint1.tg[0].tr";
connectAttr "ctrl_main_L_nasal.ro" "surf_L_nasal_parentConstraint1.tg[0].tro";
connectAttr "ctrl_main_L_nasal.s" "surf_L_nasal_parentConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_nasal.pm" "surf_L_nasal_parentConstraint1.tg[0].tpm";
connectAttr "surf_L_nasal_parentConstraint1.w0" "surf_L_nasal_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_L_nasal.pim" "surf_L_nasal_scaleConstraint1.cpim";
connectAttr "ctrl_main_L_nasal.s" "surf_L_nasal_scaleConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_nasal.pm" "surf_L_nasal_scaleConstraint1.tg[0].tpm";
connectAttr "surf_L_nasal_scaleConstraint1.w0" "surf_L_nasal_scaleConstraint1.tg[0].tw"
		;
connectAttr "ctrl_fac_main.grp_l_zygo_visibility" "surf_L_zygo.v";
connectAttr "surf_L_zygo_parentConstraint1.ctx" "surf_L_zygo.tx";
connectAttr "surf_L_zygo_parentConstraint1.cty" "surf_L_zygo.ty";
connectAttr "surf_L_zygo_parentConstraint1.ctz" "surf_L_zygo.tz";
connectAttr "surf_L_zygo_parentConstraint1.crx" "surf_L_zygo.rx";
connectAttr "surf_L_zygo_parentConstraint1.cry" "surf_L_zygo.ry";
connectAttr "surf_L_zygo_parentConstraint1.crz" "surf_L_zygo.rz";
connectAttr "surf_L_zygo_scaleConstraint1.csx" "surf_L_zygo.sx";
connectAttr "surf_L_zygo_scaleConstraint1.csy" "surf_L_zygo.sy";
connectAttr "surf_L_zygo_scaleConstraint1.csz" "surf_L_zygo.sz";
connectAttr "surf_L_zygo.ro" "surf_L_zygo_parentConstraint1.cro";
connectAttr "surf_L_zygo.pim" "surf_L_zygo_parentConstraint1.cpim";
connectAttr "surf_L_zygo.rp" "surf_L_zygo_parentConstraint1.crp";
connectAttr "surf_L_zygo.rpt" "surf_L_zygo_parentConstraint1.crt";
connectAttr "ctrl_main_L_zygo.t" "surf_L_zygo_parentConstraint1.tg[0].tt";
connectAttr "ctrl_main_L_zygo.rp" "surf_L_zygo_parentConstraint1.tg[0].trp";
connectAttr "ctrl_main_L_zygo.rpt" "surf_L_zygo_parentConstraint1.tg[0].trt";
connectAttr "ctrl_main_L_zygo.r" "surf_L_zygo_parentConstraint1.tg[0].tr";
connectAttr "ctrl_main_L_zygo.ro" "surf_L_zygo_parentConstraint1.tg[0].tro";
connectAttr "ctrl_main_L_zygo.s" "surf_L_zygo_parentConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_zygo.pm" "surf_L_zygo_parentConstraint1.tg[0].tpm";
connectAttr "surf_L_zygo_parentConstraint1.w0" "surf_L_zygo_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_L_zygo.pim" "surf_L_zygo_scaleConstraint1.cpim";
connectAttr "ctrl_main_L_zygo.s" "surf_L_zygo_scaleConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_zygo.pm" "surf_L_zygo_scaleConstraint1.tg[0].tpm";
connectAttr "surf_L_zygo_scaleConstraint1.w0" "surf_L_zygo_scaleConstraint1.tg[0].tw"
		;
connectAttr "ctrl_fac_main.grp_l_cheek_visibility" "surf_L_cheek.v";
connectAttr "surf_L_cheek_parentConstraint1.ctx" "surf_L_cheek.tx";
connectAttr "surf_L_cheek_parentConstraint1.cty" "surf_L_cheek.ty";
connectAttr "surf_L_cheek_parentConstraint1.ctz" "surf_L_cheek.tz";
connectAttr "surf_L_cheek_parentConstraint1.crx" "surf_L_cheek.rx";
connectAttr "surf_L_cheek_parentConstraint1.cry" "surf_L_cheek.ry";
connectAttr "surf_L_cheek_parentConstraint1.crz" "surf_L_cheek.rz";
connectAttr "surf_L_cheek_scaleConstraint1.csx" "surf_L_cheek.sx";
connectAttr "surf_L_cheek_scaleConstraint1.csy" "surf_L_cheek.sy";
connectAttr "surf_L_cheek_scaleConstraint1.csz" "surf_L_cheek.sz";
connectAttr "surf_L_cheek.ro" "surf_L_cheek_parentConstraint1.cro";
connectAttr "surf_L_cheek.pim" "surf_L_cheek_parentConstraint1.cpim";
connectAttr "surf_L_cheek.rp" "surf_L_cheek_parentConstraint1.crp";
connectAttr "surf_L_cheek.rpt" "surf_L_cheek_parentConstraint1.crt";
connectAttr "ctrl_main_L_cheek.t" "surf_L_cheek_parentConstraint1.tg[0].tt";
connectAttr "ctrl_main_L_cheek.rp" "surf_L_cheek_parentConstraint1.tg[0].trp";
connectAttr "ctrl_main_L_cheek.rpt" "surf_L_cheek_parentConstraint1.tg[0].trt";
connectAttr "ctrl_main_L_cheek.r" "surf_L_cheek_parentConstraint1.tg[0].tr";
connectAttr "ctrl_main_L_cheek.ro" "surf_L_cheek_parentConstraint1.tg[0].tro";
connectAttr "ctrl_main_L_cheek.s" "surf_L_cheek_parentConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_cheek.pm" "surf_L_cheek_parentConstraint1.tg[0].tpm";
connectAttr "surf_L_cheek_parentConstraint1.w0" "surf_L_cheek_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_L_cheek.pim" "surf_L_cheek_scaleConstraint1.cpim";
connectAttr "ctrl_main_L_cheek.s" "surf_L_cheek_scaleConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_cheek.pm" "surf_L_cheek_scaleConstraint1.tg[0].tpm";
connectAttr "surf_L_cheek_scaleConstraint1.w0" "surf_L_cheek_scaleConstraint1.tg[0].tw"
		;
connectAttr "ctrl_fac_main.grp_l_mouth_up_visibility" "surf_L_mouthUp.v";
connectAttr "surf_L_mouthUp_parentConstraint1.ctx" "surf_L_mouthUp.tx";
connectAttr "surf_L_mouthUp_parentConstraint1.cty" "surf_L_mouthUp.ty";
connectAttr "surf_L_mouthUp_parentConstraint1.ctz" "surf_L_mouthUp.tz";
connectAttr "surf_L_mouthUp_parentConstraint1.crx" "surf_L_mouthUp.rx";
connectAttr "surf_L_mouthUp_parentConstraint1.cry" "surf_L_mouthUp.ry";
connectAttr "surf_L_mouthUp_parentConstraint1.crz" "surf_L_mouthUp.rz";
connectAttr "surf_L_mouthUp_scaleConstraint1.csx" "surf_L_mouthUp.sx";
connectAttr "surf_L_mouthUp_scaleConstraint1.csy" "surf_L_mouthUp.sy";
connectAttr "surf_L_mouthUp_scaleConstraint1.csz" "surf_L_mouthUp.sz";
connectAttr "surf_L_mouthUp.ro" "surf_L_mouthUp_parentConstraint1.cro";
connectAttr "surf_L_mouthUp.pim" "surf_L_mouthUp_parentConstraint1.cpim";
connectAttr "surf_L_mouthUp.rp" "surf_L_mouthUp_parentConstraint1.crp";
connectAttr "surf_L_mouthUp.rpt" "surf_L_mouthUp_parentConstraint1.crt";
connectAttr "ctrl_main_L_mouth_up.t" "surf_L_mouthUp_parentConstraint1.tg[0].tt"
		;
connectAttr "ctrl_main_L_mouth_up.rp" "surf_L_mouthUp_parentConstraint1.tg[0].trp"
		;
connectAttr "ctrl_main_L_mouth_up.rpt" "surf_L_mouthUp_parentConstraint1.tg[0].trt"
		;
connectAttr "ctrl_main_L_mouth_up.r" "surf_L_mouthUp_parentConstraint1.tg[0].tr"
		;
connectAttr "ctrl_main_L_mouth_up.ro" "surf_L_mouthUp_parentConstraint1.tg[0].tro"
		;
connectAttr "ctrl_main_L_mouth_up.s" "surf_L_mouthUp_parentConstraint1.tg[0].ts"
		;
connectAttr "ctrl_main_L_mouth_up.pm" "surf_L_mouthUp_parentConstraint1.tg[0].tpm"
		;
connectAttr "surf_L_mouthUp_parentConstraint1.w0" "surf_L_mouthUp_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_L_mouthUp.pim" "surf_L_mouthUp_scaleConstraint1.cpim";
connectAttr "ctrl_main_L_mouth_up.s" "surf_L_mouthUp_scaleConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_mouth_up.pm" "surf_L_mouthUp_scaleConstraint1.tg[0].tpm"
		;
connectAttr "surf_L_mouthUp_scaleConstraint1.w0" "surf_L_mouthUp_scaleConstraint1.tg[0].tw"
		;
connectAttr "ctrl_fac_main.grp_c_mouth_up_visibility" "surf_C_mouthUp.v";
connectAttr "surf_C_mouthUp_parentConstraint1.ctx" "surf_C_mouthUp.tx";
connectAttr "surf_C_mouthUp_parentConstraint1.cty" "surf_C_mouthUp.ty";
connectAttr "surf_C_mouthUp_parentConstraint1.ctz" "surf_C_mouthUp.tz";
connectAttr "surf_C_mouthUp_parentConstraint1.crx" "surf_C_mouthUp.rx";
connectAttr "surf_C_mouthUp_parentConstraint1.cry" "surf_C_mouthUp.ry";
connectAttr "surf_C_mouthUp_parentConstraint1.crz" "surf_C_mouthUp.rz";
connectAttr "surf_C_mouthUp_scaleConstraint1.csx" "surf_C_mouthUp.sx";
connectAttr "surf_C_mouthUp_scaleConstraint1.csy" "surf_C_mouthUp.sy";
connectAttr "surf_C_mouthUp_scaleConstraint1.csz" "surf_C_mouthUp.sz";
connectAttr "surf_C_mouthUp.ro" "surf_C_mouthUp_parentConstraint1.cro";
connectAttr "surf_C_mouthUp.pim" "surf_C_mouthUp_parentConstraint1.cpim";
connectAttr "surf_C_mouthUp.rp" "surf_C_mouthUp_parentConstraint1.crp";
connectAttr "surf_C_mouthUp.rpt" "surf_C_mouthUp_parentConstraint1.crt";
connectAttr "ctrl_main_C_mouth_up.t" "surf_C_mouthUp_parentConstraint1.tg[0].tt"
		;
connectAttr "ctrl_main_C_mouth_up.rp" "surf_C_mouthUp_parentConstraint1.tg[0].trp"
		;
connectAttr "ctrl_main_C_mouth_up.rpt" "surf_C_mouthUp_parentConstraint1.tg[0].trt"
		;
connectAttr "ctrl_main_C_mouth_up.r" "surf_C_mouthUp_parentConstraint1.tg[0].tr"
		;
connectAttr "ctrl_main_C_mouth_up.ro" "surf_C_mouthUp_parentConstraint1.tg[0].tro"
		;
connectAttr "ctrl_main_C_mouth_up.s" "surf_C_mouthUp_parentConstraint1.tg[0].ts"
		;
connectAttr "ctrl_main_C_mouth_up.pm" "surf_C_mouthUp_parentConstraint1.tg[0].tpm"
		;
connectAttr "surf_C_mouthUp_parentConstraint1.w0" "surf_C_mouthUp_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_C_mouthUp.pim" "surf_C_mouthUp_scaleConstraint1.cpim";
connectAttr "ctrl_main_C_mouth_up.s" "surf_C_mouthUp_scaleConstraint1.tg[0].ts";
connectAttr "ctrl_main_C_mouth_up.pm" "surf_C_mouthUp_scaleConstraint1.tg[0].tpm"
		;
connectAttr "surf_C_mouthUp_scaleConstraint1.w0" "surf_C_mouthUp_scaleConstraint1.tg[0].tw"
		;
connectAttr "ctrl_fac_main.grp_c_mouth_low_visibility" "surf_C_mouthLow.v";
connectAttr "surf_C_mouthLow_parentConstraint1.ctx" "surf_C_mouthLow.tx";
connectAttr "surf_C_mouthLow_parentConstraint1.cty" "surf_C_mouthLow.ty";
connectAttr "surf_C_mouthLow_parentConstraint1.ctz" "surf_C_mouthLow.tz";
connectAttr "surf_C_mouthLow_parentConstraint1.crx" "surf_C_mouthLow.rx";
connectAttr "surf_C_mouthLow_parentConstraint1.cry" "surf_C_mouthLow.ry";
connectAttr "surf_C_mouthLow_parentConstraint1.crz" "surf_C_mouthLow.rz";
connectAttr "surf_C_mouthLow_scaleConstraint1.csx" "surf_C_mouthLow.sx";
connectAttr "surf_C_mouthLow_scaleConstraint1.csy" "surf_C_mouthLow.sy";
connectAttr "surf_C_mouthLow_scaleConstraint1.csz" "surf_C_mouthLow.sz";
connectAttr "surf_C_mouthLow.ro" "surf_C_mouthLow_parentConstraint1.cro";
connectAttr "surf_C_mouthLow.pim" "surf_C_mouthLow_parentConstraint1.cpim";
connectAttr "surf_C_mouthLow.rp" "surf_C_mouthLow_parentConstraint1.crp";
connectAttr "surf_C_mouthLow.rpt" "surf_C_mouthLow_parentConstraint1.crt";
connectAttr "ctrl_main_C_mouth_low.t" "surf_C_mouthLow_parentConstraint1.tg[0].tt"
		;
connectAttr "ctrl_main_C_mouth_low.rp" "surf_C_mouthLow_parentConstraint1.tg[0].trp"
		;
connectAttr "ctrl_main_C_mouth_low.rpt" "surf_C_mouthLow_parentConstraint1.tg[0].trt"
		;
connectAttr "ctrl_main_C_mouth_low.r" "surf_C_mouthLow_parentConstraint1.tg[0].tr"
		;
connectAttr "ctrl_main_C_mouth_low.ro" "surf_C_mouthLow_parentConstraint1.tg[0].tro"
		;
connectAttr "ctrl_main_C_mouth_low.s" "surf_C_mouthLow_parentConstraint1.tg[0].ts"
		;
connectAttr "ctrl_main_C_mouth_low.pm" "surf_C_mouthLow_parentConstraint1.tg[0].tpm"
		;
connectAttr "surf_C_mouthLow_parentConstraint1.w0" "surf_C_mouthLow_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_C_mouthLow.pim" "surf_C_mouthLow_scaleConstraint1.cpim";
connectAttr "ctrl_main_C_mouth_low.s" "surf_C_mouthLow_scaleConstraint1.tg[0].ts"
		;
connectAttr "ctrl_main_C_mouth_low.pm" "surf_C_mouthLow_scaleConstraint1.tg[0].tpm"
		;
connectAttr "surf_C_mouthLow_scaleConstraint1.w0" "surf_C_mouthLow_scaleConstraint1.tg[0].tw"
		;
connectAttr "ctrl_fac_main.grp_l_chin_visibility" "surf_L_chin.v";
connectAttr "surf_L_chin_parentConstraint1.ctx" "surf_L_chin.tx";
connectAttr "surf_L_chin_parentConstraint1.cty" "surf_L_chin.ty";
connectAttr "surf_L_chin_parentConstraint1.ctz" "surf_L_chin.tz";
connectAttr "surf_L_chin_parentConstraint1.crx" "surf_L_chin.rx";
connectAttr "surf_L_chin_parentConstraint1.cry" "surf_L_chin.ry";
connectAttr "surf_L_chin_parentConstraint1.crz" "surf_L_chin.rz";
connectAttr "surf_L_chin_scaleConstraint1.csx" "surf_L_chin.sx";
connectAttr "surf_L_chin_scaleConstraint1.csy" "surf_L_chin.sy";
connectAttr "surf_L_chin_scaleConstraint1.csz" "surf_L_chin.sz";
connectAttr "surf_L_chin.ro" "surf_L_chin_parentConstraint1.cro";
connectAttr "surf_L_chin.pim" "surf_L_chin_parentConstraint1.cpim";
connectAttr "surf_L_chin.rp" "surf_L_chin_parentConstraint1.crp";
connectAttr "surf_L_chin.rpt" "surf_L_chin_parentConstraint1.crt";
connectAttr "ctrl_main_L_chin.t" "surf_L_chin_parentConstraint1.tg[0].tt";
connectAttr "ctrl_main_L_chin.rp" "surf_L_chin_parentConstraint1.tg[0].trp";
connectAttr "ctrl_main_L_chin.rpt" "surf_L_chin_parentConstraint1.tg[0].trt";
connectAttr "ctrl_main_L_chin.r" "surf_L_chin_parentConstraint1.tg[0].tr";
connectAttr "ctrl_main_L_chin.ro" "surf_L_chin_parentConstraint1.tg[0].tro";
connectAttr "ctrl_main_L_chin.s" "surf_L_chin_parentConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_chin.pm" "surf_L_chin_parentConstraint1.tg[0].tpm";
connectAttr "surf_L_chin_parentConstraint1.w0" "surf_L_chin_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_L_chin.pim" "surf_L_chin_scaleConstraint1.cpim";
connectAttr "ctrl_main_L_chin.s" "surf_L_chin_scaleConstraint1.tg[0].ts";
connectAttr "ctrl_main_L_chin.pm" "surf_L_chin_scaleConstraint1.tg[0].tpm";
connectAttr "surf_L_chin_scaleConstraint1.w0" "surf_L_chin_scaleConstraint1.tg[0].tw"
		;
connectAttr "ctrl_fac_main.grp_l_mouth_low_visibility" "surf_L_mouthLow.v";
connectAttr "surf_L_mouthLow_parentConstraint1.ctx" "surf_L_mouthLow.tx";
connectAttr "surf_L_mouthLow_parentConstraint1.cty" "surf_L_mouthLow.ty";
connectAttr "surf_L_mouthLow_parentConstraint1.ctz" "surf_L_mouthLow.tz";
connectAttr "surf_L_mouthLow_parentConstraint1.crx" "surf_L_mouthLow.rx";
connectAttr "surf_L_mouthLow_parentConstraint1.cry" "surf_L_mouthLow.ry";
connectAttr "surf_L_mouthLow_parentConstraint1.crz" "surf_L_mouthLow.rz";
connectAttr "surf_L_mouthLow_scaleConstraint1.csx" "surf_L_mouthLow.sx";
connectAttr "surf_L_mouthLow_scaleConstraint1.csy" "surf_L_mouthLow.sy";
connectAttr "surf_L_mouthLow_scaleConstraint1.csz" "surf_L_mouthLow.sz";
connectAttr "surf_L_mouthLow.ro" "surf_L_mouthLow_parentConstraint1.cro";
connectAttr "surf_L_mouthLow.pim" "surf_L_mouthLow_parentConstraint1.cpim";
connectAttr "surf_L_mouthLow.rp" "surf_L_mouthLow_parentConstraint1.crp";
connectAttr "surf_L_mouthLow.rpt" "surf_L_mouthLow_parentConstraint1.crt";
connectAttr "ctrl_main_L_mouth_low.t" "surf_L_mouthLow_parentConstraint1.tg[0].tt"
		;
connectAttr "ctrl_main_L_mouth_low.rp" "surf_L_mouthLow_parentConstraint1.tg[0].trp"
		;
connectAttr "ctrl_main_L_mouth_low.rpt" "surf_L_mouthLow_parentConstraint1.tg[0].trt"
		;
connectAttr "ctrl_main_L_mouth_low.r" "surf_L_mouthLow_parentConstraint1.tg[0].tr"
		;
connectAttr "ctrl_main_L_mouth_low.ro" "surf_L_mouthLow_parentConstraint1.tg[0].tro"
		;
connectAttr "ctrl_main_L_mouth_low.s" "surf_L_mouthLow_parentConstraint1.tg[0].ts"
		;
connectAttr "ctrl_main_L_mouth_low.pm" "surf_L_mouthLow_parentConstraint1.tg[0].tpm"
		;
connectAttr "surf_L_mouthLow_parentConstraint1.w0" "surf_L_mouthLow_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_L_mouthLow.pim" "surf_L_mouthLow_scaleConstraint1.cpim";
connectAttr "ctrl_main_L_mouth_low.s" "surf_L_mouthLow_scaleConstraint1.tg[0].ts"
		;
connectAttr "ctrl_main_L_mouth_low.pm" "surf_L_mouthLow_scaleConstraint1.tg[0].tpm"
		;
connectAttr "surf_L_mouthLow_scaleConstraint1.w0" "surf_L_mouthLow_scaleConstraint1.tg[0].tw"
		;
connectAttr "ctrl_fac_main.grp_l_mouth_corner_visibility" "surf_L_mcorner.v";
connectAttr "surf_L_mcorner_parentConstraint1.ctx" "surf_L_mcorner.tx";
connectAttr "surf_L_mcorner_parentConstraint1.cty" "surf_L_mcorner.ty";
connectAttr "surf_L_mcorner_parentConstraint1.ctz" "surf_L_mcorner.tz";
connectAttr "surf_L_mcorner_parentConstraint1.crx" "surf_L_mcorner.rx";
connectAttr "surf_L_mcorner_parentConstraint1.cry" "surf_L_mcorner.ry";
connectAttr "surf_L_mcorner_parentConstraint1.crz" "surf_L_mcorner.rz";
connectAttr "surf_L_mcorner_scaleConstraint1.csx" "surf_L_mcorner.sx";
connectAttr "surf_L_mcorner_scaleConstraint1.csy" "surf_L_mcorner.sy";
connectAttr "surf_L_mcorner_scaleConstraint1.csz" "surf_L_mcorner.sz";
connectAttr "surf_L_mcorner.ro" "surf_L_mcorner_parentConstraint1.cro";
connectAttr "surf_L_mcorner.pim" "surf_L_mcorner_parentConstraint1.cpim";
connectAttr "surf_L_mcorner.rp" "surf_L_mcorner_parentConstraint1.crp";
connectAttr "surf_L_mcorner.rpt" "surf_L_mcorner_parentConstraint1.crt";
connectAttr "ctrl_main_L_mouth_corner.t" "surf_L_mcorner_parentConstraint1.tg[0].tt"
		;
connectAttr "ctrl_main_L_mouth_corner.rp" "surf_L_mcorner_parentConstraint1.tg[0].trp"
		;
connectAttr "ctrl_main_L_mouth_corner.rpt" "surf_L_mcorner_parentConstraint1.tg[0].trt"
		;
connectAttr "ctrl_main_L_mouth_corner.r" "surf_L_mcorner_parentConstraint1.tg[0].tr"
		;
connectAttr "ctrl_main_L_mouth_corner.ro" "surf_L_mcorner_parentConstraint1.tg[0].tro"
		;
connectAttr "ctrl_main_L_mouth_corner.s" "surf_L_mcorner_parentConstraint1.tg[0].ts"
		;
connectAttr "ctrl_main_L_mouth_corner.pm" "surf_L_mcorner_parentConstraint1.tg[0].tpm"
		;
connectAttr "surf_L_mcorner_parentConstraint1.w0" "surf_L_mcorner_parentConstraint1.tg[0].tw"
		;
connectAttr "surf_L_mcorner.pim" "surf_L_mcorner_scaleConstraint1.cpim";
connectAttr "ctrl_main_L_mouth_corner.s" "surf_L_mcorner_scaleConstraint1.tg[0].ts"
		;
connectAttr "ctrl_main_L_mouth_corner.pm" "surf_L_mcorner_scaleConstraint1.tg[0].tpm"
		;
connectAttr "surf_L_mcorner_scaleConstraint1.w0" "surf_L_mcorner_scaleConstraint1.tg[0].tw"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "face_layout_lambert2SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "face_layout_lambert2SG1.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "sharedReferenceNode.sr" "GlumshanksEDC_2016_01RN.sr";
connectAttr "face_layout_lambert2SG1.msg" "face_layout_materialInfo44.sg";
connectAttr "face_layout_mat_surf1.msg" "face_layout_materialInfo44.m";
connectAttr "face_layout_mat_surf1.oc" "face_layout_lambert2SG1.ss";
connectAttr "surf_L_lidLowShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "surf_L_lidUpShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "surf_C_mouthLowShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "surf_C_browShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "surf_L_mouthLowShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "surf_L_chinShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "surf_L_cheekShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "surf_L_browShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "surf_L_mcornerShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "surf_L_mouthUpShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "surf_C_mouthUpShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "surf_L_zygoShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "surf_L_nasalShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "surf_L_lidCenterShape.iog" "face_layout_lambert2SG1.dsm" -na;
connectAttr "face_layout_hyperLayout55.msg" "AST_FaceEDC.hl";
connectAttr "ctrl_fac_mainShape.msg" "face_layout_hyperLayout55.hyp[0].dn";
connectAttr "ctrl_fac_main.msg" "face_layout_hyperLayout55.hyp[1].dn";
connectAttr "grp_face_main.msg" "face_layout_hyperLayout55.hyp[2].dn";
connectAttr "grp_ctrl_face_main.msg" "face_layout_hyperLayout55.hyp[3].dn";
connectAttr "grp_lyt_ctrls.msg" "face_layout_hyperLayout55.hyp[4].dn";
connectAttr "grp_sub_headBtm.msg" "face_layout_hyperLayout55.hyp[5].dn";
connectAttr "grp_L_mouth_low.msg" "face_layout_hyperLayout55.hyp[7].dn";
connectAttr "lyt_ctrl_L_mouth_low.msg" "face_layout_hyperLayout55.hyp[8].dn";
connectAttr "lyt_ctrl_L_mouth_lowShape.msg" "face_layout_hyperLayout55.hyp[9].dn"
		;
connectAttr "grp_ctrl_main_L_mouth_low.msg" "face_layout_hyperLayout55.hyp[28].dn"
		;
connectAttr "ctrl_main_L_mouth_low.msg" "face_layout_hyperLayout55.hyp[29].dn";
connectAttr "ctrl_main_L_mouth_lowShape.msg" "face_layout_hyperLayout55.hyp[30].dn"
		;
connectAttr "grp_C_mouth_low.msg" "face_layout_hyperLayout55.hyp[31].dn";
connectAttr "lyt_ctrl_C_mouth_low.msg" "face_layout_hyperLayout55.hyp[32].dn";
connectAttr "lyt_ctrl_C_mouth_lowShape.msg" "face_layout_hyperLayout55.hyp[33].dn"
		;
connectAttr "grp_ctrl_main_C_mouth_low.msg" "face_layout_hyperLayout55.hyp[40].dn"
		;
connectAttr "ctrl_main_C_mouth_low.msg" "face_layout_hyperLayout55.hyp[41].dn";
connectAttr "ctrl_main_C_mouth_lowShape.msg" "face_layout_hyperLayout55.hyp[42].dn"
		;
connectAttr "grp_L_chin.msg" "face_layout_hyperLayout55.hyp[43].dn";
connectAttr "lyt_ctrl_L_chin.msg" "face_layout_hyperLayout55.hyp[44].dn";
connectAttr "lyt_ctrl_L_chinShape.msg" "face_layout_hyperLayout55.hyp[45].dn";
connectAttr "grp_ctrl_main_L_chin.msg" "face_layout_hyperLayout55.hyp[52].dn";
connectAttr "ctrl_main_L_chin.msg" "face_layout_hyperLayout55.hyp[53].dn";
connectAttr "ctrl_main_L_chinShape.msg" "face_layout_hyperLayout55.hyp[54].dn";
connectAttr "grp_L_mouth_up.msg" "face_layout_hyperLayout55.hyp[55].dn";
connectAttr "lyt_ctrl_L_mouth_up.msg" "face_layout_hyperLayout55.hyp[56].dn";
connectAttr "lyt_ctrl_L_mouth_upShape.msg" "face_layout_hyperLayout55.hyp[57].dn"
		;
connectAttr "lyt_ctrl_L_obic.msg" "face_layout_hyperLayout55.hyp[58].dn";
connectAttr "lyt_ctrl_L_obicShape.msg" "face_layout_hyperLayout55.hyp[59].dn";
connectAttr "grp_ctrl_main_L_mouth_up.msg" "face_layout_hyperLayout55.hyp[78].dn"
		;
connectAttr "ctrl_main_L_mouth_up.msg" "face_layout_hyperLayout55.hyp[79].dn";
connectAttr "ctrl_main_L_mouth_upShape.msg" "face_layout_hyperLayout55.hyp[80].dn"
		;
connectAttr "grp_L_mouth_corner.msg" "face_layout_hyperLayout55.hyp[81].dn";
connectAttr "lyt_ctrl_L_mouthcorner_up.msg" "face_layout_hyperLayout55.hyp[82].dn"
		;
connectAttr "lyt_ctrl_L_mouthcorner_upShape.msg" "face_layout_hyperLayout55.hyp[83].dn"
		;
connectAttr "lyt_ctrl_L_mouthcorner_low.msg" "face_layout_hyperLayout55.hyp[84].dn"
		;
connectAttr "lyt_ctrl_L_mouthcorner_lowShape.msg" "face_layout_hyperLayout55.hyp[85].dn"
		;
connectAttr "lyt_ctrl_L_mouthcorner_out.msg" "face_layout_hyperLayout55.hyp[86].dn"
		;
connectAttr "lyt_ctrl_L_mouthcorner_outShape.msg" "face_layout_hyperLayout55.hyp[87].dn"
		;
connectAttr "grp_ctrl_main_L_mouth_corner.msg" "face_layout_hyperLayout55.hyp[106].dn"
		;
connectAttr "ctrl_main_L_mouth_corner.msg" "face_layout_hyperLayout55.hyp[107].dn"
		;
connectAttr "ctrl_main_L_mouth_cornerShape.msg" "face_layout_hyperLayout55.hyp[108].dn"
		;
connectAttr "grp_C_mouth_up.msg" "face_layout_hyperLayout55.hyp[109].dn";
connectAttr "lyt_ctrl_C_mouth_up.msg" "face_layout_hyperLayout55.hyp[110].dn";
connectAttr "lyt_ctrl_C_mouth_upShape.msg" "face_layout_hyperLayout55.hyp[111].dn"
		;
connectAttr "grp_ctrl_main_C_mouth_up.msg" "face_layout_hyperLayout55.hyp[130].dn"
		;
connectAttr "ctrl_main_C_mouth_up.msg" "face_layout_hyperLayout55.hyp[131].dn";
connectAttr "ctrl_main_C_mouth_upShape.msg" "face_layout_hyperLayout55.hyp[132].dn"
		;
connectAttr "grp_L_cheek.msg" "face_layout_hyperLayout55.hyp[133].dn";
connectAttr "lyt_ctrl_L_cheek.msg" "face_layout_hyperLayout55.hyp[134].dn";
connectAttr "lyt_ctrl_L_cheekShape.msg" "face_layout_hyperLayout55.hyp[135].dn";
connectAttr "grp_ctrl_main_L_cheek.msg" "face_layout_hyperLayout55.hyp[154].dn";
connectAttr "ctrl_main_L_cheek.msg" "face_layout_hyperLayout55.hyp[155].dn";
connectAttr "ctrl_main_L_cheekShape.msg" "face_layout_hyperLayout55.hyp[156].dn"
		;
connectAttr "grp_L_lid_low.msg" "face_layout_hyperLayout55.hyp[157].dn";
connectAttr "lyt_ctrl_L_lid1_low.msg" "face_layout_hyperLayout55.hyp[158].dn";
connectAttr "lyt_ctrl_L_lid1_lowShape.msg" "face_layout_hyperLayout55.hyp[159].dn"
		;
connectAttr "lyt_ctrl_L_lid2_low.msg" "face_layout_hyperLayout55.hyp[160].dn";
connectAttr "lyt_ctrl_L_lid2_lowShape.msg" "face_layout_hyperLayout55.hyp[161].dn"
		;
connectAttr "lyt_ctrl_L_lid3_low.msg" "face_layout_hyperLayout55.hyp[162].dn";
connectAttr "lyt_ctrl_L_lid3_lowShape.msg" "face_layout_hyperLayout55.hyp[163].dn"
		;
connectAttr "grp_ctrl_main_L_lid_low.msg" "face_layout_hyperLayout55.hyp[182].dn"
		;
connectAttr "ctrl_main_L_lid_low.msg" "face_layout_hyperLayout55.hyp[183].dn";
connectAttr "ctrl_main_L_lid_lowShape.msg" "face_layout_hyperLayout55.hyp[184].dn"
		;
connectAttr "grp_L_brow.msg" "face_layout_hyperLayout55.hyp[185].dn";
connectAttr "lyt_ctrl_L_brow1.msg" "face_layout_hyperLayout55.hyp[186].dn";
connectAttr "lyt_ctrl_L_brow1Shape.msg" "face_layout_hyperLayout55.hyp[187].dn";
connectAttr "lyt_ctrl_L_brow2.msg" "face_layout_hyperLayout55.hyp[188].dn";
connectAttr "lyt_ctrl_L_brow2Shape.msg" "face_layout_hyperLayout55.hyp[189].dn";
connectAttr "lyt_ctrl_L_brow3.msg" "face_layout_hyperLayout55.hyp[190].dn";
connectAttr "lyt_ctrl_L_brow3Shape.msg" "face_layout_hyperLayout55.hyp[191].dn";
connectAttr "grp_ctrl_main_L_brow.msg" "face_layout_hyperLayout55.hyp[210].dn";
connectAttr "ctrl_main_L_brow.msg" "face_layout_hyperLayout55.hyp[211].dn";
connectAttr "ctrl_main_L_browShape.msg" "face_layout_hyperLayout55.hyp[212].dn";
connectAttr "grp_L_lid_center.msg" "face_layout_hyperLayout55.hyp[213].dn";
connectAttr "lyt_ctrl_L_lidcrnr_in.msg" "face_layout_hyperLayout55.hyp[214].dn";
connectAttr "lyt_ctrl_L_lidcrnr_inShape.msg" "face_layout_hyperLayout55.hyp[215].dn"
		;
connectAttr "lyt_ctrl_L_lidcrnr_out.msg" "face_layout_hyperLayout55.hyp[216].dn"
		;
connectAttr "lyt_ctrl_L_lidcrnr_outShape.msg" "face_layout_hyperLayout55.hyp[217].dn"
		;
connectAttr "grp_ctrl_main_L_lid_center.msg" "face_layout_hyperLayout55.hyp[224].dn"
		;
connectAttr "ctrl_main_L_lid_center.msg" "face_layout_hyperLayout55.hyp[225].dn"
		;
connectAttr "ctrl_main_L_lid_centerShape.msg" "face_layout_hyperLayout55.hyp[226].dn"
		;
connectAttr "grp_C_brow.msg" "face_layout_hyperLayout55.hyp[227].dn";
connectAttr "lyt_ctrl_C_brow.msg" "face_layout_hyperLayout55.hyp[228].dn";
connectAttr "lyt_ctrl_C_browShape.msg" "face_layout_hyperLayout55.hyp[229].dn";
connectAttr "grp_ctrl_main_C_brow.msg" "face_layout_hyperLayout55.hyp[236].dn";
connectAttr "ctrl_main_C_brow.msg" "face_layout_hyperLayout55.hyp[237].dn";
connectAttr "ctrl_main_C_browShape.msg" "face_layout_hyperLayout55.hyp[238].dn";
connectAttr "grp_L_nasal.msg" "face_layout_hyperLayout55.hyp[239].dn";
connectAttr "lyt_ctrl_L_nasal1.msg" "face_layout_hyperLayout55.hyp[240].dn";
connectAttr "lyt_ctrl_L_nasal1Shape.msg" "face_layout_hyperLayout55.hyp[241].dn"
		;
connectAttr "lyt_ctrl_L_nasal2.msg" "face_layout_hyperLayout55.hyp[242].dn";
connectAttr "lyt_ctrl_L_nasal2Shape.msg" "face_layout_hyperLayout55.hyp[243].dn"
		;
connectAttr "grp_ctrl_main_L_nasal.msg" "face_layout_hyperLayout55.hyp[250].dn";
connectAttr "ctrl_main_L_nasal.msg" "face_layout_hyperLayout55.hyp[251].dn";
connectAttr "ctrl_main_L_nasalShape.msg" "face_layout_hyperLayout55.hyp[252].dn"
		;
connectAttr "grp_L_zygo.msg" "face_layout_hyperLayout55.hyp[253].dn";
connectAttr "lyt_ctrl_L_zygo1.msg" "face_layout_hyperLayout55.hyp[254].dn";
connectAttr "lyt_ctrl_L_zygo1Shape.msg" "face_layout_hyperLayout55.hyp[255].dn";
connectAttr "lyt_ctrl_L_zygo2.msg" "face_layout_hyperLayout55.hyp[256].dn";
connectAttr "lyt_ctrl_L_zygo2Shape.msg" "face_layout_hyperLayout55.hyp[257].dn";
connectAttr "grp_ctrl_main_L_zygo.msg" "face_layout_hyperLayout55.hyp[266].dn";
connectAttr "ctrl_main_L_zygo.msg" "face_layout_hyperLayout55.hyp[267].dn";
connectAttr "ctrl_main_L_zygoShape.msg" "face_layout_hyperLayout55.hyp[268].dn";
connectAttr "grp_L_lid_up.msg" "face_layout_hyperLayout55.hyp[269].dn";
connectAttr "lyt_ctrl_L_lid1_up.msg" "face_layout_hyperLayout55.hyp[270].dn";
connectAttr "lyt_ctrl_L_lid1_upShape.msg" "face_layout_hyperLayout55.hyp[271].dn"
		;
connectAttr "lyt_ctrl_L_lid2_up.msg" "face_layout_hyperLayout55.hyp[272].dn";
connectAttr "lyt_ctrl_L_lid2_upShape.msg" "face_layout_hyperLayout55.hyp[273].dn"
		;
connectAttr "lyt_ctrl_L_lid3_up.msg" "face_layout_hyperLayout55.hyp[274].dn";
connectAttr "lyt_ctrl_L_lid3_upShape.msg" "face_layout_hyperLayout55.hyp[275].dn"
		;
connectAttr "grp_ctrl_main_L_lid_up.msg" "face_layout_hyperLayout55.hyp[294].dn"
		;
connectAttr "ctrl_main_L_lid_up.msg" "face_layout_hyperLayout55.hyp[295].dn";
connectAttr "ctrl_main_L_lid_upShape.msg" "face_layout_hyperLayout55.hyp[296].dn"
		;
connectAttr "FACE_CONTROLS.msg" "face_layout_hyperLayout55.hyp[933].dn";
connectAttr "ZERO_grp_ctrl_C_mouthUp.msg" "face_layout_hyperLayout55.hyp[934].dn"
		;
connectAttr "ctrl_mr_C_mouthUp.msg" "face_layout_hyperLayout55.hyp[935].dn";
connectAttr "ctrl_mr_C_mouthUpShape.msg" "face_layout_hyperLayout55.hyp[936].dn"
		;
connectAttr "ZERO_grp_ctrl_C_mouthDown.msg" "face_layout_hyperLayout55.hyp[937].dn"
		;
connectAttr "ctrl_mr_C_mouthDown.msg" "face_layout_hyperLayout55.hyp[938].dn";
connectAttr "ctrl_mr_C_mouthDownShape.msg" "face_layout_hyperLayout55.hyp[939].dn"
		;
connectAttr "ZERO_grp_ctrl_L_mouthCorner.msg" "face_layout_hyperLayout55.hyp[940].dn"
		;
connectAttr "ctrl_mr_L_mouthCorner.msg" "face_layout_hyperLayout55.hyp[941].dn";
connectAttr "ctrl_mr_L_mouthCornerShape.msg" "face_layout_hyperLayout55.hyp[942].dn"
		;
connectAttr "ZERO_grp_ctrl_C_muzzle.msg" "face_layout_hyperLayout55.hyp[943].dn"
		;
connectAttr "ctrl_mr_C_muzzle.msg" "face_layout_hyperLayout55.hyp[944].dn";
connectAttr "ctrl_mr_C_muzzleShape.msg" "face_layout_hyperLayout55.hyp[945].dn";
connectAttr "ZERO_grp_ctrl_L_nasal.msg" "face_layout_hyperLayout55.hyp[946].dn";
connectAttr "ctrl_mr_L_nasal.msg" "face_layout_hyperLayout55.hyp[947].dn";
connectAttr "ctrl_mr_L_nasalShape.msg" "face_layout_hyperLayout55.hyp[948].dn";
connectAttr "ZERO_grp_ctrl_C_brow.msg" "face_layout_hyperLayout55.hyp[949].dn";
connectAttr "ctrl_mr_C_brow.msg" "face_layout_hyperLayout55.hyp[950].dn";
connectAttr "ctrl_mr_C_browShape.msg" "face_layout_hyperLayout55.hyp[951].dn";
connectAttr "ZERO_grp_ctrl_L_lidUp.msg" "face_layout_hyperLayout55.hyp[952].dn";
connectAttr "ctrl_mr_L_lidUp.msg" "face_layout_hyperLayout55.hyp[953].dn";
connectAttr "ctrl_mr_L_lidUpShape.msg" "face_layout_hyperLayout55.hyp[954].dn";
connectAttr "ZERO_grp_ctrl_L_lidLow.msg" "face_layout_hyperLayout55.hyp[955].dn"
		;
connectAttr "ctrl_mr_L_lidLow.msg" "face_layout_hyperLayout55.hyp[956].dn";
connectAttr "ctrl_mr_L_lidLowShape.msg" "face_layout_hyperLayout55.hyp[957].dn";
connectAttr "ZERO_grp_ctrl_L_eye.msg" "face_layout_hyperLayout55.hyp[961].dn";
connectAttr "ctrl_mr_L_eye.msg" "face_layout_hyperLayout55.hyp[962].dn";
connectAttr "ctrl_mr_L_eyeShape.msg" "face_layout_hyperLayout55.hyp[963].dn";
connectAttr "ZERO_grp_ctrl_L_lidIn.msg" "face_layout_hyperLayout55.hyp[964].dn";
connectAttr "ctrl_mr_L_lidIn.msg" "face_layout_hyperLayout55.hyp[965].dn";
connectAttr "ctrl_mr_L_lidInShape.msg" "face_layout_hyperLayout55.hyp[966].dn";
connectAttr "ZERO_grp_ctrl_L_lidOut.msg" "face_layout_hyperLayout55.hyp[967].dn"
		;
connectAttr "ctrl_mr_L_lidOut.msg" "face_layout_hyperLayout55.hyp[968].dn";
connectAttr "ctrl_mr_L_lidOutShape.msg" "face_layout_hyperLayout55.hyp[969].dn";
connectAttr "ZERO_grp_ctrl_L_brow.msg" "face_layout_hyperLayout55.hyp[970].dn";
connectAttr "ctrl_mr_L_brow.msg" "face_layout_hyperLayout55.hyp[971].dn";
connectAttr "ctrl_mr_L_browShape.msg" "face_layout_hyperLayout55.hyp[972].dn";
connectAttr "ZERO_grp_ctrl_L_cheek.msg" "face_layout_hyperLayout55.hyp[973].dn";
connectAttr "ctrl_mr_L_cheek.msg" "face_layout_hyperLayout55.hyp[974].dn";
connectAttr "ctrl_mr_L_cheekShape.msg" "face_layout_hyperLayout55.hyp[975].dn";
connectAttr "ZERO_grp_ctrl_L_zygo.msg" "face_layout_hyperLayout55.hyp[976].dn";
connectAttr "ctrl_mr_L_zygo.msg" "face_layout_hyperLayout55.hyp[977].dn";
connectAttr "ctrl_mr_L_zygoShape.msg" "face_layout_hyperLayout55.hyp[978].dn";
connectAttr "ZERO_grp_ctrl_L_mouthUp.msg" "face_layout_hyperLayout55.hyp[979].dn"
		;
connectAttr "ctrl_mr_L_mouthUp.msg" "face_layout_hyperLayout55.hyp[980].dn";
connectAttr "ctrl_mr_L_mouthUpShape.msg" "face_layout_hyperLayout55.hyp[981].dn"
		;
connectAttr "ZERO_grp_ctrl_L_mouthLow.msg" "face_layout_hyperLayout55.hyp[982].dn"
		;
connectAttr "ctrl_mr_L_mouthLow.msg" "face_layout_hyperLayout55.hyp[983].dn";
connectAttr "ctrl_mr_L_mouthLowShape.msg" "face_layout_hyperLayout55.hyp[984].dn"
		;
connectAttr "ZERO_grp_ctrl_C_jaw.msg" "face_layout_hyperLayout55.hyp[985].dn";
connectAttr "ctrl_mr_C_jaw.msg" "face_layout_hyperLayout55.hyp[986].dn";
connectAttr "ctrl_mr_C_jawShape.msg" "face_layout_hyperLayout55.hyp[987].dn";
connectAttr "folicle_L_mouth_low.msg" "face_layout_hyperLayout55.hyp[989].dn";
connectAttr "folicle_C_mouth_low.msg" "face_layout_hyperLayout55.hyp[990].dn";
connectAttr "folicle_L_chin.msg" "face_layout_hyperLayout55.hyp[991].dn";
connectAttr "folicle_L_mouth_up.msg" "face_layout_hyperLayout55.hyp[992].dn";
connectAttr "folicle_L_obic.msg" "face_layout_hyperLayout55.hyp[993].dn";
connectAttr "folicle_L_mouthcorner_up.msg" "face_layout_hyperLayout55.hyp[994].dn"
		;
connectAttr "folicle_L_mouthcorner_low.msg" "face_layout_hyperLayout55.hyp[995].dn"
		;
connectAttr "folicle_L_mouthcorner_out.msg" "face_layout_hyperLayout55.hyp[996].dn"
		;
connectAttr "folicle_C_mouth_up.msg" "face_layout_hyperLayout55.hyp[997].dn";
connectAttr "folicle_L_cheek.msg" "face_layout_hyperLayout55.hyp[998].dn";
connectAttr "folicle_L_lid1_low.msg" "face_layout_hyperLayout55.hyp[999].dn";
connectAttr "folicle_L_lid2_low.msg" "face_layout_hyperLayout55.hyp[1000].dn";
connectAttr "folicle_L_lid3_low.msg" "face_layout_hyperLayout55.hyp[1001].dn";
connectAttr "folicle_L_brow1.msg" "face_layout_hyperLayout55.hyp[1002].dn";
connectAttr "folicle_L_brow2.msg" "face_layout_hyperLayout55.hyp[1003].dn";
connectAttr "folicle_L_brow3.msg" "face_layout_hyperLayout55.hyp[1004].dn";
connectAttr "folicle_L_lidcrnr_in.msg" "face_layout_hyperLayout55.hyp[1005].dn";
connectAttr "folicle_L_lidcrnr_out.msg" "face_layout_hyperLayout55.hyp[1006].dn"
		;
connectAttr "folicle_C_brow.msg" "face_layout_hyperLayout55.hyp[1007].dn";
connectAttr "folicle_L_nasal1.msg" "face_layout_hyperLayout55.hyp[1008].dn";
connectAttr "folicle_L_nasal2.msg" "face_layout_hyperLayout55.hyp[1009].dn";
connectAttr "folicle_L_zygo1.msg" "face_layout_hyperLayout55.hyp[1010].dn";
connectAttr "folicle_L_zygo2.msg" "face_layout_hyperLayout55.hyp[1011].dn";
connectAttr "folicle_L_lid1_up.msg" "face_layout_hyperLayout55.hyp[1012].dn";
connectAttr "folicle_L_lid2_up.msg" "face_layout_hyperLayout55.hyp[1013].dn";
connectAttr "folicle_L_lid3_up.msg" "face_layout_hyperLayout55.hyp[1014].dn";
connectAttr "folicle_L_mouth_lowShape.msg" "face_layout_hyperLayout55.hyp[1041].dn"
		;
connectAttr "folicle_C_mouth_lowShape.msg" "face_layout_hyperLayout55.hyp[1042].dn"
		;
connectAttr "folicle_L_chinShape.msg" "face_layout_hyperLayout55.hyp[1043].dn";
connectAttr "folicle_L_mouth_upShape.msg" "face_layout_hyperLayout55.hyp[1044].dn"
		;
connectAttr "folicle_L_obicShape.msg" "face_layout_hyperLayout55.hyp[1045].dn";
connectAttr "folicle_L_mouthcorner_upShape.msg" "face_layout_hyperLayout55.hyp[1046].dn"
		;
connectAttr "folicle_L_mouthcorner_lowShape.msg" "face_layout_hyperLayout55.hyp[1047].dn"
		;
connectAttr "folicle_L_mouthcorner_outShape.msg" "face_layout_hyperLayout55.hyp[1048].dn"
		;
connectAttr "folicle_C_mouth_upShape.msg" "face_layout_hyperLayout55.hyp[1049].dn"
		;
connectAttr "folicle_L_cheekShape.msg" "face_layout_hyperLayout55.hyp[1050].dn";
connectAttr "folicle_L_lid1_lowShape.msg" "face_layout_hyperLayout55.hyp[1051].dn"
		;
connectAttr "folicle_L_lid2_lowShape.msg" "face_layout_hyperLayout55.hyp[1052].dn"
		;
connectAttr "folicle_L_lid3_lowShape.msg" "face_layout_hyperLayout55.hyp[1053].dn"
		;
connectAttr "folicle_L_brow1Shape.msg" "face_layout_hyperLayout55.hyp[1054].dn";
connectAttr "folicle_L_brow2Shape.msg" "face_layout_hyperLayout55.hyp[1055].dn";
connectAttr "folicle_L_brow3Shape.msg" "face_layout_hyperLayout55.hyp[1056].dn";
connectAttr "folicle_L_lidcrnr_inShape.msg" "face_layout_hyperLayout55.hyp[1057].dn"
		;
connectAttr "folicle_L_lidcrnr_outShape.msg" "face_layout_hyperLayout55.hyp[1058].dn"
		;
connectAttr "folicle_C_browShape.msg" "face_layout_hyperLayout55.hyp[1059].dn";
connectAttr "folicle_L_nasal1Shape.msg" "face_layout_hyperLayout55.hyp[1060].dn"
		;
connectAttr "folicle_L_nasal2Shape.msg" "face_layout_hyperLayout55.hyp[1061].dn"
		;
connectAttr "folicle_L_zygo1Shape.msg" "face_layout_hyperLayout55.hyp[1062].dn";
connectAttr "folicle_L_zygo2Shape.msg" "face_layout_hyperLayout55.hyp[1063].dn";
connectAttr "folicle_L_lid1_upShape.msg" "face_layout_hyperLayout55.hyp[1064].dn"
		;
connectAttr "folicle_L_lid2_upShape.msg" "face_layout_hyperLayout55.hyp[1065].dn"
		;
connectAttr "folicle_L_lid3_upShape.msg" "face_layout_hyperLayout55.hyp[1066].dn"
		;
connectAttr "ZERO_grp_ctrl_headTop.msg" "face_layout_hyperLayout55.hyp[1080].dn"
		;
connectAttr "ZERO_grp_ctrl_headMid.msg" "face_layout_hyperLayout55.hyp[1083].dn"
		;
connectAttr "ctrl_mr_C_headMid.msg" "face_layout_hyperLayout55.hyp[1084].dn";
connectAttr "ctrl_mr_C_headMidShape.msg" "face_layout_hyperLayout55.hyp[1085].dn"
		;
connectAttr "ZERO_grp_ctrl_headBtm.msg" "face_layout_hyperLayout55.hyp[1086].dn"
		;
connectAttr "ctrl_mr_C_headBtm.msg" "face_layout_hyperLayout55.hyp[1087].dn";
connectAttr "ctrl_mr_C_headBtmShape.msg" "face_layout_hyperLayout55.hyp[1088].dn"
		;
connectAttr "grp_sub_headTop.msg" "face_layout_hyperLayout55.hyp[1092].dn";
connectAttr "grp_sub_headMid.msg" "face_layout_hyperLayout55.hyp[1093].dn";
connectAttr "ZERO_grp_ctrl_L_nose.msg" "face_layout_hyperLayout55.hyp[1095].dn";
connectAttr "ctrl_mr_L_nose.msg" "face_layout_hyperLayout55.hyp[1096].dn";
connectAttr "ctrl_mr_L_noseShape.msg" "face_layout_hyperLayout55.hyp[1097].dn";
connectAttr "ZERO_grp_ctrl_C_nose.msg" "face_layout_hyperLayout55.hyp[1106].dn";
connectAttr "ctrl_mr_C_nose.msg" "face_layout_hyperLayout55.hyp[1107].dn";
connectAttr "ctrl_mr_C_noseShape.msg" "face_layout_hyperLayout55.hyp[1108].dn";
connectAttr "World_grp_FAC_EDC.msg" "face_layout_hyperLayout55.hyp[1109].dn";
connectAttr "grp_surf_headBtm.msg" "face_layout_hyperLayout55.hyp[1110].dn";
connectAttr "surf_L_mouthUp.msg" "face_layout_hyperLayout55.hyp[1111].dn";
connectAttr "surf_L_mouthUpShape.msg" "face_layout_hyperLayout55.hyp[1112].dn";
connectAttr "surf_L_mcorner.msg" "face_layout_hyperLayout55.hyp[1114].dn";
connectAttr "surf_L_mcornerShape.msg" "face_layout_hyperLayout55.hyp[1115].dn";
connectAttr "surf_C_mouthUp.msg" "face_layout_hyperLayout55.hyp[1117].dn";
connectAttr "surf_C_mouthUpShape.msg" "face_layout_hyperLayout55.hyp[1118].dn";
connectAttr "surf_L_cheek.msg" "face_layout_hyperLayout55.hyp[1120].dn";
connectAttr "surf_L_cheekShape.msg" "face_layout_hyperLayout55.hyp[1121].dn";
connectAttr "surf_L_cheekShapeOrig.msg" "face_layout_hyperLayout55.hyp[1122].dn"
		;
connectAttr "ZERO_grp_surf_jawSubA.msg" "face_layout_hyperLayout55.hyp[1123].dn"
		;
connectAttr "grp_surf_jawSubA.msg" "face_layout_hyperLayout55.hyp[1124].dn";
connectAttr "surf_C_mouthLow.msg" "face_layout_hyperLayout55.hyp[1125].dn";
connectAttr "surf_C_mouthLowShape.msg" "face_layout_hyperLayout55.hyp[1126].dn";
connectAttr "surf_L_chin.msg" "face_layout_hyperLayout55.hyp[1128].dn";
connectAttr "surf_L_chinShape.msg" "face_layout_hyperLayout55.hyp[1129].dn";
connectAttr "ZERO_grp_surf_jawSubB.msg" "face_layout_hyperLayout55.hyp[1137].dn"
		;
connectAttr "grp_surf_jawSubB.msg" "face_layout_hyperLayout55.hyp[1138].dn";
connectAttr "surf_L_mouthLow.msg" "face_layout_hyperLayout55.hyp[1139].dn";
connectAttr "surf_L_mouthLowShape.msg" "face_layout_hyperLayout55.hyp[1140].dn";
connectAttr "grp_surf_headTop.msg" "face_layout_hyperLayout55.hyp[1157].dn";
connectAttr "surf_L_lidLow.msg" "face_layout_hyperLayout55.hyp[1158].dn";
connectAttr "surf_L_lidLowShape.msg" "face_layout_hyperLayout55.hyp[1159].dn";
connectAttr "surf_L_brow.msg" "face_layout_hyperLayout55.hyp[1161].dn";
connectAttr "surf_L_browShape.msg" "face_layout_hyperLayout55.hyp[1162].dn";
connectAttr "surf_L_lidCenter.msg" "face_layout_hyperLayout55.hyp[1164].dn";
connectAttr "surf_L_lidCenterShape.msg" "face_layout_hyperLayout55.hyp[1165].dn"
		;
connectAttr "surf_C_brow.msg" "face_layout_hyperLayout55.hyp[1167].dn";
connectAttr "surf_C_browShape.msg" "face_layout_hyperLayout55.hyp[1168].dn";
connectAttr "surf_L_lidUp.msg" "face_layout_hyperLayout55.hyp[1170].dn";
connectAttr "surf_L_lidUpShape.msg" "face_layout_hyperLayout55.hyp[1171].dn";
connectAttr "grp_surf_headMid.msg" "face_layout_hyperLayout55.hyp[1188].dn";
connectAttr "surf_L_nasal.msg" "face_layout_hyperLayout55.hyp[1189].dn";
connectAttr "surf_L_nasalShape.msg" "face_layout_hyperLayout55.hyp[1190].dn";
connectAttr "surf_L_zygo.msg" "face_layout_hyperLayout55.hyp[1192].dn";
connectAttr "surf_L_zygoShape.msg" "face_layout_hyperLayout55.hyp[1193].dn";
connectAttr "ZERO_grp_surf_muzzleSubA.msg" "face_layout_hyperLayout55.hyp[1201].dn"
		;
connectAttr "grp_surf_muzzleSubA.msg" "face_layout_hyperLayout55.hyp[1202].dn";
connectAttr "ZERO_grp_surf_muzzleSubB.msg" "face_layout_hyperLayout55.hyp[1203].dn"
		;
connectAttr "grp_surf_muzzleSubB.msg" "face_layout_hyperLayout55.hyp[1204].dn";
connectAttr "ZERO_grp_surfaces.msg" "face_layout_hyperLayout55.hyp[1206].dn";
connectAttr "grp_eyeRoot.msg" "face_layout_hyperLayout55.hyp[1207].dn";
connectAttr "ZERO_grp_eyeRoot.msg" "face_layout_hyperLayout55.hyp[1208].dn";
connectAttr "grp_surf_jawSubC.msg" "face_layout_hyperLayout55.hyp[1209].dn";
connectAttr "ZERO_grp_surf_jawSubC.msg" "face_layout_hyperLayout55.hyp[1210].dn"
		;
connectAttr "face_layout_mat_surf1.msg" "face_layout_hyperLayout55.hyp[1211].dn"
		;
connectAttr "ZERO_grp_ctrl_L_eyeRoot.msg" "face_layout_hyperLayout55.hyp[1212].dn"
		;
connectAttr "ctrl_mr_L_eyeRoot.msg" "face_layout_hyperLayout55.hyp[1213].dn";
connectAttr "ctrl_mr_L_eyeRootShape.msg" "face_layout_hyperLayout55.hyp[1214].dn"
		;
connectAttr "surf_L_brow_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1215].dn"
		;
connectAttr "surf_L_brow_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1216].dn"
		;
connectAttr "surf_C_brow_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1217].dn"
		;
connectAttr "surf_C_brow_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1218].dn"
		;
connectAttr "surf_L_lidLow_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1219].dn"
		;
connectAttr "surf_L_lidLow_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1220].dn"
		;
connectAttr "surf_L_lidCenter_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1221].dn"
		;
connectAttr "surf_L_lidCenter_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1222].dn"
		;
connectAttr "surf_L_lidUp_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1223].dn"
		;
connectAttr "surf_L_lidUp_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1224].dn"
		;
connectAttr "surf_L_nasal_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1225].dn"
		;
connectAttr "surf_L_nasal_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1226].dn"
		;
connectAttr "surf_L_zygo_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1227].dn"
		;
connectAttr "surf_L_zygo_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1228].dn"
		;
connectAttr "surf_L_cheek_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1229].dn"
		;
connectAttr "surf_L_cheek_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1230].dn"
		;
connectAttr "surf_L_mouthUp_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1231].dn"
		;
connectAttr "surf_L_mouthUp_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1232].dn"
		;
connectAttr "surf_C_mouthUp_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1233].dn"
		;
connectAttr "surf_C_mouthUp_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1234].dn"
		;
connectAttr "surf_C_mouthLow_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1235].dn"
		;
connectAttr "surf_C_mouthLow_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1236].dn"
		;
connectAttr "surf_L_chin_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1237].dn"
		;
connectAttr "surf_L_chin_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1238].dn"
		;
connectAttr "surf_L_mouthLow_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1239].dn"
		;
connectAttr "surf_L_mouthLow_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1240].dn"
		;
connectAttr "surf_L_mcorner_parentConstraint1.msg" "face_layout_hyperLayout55.hyp[1241].dn"
		;
connectAttr "surf_L_mcorner_scaleConstraint1.msg" "face_layout_hyperLayout55.hyp[1242].dn"
		;
connectAttr "ctrl_mr_C_headTop.msg" "face_layout_hyperLayout55.hyp[1243].dn";
connectAttr "ctrl_mr_C_headTopShape.msg" "face_layout_hyperLayout55.hyp[1244].dn"
		;
connectAttr ":TurtleDefaultBakeLayer.idx" ":TurtleBakeLayerManager.bli[0]";
connectAttr ":TurtleRenderOptions.msg" ":TurtleDefaultBakeLayer.rset";
connectAttr "hyperView1.msg" "nodeEditorPanel1Info.b[0]";
connectAttr "hyperLayout1.msg" "hyperView1.hl";
connectAttr ":TurtleRenderOptions.msg" "hyperLayout1.hyp[0].dn";
connectAttr ":TurtleUIOptions.msg" "hyperLayout1.hyp[1].dn";
connectAttr ":TurtleBakeLayerManager.msg" "hyperLayout1.hyp[2].dn";
connectAttr ":TurtleDefaultBakeLayer.msg" "hyperLayout1.hyp[3].dn";
connectAttr "face_layout_lambert2SG1.pa" ":renderPartition.st" -na;
connectAttr "face_layout_mat_surf1.msg" ":defaultShaderList1.s" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr ":perspShape.msg" ":defaultRenderGlobals.sc";
// End of face_layout.ma
