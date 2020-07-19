Rails.application.configure do
  config.study_meter = {
    user: { host: "study-meter.com", path: "" },
    admin: { host: "study-meter.com", path: "admin" }
  }
end
