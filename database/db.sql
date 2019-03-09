-- users -> students
ALTER TABLE `users`
ADD KEY `users_student_id_foregin` (`student_id`),
ADD CONSTRAINT `users_student_id_foregin` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

-- students -> classes
ALTER TABLE `students`
ADD KEY `students_classes_foregin` (`class_id`),
ADD CONSTRAINT `students_classes_foregin` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);

-- students -> school_years
ALTER TABLE `students`
ADD KEY `students_school_years_foregin` (`school_year_id`),
ADD CONSTRAINT `students_school_years_foregin` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`id`);

-- user_roles
ALTER TABLE `user_roles`
ADD KEY `user_roles_users_foregin` (`user_id`),
ADD CONSTRAINT `user_roles_users_foregin` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ADD KEY `user_roles_roles_foregin` (`role_id`),
ADD CONSTRAINT `user_roles_roles_foregin` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

-- ward -> district
ALTER TABLE `wards`
ADD KEY `wards_districts_foregin` (`district_id`),
ADD CONSTRAINT `wards_districts_foregin` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`);

-- districts -> provinces
ALTER TABLE `districts`
ADD KEY `districts_provinces_foregin` (`province_id`),
ADD CONSTRAINT `districts_provinces_foregin` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`);

-- activities -> users
ALTER TABLE `activities`
ADD KEY `activities_users_foregin` (`leader`),
ADD CONSTRAINT `activities_users_foregin` FOREIGN KEY (`leader`) REFERENCES `users` (`id`);

-- workflows --> users
ALTER TABLE `workflows`
ADD KEY `workflows_users_foregin` (`user_id`),
ADD CONSTRAINT `workflows_users_foregin` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

-- workflows --> activities
ALTER TABLE `workflows`
ADD KEY `workflows_activities_foregin` (`activity_id`),
ADD CONSTRAINT `workflows_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`);

-- attenders --> activities
ALTER TABLE `attenders`
ADD KEY `attenders_activities_foregin` (`activity_id`),
ADD CONSTRAINT `attenders_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`);

-- attenders --> students
ALTER TABLE `attenders`
ADD KEY `attenders_students_foregin` (`student_id`),
ADD CONSTRAINT `attenders_students_foregin` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

-- checkin --> activities
ALTER TABLE `checkin`
ADD KEY `checkin_activities_foregin` (`activity_id`),
ADD CONSTRAINT `checkin_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`);

-- checkin --> students
ALTER TABLE `checkin`
ADD KEY `checkin_students_foregin` (`student_id`),
ADD CONSTRAINT `checkin_students_foregin` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

-- practise_marks --> activities
ALTER TABLE `practise_marks`
ADD KEY `practise_marks_activities_foregin` (`activity_id`),
ADD CONSTRAINT `practise_marks_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`);

-- practise_marks --> students
ALTER TABLE `practise_marks`
ADD KEY `practise_marks_students_foregin` (`student_id`),
ADD CONSTRAINT `practise_marks_students_foregin` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

-- social_marks --> activities
ALTER TABLE `social_marks`
ADD KEY `social_marks_activities_foregin` (`activity_id`),
ADD CONSTRAINT `social_marks_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`);

-- social_marks --> students
ALTER TABLE `social_marks`
ADD KEY `social_marks_students_foregin` (`student_id`),
ADD CONSTRAINT `social_marks_students_foregin` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

-- union_fees --> school_years
ALTER TABLE `union_fees`
ADD KEY `union_fees_school_years_foregin` (`school_year_id`),
ADD CONSTRAINT `union_fees_school_years_foregin` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`id`);


-- activity_funds --> activities
ALTER TABLE `activity_funds`
ADD KEY `activity_funds_activities_foregin` (`activity_id`),
ADD CONSTRAINT `activity_funds_activities_foregin` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`);

-- activity_fund_details --> activity_funds
ALTER TABLE `activity_fund_details`
ADD KEY `activity_fund_details_activity_funds_foregin` (`fund_id`),
ADD CONSTRAINT `activity_fund_details_activity_funds_foregin` FOREIGN KEY (`fund_id`) REFERENCES `activity_funds` (`id`);

-- activity_fund_details --> users
ALTER TABLE `activity_fund_details`
ADD KEY `activity_fund_details_users_foregin` (`user_id`),
ADD CONSTRAINT `activity_fund_details_users_foregin` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

-- yearly_funds --> school_years
ALTER TABLE `yearly_funds`
ADD KEY `yearly_funds_school_years_foregin` (`school_year_id`),
ADD CONSTRAINT `yearly_funds_school_years_foregin` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`id`);

-- news --> news_types
ALTER TABLE `news`
ADD KEY `news_news_types_foregin` (`type_id`),
ADD CONSTRAINT `news_news_types_foregin` FOREIGN KEY (`type_id`) REFERENCES `news_types` (`id`);

-- news --> users
ALTER TABLE `news`
ADD KEY `news_users_foregin` (`created_by`),
ADD CONSTRAINT `news_users_foregin` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);