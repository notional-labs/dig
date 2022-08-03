import roadmap from '../../assets/img/roadmap.png'
import icon from '../../assets/img/roadmap2.png'
import line from '../../assets/img/line.png'
import shadow from '../../assets/img/shadow.png'
import { Image } from 'antd'
import { useEffect, useState } from 'react'
import aos from 'aos'

const RoadmapMobile = ({ }) => {

    useEffect(() => {
        aos.init({
            duration: 2000
        })
    }, [])

    return (
        <div className="roadmap-mobile" style={{
            padding: '10px'
        }}>
            <div
                data-aos="fade-down"
                style={{
                    display: 'flex',
                    justifyContent: 'start'
                }}>
                <div>
                    <Image src={icon} preview={false} width={'50px'} />
                </div>
                <div style={{
                    paddingLeft: '20px'
                }}>
                    <p style={{
                        color: '#EEC13F',
                        fontSize: '20px',
                        fontWeight: 700,
                        padding: 0,
                        margin: 0,
                        textAlign: 'left'
                    }}>
                        Q3 2021
                    </p>
                    <p style={{
                        color: '#EEC13F',
                        fontSize: '20px',
                        fontWeight: 700,
                        padding: 0,
                        margin: 0,
                        textAlign: 'left'
                    }}>
                        Development and Airdrop
                    </p>
                    <p style={{
                        color: '#ffffff',
                        fontSize: '10px',
                        fontWeight: 400,
                        marginBottom: '10px',
                        textAlign: 'left'
                    }}>
                        Dig Chain is being built using Starport on Cosmos SDK. The first testnet of Dig Chain was connected to 8 other blockchains in the Cosmos ecosystem. This has gathered some serious attention for the project already.
                    </p>
                </div>
            </div>
            <div
                data-aos="fade-down"
                data-aos-delay="200"
                style={{
                    display: 'flex',
                    justifyContent: 'start'
                }}>
                <div>
                    <Image src={icon} preview={false} width={'50px'} />
                </div>
                <div style={{
                    paddingLeft: '20px'
                }}>
                    <p style={{
                        color: '#EEC13F',
                        fontSize: '20px',
                        fontWeight: 700,
                        padding: 0,
                        margin: 0,
                        textAlign: 'left'
                    }}>
                        Q4 2021
                    </p>
                    <p style={{
                        color: '#EEC13F',
                        fontSize: '20px',
                        fontWeight: 700,
                        padding: 0,
                        margin: 0,
                        textAlign: 'left'
                    }}>
                        Liquidity Pools and Building Validator Community
                    </p>
                    <p style={{
                        color: '#ffffff',
                        fontSize: '10px',
                        fontWeight: 400,
                        marginBottom: '10px',
                        textAlign: 'left'
                    }}>
                        Dig Chain is being built using Starport on Cosmos SDK. The first testnet of Dig Chain was connected to 8 other blockchains in the Cosmos ecosystem. This has gathered some serious attention for the project already.
                    </p>
                </div>
            </div>
            <div
                data-aos="fade-down"
                data-aos-delay="200"
                style={{
                    display: 'flex',
                    justifyContent: 'start'
                }}>
                <div>
                    <Image src={icon} preview={false} width={'50px'} />
                </div>
                <div style={{
                    paddingLeft: '20px'
                }}>
                    <p style={{
                        color: '#EEC13F',
                        fontSize: '20px',
                        fontWeight: 700,
                        padding: 0,
                        margin: 0,
                        textAlign: 'left'
                    }}>
                        Q4 2021
                    </p>
                    <p style={{
                        color: '#EEC13F',
                        fontSize: '20px',
                        fontWeight: 700,
                        padding: 0,
                        margin: 0,
                        textAlign: 'left'
                    }}>
                        Liquidity Pools and Building Validator Community
                    </p>
                    <p style={{
                        color: '#ffffff',
                        fontSize: '10px',
                        fontWeight: 400,
                        marginBottom: '10px',
                        textAlign: 'left'
                    }}>
                        Dig Chain is being built using Starport on Cosmos SDK. The first testnet of Dig Chain was connected to 8 other blockchains in the Cosmos ecosystem. This has gathered some serious attention for the project already.
                    </p>
                </div>
            </div>
            <div
                data-aos="fade-down"
                data-aos-delay="600"
                style={{
                    display: 'flex',
                    justifyContent: 'start'
                }}>
                <div>
                    <Image src={icon} preview={false} width={'50px'} />
                </div>
                <div style={{
                    paddingLeft: '20px'
                }}>
                    <p style={{
                        color: '#EEC13F',
                        fontSize: '20px',
                        fontWeight: 700,
                        padding: 0,
                        margin: 0,
                        textAlign: 'left'
                    }}>
                        Q2 2022
                    </p>
                    <p style={{
                        color: '#EEC13F',
                        fontSize: '20px',
                        fontWeight: 700,
                        padding: 0,
                        margin: 0,
                        textAlign: 'left'
                    }}>
                        Growing Globally and Marketing
                    </p>
                    <p style={{
                        color: '#ffffff',
                        fontSize: '10px',
                        fontWeight: 400,
                        marginBottom: '10px',
                        textAlign: 'left'
                    }}>
                        Growing Dig's baby chains into various regions of the world to comply with local regulations and bringing more projects into the chain. Marketing efforts will intensify in tandem with partnerships and project successes.                    </p>
                </div>
            </div>
            <div
                data-aos="fade-down"
                data-aos-delay="800"
                style={{
                    display: 'flex',
                    justifyContent: 'start'
                }}>
                <div>
                    <Image src={icon} preview={false} width={'50px'} />
                </div>
                <div style={{
                    paddingLeft: '20px'
                }}>
                    <p style={{
                        color: '#EEC13F',
                        fontSize: '20px',
                        fontWeight: 700,
                        padding: 0,
                        margin: 0,
                        textAlign: 'left'
                    }}>
                        Q3 2022
                    </p>
                    <p style={{
                        color: '#EEC13F',
                        fontSize: '20px',
                        fontWeight: 700,
                        padding: 0,
                        margin: 0,
                        textAlign: 'left'
                    }}>
                        Major Partnerships
                    </p>
                    <p style={{
                        color: '#ffffff',
                        fontSize: '10px',
                        fontWeight: 400,
                        marginBottom: '10px',
                        textAlign: 'left'
                    }}>
                        Making major partnerships with real estate developers and real estate brokers to expand the project's scope into mainstream adoption.
                    </p>
                </div>
            </div>
        </div>
    )
}

export default RoadmapMobile