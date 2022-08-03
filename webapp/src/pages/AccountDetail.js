import { Typography } from 'antd';
import { PieChart } from 'react-minimal-pie-chart';
import DelegationList from '../components/DelegationList';
import {
    useParams,
    Link
} from "react-router-dom";
import { useEffect, useState, useCallback } from 'react';
import { BsGraphUp, BsGraphDown, BsWallet, BsLock } from "react-icons/bs";
import { getAsset, getTotalDelegate, getTotalUnbonding, getPrice, convertAsset, getDelegation, getReward } from '../helpers/getBalances';
import TxList from '../components/TxList';
import { Doughnut } from 'react-chartjs-2';
import { Chart, ArcElement } from 'chart.js'
import AssetCard from '../components/AssetCard'

Chart.register(ArcElement);

const { Title } = Typography;

const style = {
    container: {
        padding: 70,
        paddingTop: '7em',
        color: '#ffffff'
    },
    assetBlock: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
        color: '#ED9D26',
        backgroundColor: 'transparent',
    },
    assetChart: {
        borderRadius: '10px',
        backgroundColor: 'transparent',
        border: 'solid 2px #EEC13F',
        padding: '1em'
    },
    asset: {
        borderRadius: '10px',
        marginBottom: '20px',
        color: '#696969',
        fontFamily: 'montserrat',
        marginTop: '20px',
        backgroundColor: 'transparent',
    },
    assetButtonBlock: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'end',
    },
    delegation: {
        borderRadius: '30px',
        marginBottom: '20px',
        color: '#bdbdbd',
        fontFamily: 'montserrat',
        marginTop: '5rem',
    },
    button: {
        border: 0,
        borderRadius: '30px',
        width: '100%',
        marginBottom: 0,
        marginLeft: 0,
        fontFamily: 'montserrat',
        fontWeight: 600,
        backgroundColor: '#2e2c27',
        color: '#F6F3FB',
        padding: '2em',
        paddingTop: '1em',
        paddingBottom: '1em'
    },
    icon: {
        fontSize: '1.5rem',
    },
    li: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
        width: '100%',
        alignContent: 'center',
        marginBottom: '0.5em',
    },
    iconDiv: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'start',
        alignContent: 'stretch'
    },
    breadcrumb: {
        textAlign: 'left',
        fontWeight: 'bold',
        fontSize: '24px',
        color: '#ffffff',
        fontFamily: 'montserrat',
        marginBottom: '50px'
    },
}

