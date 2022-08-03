import { useEffect, useState, useCallback } from 'react';
import { Image, Input, Empty } from 'antd';
import { getValidators, getLogo } from '../helpers/getValidators';
import { getTotal } from '../helpers/getBalances';
import "@fontsource/montserrat"
import notFound from '../assets/img/no-profile.png'
import { Modal, } from 'antd';
import DelegateModal from '../components/DelegateModal';
import { getKeplr, } from '../helpers/getKeplr';
import { CaretDownOutlined, CaretUpOutlined } from '@ant-design/icons'
import aos from 'aos';
import loadingGif from '../assets/img/loading.gif'
import { ImFloppyDisk } from "react-icons/im";

const { Search } = Input;

const style = {
    table: {
        width: '100%',
        borderSpacing: '0 1em',
        borderCollapse: 'separate'
    },
    tblHeader: {
        backgroundColor: 'transparent',
    },
    tblContent: {
        borderRadius: '50px',
    },
    th: {
        padding: '10px 10px',
        textAlign: 'left',
        fontWeight: 900,
        fontSize: '24px',
        color: '#EEC13F',
        textTransform: 'uppercase',
        fontFamily: 'montserrat',
    },
    td: {
        padding: '0.7em',
        paddingLeft: '1em',
        paddingRight: '1em',
        textAlign: 'left',
        verticalAlign: 'middle',
        fontWeight: 700,
        fontSize: '20px',
        color: '#ffffff',
        fontFamily: 'montserrat',
    },
    breadcrumb: {
        textAlign: 'left',
        fontWeight: 700,
        fontSize: '20px',
        color: '#ffffff',
        fontFamily: 'montserrat',
        paddingBottom: '0.5em'
    },
}

