FactoryGirl.define do
  factory :period do
    period_id "MyString"
    campus_id "MyString"
    b_active_period false
    b_sched_diff_periods false
    b_check_sites false
    limited_session_time 1
    from_schedule_email "MyString"
    b_check_priorities_1_2 false
    b_quota_exceeds_capacity false
    b_send_email_finished_selection false
    campus_contact_email "MyText"
    n_quota_less_limit 1
    d_lim_new_schedule_date "2016-11-16 13:00:05"
    period_description "MyString"
    admission_no_nds_id 1
  end
end
