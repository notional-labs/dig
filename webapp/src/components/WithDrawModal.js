import { message, notification, Checkbox, InputNumber} from "antd"
import { withDraw } from "../helpers/transaction"
import { getKeplr, getStargateClient } from "../helpers/getKeplr"
import { makeSignDocWithDrawMsg, makeWithDrawMsg } from "../helpers/ethereum/lib/eth-transaction/Msg"
import { broadcastTransaction } from "../helpers/ethereum/lib/eth-broadcast/broadcastTX"
import { getWeb3Instance } from "../helpers/ethereum/lib/metamaskHelpers"
import { useEffect, useState } from 'react'
import ClipLoader from "react-spinners/ClipLoader"

const style = {
    transfer: {
        marginBottom: '2rem',
        width: '100%',
        backgroundColor: '#4D4D4D',
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
        marginBottom: 0
    }
}

const WithDrawModal = ({ address, type, validator, wrapSetShow }) => {
    const [showAdvance, setShowAdvance] = useState(false)
    const [gasAmount, setGasAmount] = useState('400000')
    const [isDoingTX, setIsDoingTx] = useState(false)

    const success = () => {
        notification.success({
            message: 'Transaction sent',
            duration: 1
        })
    };

    const error = (message) => {
        notification.error({
            message: 'Withdraw failed',
            description: message
        })
    };

    const check = (e) => {
        setShowAdvance(e.target.checked)
    }

    const handleChangeGas = (value) => {
        setGasAmount(value)
    }

    const handleClick = async () => {
        setIsDoingTx(true)
        if (type === 'keplr') {
            const { offlineSigner } = await getKeplr();

            const stargate = await getStargateClient(offlineSigner)
            if (stargate != null) {
                const gas = parseInt(gasAmount)
                withDraw(stargate, address, validator, gas).then((result) => {
                    console.log(result)
                    if (result.code == 0) {
                        setIsDoingTx(false)
                        success()
                        wrapSetShow(false)
                    }else{
                        setIsDoingTx(false)
                        error(result.rawLog)
                        wrapSetShow(false)    
                    }
                }).catch((e) => {
                    setIsDoingTx(false)
                    error(e.message)
                    wrapSetShow(false)
                })
            }
        }
        else {
            //makeSignDocDelegateMsg, makeDelegateMsgmakeDelegateMsg
            // please set enviroment variable: DENOM, etc
            //import web3
            let web3 = await getWeb3Instance();
            const denom = process.env.REACT_APP_DENOM
            const chainId = process.env.REACT_APP_CHAIN_ID
            const memo = "Love From Dev Team"

            console.log(address)
            const gasLimit = parseInt(gasAmount)


            const msgWithDraw = makeWithDrawMsg(address, validator, denom)
            const makeSignDocWithDrawelMsg = makeSignDocWithDrawMsg(address, validator, denom)

            const UIProcessing = function(){
                setIsDoingTx(false)
                wrapSetShow(false)
            }

            broadcastTransaction(address, msgWithDraw, makeSignDocWithDrawelMsg, chainId, memo, gasLimit, web3, UIProcessing).then(() => {
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
            <div style={style.transfer}>
                <p style={style.formTitle}>To</p>
                <div style={{
                    marginBottom: '20px',
                    width: '100%',
                    height: '40px',
                    borderRadius: '10px',
                    border: `2px solid #c4c4c4`,
                    fontSize: '1rem',
                    padding: '0.2rem',
                    paddingLeft: '0.5rem',
                    backgroundColor: '#4D4D4D',
                    color: '#ffffff',
                    overflow: 'hidden',
                    textOverflow: 'ellipsis',
                    display: '-webkit-box',
                }}>
                    {address}
                </div>
            </div>
            <div>
                <Checkbox onChange={check} style={{color: '#F6F3FB', fontSize: '1.2rem', fontFamily: 'montserrat' }}>Advanced</Checkbox>
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
                    <div style={{display: 'flex', flexDirection: 'row', justifyContent: 'center', fontSize: '1rem'}}>
                        <ClipLoader style={{ marginTop: '5em' }} color={'#f0a848'} loading={isDoingTX}/>
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
                <button
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
                    Withdraw
                </button>
            </div>
        </div>
    )
}

export default WithDrawModal
