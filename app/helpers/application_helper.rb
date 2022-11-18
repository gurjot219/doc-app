module ApplicationHelper
  def parse_dates(date)
    Date.strptime(date.to_s, '%Y-%m-%d')
  end

  def is_log_in_page?
    request.fullpath.start_with?("/home") ||
    request.fullpath.start_with?("/patients/new")
  end

  def get_log_in_user
    if user_signed_in?
      case current_user.role
      when "doctor"
        doctor  = Doctor.find_by_email(current_user.email)
        return {user: doctor, edit_profile: edit_doctor_path(doctor), show_profile: doctor_path(doctor)}
      when "patient"
        patient = Patient.find_by_email(current_user.email)
        return {user: patient, edit_profile: edit_patient_path(patient), show_profile: patient_path(patient)}
      else
        {}
      end
    end
  end

  def get_errors(field, object)
    errors = object.errors.messages[field].join(", ")
    [errors.present?, errors]
  end
end
