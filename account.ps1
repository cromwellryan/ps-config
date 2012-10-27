function Set-Password($password) {
  $user = [adsi]"WinNT://$($env:userdomain)/$($env:username)"
  $user.SetPassword($password)
}

function Create-LocalUser($username, $password) {

  $objOu = [ADSI]"WinNT://$computer"

  $objUser = $objOU.Create("User", $user)

  $objUser.setpassword($password)
  $objUser.SetInfo()
  $objUser.description = ""
  $objUser.SetInfo()

}
