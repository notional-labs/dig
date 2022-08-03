import { Image } from "antd"
import digger from '../assets/img/digger.png'
import coin1 from '../assets/img/coin1.png'
import coin2 from '../assets/img/coin2.png'
import coin3 from '../assets/img/coin3.png'
import aos from "aos"
import { useEffect } from "react"

const style = {
    intro: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
        padding: 20,
        height: 'auto',
        minHeight: '80vh'
    },
    asset: {
        position: 'absolute',
        zIndex: 1
    },
}

const FrontPage = () => {

    useEffect(() => {
        aos.init({
            duration: 3000
        })
    }, [])

    return (
        <div>
            <div style={style.intro}>
                <div style={{
                    textAlign: 'center',
                    margin: 'auto'
                }}>
                    <div data-aos="zoom-in">
                        <Image
                            width={500}
                            src={digger}
                            preview={false}
                        />
                    </div>
                    <p style={{
                        color: '#EEC13F',
                        fontSize: '100px',
                        fontWeight: 700,
                        margin: 0,
                        height: '100px',
                        marginBottom: '50px'
                    }}>
                        DIGCHAIN
                    </p>
                    <p style={{
                        color: '#FFFFFF',
                        fontSize: '24px',
                        fontWeight: 10,
                        margin: 0
                    }}>
                        Welcome to the Dig chain website.
                    </p>
                    <p style={{
                        color: '#FFFFFF',
                        fontSize: '24px',
                        fontWeight: 10,
                        margin: 0
                    }}>
                        Have fun digging around the community and the validators.
                    </p>

                    <a href="https://drive.google.com/file/d/1NeaNBXFFCSLl9Q6ckCNqT2WhZEi8_lRN/view" target={'_blank'}>
                        <button style={{
                            border: 0,
                            borderRadius: '10px',
                            backgroundColor: '#EEC13F',
                            color: '#ffffff',
                            fontSize: '24px',
                            padding: 30,
                            paddingTop: 5,
                            paddingBottom: 5,
                            marginTop: '20px'
                        }}>
                            White paper
                        </button>
                    </a>
                </div>
            </div>

        </div >
    )
}

export default FrontPage
