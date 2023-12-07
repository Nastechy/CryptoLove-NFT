import CryptoLove from 0x05
import NonFungibleToken from 0x05

transaction(account: Address) {

  prepare(owner: AuthAccount) {

    let minter = owner.borrow<&CryptoLove.Minter>(from: /storage/Minter)
                    ?? panic("This owner did not deploy this contract.")


    let accountsCollection = getAccount(account).getCapability(/public/CryptoLove)
              .borrow<&CryptoLove.Collection{NonFungibleToken.CollectionPublic}>()
              ?? panic("This address does not have any Collection.")



    let nft <- minter.createNFT(name:"CryptoLove", favouriteFood: "yam", luckyNumber: 28)

    accountsCollection.deposit(token: <- nft)
  }

}
