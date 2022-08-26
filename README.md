# SmartContracts
 ## Counter Smart Contract

- Increment Function:

      Increment Function Increase the value of Counter variable one time when it is clicked:
- Deccrement Function:

      Deccrement Function Deccrease the value of Counter variable one time when it is clicked:
- Reset Function:

      Reset the value of counter to 0
      
 ## BalanceTransfer Smart Contract

- receiveBalance Function:

      will receive some amount in Ethereum Currency to store on Contract Address balance:
- showBalance Function:

      will show the balance that is received at that contract address:
- sendBalance Function:

      owner of that contract will be able to call sendBalance function
       to send that balance stored on contract address to Specific Address
        should be pass as an aurgument

## Lottery Contract

- participate Function:

      For participation in Lottery Participant balance should be greater
      than 1 ether for participation then can participate:
- showBalanc Function:

      Only manager can check the balance of Contract address that is stored:
- random Function:

      This function is for generating a random number.
- pickWinner Function:

      Manager will pickwinner and participants should be 3 or greater than 3,Balance of the
      contract will be transfer to Random Address from te participants.

## WithdrawBalance Smart Contract

- getBalance Function:

      will return the balance stored on smart contract address:
- sendMoney Function:

      sending some value to smart contract address will be stored on smart contract also store
      in balanceReceived in the form of address => balance key value pairs that which address
      has
      deposit how much amount:
- withdrawAllMoney Function:

      The address which sent amount to contract address can withdraw amount that
      is deposited by that address, to any address then from balanceReceive
      mapping amount will be zero of that address.
      

## WithdrawBalance Smart Contract

- receiveBalance Function:

      This function will receive balance from addresses to store on contract address
      and also store address and that address value deposited:
- showBalanceFunction:

      will return the total balance received by contract address:
- withDrawAmount Function:

      This function will get address and amount that sender want to send money to particular Address and
      amount that will be deducted from sender amount stored in mapping and contract address.
