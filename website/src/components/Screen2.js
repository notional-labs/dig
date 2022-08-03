import { Image } from "antd"
import icon from '../assets/img/vector.png'
import Tree from "./subScreen2/Tree"
import Grid from "./subScreen2/Grid"
import aos from 'aos'
import { useEffect } from 'react'
import TreeMobile from "./subScreen2/TreeMobile"
import GridMobile from "./subScreen2/GridMobile"

const Screen2 = ({ }) => {

    useEffect(() => {
        aos.init({
            duration: 2000
        })
    }, [])

    return (
        <div style={{
            zIndex: 1,
            position: 'relative'
        }}>
            <div style={{
                marginTop: '200px',
                display: 'flex',
                flexDirection: 'row',
                justifyContent: 'center'
            }}>
                <p
                    className="screen2-title"
                    data-aos="fade"
                    style={{
                        fontWeight: 700,
                        color: '#EEC13F',
                    }}>
                    Dig Parent Chain
                </p>
                <div className="icon">
                    <Image src={icon}
                        preview={false}
                        style={{
                            marginLeft: '10px',
                            marginTop: '5px'
                        }} />
                </div>
            </div>
            <Tree />
            <TreeMobile/>
            <p
                className='screen2-content'
                id='top-content'
                data-aos="fade"
                data-aos-delay="500"
                style={{
                    fontWeight: 400,
                    color: '#ffffff',
                }}>
                Dig Chain is a governance-focused layer-1 blockchain that acts as a hub for numerous regional Dig chains, each designed to facilitate the tokenization of real estate. Dig Chain will also enable CW20 smart contracts.
            </p>
            <br />
            <p
                className='screen2-content'
                data-aos="fade"
                data-aos-delay="500"
                style={{
                    fontWeight: 400,
                    color: '#ffffff',
                }}>
                The reason various regional blockchains are necessary is simple: regulations surrounding real estate are different in different jurisdictions. Each blockchain will be geo-fenced to a particular jurisdiction to ensure it can be compliant with local regulations.
                <br />
            </p>
            <p
                className='screen2-content'
                data-aos="fade"
                data-aos-delay="500"
                style={{
                    fontWeight: 400,
                    color: '#ffffff',
                }}>
                They will all connect seamlessly to the hub Dig Chain via IBC (inter-blockchain communication).
            </p>
            <Grid />
            <GridMobile/>
        </div >
    )
}

export default Screen2