import { Input, InputNumber, message, notification, Checkbox } from "antd"
import { transfer } from "../helpers/transaction"
import { useEffect, useState } from 'react'
import { getBalance } from "../helpers/getBalances";
import { getKeplr, getStargateClient } from "../helpers/getKeplr";
import { Form } from "react-bootstrap";
import { makeSendMsg, makeSignDocSendMsg, } from "../helpers/ethereum/lib/eth-transaction/Msg"
import { broadcastTransaction } from "../helpers/ethereum/lib/eth-broadcast/broadcastTX"
import { getWeb3Instance } from "../helpers/ethereum/lib/metamaskHelpers";
import { ClipLoader, BounceLoader } from "react-spinners"
import { getChannels, getClientState } from "../helpers/getChannels";

const style = {
    transfer: {
        marginBottom: '2rem',
        width: '100%',
        marginTop: '1rem',
        padding: 20,
        backgroundColor: '#1f1f1f',
        borderRadius: '20px',
        border: 'solid 1px #bdbdbd'
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
        backgroundColor: '#1f1f1f',
        color: '#bdbdbd',
        borderRadius: '10px',
    },
    formTitle: {
        fontFamily: 'ubuntu',
        color: '#ffac38',
        fontWeight: 500
    }
}

const IBCTransferModal = ({ account, wrapSetShow }) => {
    const [value, setValue] = useState('')
    const [address, setAddress] = useState('')
    const [amount, setAmount] = useState('')
    const [showAdvance, setShowAdvance] = useState(false)
    const [gasAmount, setGasAmount] = useState('200000')
    const [isDoingTX, setIsDoingTx] = useState(false)
    const [channels, setChannels] = useState([])
    const [selectChannel, setSelectChannel] = useState(-1)
    const [destination, setDestination] = useState('')
    const [isLoading, setIsLoading] = useState(false)

    useEffect(() => {
        (async () => {
            setIsLoading(true)
            if (account.type === 'keplr') {
                const balance = await getBalance(account.account.address)
                const balanceAmount = balance.length > 0 ? balance[0][0].amount : 0

                setAmount(balanceAmount)
            }
            else {
                const balance = await getBalance(account.account)
                const balanceAmount = balance.length > 0 ? balance[0][0].amount : 0

                setAmount(balanceAmount)
            }
            const res = await getChannels()
            const channel = res.channels
            if(channel.length > 0){
                setChannels([...channel])
                const destination = await displayDestination(channel[0].channel_id)
                setDestination(destination)
            }
            setIsLoading(false)
        })()
    }, [account,])

    const success = () => {
        notification.success({
            message: 'Transaction sent',
            duration: 1
        })
    };

    const error = (message) => {
        notification.error({
            message: 'Transfer failed',
            description: message
        })
    };

    const handleChange = (value) => {
        setValue(value)
    }

    const handleChangeAddress = (e) => {
        setAddress(e.target.value)
    }

    const checkDisable = () => {
        if (value === 0 || address === '' || selectChannel < 0) {
            return true
        }
        return false
    }

    const check = (e) => {
        setShowAdvance(e.target.checked)
    }

    const handleChangeGas = (value) => {
        setGasAmount(value)
    }

    const handleChangeSelectChannel = async (e) => {
        setSelectChannel(e.target.value)
        const destination = await displayDestination(channels[e.target.value].channel_id)
        setDestination(destination)
    }

    const displayDestination = async(channel_id) => {
        let res = await getClientState(channel_id)
        const destination = res.identified_client_state.client_state.chain_id || ''
        return destination
    }

    const handleClick = async () => {
        setIsDoingTx(true)
        if (account.type === 'keplr') {
            const { offlineSigner } = await getKeplr();

            const stargate = await getStargateClient(offlineSigner)
            if (stargate != null) {
                const amount = value * 1000000
                const recipient = address
                const gas = parseInt(gasAmount)
                transfer(stargate, account.account.address, amount, recipient, gas).then((result) => {

                    if (result.code == 0) {
                        setIsDoingTx(false)
                        success()
                        wrapSetShow(false)
                    } else {
                        setIsDoingTx(false)
                        error(result.rawLog)
                        wrapSetShow(false)
                    }
                }).catch((e) => {
                    setIsDoingTx(false)
                    error(e.message)
                    wrapSetShow(false)
                    console.log(e)
                })
            }
        }
        else {
            let web3 = await getWeb3Instance();
            const denom = process.env.REACT_APP_DENOM
            const chainId = process.env.REACT_APP_CHAIN_ID
            const memo = "Love From Dev Team"

            const gasLimit = parseInt(gasAmount)

            const amount = value * 1000000

            const msgDelegate = makeSendMsg(account.account, address, amount, denom)
            const signDocDelegate = makeSignDocSendMsg(account.account, address, amount, denom)

            const UIProcessing = function () {
                setIsDoingTx(false)
                wrapSetShow(false)
            }

            await broadcastTransaction(account.account, msgDelegate, signDocDelegate, chainId, memo, gasLimit, web3, UIProcessing).then((data) => {
                // setIsDoingTx(false)
                // wrapSetShow(false)
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
            {
                isLoading ? (
                    <div style={{ display: 'flex', flexDirection: 'row', justifyContent: 'center', }}>
                        <div style={{ minHeight: '77vh', display: 'flex', flexDirection: 'column', justifyContent: 'center', }}>
                            <div style={{ display: 'flex', flexDirection: 'row', justifyContent: 'center', }}>
                                <BounceLoader color={'#fcab42'} />
                            </div>
                            <p style={{ color: '#fcab42', fontSize: '1.2rem', fontFamily: 'Ubuntu' }}>This feature is for expert</p>
                        </div>
                    </div>
                ) : (
                    <div>
                        <div style={style.transfer}>
                            <p style={style.formTitle}>From</p>
                            <div style={{
                                marginBottom: '20px',
                                width: '100%',
                                height: '40px',
                                borderRadius: '10px',
                                border: `2px solid #c4c4c4`,
                                fontSize: '1rem',
                                padding: '0.2rem',
                                paddingLeft: '0.5rem',
                                backgroundColor: '#1f1f1f',
                                color: '#F6F3FB'
                            }}>
                                {account.type === 'keplr' ? account.account.address : account.account}
                            </div>
                            <p style={style.formTitle}>Destination: {destination}</p>
                            <>
                                <Form.Select onChange={async(e) => { await handleChangeSelectChannel(e) }} defaultValue={-100} style={{ ...style.formInput, marginBottom: '20px', }}>
                                    <option>Select a channel</option>
                                    {
                                        channels.map((channel, index) => (
                                            <option key={index} value={index}>Transfer/{channel.channel_id || ''}</option>
                                        ))
                                    }
                                </Form.Select>
                            </>
                            <p style={style.formTitle}>To</p>
                            <>
                                <Input style={{
                                    width: '100%',
                                    height: '40px',
                                    borderRadius: '10px',
                                    border: `2px solid #c4c4c4`,
                                    fontSize: '1rem',
                                    paddingTop: '0.2rem',
                                    backgroundColor: '#1f1f1f',
                                    color: '#F6F3FB'
                                }}
                                    placeholder="Recipient address"
                                    onChange={handleChangeAddress} />
                            </>
                        </div>
                        <div style={style.transfer}>
                            <p style={style.formTitle}>Amount Availabe</p>
                            <p style={{ ...style.formInput, border: 'solid 1px #bdbdbd', padding: 10 }}>
                                {parseInt(amount) / 1000000 || 0} DIG
                            </p>
                            <div style={{ marginBottom: '1rem', ...style.formTitle }}>Amount To Send</div>
                            <>
                                <InputNumber style={{
                                    width: '100%',
                                    height: '40px',
                                    borderRadius: '10px',
                                    border: `2px solid #c4c4c4`,
                                    fontSize: '1rem',
                                    paddingTop: '0.2rem',
                                    backgroundColor: '#1f1f1f',
                                    color: '#F6F3FB'
                                }} min={0} max={parseFloat(amount) / 1000000} step={0.000001} onChange={handleChange} />
                            </>
                        </div>
                        <div>
                            <Checkbox onChange={check} style={{ color: '#F6F3FB', fontSize: '1.2rem', fontFamily: 'Ubuntu' }}>Advance</Checkbox>
                        </div>
                        {
                            showAdvance && (
                                <div style={style.transfer}>
                                    <div style={{ marginBottom: '1rem', ...style.formTitle }}>Set Gas</div>
                                    <>
                                        <InputNumber style={{
                                            width: '100%',
                                            height: '40px',
                                            borderRadius: '10px',
                                            border: `2px solid #c4c4c4`,
                                            fontSize: '1rem',
                                            paddingTop: '0.2rem',
                                            backgroundColor: '#1f1f1f',
                                            color: '#F6F3FB'
                                        }} min={0} step={1} onChange={handleChangeGas} defaultValue={parseInt(gasAmount)} />
                                    </>
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
                            <button onClick={() => wrapSetShow(false)} style={{ border: 0, borderRadius: '10px', width: '20%', height: '2.5rem', fontSize: '1rem', backgroundColor: '#838089', color: '#F6F3FB', fontFamily: 'ubuntu', marginRight: '20px' }}>
                                Cancel
                            </button>
                            <button disabled={checkDisable()} onClick={handleClick} style={{ border: 0, borderRadius: '10px', width: '20%', height: '2.5rem', fontSize: '1rem', backgroundColor: '#ffac38', color: '#F6F3FB', fontFamily: 'ubuntu' }}>
                                Send
                            </button>
                        </div>
                    </div>
                )
            }
        </div>
    )
}

export default IBCTransferModal