import { Image } from "antd"
import osmosis from '../assets/img/osmosis.png'
import juno from '../assets/img/juno.png'
import notional from '../assets/img/notional.png'
import notional2 from '../assets/img/notional2.png'
import blurt from '../assets/img/blurt.png'
import blurt2 from '../assets/img/blurt2.png'
import aos from 'aos'
import { useEffect } from 'react'

const Screen4 = ({ }) => {

    useEffect(() => {
        aos.init({
            duration: 2000
        })
    }, [])

    return (
        <div style={{
            position: 'relative',
            zIndex: 1
        }}>
            <div
                id='top-content-3'
                data-aos="fade"
                style={{
                    display: 'flex',
                    flexDirection: 'row',
                    justifyContent: 'center',
                }}>
                <p
                    className="screen2-title"
                    style={{
                        fontWeight: 'bold',
                        color: '#EEC13F'
                    }}>
                    PARTNERS
                </p>
            </div>
            <div className="partner">
                <div
                    style={{
                        display: 'flex',
                        flexDirection: 'row',
                        justifyContent: 'space-evenly',

                    }}>
                    <div className="logo" style={{
                        margin: 'auto 0'
                    }}>
                        <Image src={notional} preview={false} width={150} />
                        <span style={{
                            marginLeft: '20px'
                        }}>
                            <Image src={notional2} preview={false} width={300} />
                        </span>
                    </div>
                    <div className="logo" style={{
                        margin: 'auto 0'
                    }}>
                        <Image src={blurt} preview={false} width={150} />
                        <span style={{
                            marginLeft: '20px'
                        }}>
                            <Image src={blurt2} preview={false} width={100} />
                        </span>
                    </div>
                </div>
            </div>
            <div className="partner-mobile">
                <div
                    style={{
                        display: 'flex',
                        flexDirection: 'column',
                        justifyContent: 'space-evenly',
                        margin: 'auto'
                    }}>
                    <div className="logo" style={{
                        display: 'flex',
                        justifyContent: 'center',
                        marginBottom: '50px'
                    }}>
                        <Image src={notional} preview={false} width={'20%'}/>
                        <span style={{
                            margin: 'auto 0'
                        }}>
                            <Image src={notional2} preview={false} width={'80%'} />
                        </span>
                    </div>
                    <div className="logo" style={{
                        display: 'flex',
                        justifyContent: 'center',
                        marginBottom: '50px'
                    }}>
                        <Image src={blurt} preview={false} width={'20%'}/>
                        <span style={{
                            margin: 'auto 0'
                        }}>
                            <Image src={blurt2} preview={false} width={'80%'} />
                        </span>
                    </div>
                </div>
            </div>
            <div
                id='top-content-4'
                style={{
                    display: 'flex',
                    flexDirection: 'row',
                    justifyContent: 'center',
                }}>
                <p
                    className="screen2-title"
                    style={{
                        fontWeight: 'bold',
                        color: '#EEC13F'
                    }}>
                    DEX
                </p>
            </div>
            <div className="partner">
                <div style={{
                    display: 'flex',
                    flexDirection: 'row',
                    justifyContent: 'space-evenly',

                }}>
                    <div className="logo">
                        <Image src={osmosis} preview={false} width={500} />
                    </div>
                    <div className="logo">
                        <Image src={juno} preview={false} width={200} />
                    </div>
                </div>
            </div>
            <div className="partner-mobile">
                <div style={{
                    display: 'flex',
                    flexDirection: 'column',
                    justifyContent: 'space-evenly',

                }}>
                    <div className="logo" style={{
                        display: 'flex',
                        justifyContent: 'center',
                        marginBottom: '50px'
                    }}>
                        <Image src={osmosis} preview={false} width={'70%'} />
                    </div>
                    <div className="logo">
                        <Image src={juno} preview={false} width={'50%'} />
                    </div>
                </div>
            </div>
        </div >
    )
}

export default Screen4