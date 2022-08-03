import { useEffect, useState } from "react"
import { getBalance } from "../helpers/getBalances"
import { getTotalDelegate, getDelegation, getReward, getTotalUnbonding, getUnbond } from "../helpers/getBalances"

const style = {
    iconDiv: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'start',
        alignContent: 'stretch'
    },
    icon: {
        fontSize: '1.5rem',
    },
}

const AssetCard = ({ wrapSetAsset, type, Icon, backgroundColor, addr, asset }) => {

    useEffect(() => {
        (async () => {
            if (type === 1) {
                const res = await getBalance(addr)
                const balance = res[0].length > 0 ? res[0][0].amount : '0'
                wrapSetAsset(balance, 1)
            }
            else if (type === 2) {
                const res = await getDelegation(addr)
                const delegation = res.delegation_responses.length > 0 ? getTotalDelegate(res.delegation_responses) : '0'
                wrapSetAsset(delegation, 2)
            }
            else if (type === 3) {
                const res = await getReward(addr)
                const reward = res.total.length > 0 ? res.total[0].amount : '0'
                wrapSetAsset(reward, 3)
            }
            else if (type === 4) {
                const res = await getUnbond(addr)
                const unbond = res.unbonding_responses.length > 0 ? getTotalUnbonding(res.unbonding_responses) : '0'
                wrapSetAsset(unbond, 4)
            }
        })()
    }, [])

    const getTitle = () => {
        return type === 1 ? 'Balance' : type === 2 ? 'Delegation' : type === 3 ? 'Reward' : 'Unbonding'
    }

    return (
        <>
            <div style={style.iconDiv}>
                <div style={{ backgroundColor: backgroundColor, height: '100%', padding: '0.5em', borderRadius: '10px' }}>
                    {Icon}
                </div>
                <p style={{ marginLeft: '10px', fontWeight: 500, marginBottom: 0 }}>
                    <span style={{
                        display: 'inline-block',
                        verticalAlign: 'middle',
                        lineheight: 'normal',
                        marginTop: '0.5em',
                        fontWeight: 'bold',
                        color: '#ffffff'
                    }}>
                        {
                            getTitle()
                        }
                    </span>
                </p>
            </div>
            <div style={{ fontWeight: 500 }}>
                <span style={{
                    display: 'inline-block',
                    verticalAlign: 'middle',
                    lineheight: 'normal',
                    marginTop: '0.5em',
                    color: '#ffffff'
                }}>
                    {parseInt(asset) / 1000000 || 0} DIG
                </span>
            </div>
        </>
    )
}

export default AssetCard