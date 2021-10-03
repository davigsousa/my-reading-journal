:- module(controllers_profile, []).

:- use_module("./src/utils/files.pl", []).

indexProfile(Profile):-
  utils_files:get_dict_from_json_file("./data/profile.json", Profile).

updateProfile(Profile):-
  utils_files:save_dict_to_json_file("./data/profile.json", Profile).