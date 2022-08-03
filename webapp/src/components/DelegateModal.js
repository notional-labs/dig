import { InputNumber, message, notification, Checkbox, Input, Empty } from "antd"
import { delegate } from "../helpers/transaction"
import { useEffect, useState } from 'react'
import { Form } from "react-bootstrap";
import { getKeplr, getStargateClient } from "../helpers/getKeplr";
import { makeMsgBeginRedelegate, makeSignDocDelegateMsg, makeDelegateMsg, makeSendMsg, makeSignDocSendMsg, makeSendMsgcTemp } from "../helpers/ethereum/lib/eth-transaction/Msg"
import { broadcastTransaction } from "../helpers/ethereum/lib/eth-broadcast/broadcastTX"
import { getWeb3Instance } from "../helpers/ethereum/lib/metamaskHelpers";
import ClipLoader from "react-spinners/ClipLoader"
import { getBalance } from "../helpers/getBalances";
import { IoSearch } from "react-icons/io5";


const style = {
    transfer: {
        marginBottom: '20px',
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
        marginBottom: '1rem',
    },
    formInput: {
        backgroundColor: '#4D4D4D',
        color: '#bdbdbd',
        borderRadius: '10px',
        marginBottom: 10,
        fontSize: '16px'
    },
    formTitle: {
        fontFamily: 'montserrat',
        color: '#ffffff',
        fontWeight: 400,
        fontSize: '16px',
        marginBottom: 0,
        marginTop: '20px'
    }
}

const DelegateModal = ({ validators, wrapSetter, defaultVal }) => {
    const [value, setValue] = useState('')
    const [delegators, setDelegators] = useState([])
    const [filterValidators, setFilterValidators] = useState([...validators])
    const [selectVal, setSelectVal] = useState(defaultVal)
    const [selectDel, setSelectDel] = useState(0)
    const [showAdvance, setShowAdvance] = useState(false)
    const [gasAmount, setGasAmount] = useState('250000')
    const [isDoingTX, setIsDoingTx] = useState(false)
    const [availabeAmount, setAvailableAmount] = useState('')

    useEffect(() => {
        (async () => {
            setDelegators([...JSON.parse(localStorage.getItem('accounts'))])
            const delegatorsList = JSON.parse(localStorage.getItem('accounts'))
            if (delegatorsList.length > 0) {
                await getAvailableAmount(delegatorsList)
            }
        })()
    }, [selectDel])

    useEffect(() => {
        setSelectVal(defaultVal)
    }, [defaultVal])

    const success = () => {
        notification.success({
            message: 'Transaction sent',
            duration: 1
        })
    };

    const error = (message) => {
        notification.error({
            message: 'Delegate failed',
            description: message
        })
    };

    const handleChange = (value) => {
        setValue(value)
    }

    const checkDisable = () => {
        if (value === 0 || value === '' || delegators.length === 0) {
            return true
        }
        return false
    }
    const handleChangeSelect = (e) => {
        setSelectDel(e.target.value)
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

    const getAvailableAmount = async (delegators) => {
        const address = delegators[selectDel].type === 'keplr' ? delegators[selectDel].account.address : delegators[selectDel].account
        const balance = await getBalance(address)
        const balanceAmount = balance.length > 0 ? balance[0][0].amount : 0
        setAvailableAmount(balanceAmount)
    }

    const handleChangeSearch = (e) => {
        const list = validators.filter(val => val.description.moniker.toLowerCase().includes(e.target.value.toLowerCase()))
        setFilterValidators([...list])
    }

    const handleClick = async () => {
        setIsDoingTx(true)
        if (delegators[selectDel].type === 'keplr') {
            const { offlineSigner } = await getKeplr();

            const stargate = await getStargateClient(offlineSigner)
            console.log(stargate)
            if (stargate != null) {
                const amount = value * 1000000
                const recipient = selectVal
                const gas = parseInt(gasAmount)
                delegate(stargate, delegators[selectDel].account.address, amount, recipient, gas).then(() => {
                    setIsDoingTx(false)
                    success()
                    wrapSetter(false)
                }).catch((e) => {
                    setIsDoingTx(false)
                    error(e.message)
                    wrapSetter(false)
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

            const address = delegators[selectDel].account
            const gasLimit = parseInt(gasAmount)


            const recipient = selectVal
            const amount = value * 1000000

            if (amount == 0) {
                window.alert("Plese check your amount")
                return
            }
            const msgDelegate = makeDelegateMsg(address, recipient, amount, denom)
            const signDocDelegate = makeSignDocDelegateMsg(address, recipient, amount, denom)

            console.log("address", address)

            const UIProcessing = function () {
                setIsDoingTx(false)
                wrapSetter(false)
            }
            broadcastTransaction(address, msgDelegate, signDocDelegate, chainId, memo, gasLimit, web3, UIProcessing).then(() => {
                // wrapSetter(false)
                // setIsDoingTx(false)
                // success()
            }).catch((e) => {
                wrapSetter(false)
                setIsDoingTx(false)
                error(e.message)
            })
        }
    }

    return (
        <div>
            <div style={style.transfer}>
                <p style={style.formTitle}>Delegator</p>
                <>
                    <Form.Select onChange={handleChangeSelect} defaultValue={selectDel} style={{ ...style.formInput, backgroundColor: '#C4C4C4', color: '#000000' }}>
                        {
                            delegators.map((delegator, index) => (
                                <option key={index} value={index}>
                                    {delegator.key ? delegator.key.name : delegator.type === 'keplr' ? delegator.account.address : delegator.account}
                                </option>
                            ))
                        }
                    </Form.Select>
                </>
                <p style={style.formTitle}>Validator</p>
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
                            validators.filter(val => val.operator_address === selectVal)[0].description.moniker
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
                <p style={style.formTitle}>Amount Availabe</p>
                <p style={{ ...style.formInput, border: 'solid 1px #bdbdbd', padding: 10 }}>
                    {parseInt(availabeAmount) / 1000000 || 0} DIG
                </p>
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
                        max={parseInt(availabeAmount) / 1000000}
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
                <button onClick={() => wrapSetter(false)}
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

export default DelegateModal