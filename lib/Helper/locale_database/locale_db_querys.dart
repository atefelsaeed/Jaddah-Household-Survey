class LocaleDBQueries {
  static const String createSurveyPTTable = '''
  CREATE TABLE `servey_p_t_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `synced` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headerLat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headerLong` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headerDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headerEmpNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headerInterviewNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headerDistrictName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headerZoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsAddressLong` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsNumberBedRooms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsNumberApartments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsNumberFloors` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsAddressLat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsPhone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsHavePastTrip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsDwellingType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsIsDwelling` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsNumberSeparateFamilies` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsNumberAdults` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsNumberChildren` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsNumberYearsInAddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsDemolishedAreas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsPCTotalBikesNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsPCAdultsBikesNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsPCChildrenBikesNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsECTotalBikesNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsECAdultsBikesNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsECChildrenBikesNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsESTotalBikesNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsESAdultsBikesNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsESChildrenBikesNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hhsTotalIncome` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehiclesData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`vehiclesData`)),
  `hhsSeparateFamilies` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hhsSeparateFamilies`)),
  `vehiclesBodyType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`vehiclesBodyType`)),
  `personData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`personData`)),
  `tripsList` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tripsList`)),
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL)''';

  static const String crateUsersTable = '''
  CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`review`)),
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL)''';

  static const String crateSurveysTable = '''
  CREATE TABLE `survies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `HAE_NO` int(11) NOT NULL,
  `HAE_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `QTA` int(11) NOT NULL,
  `BLOK` int(11) NOT NULL,
  `BLOK_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Y` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `X` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'not filled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL)''';
}
