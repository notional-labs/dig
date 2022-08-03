import { InputNumber, notification, Checkbox, Radio, } from "antd"
import { voteTest } from "../helpers/transaction"
import { useEffect, useState } from 'react'
import { Form } from "react-bootstrap";
import { getClient, getKeplr, getStargateClient } from "../helpers/getKeplr";
import { makeVoteMsg, makeSignDocVoteMsg } from "../helpers/ethereum/lib/eth-transaction/Msg"
import { broadcastTransaction } from "../helpers/ethereum/lib/eth-broadcast/broadcastTX"
import { getWeb3Instance } from "../helpers/ethereum/lib/metamaskHelpers";
import ClipLoader from "react-spinners/ClipLoader"
import { DownCircleTwoTone } from '@ant-design/icons'

const style = {
    transfer: {
        marginBottom: '20px',
        width: '100%',
        backgroundColor: '#4D4D4D'
    },
    transferInfo: {
        padding: '50px',
        borderRadius: '10px',
        width: '20rem'
    },
    container: {
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'space-between',
    },
    form: {
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
    },
    button: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'end',
        marginTop: '2rem',
        marginBottom: '1rem'
    },
    formInput: {
        backgroundColor: '#4D4D4D',
        color: '#ffffff',
        borderRadius: '10px',
    },
    formTitle: {
        fontFamily: 'montserrat',
        color: '#ffffff',
        fontWeight: 500,
        fontSize: '16px',
        marginBottom: 0
    }
}

const selectStyle = {
    dropdownIndicator: base => ({
        ...base,
        color: '#ffac38'
    }),
}


