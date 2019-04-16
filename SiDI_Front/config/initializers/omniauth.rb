Rails.application.config.middleware.use OmniAuth::Builder do
  provider :wsfed,
           :issuer_name           => "http://fstest.itesm.mx/adfs/services/trust",
           :issuer                => "https://fstest.itesm.mx/adfs/ls/",
           :realm                 => "https://pprd504azms01.itesm.mx",
           :reply                 => "https://pprd504azms01.itesm.mx/auth/wsfed/callback",
           :saml_version          => "2",
           :id_claim              => "upn",
           :idp_cert_fingerprint  => "4269023ee20dbb805406c5c2cae545253f6f7c52dcaf0294f63e9c888aef56ec"
end