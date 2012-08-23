function Set-Password($password) {
  $user = [adsi]"WinNT://$($env:userdomain)/$($env:username)"
  $user.SetPassword($password)
}