const AccountDetail = ({ accounts }) => {
    const [show, setShow] = useState(false)
    const [showIbc, setShowIbc] = useState(false)
    const [selectAcc, setSelectAcc] = useState(0)
    const [balance, setBalance] = useState('')
    const [reward, setReward] = useState('')
    const [delegation, setDelegation] = useState('')
    const [unbond, setUnbond] = useState('')
    const [delegations, setDelegations] = useState([])
    const [rewards, setRewards] = useState([])
    const [total, setTotal] = useState(0)
    let { id } = useParams();

    const wrapSetAsset = useCallback((value, type) => {
        switch (type) {
            case 1:
                setBalance(value)
                break;
            case 2:
                setDelegation(value)
                break;
            case 3:
                setReward(value)
                break;
            case 4:
                setUnbond(value)
                break;
            default:
                break;
        }
    }, [])

    useEffect(() => {
        (async () => {
            accounts.map((account, index) => {
                if (account.type === 'keplr') {
                    if (account.account.address === id) {
                        setSelectAcc(index)
                    }
                }
                if (account.type === 'metamask') {
                    if (account.account === id) {
                        setSelectAcc(index)
                    }
                }
            })
            const delegationList = await getDelegation(id)
            const rewardList = await getReward(id)

            setDelegations([...delegationList.delegation_responses])
            setRewards([...rewardList.rewards])
        })()
    }, [])

    useEffect(() => {
        (async () => {

            const res = await getPrice()
            const usd = res['dig-chain'].usd || 0

            const totalAsset = convertAsset(balance, delegation, reward, unbond, usd)
            setTotal(totalAsset)
        })()
    }, [balance, delegation, reward, unbond])

    return (
        <div style={style.container}>
            <div style={{
                textAlign: 'left',
                fontSize: '36px',
                color: '#ffffff',
                fontFamily: 'montserrat',
                fontWeight: 'bold',
                marginBottom: '20px'
            }}>
                Detail
            </div>
            <div style={style.breadcrumb}>
                <span style={{ color: '#ffffff', fontWeight: 500 }}>
                    <Link to='/accounts' style={{ color: '#ffffff', fontWeight: 500 }}>
                        Accounts
                    </Link>
                </span>
                <span style={{ color: '#ffffff', fontWeight: 500 }}>
                    {' / '}
                </span>
                <span style={{ color: '#ED9D26' }}>
                    Details
                </span>
            </div>
            <div style={{ ...style.asset, backgroundColor: 'transparent' }}>
                <div style={style.assetBlock}>
                    <Title style={{ color: '#ED9D26', fontSize: '36px', fontWeight: 'bold', fontFamily: 'montserrat' }}>
                        Assets
                    </Title>
                </div>
                <div style={style.assetChart}>
                    <div
                        className='asset-block'
                    >
                        <div
                            className='chart'
                        >
                            <Doughnut data={{
                                labels: [
                                    'Balance',
                                    'Delegation',
                                    'Reward',
                                    'Unbonding'
                                ],
                                datasets: [{
                                    data: [
                                        parseInt(balance) / 1000000,
                                        parseInt(delegation) / 1000000,
                                        parseInt(reward) / 1000000,
                                        parseInt(unbond) / 1000000
                                    ],
                                    backgroundColor: [
                                        'rgb(61, 255, 148)',
                                        'rgb(140, 129, 252)',
                                        'rgb(255, 174, 97)',
                                        'rgb(255, 115, 116)'
                                    ],
                                    hoverOffset: 4
                                }]
                            }} />
                        </div>
                        <ul style={{
                            textAlign: 'left',
                            margin: 0,
                            padding: '2em',
                            listStyleType: 'none',
                            textAlign: 'left',
                            fontSize: '1.25rem',
                            width: '100%',
                            borderRadius: '20px'
                        }}>
                            <li style={style.li}>
                                <AssetCard
                                    wrapSetAsset={wrapSetAsset}
                                    type={1}
                                    Icon={<BsWallet style={{ ...style.icon, color: '#93A98D' }} />}
                                    backgroundColor={'rgb(61, 255, 148)'}
                                    addr={id}
                                    asset={balance}
                                />
                            </li>
                            <li style={style.li}>
                                <AssetCard
                                    wrapSetAsset={wrapSetAsset}
                                    type={2}
                                    Icon={<BsLock style={{ ...style.icon, color: '#0B1321' }} />}
                                    backgroundColor={'rgb(140, 129, 252)'}
                                    addr={id}
                                    asset={delegation}
                                />
                            </li>
                            <li style={style.li}>
                                <AssetCard
                                    wrapSetAsset={wrapSetAsset}
                                    type={3}
                                    Icon={<BsGraphUp style={{ ...style.icon, color: '#AE8D4F' }} />}
                                    backgroundColor={'rgb(255, 174, 97)'}
                                    addr={id}
                                    asset={reward}
                                />
                            </li>
                            <li style={style.li}>
                                <AssetCard
                                    wrapSetAsset={wrapSetAsset}
                                    type={4}
                                    Icon={<BsGraphDown style={{ ...style.icon, color: '#BD6B5A' }} />}
                                    backgroundColor={'rgb(255, 115, 116)'}
                                    addr={id}
                                    asset={unbond}
                                />
                            </li>
                            <li>
                                <hr style={{ color: '#ffffff', fontWeight: 'bold', }} />
                            </li>
                            <li style={{ ...style.li, justifyContent: 'end' }}>
                                <div style={{ fontWeight: 600, fontSize: '1.5rem' }}>
                                    <span style={{
                                        display: 'inline-block',
                                        verticalAlign: 'middle',
                                        lineheight: 'normal',
                                        color: '#ffffff'
                                    }}>
                                        Total {total} USD
                                    </span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div style={{ ...style.delegation, marginTop: '4em', paddingTop: 0 }}>
                <DelegationList 
                    address={id} 
                    type={accounts[selectAcc] && accounts[selectAcc].type} 
                    delegations={delegations} 
                    rewards={rewards} 
                />
            </div>
            <div style={{ ...style.delegation, marginTop: '4em', paddingTop: 20 }}>
                <TxList address={id} />
            </div>
            {/* <>
                <Modal show={show} onHide={handleClose} backdrop="static" >
                    <Modal.Header style={{
                        backgroundColor: '#4D4D4D',
                        color: '#EEC13F',
                        fontFamily: 'montserrat',
                        fontSize: '24px',
                        fontWeight: 400,
                        border: 0
                    }}>
                        <div>
                            Transfer Token
                        </div>
                    </Modal.Header>
                    <Modal.Body style={{ backgroundColor: '#4D4D4D', }}>
                        <TransferModal account={accounts[selectAcc]} wrapSetShow={wrapSetShowTransferModal} />
                    </Modal.Body>
                </Modal>
            </>
            <>
                <Modal show={showIbc} onHide={handleCloseIbc} backdrop="static" >
                    <Modal.Header style={{ backgroundColor: '#d6d6d6', color: '#696969', fontFamily: 'montserrat', fontSize: '1.2rem', fontWeight: 600 }}>
                        <div>
                            IBC Transfer Token
                        </div>
                    </Modal.Header>
                    <Modal.Body style={{ backgroundColor: '#1f1f1f', }}>
                        <IBCTransferModal account={accounts[selectAcc]} wrapSetShow={wrapSetShowIBCTransferModal} />
                    </Modal.Body>
                </Modal>
            </> */}
        </div>
    )
}

export default AccountDetail
