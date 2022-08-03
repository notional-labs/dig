import { useEffect, useState, useCallback } from "react"
import { getTxs } from "../helpers/getTxs"
import { Typography, Skeleton } from 'antd';
import ButtonList from "./ButtonList";

const { Title, Paragraph } = Typography;

const style = {
    container: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
    },
    button: {
        border: 0,
        borderRadius: '10px',
        width: '100%',
        height: '40px',
        margin: 10,
        marginBottom: 0,
        marginLeft: 0,
        fontFamily: 'montserrat',
        fontWeight: 600,
        backgroundColor: '#2e2c27',
        color: '#F6F3FB'
    },
    table: {
        width: '100%',
    },
    tdlHeader: {
        backgroundColor: 'transparent',
        borderBottom: 'solid 1px #ffffff'
    },
    tdlContent: {
        marginTop: '0px',
        borderRadius: '50px',
        paddingTop: 0
    },
    th: {
        padding: '15px 15px',
        textAlign: 'left',
        fontWeight: 'bold',
        fontSize: '24px',
        color: '#ffffff',
        textTransform: 'uppercase',
        fontFamily: 'montserrat',
    },
    td: {
        padding: '15px',
        textAlign: 'left',
        verticalAlign: 'middle',
        fontWeight: '300',
        fontSize: '1rem',
        color: '#ffffff',
        fontFamily: 'montserrat',
    }
}

const timeStampHandler = (time) => {
    let date = new Date(time)
    return `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()} ${date.getHours()}:${date.getMinutes()}`
}

const getMsgType = (tx) => {
    const msg = tx.value.msg[0].type || ''
    const type = msg.split('Msg')[1]
    return type
}

const TxList = ({ address }) => {
    const [txs, setTxs] = useState([])
    const [params, setParams] = useState({
        page: 1,
        limit: 10,
    })
    const [total, setTotal] = useState(0)
    const [isLoading, setIsloading] = useState(false)

    useEffect(() => {
        (async () => {
            setIsloading(true)
            const res = await getTxs(address, params)
            res.txs && setTxs([...res.txs])
            setTotal(res.page_total)
            setIsloading(false)
        })()
    }, [params])

    const wrapSetParams = useCallback((val) => {
        setParams({
            ...params,
            page: val
        })
    }, [setParams])
    return (
        <div>
            <div style={style.container}>
                <Title style={{ color: '#ED9D26', fontSize: '36px', fontWeight: 'bold', fontFamily: 'montserrat' }}>
                    Transactions
                </Title>
            </div>
            <div style={{ borderRadius: '10px', border: 'solid 2px #EEC13F', padding: '1em' }}>
                {
                    !isLoading ? (
                        <table cellPadding="0" cellSpacing="0" border="0" style={style.table}>
                            <thead style={style.tdlHeader}>
                                <tr>
                                    <th style={{ ...style.th, width: '20%' }}>Height</th>
                                    <th style={{ ...style.th, width: '10rem', textAlign: 'left' }}>Tx Hash</th>
                                    <th style={{ ...style.th, width: '10rem', textAlign: 'left' }}>MSGS</th>
                                    <th style={{ ...style.th, width: '10rem', textAlign: 'left' }}>Time</th>
                                </tr>
                            </thead>
                            <tbody style={style.tdlContent}>
                                {txs.map((tx, index) => (
                                    <tr key={index}>
                                        <td style={{ ...style.td, }}>
                                            <a style={{ color: '#EEC13F' }} href={`https://ping.pub/dig/blocks/${tx.height}`} target='_blank'>
                                                {tx.height || ''}
                                            </a>
                                        </td>
                                        <td style={{ ...style.td, textAlign: 'left', width: '50%' }}>
                                            <a style={{ color: '#EEC13F' }} href={`https://ping.pub/dig/tx/${tx.txhash}`} target='_blank'>
                                                {`${tx.txhash.slice(0,50)}...` || ''}
                                            </a>
                                        </td>
                                        <td style={{ ...style.td, textAlign: 'left', width: '10%' }}>
                                            {getMsgType(tx.tx) || ''}
                                        </td>
                                        <td style={{ ...style.td, textAlign: 'left', width: '30%' }}>
                                            {tx.timestamp && timeStampHandler(tx.timestamp) || ''}
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    ) : (
                        <Skeleton active/>
                    )
                }
                <div style={{ margin: 'auto', marginTop: '2em' }} >
                    <ButtonList total={total} wrapSetParams={wrapSetParams} currentPage={params.page} />
                </div>
            </div>
        </div>
    )
}

export default TxList