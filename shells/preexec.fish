# Seiichi Ariga <seiichi.ariga@gmail.com>

function cs_pulse_preexec --on-event fish_preexec
  echo "Called : $argv"
end