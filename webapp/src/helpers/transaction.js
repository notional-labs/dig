import {
  coin,
  StdFee
} from "@cosmjs/stargate";
import { makeDelegateMsg, makeSendMsg, makeVoteMsg, makeUndelegateMsg, makeWithDrawMsg, makeSubmitProposalMsg, makeDepositMsg, makeWithDrawAllMsg } from "../helpers/ethereum/lib/eth-transaction/Msg"
import { MsgVote, MsgSubmitProposal } from 'cosmjs-types/cosmos/gov/v1beta1/tx'
import utils_1 from "@cosmjs/utils"
import gov_1 from "cosmjs-types/cosmos/gov/v1beta1/gov"
import any_1 from 'cosmjs-types/google/protobuf/any'


export const transfer = async (client, address, amount, recipient, gas) => {
  let fee = {
    amount: [],
    gas: `${gas}`,
  };
  const denom = process.env.REACT_APP_DENOM
  const msg = makeSendMsg(address, recipient, amount, denom)

  const result = await client.signAndBroadcast(
    address,
    [msg],
    fee,
  );
  return result
}

export const delegate = async (client, address, amount, recipient, gas) => {
  let fee = {
    amount: [],
    gas: `${gas}`,
  };

  const denom = process.env.REACT_APP_DENOM
  const msg = makeDelegateMsg(address, recipient, amount, denom)

  const result = await client.signAndBroadcast(
    address,
    [msg],
    fee,
  );
  return result

}

export const unbonding = async (client, address, amount, recipient, gas) => {
  let fee = {
    amount: [],
    gas: `${gas}`,
  };
  const denom = process.env.REACT_APP_DENOM
  const msg = makeUndelegateMsg(address, recipient, amount, denom)

  const result = await client.signAndBroadcast(
    address,
    [msg],
    fee,
  );
  return result
}

export const withDraw = async (client, address, validatorAddress, gas) => {
  let fee = {
    amount: [],
    gas: `${gas}`,
  };
  const msg = makeWithDrawMsg(address, validatorAddress)

  const result = await client.signAndBroadcast(
    address,
    [msg],
    fee,
  );
  return result
}

export const withDrawAll = async (client, address, validatorAddresses, gas) => {
  let fee = {
    amount: [],
    gas: `${gas}`,
  };
  const msg = makeWithDrawAllMsg(address, validatorAddresses)

  const result = await client.signAndBroadcast(
    address,
    [...msg],
    fee,
  );
  return result
}

export const vote = async (client, option, proposal_id, voter, gas) => {
  let fee = {
    amount: [],
    gas: `${gas}`,
  }

  const msg = makeVoteMsg(option, proposal_id, voter)

  console.log(msg)

  const result = await client.signAndBroadcast(
    voter,
    [msg],
    fee,
  )
  return result
}

export const voteTest = async (client, option, proposal_id, voter, gas, accounts) => {
  let fee = {
    amount: [],
    gas: `${gas}`,
  }

  client.aminoTypes.register["/cosmos.gov.v1beta1.MsgVote"] = {
    aminoType: "cosmos-sdk/MsgVote",
    toAmino: ({ option, proposalId, voter }) => {
      return {
        option: option,
        proposal_id: proposalId,
        voter: voter,
      };
    },
    fromAmino: ({ option, proposal_id, voter }) => {
      return {
        option: option,
        proposalId: proposal_id,
        voter: voter,
      };
    },
  }

  client.registry.register('/cosmos.gov.v1beta1.MsgVote', MsgVote)

  const account = await client.getAccount(voter)
  const accountNumber = account.accountNumber
  const sequence = account.sequence
  const chainId = await client.getChainId()

  const signerData = {
    accountNumber,
    sequence,
    chainId,
  }

  const msg = makeVoteMsg(option, proposal_id, voter)

  const signMsg = await client.signAndBroadcast(voter, [msg], fee, null, signerData)

}

export const submitProposal = async (client, title, description, deposit, proposer, gas) => {
  let fee = {
    amount: [],
    gas: `${gas}`,
  }

  const denom = process.env.REACT_APP_DENOM

  let msg = makeSubmitProposalMsg(title, description, deposit, proposer, denom)

  const account = await client.getAccount(proposer)
  const accountNumber = account.accountNumber
  const sequence = account.sequence
  const chainId = await client.getChainId()

  const signerData = {
    accountNumber,
    sequence,
    chainId,
  }

  const signMsg = await client.signAndBroadcast(proposer, [msg], fee, null, signerData)

  return signMsg
}

export const deposit = async (client, proposal_id, depositor, amount, gas) => {
  let fee = {
    amount: [],
    gas: `${gas}`,
  }

  const denom = process.env.REACT_APP_DENOM

  let msg = makeDepositMsg(amount, depositor, proposal_id, denom)

  const account = await client.getAccount(depositor)
  const accountNumber = account.accountNumber
  const sequence = account.sequence
  const chainId = await client.getChainId()

  const signerData = {
    accountNumber,
    sequence,
    chainId,
  }

  const signMsg = await client.signAndBroadcast(depositor, [msg], fee, null, signerData)

  return signMsg
}