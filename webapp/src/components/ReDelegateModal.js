import { InputNumber, notification, Checkbox, Input, Empty } from "antd"
import { useEffect, useState } from 'react'
import { Form } from "react-bootstrap";
import { getKeplr, getStargateClient } from "../helpers/getKeplr";
import { makeSignDocBeginRedelegateMsg, makeBeginRedelegateMsg } from "../helpers/ethereum/lib/eth-transaction/Msg"
import { broadcastTransaction } from "../helpers/ethereum/lib/eth-broadcast/broadcastTX"
import { getWeb3Instance } from "../helpers/ethereum/lib/metamaskHelpers"
import ClipLoader from "react-spinners/ClipLoader"
import { IoSearch } from "react-icons/io5";


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

const ReDelegateModal = ({ address, type, delegation, wrapSetShow, validators }) => {
    const [value, setValue] = useState('')
    const [selectVal, setSelectVal] = useState('')
    const [showAdvance, setShowAdvance] = useState(false)
    const [gasAmount, setGasAmount] = useState('400000')
    const [isDoingTX, setIsDoingTx] = useState(false)
    const [filterValidators, setFilterValidators] = useState([...validators])

    const success = () => {
        notification.success({
            message: 'Transaction sent',
            duration: 1
        })
    };

    const error = (message) => {
        notification.error({
            message: 'Redelegate failed',
            description: message
        })
    };

    const handleChange = (value) => {
        setValue(value)
    }

    const checkDisable = () => {
        if (value === 0 || selectVal === '') {
            return true
        }
        return false
    }

    const handleChangeSelectVal = (val) => {
        setSelectVal(val)
    }

    const check = (e) => {
        setShowAdvance(e.target.checked)
    }

    const handleChangeGas = (value) => {
        setGasAmount(value)
    }

    const handleChangeSearch = (e) => {
        const list = validators.filter(val => val.description.moniker.toLowerCase().includes(e.target.value.toLowerCase()))
        setFilterValidators([...list])
    }

    const handleClick = async () => {
        setIsDoingTx(true)
        if (type === 'keplr') {
            const { offlineSigner } = await getKeplr();

            const stargate = await getStargateClient(offlineSigner)
            if (stargate != null) {
                const amount = value * 1000000
                const val = delegation.delegation.validator_address
                const validator_src_address = delegation.delegation.validator_address
                //TODO: add choice form to validator_dst_address - done
                const validator_dst_address = selectVal
                const gasLimit = parseInt(gasAmount)
                let stdFee = {
                    amount: [],
                    gas: gasLimit.toString(),
                }

                console.log("address")
                console.log(validator_src_address)
                console.log(validator_dst_address)
                const denom = process.env.REACT_APP_DENOM
                try {
                    const msgRelegate = makeBeginRedelegateMsg(address, validator_src_address, validator_dst_address, amount, denom)
                    await stargate.signAndBroadcast(address, [msgRelegate], stdFee).then(result => {
                        if (result.code == 0) {
                            setIsDoingTx(false)
                            success()
                            wrapSetShow(false)
                        } else {
                            setIsDoingTx(false)
                            error(result.rawLog)
                            wrapSetShow(false)
                        }
                    })
                    setIsDoingTx(false)
                    wrapSetShow(false)
                    success()
                }
                catch (e) {
                    setIsDoingTx(false)
                    wrapSetShow(false)
                    error(e.message)
                }
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


            const validator_src_address = delegation.delegation.validator_address
            //TODO: add choice form to validator_dst_address
            const validator_dst_address = selectVal
            const amount = value * 1000000

            console.log("address")
            console.log(validator_src_address)
            console.log(validator_dst_address)

            const msgDelegate = makeBeginRedelegateMsg(address, validator_src_address, validator_dst_address, amount, denom)
            const signDocDelegate = makeSignDocBeginRedelegateMsg(address, validator_src_address, validator_dst_address, amount, denom)

            console.log(msgDelegate)
            console.log(signDocDelegate)

            const UIProcessing = function () {
                setIsDoingTx(false)
                wrapSetShow(false)
            }

            broadcastTransaction(address, msgDelegate, signDocDelegate, chainId, memo, gasLimit, web3, UIProcessing).then(() => {
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
                <p style={style.formTitle}>Delegator</p>
                <div style={{
                    marginBottom: '20px',
                    width: '100%',
                    height: '40px',
                    borderRadius: '10px',
                    border: `2px solid #c4c4c4`,
                    fontSize: '1rem',
                    padding: '0.2rem',
                    paddingLeft: '0.5rem',
                    backgroundColor: '#C4C4C4',
                    color: '#9B9B9B',
                    overflow: 'hidden',
                    textOverflow: 'ellipsis',
                    display: '-webkit-box',
                }}>
                    {address}
                </div>
                <p style={style.formTitle}>Validator</p>
                <div style={{
                    marginBottom: '20px',
                    width: '100%',
                    height: '40px',
                    borderRadius: '10px',
                    border: `2px solid #c4c4c4`,
                    fontSize: '1rem',
                    padding: '0.2rem',
                    paddingLeft: '0.5rem',
                    backgroundColor: '#C4C4C4',
                    color: '#9B9B9B',
                    overflow: 'hidden',
                    textOverflow: 'ellipsis',
                    display: '-webkit-box',
                    '-webkit-line-clamp': 1
                }}>
                    {delegation.delegation.validator_address}
                </div>
            </div>
            <div style={style.transfer}>
                <p style={style.formTitle}>To</p>
                <>
                    <Input
                        onChange={handleChangeSearch}
                        style={{
                            borderRadius: '10px',
                            marginBottom: '20px',
                            width: '30%',
                            backgroundColor: 'transparent',
                            color: '#ffffff',
                        }}
                        placeholder='Search'
                        prefix={<IoSearch />}
                    />
                    <div
                        style={{
                            backgroundColor: 'white',
                            borderRadius: '10px',
                            padding: '0 .5em',
                            fontSize: '20px',
                            fontWeight: 'bold'
                        }}
                    >
                        {
                            validators.filter(val => val.operator_address === selectVal).length > 0 ?
                                validators.filter(val => val.operator_address === selectVal)[0].description.moniker
                                : <p
                                    style={{
                                        fontWeight: 400,
                                        color: '#bfbfbf'
                                    }}
                                >
                                    Select a validator'
                                </p>
                        }
                    </div>
                    <div
                        style={{
                            height: '250px',
                            overflow: 'auto',
                            border: 'solid 1px rgb(189, 189, 189)',
                            marginTop: '20px',
                            borderRadius: '10px',
                        }}
                    >
                        {
                            filterValidators.length > 0 ? (
                                filterValidators.map((val, index) => (
                                    <button
                                        className="val-select-button"
                                        key={index}
                                        onClick={() => handleChangeSelectVal(val.operator_address)}
                                        style={{
                                            border: 0,
                                            backgroundColor: 'transparent',
                                            width: '100%',
                                            textAlign: 'left',
                                            fontSize: '16px',
                                            color: '#ffffff',
                                            padding: '10px'
                                        }}
                                    >
                                        {val.description.moniker} ({`${val.commission.commission_rates.rate * 100}%`})
                                    </button>
                                ))
                            ) : (
                                <div
                                    style={{
                                        position: 'relative',
                                        top: '50px',
                                        color: '#ffffff'
                                    }}
                                >
                                    <Empty image={Empty.PRESENTED_IMAGE_SIMPLE} />
                                </div>
                            )
                        }
                    </div>
                </>
            </div>
            <div style={style.transfer}>
                <div style={{ marginBottom: '1rem', ...style.formTitle }}>Amount To Stake</div>
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
                        max={parseFloat(delegation.delegation.shares) / 1000000}
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

export default ReDelegateModal
