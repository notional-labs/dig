import { InputNumber, notification, Checkbox, Input } from "antd"
import { useState, useEffect } from 'react'
import { Form } from "react-bootstrap";
import { getClient, getKeplr, getStargateClient } from "../helpers/getKeplr";
import { makeSubmitProposalMsg, makeSignDocSubmitProposalMsg } from "../helpers/ethereum/lib/eth-transaction/Msg"
import { submitProposal } from "../helpers/transaction";
import { broadcastTransaction } from "../helpers/ethereum/lib/eth-broadcast/broadcastTX"
import { getWeb3Instance } from "../helpers/ethereum/lib/metamaskHelpers"
import ClipLoader from "react-spinners/ClipLoader"
import { getParams } from "../helpers/getProposal";

const { TextArea } = Input;

//TODO: add logic to web, and right variale

const style = {
    transfer: {
        marginBottom: '20px',
        width: '100%',
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
        fontSize: '16px'
    },
    formTitle: {
        fontFamily: 'montserrat',
        color: '#ffffff',
        fontWeight: 500,
        fontSize: '16px',
        margin: 0
    }
}

const CreateProposalModal = ({ accounts, wrapSetShow }) => {
    const [value, setValue] = useState('')
    const [selectProposer, setSelectProposer] = useState(0)
    const [showAdvance, setShowAdvance] = useState(false)
    const [gasAmount, setGasAmount] = useState('400000')
    const [isDoingTX, setIsDoingTx] = useState(false)
    const [title, setTitle] = useState('')
    const [description, setDescription] = useState('')
    const [minAmount, setMinAmount] = useState(0)

    useEffect(() => {
        (async () => {
            const params = await getParams()
            const depositParams = params[0] || 0
            setMinAmount(parseInt(depositParams.amount))
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
            message: 'Submit failed',
            description: message
        })
    };

    const handleChange = (value) => {
        setValue(value)
    }

    const handleChangeTitle = (e) => {
        setTitle(e.target.value)
    }

    const handleChangeDescription = (e) => {
        setDescription(e.target.value)
    }

    const checkDisable = () => {
        if (value === 0) {
            return true
        }
        return false
    }

    const handleChangeSelectProposer = (e) => {
        setSelectProposer(e.target.value)
    }

    const check = (e) => {
        setShowAdvance(e.target.checked)
    }

    const handleChangeGas = (value) => {
        setGasAmount(value)
    }


    const handleClick = async () => {
        setIsDoingTx(true)
        if (accounts[selectProposer].type === 'keplr') {
            const newStargate = await getClient()
            if (newStargate != null) {
                const gas = parseInt(gasAmount)
                const deposit = parseFloat(value) * 1000000
                submitProposal(newStargate, title, description, deposit, accounts[selectProposer].account.address, gas).then(() => {
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

            const gasLimit = parseInt(gasAmount)

            //TODO: add choice form to validator_dst_address
            const deposit = parseInt(value)

            const msgSubmitProposal = makeSubmitProposalMsg(title, description, deposit, accounts[selectProposer].account, denom)
            const signDocSubmitProposal = makeSignDocSubmitProposalMsg(title, description, deposit, accounts[selectProposer].account, denom)

            const UIProcessing = function () {
                setIsDoingTx(false)
                wrapSetShow(false)
            }

            broadcastTransaction(accounts[selectProposer].account, msgSubmitProposal, signDocSubmitProposal, chainId, memo, gasLimit, web3, UIProcessing).then(() => {
                // wrapSetShow(false)
                // setIsDoingTx(false)
                // success()
            }).catch((e) => {
                setIsDoingTx(false)
                wrapSetShow(false)
                error(e.message)
            })
        }

    }

    return (
        <div>
            <div style={style.transfer}>
                <p style={style.formTitle}>Proposer</p>
                <>
                    <Form.Select onChange={handleChangeSelectProposer} defaultValue={selectProposer} style={{ ...style.formInput, backgroundColor: '#C4C4C4', color: '#000000' }}>
                        {
                            accounts.filter(x => x.type === 'keplr').map((account, index) => (
                                <option key={index} value={index}>
                                    {account.key ? account.key.name : account.type === 'keplr' ? account.account.address : account.account}
                                </option>
                            ))
                        }
                    </Form.Select>
                </>
                <p style={{ color: '#F6F3FB', fontSize: '1.2rem', fontFamily: 'montserrat', marginTop: '1rem' }}>Content</p>
                <p style={{ ...style.formTitle, marginTop: '20px' }}>Title</p>
                <div style={{
                    marginBottom: '20px',
                    width: '100%',
                    height: '40px',
                    borderRadius: '10px',
                    border: `1px solid #c4c4c4`,
                    fontSize: '1rem',
                    color: '#9B9B9B',
                    padding: 0,
                }}>
                    <Input placeholder="title"
                        style={{
                            height: '100%',
                            fontSize: '1rem',
                            paddingTop: '0.2rem',
                            backgroundColor: 'transparent',
                            color: '#F6F3FB',
                            borderRadius: '10px',
                            border: 'none'
                        }} onChange={handleChangeTitle}/>
                </div>
                <p style={{ ...style.formTitle, marginTop: '20px' }}>Description</p>
                <div style={{
                    marginBottom: '20px',
                    width: '100%',
                    borderRadius: '10px',
                    border: `1px solid #c4c4c4`,
                    fontSize: '1rem',
                    color: '#9B9B9B',
                    padding: 0,
                }}>
                    <TextArea placeholder="description"
                        style={{
                            height: '100%',
                            fontSize: '1rem',
                            paddingTop: '0.2rem',
                            color: '#F6F3FB',
                            borderRadius: '10px',
                            border: 'none'
                        }} onChange={handleChangeDescription}/>
                </div>
            </div>
            <div style={style.transfer}>
                <div style={{ marginBottom: '1rem', ...style.formTitle }}>Initial Deposit</div>
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
                    }} 
                        step={0.000001}
                        onChange={handleChange}
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
                        DIG
                    </span>
                </div>
            </div>
            <p style={style.formTitle}>Minimal Deposit</p>
                <p style={{ ...style.formInput, border: 'solid 1px #bdbdbd', padding: '0.5rem' }}>
                    {minAmount / 1000000 || 0} DIG
                </p>
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
        </div>
    )
}

export default CreateProposalModal