const VoteModal = ({ proposal, id, wrapSetShow }) => {
    const [fee, setFee] = useState('5000')
    const [voters, setVoters] = useState([])
    const [selectVoter, setSelectVoter] = useState(0)
    const [showAdvance, setShowAdvance] = useState(false)
    const [gasAmount, setGasAmount] = useState('200000')
    const [isDoingTX, setIsDoingTx] = useState(false)
    const [choice, setChoice] = useState(0)

    useEffect(() => {
        (async () => {
            setVoters([...JSON.parse(localStorage.getItem('accounts'))])
        })()
    }, [])

    const success = () => {
        notification.success({
            message: 'Transaction sent',
            duration: 1
        })
    };

    const error = (message) => {
        notification.error({
            message: 'Vote failed',
            description: message
        })
    };

    const handleChangeFee = (value) => {
        setFee(value)
    }

    const checkDisable = () => {
        if (fee === 0 || choice === 0 || voters.length === 0) {
            return true
        }
        return false
    }
    const handleChangeSelect = (e) => {
        setSelectVoter(e.target.value)
    }

    const handleChangeVote = (e) => {
        setChoice(e.target.value)
    }

    const check = (e) => {
        setShowAdvance(e.target.checked)
    }

    const handleChangeGas = (value) => {
        setGasAmount(value)
    }

    const handleClick = async () => {
        setIsDoingTx(true)
        if (voters[selectVoter].type === 'keplr') {
            const newStargate = await getClient()
            if (newStargate != null) {
                const gas = parseInt(gasAmount)
                voteTest(newStargate, choice, `${id}`, voters[selectVoter].account.address, gas).then(() => {
                    setIsDoingTx(false)
                    success()
                    wrapSetShow(false)
                }).catch((e) => {
                    setIsDoingTx(false)
                    error(e.message)
                    wrapSetShow(false)
                    console.log(e)
                })
            }
        }
        else {
            //makeSignDocDelegateMsg, makeDelegateMsg
            // please set enviroment variable: DENOM, etc
            //import web3
            let web3 = await getWeb3Instance();
            const denom = process.env.REACT_APP_DENOM
            const chainId = process.env.REACT_APP_CHAIN_ID
            const memo = "Love From Dev Team"

            const address = voters[selectVoter].account
            const gasLimit = parseInt(gasAmount)

            const msgVote = makeVoteMsg(choice, `${id}`, address)
            const signDocVote = makeSignDocVoteMsg(choice, `${id}`, address)

            console.log("address", address)

            const UIProcessing = function () {
                setIsDoingTx(false)
                wrapSetShow(false)
            }
            broadcastTransaction(address, msgVote, signDocVote, chainId, memo, gasLimit, web3, UIProcessing).then(() => {
                // wrapSetShow(false)
                // setIsDoingTx(false)
                // success()
            }).catch((e) => {
                wrapSetShow(false)
                setIsDoingTx(false)
                error(e.message)
            })
        }
    }

    return (
        <div>
            <div style={style.transfer}>
                <p style={style.formTitle}>Voter</p>
                <>
                    <Form.Select
                        onChange={handleChangeSelect}
                        defaultValue={selectVoter}
                        style={{ ...style.formInput, backgroundColor: '#C4C4C4', color: '#000000' }}
                    >
                        {
                            voters.map((voter, index) => (
                                <option key={index} value={index}>
                                    {voter.key ? voter.key.name : voter.type === 'keplr' ? voter.account.address : voter.account}
                                </option>
                            ))
                        }
                    </Form.Select>
                </>
            </div>
            <div style={style.transfer}>
                <p style={style.formTitle}>Option</p>
                <Radio.Group
                    onChange={handleChangeVote}
                    value={choice}
                    style={style.formInput}
                >
                    <Radio value={1} style={{ color: '#ffffff', backgroundColor: '#4D4D4D' }}>Yes</Radio>
                    <Radio value={3} style={{ color: '#ffffff', }}>No</Radio>
                    <Radio value={4} style={{ color: '#ffffff', }}>No With Veto</Radio>
                    <Radio value={2} style={{ color: '#ffffff', }}>Abstain</Radio>
                </Radio.Group>
            </div >
            {/* <div style={style.transfer}>
                <div style={{ marginBottom: '1rem', ...style.formTitle }}>Fee</div>
                <>
                    <InputNumber style={{
                        width: '100%',
                        height: '40px',
                        borderRadius: '10px',
                        border: `2px solid #c4c4c4`,
                        fontSize: '1rem',
                        paddingTop: '0.2rem',
                        backgroundColor: '#4D4D4D',
                        color: '#F6F3FB'
                    }} min={0} step={1} onChange={handleChangeFee} defaultValue={parseInt(fee)} />
                </>
            </div> */}
            <div>
                <Checkbox onChange={check} style={{ color: '#F6F3FB', fontSize: '1.2rem', fontFamily: 'montserrat' }}>Advanced</Checkbox>
            </div>
            {
                showAdvance && (
                    <div style={style.transfer}>
                        <div style={{ marginBottom: '1rem', ...style.formTitle }}>Set Gas</div>
                        <div style={{
                            width: '100%',
                            height: '40px',
                            borderRadius: '10px',
                            border: `2px solid #c4c4c4`,
                            fontSize: '1rem',
                            padding: 0,
                            backgroundColor: '#4D4D4D',
                            color: '#F6F3FB'
                        }}>
                            <InputNumber style={{
                                width: '80%',
                                height: '100%',
                                fontSize: '1rem',
                                paddingTop: '0.2rem',
                                backgroundColor: '#4D4D4D',
                                color: '#F6F3FB',
                                borderRadius: '10px 0 0 10px'
                            }} min={0}
                                step={1}
                                onChange={handleChangeGas}
                                defaultValue={parseInt(gasAmount)}
                                controls={false}
                                bordered={false}
                            />
                            <span style={{
                                height: '40px',
                                borderRadius: '10px',
                                border: `none`,
                                fontSize: '1.3rem',
                            }}>
                                |
                            </span>
                            <span style={{
                                width: '20%',
                                height: '100%',
                                borderRadius: '10px',
                                border: `none`,
                                fontSize: '1rem',
                                textAlign: 'center',
                                marginLeft: '2em'
                            }}>
                                UDIG
                            </span>
                        </div>
                    </div>
                )
            }
            {
                isDoingTX && (
                    <div style={{ display: 'flex', flexDirection: 'row', justifyContent: 'center', fontSize: '1rem' }}>
                        <ClipLoader style={{ marginTop: '5em' }} color={'#f0a848'} loading={isDoingTX} />
                    </div>
                )
            }
            <div style={style.button}>
                <button onClick={() => wrapSetShow(false)}
                    style={{
                        border: 0,
                        borderRadius: '10px',
                        width: '20%',
                        height: '2.5rem',
                        fontSize: '15px',
                        backgroundColor: '#C4C4C4',
                        color: '#ffffff',
                        fontFamily: 'montserrat',
                        marginRight: '20px'
                    }}>
                    Cancel
                </button>
                <button disabled={checkDisable()}
                    onClick={handleClick}
                    style={{
                        border: 0,
                        borderRadius: '10px',
                        width: '20%',
                        height: '2.5rem',
                        fontSize: '15px',
                        backgroundColor: '#E4BA40',
                        color: '#ffffff',
                        fontFamily: 'montserrat'
                    }}>
                    Send
                </button>
            </div>
        </div >
    )
}

export default VoteModal