import { Image } from "antd"
import github from '../assets/img/github.png'
import tele from '../assets/img/tele.png'
import twitter from '../assets/img/twitter.png'
import discord from '../assets/img/discord.png'
import dis from '../assets/img/diss.png'
import aos from 'aos'
import { useEffect } from 'react'

const Screen6 = ({ }) => {

    useEffect(() => {
        aos.init({
            duration: 2000
        })
    }, [])

    return (
        <div style={{
            zIndex: 1,
            position: 'relative',
            marginTop: '200px'
        }}>
            <div
                id='top-content-6'
                data-aos="fade"
                style={{
                    display: 'flex',
                    flexDirection: 'row',
                    justifyContent: 'center',
                }}>
                <p
                    className='screen2-title'
                    style={{
                        fontWeight: 'bold',
                        color: '#EEC13F'
                    }}>
                    Follow us on
                </p>
            </div>
            <div className="contact">
                <div style={{
                    display: 'flex',
                    justifyContent: 'center'
                }}>
                    <a
                        data-aos="zoom-in"
                        data-aos-delay="500"
                        href='https://github.com/notional-labs/dig'
                        target={'_blank'}
                        style={{
                            margin: '0 25px 0 25px'
                        }}>
                        <Image src={github} preview={false} width={120} />
                    </a>
                    <a
                        data-aos="zoom-in"
                        data-aos-delay="1000"
                        href='https://t.me/digchain_official'
                        target={'_blank'}
                        style={{
                            margin: '0 25px 0 25px'
                        }}>
                        <Image src={tele} preview={false} width={120} />
                    </a>
                    <a
                        data-aos="zoom-in"
                        data-aos-delay="1500"
                        href='https://twitter.com/Dig_Chain'
                        target={'_blank'}
                        style={{
                            margin: '0 25px 0 25px'
                        }}>
                        <Image src={twitter} preview={false} width={120} />
                    </a>
                    <a
                        data-aos="zoom-in"
                        data-aos-delay="2000"
                        href='https://discord.gg/R44XTwfbmU'
                        target={'_blank'}
                        style={{
                            margin: '0 25px 0 25px'
                        }}>
                        <Image src={dis} preview={false} style={{
                            borderRadius: '50%'
                        }} width={120} />
                    </a>
                </div>
            </div>
            <div className="contact-mobile">
                <div style={{
                    display: 'flex',
                    justifyContent: 'center'
                }}>
                    <a
                        data-aos="zoom-in"
                        data-aos-delay="500"
                        href='https://github.com/notional-labs/'
                        target={'_blank'}
                        style={{
                            margin: '0 5% 0 5%'
                        }}>
                        <Image src={github} preview={false} width={50} />
                    </a>
                    <a
                        data-aos="zoom-in"
                        data-aos-delay="1000"
                        href='https://t.me/digchain_official'
                        target={'_blank'}
                        style={{
                            margin: '0 5% 0 5%'
                        }}>
                        <Image src={tele} preview={false} width={50} />
                    </a>
                    <a
                        data-aos="zoom-in"
                        data-aos-delay="1500"
                        href='https://twitter.com/Dig_Chain'
                        target={'_blank'}
                        style={{
                            margin: '0 5% 0 5%'
                        }}>
                        <Image src={twitter} preview={false} width={50} />
                    </a>
                    <a
                        data-aos="zoom-in"
                        data-aos-delay="2000"
                        href='https://discord.gg/R44XTwfbmU'
                        target={'_blank'}
                        style={{
                            margin: '0 5% 0 5%'
                        }}>
                        <Image src={dis} preview={false} style={{
                            borderRadius: '50%'
                        }} width={50} />
                    </a>
                </div>
            </div>
        </div>
    )
}

export default Screen6