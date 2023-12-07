import CryptoLove from 0x05
transaction() {
  prepare(signer: AuthAccount) {
  
    signer.save(<- CryptoLove.createEmptyCollection(), to: /storage/CryptoLove)

  
    signer.link<&CryptoLove.Collection>(/public/CryptoLove, target: /storage/CryptoLove)
    log("Account started successfully");
  }
}
