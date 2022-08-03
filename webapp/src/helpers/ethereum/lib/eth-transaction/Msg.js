import { coins, coin } from "@cosmjs/launchpad";

const gov_1 = require("cosmjs-types/cosmos/gov/v1beta1/gov");


export function makeSendMsg(fromAddress, toAddress, amount, denom) {
    const msgSend = {
        fromAddress: fromAddress,
        toAddress: toAddress,
        amount: coins(amount, denom),
    };
    const msg = {
        typeUrl: "/cosmos.bank.v1beta1.MsgSend",
        value: msgSend,
    };
    return msg
}

export function makeDelegateMsg(delegator_address, validator_address, amount, denom) {

    const msgDelegate = {
        delegatorAddress: delegator_address,
        validatorAddress: validator_address,
        amount: coin(amount, denom)
    }
    const msg = {
        typeUrl: "/cosmos.staking.v1beta1.MsgDelegate",
        value: msgDelegate,
    };
    return msg
}

export function makeWithDrawMsg(delegator_address, validator_address) {

    const msgWithDraw = {
        delegatorAddress: delegator_address,
        validatorAddress: validator_address,
    }
    const msg = {
        typeUrl: "/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward",
        value: msgWithDraw,
    };
    return msg
}

export function makeWithDrawAllMsg(delegator_address, validator_addresses) {
    let msgs = []
    validator_addresses.map(validator_address => {
        const msgWithDraw = {
            delegatorAddress: delegator_address,
            validatorAddress: validator_address,
        }
        const msg = {
            typeUrl: "/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward",
            value: msgWithDraw,
        };
        msgs.push(msg)
    })
    return msgs
}

export function makeUndelegateMsg(delegatorAddress, validatorAddress, amount, denom) {

    const msgUndelegate = {
        delegatorAddress: delegatorAddress,
        validatorAddress: validatorAddress,
        amount: coin(amount, denom)
    }
    const msg = {
        typeUrl: "/cosmos.staking.v1beta1.MsgUndelegate",
        value: msgUndelegate,
    };
    return msg
}

export function makeBeginRedelegateMsg(delegatorAddress, validatorSrcAddress, validatorDstAddress, amount, denom) {
    const msgRedelegate = {
        delegatorAddress: delegatorAddress,
        validatorSrcAddress: validatorSrcAddress,
        validatorDstAddress: validatorDstAddress,
        amount: coin(amount, denom)
    }
    const msg = {
        typeUrl: "/cosmos.staking.v1beta1.MsgBeginRedelegate",
        value: msgRedelegate,
    };
    return msg
}

export const makeVoteMsg = (option, proposal_id, voter) => {
    const msgVote = {
        option: option,
        proposalId: proposal_id,
        voter: voter
    }

    const msg = {
        typeUrl: "/cosmos.gov.v1beta1.MsgVote",
        value: msgVote,
    }
    return msg
}

export const makeSubmitProposalMsg = (title, description, deposit, proposer, denom) => {

    const msgSubmitProposal = {
        content: {
            typeUrl: '/cosmos.gov.v1beta1.TextProposal',
            value: gov_1.TextProposal.encode(gov_1.TextProposal.fromPartial({
                title: title,
                description: description,
            })).finish(),
        },
        initialDeposit: [coin(deposit, denom)],
        proposer: proposer
    }

    const msg = {
        typeUrl: "/cosmos.gov.v1beta1.MsgSubmitProposal",
        value: msgSubmitProposal,
    }
    return msg
}

export const makeDepositMsg = (amount, depositor, proposal_id, denom) => {

    const msgDeposit = {
        amount: [coin(amount, denom)],
        depositor: depositor,
        proposalId: proposal_id
    }

    const msg = {
        typeUrl: '/cosmos.gov.v1beta1.MsgDeposit',
        value: msgDeposit
    }

    return msg
}

export function makeSignDocSendMsg(fromAddress, toAddress, amount, denom) {
    const signDocMsg = {
        type: "cosmos-sdk/MsgSend",
        value: {
            amount: coins(amount, denom),
            from_address: fromAddress,
            to_address: toAddress
        }
    }
    return signDocMsg
}

export function makeSignDocDelegateMsg(delegator_address, validator_address, amount, denom) {
    const signDocDelegate = {
        type: "cosmos-sdk/MsgDelegate",
        value: {
            amount: coin(amount, denom),
            delegator_address: delegator_address,
            validator_address: validator_address,
        }
    }
    return signDocDelegate
}

export function makeSignDocWithDrawMsg(delegator_address, validator_address, amount, denom) {
    const signDocDelegate = {
        type: "cosmos-sdk/MsgWithdrawDelegationReward",
        value: {
            delegator_address: delegator_address,
            validator_address: validator_address,
        }
    }
    return signDocDelegate
}

export function makeSignDocWithDrawAllMsg(delegator_address, validator_addresses, amount, denom) {
    let msgs = []
    validator_addresses.map(validator_address => {
        const signDocDelegate = {
            type: "cosmos-sdk/MsgWithdrawDelegationReward",
            value: {
                delegator_address: delegator_address,
                validator_address: validator_address,
            }
        }
        msgs.push(signDocDelegate)
    })
    return msgs
}

export function makeSignDocBeginRedelegateMsg(delegator_address, validator_src_address, validator_dst_address, amount, denom) {
    const msgRedelegate =
    {
        "type": "cosmos-sdk/MsgBeginRedelegate",
        "value": {
            delegator_address: delegator_address,
            validator_src_address: validator_src_address,
            validator_dst_address: validator_dst_address,
            amount: coin(amount, denom)
        }
    }

    return msgRedelegate
}


export function makeSignDocUnDelegateMsg(delegator_address, validator_address, amount, denom) {
    const signDocDelegate = {
        type: "cosmos-sdk/MsgUndelegate",
        value: {
            amount: coin(amount, denom),
            delegator_address: delegator_address,
            validator_address: validator_address,
        }
    }
    return signDocDelegate
}

export const makeSignDocVoteMsg = (option, proposal_id, voter) => {
    const signDocVote = {
        type: "cosmos-sdk/MsgVote",
        value: {
            option: option,
            proposal_id: proposal_id,
            voter: voter
        }
    }
    return signDocVote
}

export const makeSignDocSubmitProposalMsg = (title, description, deposit, proposer, denom) => {
    const signDocSubmitProposal = {
        type: "cosmos-sdk/MsgSubmitProposal",
        value: {
            content: {
                type: 'cosmos-sdk/TextProposal',
                value: gov_1.TextProposal.encode(gov_1.TextProposal.fromPartial({
                    title: title,
                    description: description,
                })).finish(),
            },
            initial_deposit: [coin(deposit, denom)],
            proposer: proposer
        }
    }
    return signDocSubmitProposal
}

export const makeSignDocDepositMsg = (amount, depositor, proposal_id, denom) => {
    const signDocDeposit = {
        type: 'cosmos-sdk/MsgDeposit',
        value: {
            amount: [coin(amount, denom)],
            depositor: depositor,
            proposal_id: proposal_id
        }
    }
}