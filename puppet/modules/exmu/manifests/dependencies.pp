class exmu::dependencies {
  case $::operatingsystem {
    Ubuntu,Debian: { require exmu::dependencies::ubuntu }
  }
}
