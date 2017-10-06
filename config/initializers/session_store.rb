Webapp::Application.config.session_store :redis_store, {
  servers: [
    {
      url: ENV["REDIS_SESSION"]
    },
  ],
  expire_after: 90.minutes,
  key: "_#{Rails.application.class.parent_name.downcase}_session"
}