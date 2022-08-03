import { Typography, Tooltip, Modal} from 'antd';
import { getBalance } from '../helpers/getBalances';
import { useEffect, useState, useCallback } from 'react';
import {
    Link,
} from "react-router-dom";
import { BiX, BiWrench } from "react-icons/bi";
import SetNameModal from './SetNameModal'


const { Paragraph } = Typography;

const style = {
    container: {
        backgroundColor: 'transparent',
        padding: 50,
        paddingTop: 5,
        paddingBottom: 5,
        borderRadius: '20px',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'space-between',
        border: 'solid 1px #EEC13F'
    },
    div: {
        display: 'flex',
        alignContent: 'center',
        justifyContent: 'center',
        flexDirection: 'row',
    },
    button: {
        border: 0,
        borderRadius: '10px',
        width: '120px',
        marginTop: 10,
        marginBottom: 10,
        fontFamily: 'montserrat',
        fontWeight: 300,
        padding: '2em',
        paddingTop: '1em',
        paddingBottom: '1em'
    },
    buttonDiv: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'end',
    }
}

const ProfileCard = ({ account, index, wrapSetSelect, wrapSetShow, wrapSetAccounts, }) => {
    const [amount, setAmount] = useState('')
    const [showSetName, setShowSetName] = useState(false)

    useEffect(() => {
        (async () => {
            if (account.type === 'keplr') {
                const balance = await getBalance(account.account.address)
                const balanceAmount = balance.length > 0 ? balance[0][0].amount : '0'

                setAmount(balanceAmount)
            }
            else {
                const balance = await getBalance(account.account)
                const balanceAmount = balance.length > 0 ? balance[0][0].amount : '0'

                setAmount(balanceAmount)
            }
        })()
    }, [account])

    const handleClick = () => {
        wrapSetSelect(index)
        wrapSetShow(true)
    }

    const handleRemove = () => {
        const accounts = JSON.parse(localStorage.getItem('accounts'))
        const filterAccouts = accounts.filter(x => x.type === 'keplr' && x.account.address !== account.account.address || x.type === 'metamask' && x.account !== account.account)
        localStorage.setItem('accounts', JSON.stringify([...filterAccouts]))
        wrapSetAccounts(filterAccouts)
    }

    const handleClickSetName = () => {
        setShowSetName(true)
    }

    const handleCloseSetName = () => {
        setShowSetName(false)
    }

    const wrapSetShowSetNameModal = useCallback((val) => {
        setShowSetName(val)
    }, [])

    return (
        <div style={style.container}>
            <div style={{ display: 'flex', flexDirection: 'row', justifyContent: 'space-between' }}>
                <div
                    style={{
                        fontSize: '20px',
                        color: 'white',
                        position: 'relative',
                        top: '10px'
                    }}
                >
                    {
                        account.key ? account.key.name : 'unnamed'
                    }
                </div>
                <div>
                    <Tooltip placement="top" title='Set name'>
                        <button style={{
                            fontWeight: 400,
                            fontSize: '1.5rem',
                            color: '#ED9D26',
                            backgroundColor: 'transparent',
                            border: 0,
                            position: 'relative',
                            top: '-5px'
                        }} onClick={handleClickSetName}
                        >
                            <BiWrench />
                        </button>
                    </Tooltip>
                    <Tooltip placement="top" title='Remove'>
                        <button style={{
                            fontWeight: 800,
                            fontSize: '2rem',
                            color: '#ED9D26',
                            backgroundColor: 'transparent',
                            border: 0,
                            position: 'relative',
                            marginRight: '-40px',
                            top: '-3px'
                        }} onClick={handleRemove}
                        >
                            <BiX />
                        </button>
                    </Tooltip>
                </div>
            </div>
            <Paragraph copyable={{ text: account.type === 'keplr' ? account.account.address && account.account.address.trim() : account.account && account.account.trim() }}
                style={{
                    color: '#FFFFFF',
                    fontFamily: 'montserrat',
                    textAlign: 'left',
                    backgroundColor: 'transparent',
                    padding: 25,
                    marginBottom: '1.5em',
                    borderRadius: '20px',
                    border: 'solid 1px #EEC13F'
                }}>
                {account.type === 'keplr' ? (account.account.address.length > 100 ? `${account.account.address.substring(0, 100)}... ` : `${account.account.address} `) : (account.account.length > 100 ? `${account.account.substring(0, 100)}... ` : `${account.account} `)}
            </Paragraph>
            <Paragraph style={{
                color: '#FFFFFF',
                fontFamily: 'montserrat',
                textAlign: 'left',
                backgroundColor: 'transparent',
                padding: 25,
                borderRadius: '20px',
                border: 'solid 1px #EEC13F'
            }}>
                {parseFloat(amount) / 1000000 || 0} DIG
            </Paragraph>
            <div style={style.buttonDiv}>
                <button style={{ ...style.button, backgroundColor: '#ED9D26', color: '#FFFFFF', marginRight: '20px' }} onClick={handleClick}>
                    Transfer
                </button>
                <Link to={account.type === 'keplr' ? account.account.address : account.account}>
                    <button style={{ ...style.button, backgroundColor: '#ED9D26', color: '#FFFFFF', }}>
                        Detail
                    </button>
                </Link>
            </div>
            <Modal
                visible={showSetName}
                footer={null}
                closable={false}
                onCancel={handleCloseSetName}
            >
                <div style={{
                    color: '#EEC13F',
                    fontFamily: 'montserrat',
                    fontSize: '24px',
                    fontWeight: 400,
                }}>
                    <p>
                        Set Wallet Name
                    </p>
                    <SetNameModal 
                        account={account}
                        wrapSetShow={wrapSetShowSetNameModal}
                        wrapSetAccounts={wrapSetAccounts}
                        index={index}
                    />
                </div>
            </Modal>
        </div>
    )
}

export default ProfileCard