const ValidatorsList = () => {
    const [validators, setValidators] = useState([])
    const [filterValidators, setFilterValidators] = useState([])
    const [loading, setLoading] = useState(false)
    const [show, setShow] = useState(false)
    const [defaultVal, setDefaultVal] = useState('')
    const [state, setState] = useState('')
    const [stateCommision, setStateCommission] = useState('')
    const [stateVal, setStateVal] = useState('')
    const [dummy, setDummy] = useState([])

    useEffect(() => {
        (async () => {
            aos.init({
                duration: 1000
            })
            setLoading(true)
            let vals = await getValidators(true)
            const totalSupply = getTotal(vals)
            let bogo1 = vals.filter(x => x.operator_address === 'digvaloper12hjc5e9z3c4x8hl8yyxlqfx67wr89meaas6k7z')[0]
            let bogo2 = vals.filter(x => x.operator_address === 'digvaloper1cxu3telmqz2we6s8xy4xckr8sl2n7judqdq629')[0]
            let bogo3 = vals.filter(x => x.operator_address === 'digvaloper1lu3at7mda24anr9eecdhyt9wsq8dwhrn664y4z')[0]
            vals = vals.filter(x => x.operator_address !== 'digvaloper12hjc5e9z3c4x8hl8yyxlqfx67wr89meaas6k7z'
                && x.operator_address !== 'digvaloper1cxu3telmqz2we6s8xy4xckr8sl2n7judqdq629'
                && x.operator_address !== 'digvaloper1lu3at7mda24anr9eecdhyt9wsq8dwhrn664y4z')
            vals.unshift(bogo2, bogo3, bogo1)
            vals = vals.filter(x => x)
            if (vals.length > 0) {
                let logoList = []
                let urls = []
                vals.map((val) => {
                    val.votingPowerPercentage = parseFloat(val.delegator_shares * 100 / totalSupply).toFixed(2)
                    urls.push(val.description.identity)
                })

                // Load avt from key
                let promise = Promise.resolve()
                urls.forEach((url, index) => {
                    promise = promise.then(() => new Promise(resolve => {
                        getLogo(url).then(img => {
                            img ? vals[index].logo = img : vals[index].logo = notFound
                            resolve()
                        }).catch(() => {
                            vals[index].logo = notFound
                            resolve()
                        })
                        setDummy([...logoList])
                    }))
                })
            }
            setValidators([...vals])
            setFilterValidators([...vals])
            setLoading(false)
        })()
    }, [])

    const wrapSetShow = useCallback((val) => {
        setShow(val)
    }, [setShow])

    const handleClick = async (index) => {
        if (!localStorage.getItem('accounts')) {
            const { accounts } = await getKeplr('dig-1')
            localStorage.setItem('accounts', JSON.stringify([{ account: accounts[0], type: 'keplr' }]))
        }
        setDefaultVal(index)
        setShow(true)
    }

    const handleClose = () => {
        setShow(false)
    }

    const handleSort = () => {
        setStateCommission('')
        setStateVal('')
        if (state === 'desc') {
            setState('asc')
            setFilterValidators([...filterValidators.sort((x, y) => x.delegator_shares - y.delegator_shares)])
        }
        else if (state === 'asc') {
            setState('desc')
            setFilterValidators([...filterValidators.sort((x, y) => y.delegator_shares - x.delegator_shares)])
        }
        else {
            setState('desc')
            setFilterValidators([...filterValidators.sort((x, y) => y.delegator_shares - x.delegator_shares)])
        }
    }

    const handleSortCommission = () => {
        setState('')
        setStateVal('')
        if (stateCommision === 'desc') {
            setStateCommission('asc')
            setFilterValidators([...filterValidators.sort((x, y) => x.commission.commission_rates.rate - y.commission.commission_rates.rate)])
        }
        else if (stateCommision === 'asc') {
            setStateCommission('desc')
            setFilterValidators([...filterValidators.sort((x, y) => y.commission.commission_rates.rate - x.commission.commission_rates.rate)])
        }
        else {
            setStateCommission('desc')
            setFilterValidators([...filterValidators.sort((x, y) => y.commission.commission_rates.rate - x.commission.commission_rates.rate)])
        }
    }

    const handleSortVal = () => {
        setState('')
        setStateCommission('')
        if (stateVal === 'desc') {
            setStateVal('asc')
            setFilterValidators([...filterValidators.sort((x, y) => x.description.moniker.localeCompare(y.description.moniker))])
        }
        else if (stateVal === 'asc') {
            setStateVal('desc')
            setFilterValidators([...filterValidators.sort((x, y) => y.description.moniker.localeCompare(x.description.moniker))])
        }
        else {
            setStateVal('desc')
            setFilterValidators([...filterValidators.sort((x, y) => y.description.moniker.localeCompare(x.description.moniker))])
        }
    }

    const searchVal = (value) => {
        if (value !== '') {
            const filter = validators.filter(x => x.description.moniker.toLowerCase().includes(value.toLowerCase()))
            setFilterValidators([...filter])
        }
        else {
            setFilterValidators([...validators])
        }
    }

    return (
        !loading ? (
            <div style={{ padding: 70, paddingTop: '7em' }}>
                <div style={{
                    display: 'flex',
                    justifyContent: 'space-between',
                    marginBottom: '20px'
                }}>
                    <div style={{
                        textAlign: 'left',
                        fontSize: '36px',
                        color: '#ffffff',
                        fontFamily: 'montserrat',
                        fontWeight: 'bold',
                        marginBottom: '0'
                    }}>
                        VALIDATOR
                    </div>
                    <div
                        style={{
                            display: 'flex',
                            justifyContent: 'end',
                            width: '50%'
                        }}
                    >
                        <button
                            style={{
                                border: 0,
                                backgroundColor: '#ED9D26',
                                color: '#ffffff',
                                borderRadius: '10px',
                                marginRight: '20px',
                                padding: '.5em 3em'
                            }}
                            onClick={() => {
                                setState('')
                                setStateCommission('')
                                setStateVal('')
                                setFilterValidators([...validators])
                            }}
                        >
                            Reset
                        </button>
                        <Search
                            placeholder='Search'
                            style={{
                                borderRadius: '10px',
                                width: '50%',
                                backgroundColor: 'transparent',
                                height: '100%'
                            }}
                            size="large"
                            allowClear={true}
                            onSearch={searchVal}
                            enterButton 
                        />
                    </div>
                </div>
                <div>
                    <table style={style.table}>
                        <thead style={style.tblHeader}>
                            <tr>
                                <th style={{ ...style.th, width: '40%' }}>
                                    <button style={{
                                        backgroundColor: 'transparent',
                                        border: 0,
                                        textTransform: 'uppercase',
                                        fontFamily: 'montserrat',
                                        fontWeight: 'bold',
                                        padding: 10,
                                        borderRadius: '24px'
                                    }} className='hover-sort-button'
                                        onClick={handleSortVal}>
                                        Validator
                                        {stateVal === 'desc' ? <CaretDownOutlined /> : stateVal === 'asc' && <CaretUpOutlined />}
                                    </button>
                                </th>
                                <th style={{ ...style.th, width: '20%', textAlign: 'center' }}>
                                    <button style={{
                                        backgroundColor: 'transparent',
                                        border: 0,
                                        textTransform: 'uppercase',
                                        fontFamily: 'montserrat',
                                        fontWeight: 'bold',
                                        padding: 10,
                                        borderRadius: '24px'
                                    }} className='hover-sort-button'
                                        onClick={handleSort}>
                                        Voting power
                                        {state === 'desc' ? <CaretDownOutlined /> : state === 'asc' && <CaretUpOutlined />}
                                    </button>
                                </th>
                                <th style={{ ...style.th, width: '20%', textAlign: 'center' }}>
                                    <button style={{
                                        backgroundColor: 'transparent',
                                        border: 0,
                                        textTransform: 'uppercase',
                                        fontFamily: 'montserrat',
                                        fontWeight: 'bold',
                                        padding: 10,
                                        borderRadius: '24px'
                                    }} className='hover-sort-button'
                                        onClick={handleSortCommission}>
                                        Commission
                                        {stateCommision === 'desc' ? <CaretDownOutlined /> : stateCommision === 'asc' && <CaretUpOutlined />}
                                    </button>
                                </th>
                                <th style={{ ...style.th, width: '20%', borderRight: 0, textAlign: 'center' }}>Action</th>
                            </tr>
                        </thead>
                        {
                            filterValidators.length > 0 ? (
                                <tbody style={style.tblContent}>
                                    {
                                        filterValidators.map((val, index) => {
                                            return (
                                                <tr key={index} style={{ backgroundColor: 'transparent', marginBottom: 20, }}>
                                                    <td style={{ ...style.td, borderRadius: '10px 0 0 10px', border: 'solid 2px #ED9D26', borderRight: 'none' }}>
                                                        <div style={{ display: 'flex', flexDirection: 'row' }}>
                                                            <div
                                                                data-aos="flip-up"
                                                                data-aos-once={true}
                                                                style={{
                                                                    borderRadius: '50%',

                                                                }}>
                                                                <Image
                                                                    width={50}
                                                                    src={val.logo || notFound}
                                                                    style={{ borderRadius: '50%', marginTop: '3px' }}
                                                                    preview={false}
                                                                />
                                                            </div>
                                                            <div style={{ marginLeft: '1rem' }} >
                                                                <div style={{ color: '#ffffff', fontSize: '20px', fontWeight: 700 }}>{val.description.moniker}</div>
                                                                <div style={{ fontSize: '15px', fontWeight: 400, opacity: 0.6 }}>{val.description.website ? val.description.website : val.description.identity}</div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td style={{ ...style.td, textAlign: 'center', border: 'solid 2px #ED9D26', borderRight: 'none', borderLeft: 'none' }}>
                                                        <div>{`${parseInt(val.delegator_shares / 1000000)} DIG`}</div>
                                                        <div style={{ fontSize: '15px', opacity: 0.6 }}>{`${val.votingPowerPercentage} %`} </div>
                                                    </td>
                                                    <td style={{ ...style.td, textAlign: 'center', border: 'solid 2px #ED9D26', borderRight: 'none', borderLeft: 'none' }}>{`${val.commission.commission_rates.rate * 100} %`}</td>
                                                    <td style={{ ...style.td, textAlign: 'center', borderRadius: '0 10px 10px 0', border: 'solid 2px #ED9D26', borderLeft: 'none', color: '#ffffff' }}>
                                                        <button style={{
                                                            backgroundColor: '#ED9D27',
                                                            border: 'none',
                                                            borderRadius: '10px',
                                                            padding: '1em',
                                                            fontSize: '15px',
                                                            fontWeight: 700,
                                                            boxShadow: '0px 0px 10px 2px rgba(0, 0, 0, 0.25)'
                                                        }} onClick={async () => await handleClick(val.operator_address)}>
                                                            Delegate
                                                        </button>
                                                    </td>
                                                </tr>
                                            )
                                        })
                                    }
                                </tbody>
                            ) : (
                                <div style={{ color: '#ffc16b', height: '55vh', paddingTop: '15em', fontFamily: 'montserrat', position: 'relative', left: '70%' }}>
                                    <ImFloppyDisk style={{ fontSize: '10rem', opacity: 0.2, }} />
                                    <p style={{ fontSize: '2rem', opacity: 0.2, paddingTop: '1em', marginBottom: 0 }}>
                                        No Data
                                    </p>
                                </div>
                            )
                        }
                    </table>
                </div>
                <Modal
                    visible={show}
                    footer={null}
                    closable={false}
                    onCancel={handleClose}
                >
                    <div style={{
                        color: '#EEC13F',
                        fontFamily: 'montserrat',
                        fontSize: '24px',
                        fontWeight: 400,
                    }}>
                        <p>
                            Delegate Token
                        </p>
                        <DelegateModal
                            validators={validators}
                            wrapSetter={wrapSetShow}
                            defaultVal={defaultVal}
                        />
                    </div>
                </Modal>
            </div >
        ) : (
            <div style={{ margin: 'auto', marginTop: '10%' }}>
                <Image src={loadingGif} width={500} preview={false} />
            </div>
        )
    )
}

export default ValidatorsList
